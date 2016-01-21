Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x232.google.com ([2a00:1450:4010:c07::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMFYw-0000Nq-7D
 for ath10k@lists.infradead.org; Thu, 21 Jan 2016 13:46:15 +0000
Received: by mail-lf0-x232.google.com with SMTP id m198so26897329lfm.0
 for <ath10k@lists.infradead.org>; Thu, 21 Jan 2016 05:45:52 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 11/13] ath10k: store txq in skb_cb
Date: Thu, 21 Jan 2016 14:46:44 +0100
Message-Id: <1453384006-31907-12-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
References: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
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

This will be necessary for later.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.h |  1 +
 drivers/net/wireless/ath/ath10k/mac.c  | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 38ed4bbd220b..5be56a8343bd 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -95,6 +95,7 @@ struct ath10k_skb_cb {
 	u8 eid;
 	u16 msdu_id;
 	struct ieee80211_vif *vif;
+	struct ieee80211_txq *txq;
 } __packed;
 
 struct ath10k_skb_rxcb {
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 42020c22eaed..639da03572e0 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3311,6 +3311,7 @@ static void ath10k_tx_h_add_p2p_noa_ie(struct ath10k *ar,
 
 static void ath10k_mac_tx_h_fill_cb(struct ath10k *ar,
 				    struct ieee80211_vif *vif,
+				    struct ieee80211_txq *txq,
 				    struct sk_buff *skb)
 {
 	struct ieee80211_hdr *hdr = (void *)skb->data;
@@ -3327,6 +3328,7 @@ static void ath10k_mac_tx_h_fill_cb(struct ath10k *ar,
 		cb->flags |= ATH10K_SKB_F_QOS;
 
 	cb->vif = vif;
+	cb->txq = txq;
 }
 
 bool ath10k_mac_tx_frm_has_freq(struct ath10k *ar)
@@ -3660,7 +3662,7 @@ static int ath10k_mac_tx_push_txq(struct ieee80211_hw *hw,
 		return -ENOENT;
 	}
 
-	ath10k_mac_tx_h_fill_cb(ar, vif, skb);
+	ath10k_mac_tx_h_fill_cb(ar, vif, txq, skb);
 
 	txmode = ath10k_mac_tx_h_get_txmode(ar, vif, sta, skb);
 	txpath = ath10k_mac_tx_h_get_txpath(ar, skb, txmode);
@@ -3792,6 +3794,27 @@ void ath10k_mac_tx_push_pending(struct ath10k *ar)
 	spin_unlock_bh(&ar->htt.tx_lock);
 }
 
+static void ath10k_mac_txq_unref(struct ath10k *ar,
+				 struct ieee80211_txq *txq)
+{
+	struct ath10k_skb_cb *cb;
+	struct sk_buff *msdu;
+	int msdu_id;
+
+	if (!txq)
+		return;
+
+	spin_lock_bh(&ar->htt.tx_lock);
+
+	idr_for_each_entry(&ar->htt.pending_tx, msdu, msdu_id) {
+		cb = ATH10K_SKB_CB(msdu);
+		if (cb->txq == txq)
+			cb->txq = NULL;
+	}
+
+	spin_unlock_bh(&ar->htt.tx_lock);
+}
+
 /************/
 /* Scanning */
 /************/
@@ -3963,6 +3986,7 @@ static void ath10k_mac_op_tx(struct ieee80211_hw *hw,
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_vif *vif = info->control.vif;
 	struct ieee80211_sta *sta = control->sta;
+	struct ieee80211_txq *txq = NULL;
 	struct ieee80211_hdr *hdr = (void *)skb->data;
 	enum ath10k_hw_txrx_mode txmode;
 	enum ath10k_mac_tx_path txpath;
@@ -3971,7 +3995,7 @@ static void ath10k_mac_op_tx(struct ieee80211_hw *hw,
 	bool is_presp;
 	int ret;
 
-	ath10k_mac_tx_h_fill_cb(ar, vif, skb);
+	ath10k_mac_tx_h_fill_cb(ar, vif, txq, skb);
 
 	txmode = ath10k_mac_tx_h_get_txmode(ar, vif, sta, skb);
 	txpath = ath10k_mac_tx_h_get_txpath(ar, skb, txmode);
@@ -5010,6 +5034,7 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 	spin_unlock_bh(&ar->data_lock);
 
 	ath10k_peer_cleanup(ar, arvif->vdev_id);
+	ath10k_mac_txq_unref(ar, vif->txq);
 
 	if (vif->type == NL80211_IFTYPE_MONITOR) {
 		ar->monitor_arvif = NULL;
@@ -5872,6 +5897,9 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 		}
 		spin_unlock_bh(&ar->data_lock);
 
+		for (i = 0; i < ARRAY_SIZE(sta->txq); i++)
+			ath10k_mac_txq_unref(ar, sta->txq[i]);
+
 		if (!sta->tdls)
 			goto exit;
 
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
