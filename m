Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x232.google.com ([2a00:1450:4013:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VegBM-0004Rf-6c
 for ath10k@lists.infradead.org; Fri, 08 Nov 2013 07:08:40 +0000
Received: by mail-ea0-f178.google.com with SMTP id a10so692184eae.23
 for <ath10k@lists.infradead.org>; Thu, 07 Nov 2013 23:08:18 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix core init failpath
Date: Fri,  8 Nov 2013 08:05:18 +0100
Message-Id: <1383894318-29455-1-git-send-email-michal.kazior@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

HIF was not stopped properly in
ath10k_core_start() upon failure. This could cause
memory leaks of CE completions entries and
possibly other issues as well.

Move the HIF start/stop out of
ath10k_htc_wait_target(). The ctl_resp completion
is already prepared in ath10k_htc_init.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 16 +++++++++++++---
 drivers/net/wireless/ath/ath10k/htc.c  | 26 +++++---------------------
 2 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2a360ca..1d3040e 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -787,14 +787,22 @@ int ath10k_core_start(struct ath10k *ar)
 		goto err;
 	}
 
-	status = ath10k_htc_wait_target(&ar->htc);
-	if (status)
+	status = ath10k_hif_start(ar);
+	if (status) {
+		ath10k_err("could not start HIF: %d\n", status);
 		goto err_wmi_detach;
+	}
+
+	status = ath10k_htc_wait_target(&ar->htc);
+	if (status) {
+		ath10k_err("failed to connect to HTC: %d\n", status);
+		goto err_hif_stop;
+	}
 
 	status = ath10k_htt_attach(ar);
 	if (status) {
 		ath10k_err("could not attach htt (%d)\n", status);
-		goto err_wmi_detach;
+		goto err_hif_stop;
 	}
 
 	status = ath10k_init_connect_htc(ar);
@@ -833,6 +841,8 @@ err_disconnect_htc:
 	ath10k_htc_stop(&ar->htc);
 err_htt_detach:
 	ath10k_htt_detach(&ar->htt);
+err_hif_stop:
+	ath10k_hif_stop(ar);
 err_wmi_detach:
 	ath10k_wmi_detach(ar);
 err:
diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 3118d75..d015911 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -534,14 +534,6 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 	u16 credit_count;
 	u16 credit_size;
 
-	INIT_COMPLETION(htc->ctl_resp);
-
-	status = ath10k_hif_start(htc->ar);
-	if (status) {
-		ath10k_err("could not start HIF (%d)\n", status);
-		goto err_start;
-	}
-
 	status = wait_for_completion_timeout(&htc->ctl_resp,
 					     ATH10K_HTC_WAIT_TIMEOUT_HZ);
 	if (status <= 0) {
@@ -549,15 +541,13 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 			status = -ETIMEDOUT;
 
 		ath10k_err("ctl_resp never came in (%d)\n", status);
-		goto err_target;
+		return status;
 	}
 
 	if (htc->control_resp_len < sizeof(msg->hdr) + sizeof(msg->ready)) {
 		ath10k_err("Invalid HTC ready msg len:%d\n",
 			   htc->control_resp_len);
-
-		status = -ECOMM;
-		goto err_target;
+		return -ECOMM;
 	}
 
 	msg = (struct ath10k_htc_msg *)htc->control_resp_buffer;
@@ -567,8 +557,7 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 
 	if (message_id != ATH10K_HTC_MSG_READY_ID) {
 		ath10k_err("Invalid HTC ready msg: 0x%x\n", message_id);
-		status = -ECOMM;
-		goto err_target;
+		return -ECOMM;
 	}
 
 	htc->total_transmit_credits = credit_count;
@@ -581,9 +570,8 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 
 	if ((htc->total_transmit_credits == 0) ||
 	    (htc->target_credit_size == 0)) {
-		status = -ECOMM;
 		ath10k_err("Invalid credit size received\n");
-		goto err_target;
+		return -ECOMM;
 	}
 
 	ath10k_htc_setup_target_buffer_assignments(htc);
@@ -600,14 +588,10 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 	status = ath10k_htc_connect_service(htc, &conn_req, &conn_resp);
 	if (status) {
 		ath10k_err("could not connect to htc service (%d)\n", status);
-		goto err_target;
+		return status;
 	}
 
 	return 0;
-err_target:
-	ath10k_hif_stop(htc->ar);
-err_start:
-	return status;
 }
 
 int ath10k_htc_connect_service(struct ath10k_htc *htc,
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
