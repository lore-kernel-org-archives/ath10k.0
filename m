Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7Oyp-0008Qp-03
 for ath10k@lists.infradead.org; Wed, 16 Jul 2014 13:10:43 +0000
Received: by mail-wi0-f172.google.com with SMTP id n3so6134528wiv.11
 for <ath10k@lists.infradead.org>; Wed, 16 Jul 2014 06:10:20 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: workaround boot issues with KVM/PCI-passthrough
Date: Wed, 16 Jul 2014 15:01:39 +0200
Message-Id: <1405515699-32452-1-git-send-email-michal.kazior@tieto.com>
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

Apparently iomap writes that unmask CE irqs aren't
propagated properly sometimes. Before failing try
to poll for the control response message as it may
have been delivered without an interrupt.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htc.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index e493db4..5fdc40d 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -546,7 +546,7 @@ static u8 ath10k_htc_get_credit_allocation(struct ath10k_htc *htc,
 
 int ath10k_htc_wait_target(struct ath10k_htc *htc)
 {
-	int status = 0;
+	int i, status = 0;
 	struct ath10k_htc_svc_conn_req conn_req;
 	struct ath10k_htc_svc_conn_resp conn_resp;
 	struct ath10k_htc_msg *msg;
@@ -556,10 +556,26 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 
 	status = wait_for_completion_timeout(&htc->ctl_resp,
 					     ATH10K_HTC_WAIT_TIMEOUT_HZ);
-	if (status <= 0) {
+	if (status == 0) {
+		/* Workaround: In some cases the PCI HIF doesn't
+		 * receive interrupt for the control response message
+		 * even if the buffer was completed. It is suspected
+		 * iomap writes unmasking PCI CE irqs aren't propagated
+		 * properly in KVM PCI-passthrough sometimes.
+		 */
+		ath10k_warn("failed to receive control response completion, polling..\n");
+
+		for (i = 0; i < CE_COUNT; i++)
+			ath10k_hif_send_complete_check(htc->ar, i, 1);
+
+		status = wait_for_completion_timeout(&htc->ctl_resp,
+					ATH10K_HTC_WAIT_TIMEOUT_HZ);
+
 		if (status == 0)
 			status = -ETIMEDOUT;
+	}
 
+	if (status < 0) {
 		ath10k_err("ctl_resp never came in (%d)\n", status);
 		return status;
 	}
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
