Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuYju-0001Dj-7x
 for ath10k@lists.infradead.org; Tue, 28 Aug 2018 07:48:39 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: Add waiting htt tx complete before wow enable
Date: Tue, 28 Aug 2018 15:47:23 +0800
Message-Id: <1535442443-22152-1-git-send-email-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

If there have some tx packets pending in firmware, and then system
enter suspend, firmware will fail for wow enable. This will trigger
mac80211 to stop ath10k and download firmware again, then it is
non-wow suspend.

After add the waiting htt tx complete, then firmware will have some
time window to send or flush the pending tx packets.

Tested with QCA6174 PCI with firmware
WLAN.RM.4.4.1-00109-QCARMSWPZ-1, but this will also affect QCA9377 PCI.
It's not a regression with new firmware releases.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 22 +++++++++++++---------
 drivers/net/wireless/ath/ath10k/mac.h |  1 +
 drivers/net/wireless/ath/ath10k/wow.c |  2 ++
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 95243b4..4cd33c9 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6717,23 +6717,17 @@ static int ath10k_mac_op_set_frag_threshold(struct ieee80211_hw *hw, u32 value)
 	return -EOPNOTSUPP;
 }
 
-static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
-			 u32 queues, bool drop)
+void ath10k_mac_wait_tx_complete(struct ath10k *ar)
 {
-	struct ath10k *ar = hw->priv;
 	bool skip;
 	long time_left;
 
 	/* mac80211 doesn't care if we really xmit queued frames or not
 	 * we'll collect those frames either way if we stop/delete vdevs
 	 */
-	if (drop)
-		return;
-
-	mutex_lock(&ar->conf_mutex);
 
 	if (ar->state == ATH10K_STATE_WEDGED)
-		goto skip;
+		return;
 
 	time_left = wait_event_timeout(ar->htt.empty_tx_wq, ({
 			bool empty;
@@ -6752,8 +6746,18 @@ static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	if (time_left == 0 || skip)
 		ath10k_warn(ar, "failed to flush transmit queue (skip %i ar-state %i): %ld\n",
 			    skip, ar->state, time_left);
+}
 
-skip:
+static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			 u32 queues, bool drop)
+{
+	struct ath10k *ar = hw->priv;
+
+	if (drop)
+		return;
+
+	mutex_lock(&ar->conf_mutex);
+	ath10k_mac_wait_tx_complete(ar);
 	mutex_unlock(&ar->conf_mutex);
 }
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.h b/drivers/net/wireless/ath/ath10k/mac.h
index 81f8d6c..570493d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.h
+++ b/drivers/net/wireless/ath/ath10k/mac.h
@@ -82,6 +82,7 @@ struct ieee80211_txq *ath10k_mac_txq_lookup(struct ath10k *ar,
 					    u16 peer_id,
 					    u8 tid);
 int ath10k_mac_ext_resource_config(struct ath10k *ar, u32 val);
+void ath10k_mac_wait_tx_complete(struct ath10k *ar);
 
 static inline void ath10k_tx_h_seq_no(struct ieee80211_vif *vif,
 				      struct sk_buff *skb)
diff --git a/drivers/net/wireless/ath/ath10k/wow.c b/drivers/net/wireless/ath/ath10k/wow.c
index a6b179f..af444df 100644
--- a/drivers/net/wireless/ath/ath10k/wow.c
+++ b/drivers/net/wireless/ath/ath10k/wow.c
@@ -374,6 +374,8 @@ int ath10k_wow_op_suspend(struct ieee80211_hw *hw,
 		goto cleanup;
 	}
 
+	ath10k_mac_wait_tx_complete(ar);
+
 	ret = ath10k_wow_enable(ar);
 	if (ret) {
 		ath10k_warn(ar, "failed to start wow: %d\n", ret);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
