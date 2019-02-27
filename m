Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gytPh-00068l-4w
 for ath10k@lists.infradead.org; Wed, 27 Feb 2019 07:13:59 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH 1/2] ath10k: Add support for adding htt_rx_ops based on
 htt_version
Date: Wed, 27 Feb 2019 12:43:47 +0530
Message-Id: <1551251628-22518-2-git-send-email-svishnoi@codeaurora.org>
In-Reply-To: <1551251628-22518-1-git-send-email-svishnoi@codeaurora.org>
References: <1551251628-22518-1-git-send-email-svishnoi@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Surabhi Vishnoi <svishnoi@codeaurora.org>

Refactor the code to add the support to attach htt_rx_ops
based on HTT version.

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1

Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt.h    |  3 ++-
 drivers/net/wireless/ath/ath10k/htt_rx.c | 29 ++++++++++++++++++++++++++---
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index fef716a..0ab29bd 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1894,7 +1894,7 @@ struct ath10k_htt {
 
 	bool tx_mem_allocated;
 	const struct ath10k_htt_tx_ops *tx_ops;
-	const struct ath10k_htt_rx_ops *rx_ops;
+	struct ath10k_htt_rx_ops *rx_ops;
 };
 
 struct ath10k_htt_tx_ops {
@@ -1969,6 +1969,7 @@ struct ath10k_htt_rx_ops {
 				    int idx);
 	void* (*htt_get_vaddr_ring)(struct ath10k_htt *htt);
 	void (*htt_reset_paddrs_ring)(struct ath10k_htt *htt, int idx);
+	void (*htt_fetch_peer_stats)(struct ath10k *ar, struct sk_buff *skb);
 };
 
 static inline size_t ath10k_htt_get_rx_ring_size(struct ath10k_htt *htt)
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 4fc8856..c7a2411 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -3143,6 +3143,11 @@ static inline s8 ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 						    rate_idx);
 }
 
+static void ath10k_htt_fetch_peer_stats_tlv(struct ath10k *ar,
+					    struct sk_buff *skb)
+{
+}
+
 static void ath10k_htt_fetch_peer_stats(struct ath10k *ar,
 					struct sk_buff *skb)
 {
@@ -3556,7 +3561,7 @@ int ath10k_htt_txrx_compl_task(struct ath10k *ar, int budget)
 }
 EXPORT_SYMBOL(ath10k_htt_txrx_compl_task);
 
-static const struct ath10k_htt_rx_ops htt_rx_ops_32 = {
+static struct ath10k_htt_rx_ops htt_rx_ops_32 = {
 	.htt_get_rx_ring_size = ath10k_htt_get_rx_ring_size_32,
 	.htt_config_paddrs_ring = ath10k_htt_config_paddrs_ring_32,
 	.htt_set_paddrs_ring = ath10k_htt_set_paddrs_ring_32,
@@ -3564,7 +3569,10 @@ int ath10k_htt_txrx_compl_task(struct ath10k *ar, int budget)
 	.htt_reset_paddrs_ring = ath10k_htt_reset_paddrs_ring_32,
 };
 
-static const struct ath10k_htt_rx_ops htt_rx_ops_64 = {
+/* FIXME: Some other way to attach ops to static const htt rx_ops
+ * without removing const??
+ */
+static struct ath10k_htt_rx_ops htt_rx_ops_64 = {
 	.htt_get_rx_ring_size = ath10k_htt_get_rx_ring_size_64,
 	.htt_config_paddrs_ring = ath10k_htt_config_paddrs_ring_64,
 	.htt_set_paddrs_ring = ath10k_htt_set_paddrs_ring_64,
@@ -3572,7 +3580,7 @@ int ath10k_htt_txrx_compl_task(struct ath10k *ar, int budget)
 	.htt_reset_paddrs_ring = ath10k_htt_reset_paddrs_ring_64,
 };
 
-static const struct ath10k_htt_rx_ops htt_rx_ops_hl = {
+static struct ath10k_htt_rx_ops htt_rx_ops_hl = {
 };
 
 void ath10k_htt_set_rx_ops(struct ath10k_htt *htt)
@@ -3585,4 +3593,19 @@ void ath10k_htt_set_rx_ops(struct ath10k_htt *htt)
 		htt->rx_ops = &htt_rx_ops_64;
 	else
 		htt->rx_ops = &htt_rx_ops_32;
+
+	switch (ar->running_fw->fw_file.htt_op_version) {
+	case ATH10K_FW_HTT_OP_VERSION_MAIN:
+	case ATH10K_FW_HTT_OP_VERSION_10_1:
+	case ATH10K_FW_HTT_OP_VERSION_10_4:
+		htt->rx_ops->htt_fetch_peer_stats = ath10k_htt_fetch_peer_stats;
+	break;
+	case ATH10K_FW_HTT_OP_VERSION_TLV:
+		htt->rx_ops->htt_fetch_peer_stats = ath10k_htt_fetch_peer_stats_tlv;
+	break;
+	case ATH10K_FW_HTT_OP_VERSION_MAX:
+	case ATH10K_FW_HTT_OP_VERSION_UNSET:
+		WARN_ON(1);
+	return;
+	}
 }
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
