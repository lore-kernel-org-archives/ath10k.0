Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW8UO-0007SC-N3
 for ath10k@lists.infradead.org; Tue, 15 Oct 2013 17:33:01 +0000
Received: by mail-pa0-f44.google.com with SMTP id lf10so9362625pab.31
 for <ath10k@lists.infradead.org>; Tue, 15 Oct 2013 10:32:39 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 7/7] ath10k: fix FW crashes on heavy TX on 10.1.389 AP FW
Date: Tue, 15 Oct 2013 10:29:56 -0700
Message-Id: <1381858196-17000-8-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1381858196-17000-1-git-send-email-michal.kazior@tieto.com>
References: <1381858196-17000-1-git-send-email-michal.kazior@tieto.com>
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

10.1.389 firmware has some differences in
calculation of number of outstanding HTT TX
completions. This led to FW crashes of 10.1.389
while main firmware branch was unnaffected.

The patch makes sure ath10k doesn't queue up more
MSDUs than it should.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/ce.c     | 11 +++++++++++
 drivers/net/wireless/ath/ath10k/htt_tx.c | 11 ++++-------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index e46951b..d243f28 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1050,6 +1050,17 @@ struct ath10k_ce_pipe *ath10k_ce_init(struct ath10k *ar,
 	u32 ctrl_addr = ath10k_ce_base_address(ce_id);
 	int ret;
 
+	/*
+	 * Make sure there's enough CE ringbuffer entries for HTT TX to avoid
+	 * additional TX locking checks.
+	 *
+	 * For the lack of a better place do the check here.
+	 */
+	BUILD_BUG_ON(TARGET_NUM_MSDU_DESC >
+		     (CE_HTT_H2T_MSG_SRC_NENTRIES - 1));
+	BUILD_BUG_ON(TARGET_10X_NUM_MSDU_DESC >
+		     (CE_HTT_H2T_MSG_SRC_NENTRIES - 1));
+
 	ret = ath10k_pci_wake(ar);
 	if (ret)
 		return NULL;
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index d9335e9..f1d36d2 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -85,16 +85,13 @@ void ath10k_htt_tx_free_msdu_id(struct ath10k_htt *htt, u16 msdu_id)
 
 int ath10k_htt_tx_attach(struct ath10k_htt *htt)
 {
-	u8 pipe;
-
 	spin_lock_init(&htt->tx_lock);
 	init_waitqueue_head(&htt->empty_tx_wq);
 
-	/* At the beginning free queue number should hint us the maximum
-	 * queue length */
-	pipe = htt->ar->htc.endpoint[htt->eid].ul_pipe_id;
-	htt->max_num_pending_tx = ath10k_hif_get_free_queue_number(htt->ar,
-								   pipe);
+	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, htt->ar->fw_features))
+		htt->max_num_pending_tx = TARGET_10X_NUM_MSDU_DESC;
+	else
+		htt->max_num_pending_tx = TARGET_NUM_MSDU_DESC;
 
 	ath10k_dbg(ATH10K_DBG_BOOT, "htt tx max num pending tx %d\n",
 		   htt->max_num_pending_tx);
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
