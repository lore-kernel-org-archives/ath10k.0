Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW5Qi-0001Bw-TA
 for ath10k@lists.infradead.org; Thu, 12 Mar 2015 15:53:50 +0000
From: Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH 1/3] ath10k: htc: match wait_for_completion_timeout return type
Date: Thu, 12 Mar 2015 11:49:11 -0400
Message-Id: <1426175351-8606-1-git-send-email-hofrat@osadl.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Nicholas Mc Guire <hofrat@osadl.org>

Return type of wait_for_completion_timeout is unsigned long not int.
An appropriately named unsigned long is added and the assignments fixed up.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

Note: this patch generates a checkpatch CHECK
CHECK: Alignment should match open parenthesis
#53: FILE: drivers/net/wireless/ath/ath10k/htc.c:574:
but the alternative is to go over 80 char so this should be ok ?

Patch was only compile tested with x86_64_defconfig + CONFIG_ATH_CARDS=m,
CONFIG_ATH10K=m

Patch is against 4.0-rc3 (localversion-next is -next-20150312)

 drivers/net/wireless/ath/ath10k/htc.c |   22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 2fd9e18..c15edc1 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -548,6 +548,7 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 {
 	struct ath10k *ar = htc->ar;
 	int i, status = 0;
+	unsigned long time_left;
 	struct ath10k_htc_svc_conn_req conn_req;
 	struct ath10k_htc_svc_conn_resp conn_resp;
 	struct ath10k_htc_msg *msg;
@@ -555,9 +556,9 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 	u16 credit_count;
 	u16 credit_size;
 
-	status = wait_for_completion_timeout(&htc->ctl_resp,
-					     ATH10K_HTC_WAIT_TIMEOUT_HZ);
-	if (status == 0) {
+	time_left = wait_for_completion_timeout(&htc->ctl_resp,
+						ATH10K_HTC_WAIT_TIMEOUT_HZ);
+	if (!time_left) {
 		/* Workaround: In some cases the PCI HIF doesn't
 		 * receive interrupt for the control response message
 		 * even if the buffer was completed. It is suspected
@@ -569,10 +570,10 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 		for (i = 0; i < CE_COUNT; i++)
 			ath10k_hif_send_complete_check(htc->ar, i, 1);
 
-		status = wait_for_completion_timeout(&htc->ctl_resp,
-						     ATH10K_HTC_WAIT_TIMEOUT_HZ);
+		time_left = wait_for_completion_timeout(&htc->ctl_resp,
+						ATH10K_HTC_WAIT_TIMEOUT_HZ);
 
-		if (status == 0)
+		if (!time_left)
 			status = -ETIMEDOUT;
 	}
 
@@ -646,6 +647,7 @@ int ath10k_htc_connect_service(struct ath10k_htc *htc,
 	struct sk_buff *skb;
 	unsigned int max_msg_size = 0;
 	int length, status;
+	unsigned long time_left;
 	bool disable_credit_flow_ctrl = false;
 	u16 message_id, service_id, flags = 0;
 	u8 tx_alloc = 0;
@@ -701,10 +703,10 @@ int ath10k_htc_connect_service(struct ath10k_htc *htc,
 	}
 
 	/* wait for response */
-	status = wait_for_completion_timeout(&htc->ctl_resp,
-					     ATH10K_HTC_CONN_SVC_TIMEOUT_HZ);
-	if (status == 0) {
-		ath10k_err(ar, "Service connect timeout: %d\n", status);
+	time_left = wait_for_completion_timeout(&htc->ctl_resp,
+						ATH10K_HTC_CONN_SVC_TIMEOUT_HZ);
+	if (!time_left) {
+		ath10k_err(ar, "Service connect timeout\n");
 		return -ETIMEDOUT;
 	}
 
-- 
1.7.10.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
