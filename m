Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMFYt-0000NA-BH
 for ath10k@lists.infradead.org; Thu, 21 Jan 2016 13:46:10 +0000
Received: by mail-lb0-x22a.google.com with SMTP id x4so23776975lbm.0
 for <ath10k@lists.infradead.org>; Thu, 21 Jan 2016 05:45:46 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 07/13] ath10k: implement wake_tx_queue
Date: Thu, 21 Jan 2016 14:46:40 +0100
Message-Id: <1453384006-31907-8-git-send-email-michal.kazior@tieto.com>
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

This actually prepares a few knobs for
new firmware supporting pull-push Tx model where
firmware asks host to submit frames for given
stations and tids.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 89 +++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 00789afa5dec..111baa104f8e 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3624,6 +3624,85 @@ void ath10k_mgmt_over_wmi_tx_work(struct work_struct *work)
 	}
 }
 
+static bool ath10k_mac_tx_can_push(struct ieee80211_hw *hw,
+				   struct ieee80211_txq *txq)
+{
+	return 1; /* TBD */
+}
+
+static int ath10k_mac_tx_push_txq(struct ieee80211_hw *hw,
+				  struct ieee80211_txq *txq)
+{
+	const bool is_mgmt = false;
+	const bool is_presp = false;
+	struct ath10k *ar = hw->priv;
+	struct ath10k_htt *htt = &ar->htt;
+	struct ieee80211_vif *vif = txq->vif;
+	struct ieee80211_sta *sta = txq->sta;
+	enum ath10k_hw_txrx_mode txmode;
+	enum ath10k_mac_tx_path txpath;
+	struct sk_buff *skb;
+	int ret;
+
+	spin_lock_bh(&ar->htt.tx_lock);
+	ret = ath10k_htt_tx_inc_pending(htt, is_mgmt, is_presp);
+	spin_unlock_bh(&ar->htt.tx_lock);
+
+	if (ret)
+		return ret;
+
+	skb = ieee80211_tx_dequeue(hw, txq);
+	if (!skb) {
+		spin_lock_bh(&ar->htt.tx_lock);
+		ath10k_htt_tx_dec_pending(htt, is_mgmt);
+		spin_unlock_bh(&ar->htt.tx_lock);
+
+		return -ENOENT;
+	}
+
+	ath10k_mac_tx_h_fill_cb(ar, vif, skb);
+
+	txmode = ath10k_mac_tx_h_get_txmode(ar, vif, sta, skb);
+	txpath = ath10k_mac_tx_h_get_txpath(ar, skb, txmode);
+
+	ret = ath10k_mac_tx(ar, vif, sta, txmode, txpath, skb);
+	if (unlikely(ret)) {
+		ath10k_warn(ar, "failed to push frame: %d\n", ret);
+
+		spin_lock_bh(&ar->htt.tx_lock);
+		ath10k_htt_tx_dec_pending(htt, is_mgmt);
+		spin_unlock_bh(&ar->htt.tx_lock);
+
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ath10k_mac_tx_push(struct ieee80211_hw *hw,
+			       struct ieee80211_txq *txq)
+{
+	struct ath10k *ar = hw->priv;
+	int ret;
+
+	ret = ath10k_mac_tx_push_txq(hw, txq);
+	if (unlikely(ret)) {
+		if (txq->sta)
+			ath10k_warn(ar, "failed to push tx to station %pM tid %hhu: %d\n",
+				    txq->sta->addr, txq->tid, ret);
+		else
+			ath10k_warn(ar, "failed to push tx to interface %pM: %d\n",
+				    txq->vif->addr, ret);
+		return;
+	}
+}
+
+static void ath10k_mac_tx_wake(struct ieee80211_hw *hw,
+			       struct ieee80211_txq *txq)
+{
+	WARN_ON(1); /* TBD */
+}
+
 /************/
 /* Scanning */
 /************/
@@ -3840,6 +3919,15 @@ static void ath10k_mac_op_tx(struct ieee80211_hw *hw,
 	}
 }
 
+static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
+					struct ieee80211_txq *txq)
+{
+	if (ath10k_mac_tx_can_push(hw, txq))
+		ath10k_mac_tx_push(hw, txq);
+	else
+		ath10k_mac_tx_wake(hw, txq);
+}
+
 /* Must not be called with conf_mutex held as workers can use that also. */
 void ath10k_drain_tx(struct ath10k *ar)
 {
@@ -6998,6 +7086,7 @@ ath10k_mac_op_switch_vif_chanctx(struct ieee80211_hw *hw,
 
 static const struct ieee80211_ops ath10k_ops = {
 	.tx				= ath10k_mac_op_tx,
+	.wake_tx_queue			= ath10k_mac_op_wake_tx_queue,
 	.start				= ath10k_start,
 	.stop				= ath10k_stop,
 	.config				= ath10k_config,
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
