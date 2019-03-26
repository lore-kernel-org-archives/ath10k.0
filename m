Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8oxJ-0002fn-VV
 for ath10k@lists.infradead.org; Tue, 26 Mar 2019 16:29:43 +0000
Received: by mail-lj1-x243.google.com with SMTP id t13so11654546lji.2
 for <ath10k@lists.infradead.org>; Tue, 26 Mar 2019 09:29:41 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 1/2] ath10k: add inline wrapper for htt_h2t_aggr_cfg_msg
Date: Tue, 26 Mar 2019 17:29:03 +0100
Message-Id: <20190326162904.6737-1-erik.stromdahl@gmail.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

This is done in order to make the *htt_h2t_aggr_cfg_msg* op align better
with the rest of the htt ops (whom all have inline wrappers).

It also adds support for the case when the op is missing (function
pointer is NULL).

As a result of this, the name of the 32 bit implementation in htt_tx.c
was changed and the function was made static.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt.c    |  2 +-
 drivers/net/wireless/ath/ath10k/htt.h    | 16 +++++++++++++---
 drivers/net/wireless/ath/ath10k/htt_tx.c |  8 ++++----
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.c b/drivers/net/wireless/ath/ath10k/htt.c
index d235ff3098e8..7b75200ceae5 100644
--- a/drivers/net/wireless/ath/ath10k/htt.c
+++ b/drivers/net/wireless/ath/ath10k/htt.c
@@ -257,7 +257,7 @@ int ath10k_htt_setup(struct ath10k_htt *htt)
 		return status;
 	}
 
-	status = htt->tx_ops->htt_h2t_aggr_cfg_msg(htt,
+	status = ath10k_htt_h2t_aggr_cfg_msg(htt,
 					     htt->max_num_ampdu,
 					     htt->max_num_amsdu);
 	if (status) {
diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 4cee5492abc8..30fb556589d1 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -2048,6 +2048,19 @@ static inline void ath10k_htt_free_txbuff(struct ath10k_htt *htt)
 		htt->tx_ops->htt_free_txbuff(htt);
 }
 
+static inline int ath10k_htt_h2t_aggr_cfg_msg(struct ath10k_htt *htt,
+					      u8 max_subfrms_ampdu,
+					      u8 max_subfrms_amsdu)
+
+{
+	if (!htt->tx_ops->htt_h2t_aggr_cfg_msg)
+		return -EOPNOTSUPP;
+
+	return htt->tx_ops->htt_h2t_aggr_cfg_msg(htt,
+						 max_subfrms_ampdu,
+						 max_subfrms_amsdu);
+}
+
 struct ath10k_htt_rx_ops {
 	size_t (*htt_get_rx_ring_size)(struct ath10k_htt *htt);
 	void (*htt_config_paddrs_ring)(struct ath10k_htt *htt, void *vaddr);
@@ -2196,9 +2209,6 @@ void ath10k_htt_htc_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb);
 bool ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb);
 int ath10k_htt_h2t_ver_req_msg(struct ath10k_htt *htt);
 int ath10k_htt_h2t_stats_req(struct ath10k_htt *htt, u8 mask, u64 cookie);
-int ath10k_htt_h2t_aggr_cfg_msg(struct ath10k_htt *htt,
-				u8 max_subfrms_ampdu,
-				u8 max_subfrms_amsdu);
 void ath10k_htt_hif_tx_complete(struct ath10k *ar, struct sk_buff *skb);
 int ath10k_htt_tx_fetch_resp(struct ath10k *ar,
 			     __le32 token,
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index d8e9cc0bb772..8d533f5eb1aa 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -977,9 +977,9 @@ static int ath10k_htt_send_rx_ring_cfg_hl(struct ath10k_htt *htt)
 	return 0;
 }
 
-int ath10k_htt_h2t_aggr_cfg_msg(struct ath10k_htt *htt,
-				u8 max_subfrms_ampdu,
-				u8 max_subfrms_amsdu)
+static int ath10k_htt_h2t_aggr_cfg_msg_32(struct ath10k_htt *htt,
+					  u8 max_subfrms_ampdu,
+					  u8 max_subfrms_amsdu)
 {
 	struct ath10k *ar = htt->ar;
 	struct htt_aggr_conf *aggr_conf;
@@ -1728,7 +1728,7 @@ static const struct ath10k_htt_tx_ops htt_tx_ops_32 = {
 	.htt_tx = ath10k_htt_tx_32,
 	.htt_alloc_txbuff = ath10k_htt_tx_alloc_cont_txbuf_32,
 	.htt_free_txbuff = ath10k_htt_tx_free_cont_txbuf_32,
-	.htt_h2t_aggr_cfg_msg = ath10k_htt_h2t_aggr_cfg_msg,
+	.htt_h2t_aggr_cfg_msg = ath10k_htt_h2t_aggr_cfg_msg_32,
 };
 
 static const struct ath10k_htt_tx_ops htt_tx_ops_64 = {
-- 
2.19.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
