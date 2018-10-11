Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAaIK-0000fI-9j
 for ath10k@lists.infradead.org; Thu, 11 Oct 2018 12:42:27 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH 2/2] ath10k: report tx rate using ieee80211_tx_rate_update()
Date: Thu, 11 Oct 2018 18:15:04 +0530
Message-Id: <1539261904-9016-3-git-send-email-akolli@codeaurora.org>
In-Reply-To: <1539261904-9016-1-git-send-email-akolli@codeaurora.org>
References: <1539261904-9016-1-git-send-email-akolli@codeaurora.org>
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
Cc: Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org

Mesh path metric needs tx rate information from ieee80211_tx_status()
call but in ath10k there is no mechanism to report tx rate information
via ieee80211_tx_status(), the tx rate is only accessible via
sta_statiscs() op.

Per peer tx stats has tx rate info available, Tx rate is available
to ath10k driver after every 4 PPDU sent in the air. For each PPDU,
ath10k driver updates rate informattion to mac80211 using
ieee80211_tx_rate_update().

Per peer txrate information is updated through per peer statistics
and is available for QCA9888/QCA9984/QCA4019/QCA998X only

Tested on QCA9984 with firmware-5.bin_10.4-3.5.3-00053
Tested on QCA998X with firmware-5.bin_10.2.4-1.0-00036

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.h   |    1 +
 drivers/net/wireless/ath/ath10k/htt_rx.c |   70 +++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/wmi.h    |    1 +
 3 files changed, 66 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 491eb0d2fc5f..cd4ed5cab630 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -494,6 +494,7 @@ struct ath10k_sta {
 	u32 smps;
 	u16 peer_id;
 	struct rate_info txrate;
+	struct ieee80211_tx_info tx_info;
 
 	struct work_struct update_wk;
 	u64 rx_duration;
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index b862d5de5e2f..2c871ecd6afc 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2627,7 +2627,7 @@ void ath10k_htt_htc_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 		dev_kfree_skb_any(skb);
 }
 
-static inline int ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
+static inline s8 ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 {
 	static const u8 legacy_rates[] = {1, 2, 5, 11, 6, 9, 12,
 					  18, 24, 36, 48, 54};
@@ -2646,7 +2646,7 @@ static inline int ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 ath10k_accumulate_per_peer_tx_stats(struct ath10k *ar,
 				    struct ath10k_sta *arsta,
 				    struct ath10k_per_peer_tx_stats *pstats,
-				    u8 legacy_rate_idx)
+				    s8 legacy_rate_idx)
 {
 	struct rate_info *txrate = &arsta->txrate;
 	struct ath10k_htt_tx_stats *tx_stats;
@@ -2768,8 +2768,11 @@ static inline int ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 				struct ath10k_per_peer_tx_stats *peer_stats)
 {
 	struct ath10k_sta *arsta = (struct ath10k_sta *)sta->drv_priv;
-	u8 rate = 0, rate_idx = 0, sgi;
+	struct ieee80211_chanctx_conf *conf = NULL;
 	struct rate_info txrate;
+	u8 rate = 0, sgi;
+	s8 rate_idx = 0;
+	bool skip_auto_rate;
 
 	lockdep_assert_held(&ar->data_lock);
 
@@ -2778,6 +2781,13 @@ static inline int ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 	txrate.nss = ATH10K_HW_NSS(peer_stats->ratecode);
 	txrate.mcs = ATH10K_HW_MCS_RATE(peer_stats->ratecode);
 	sgi = ATH10K_HW_GI(peer_stats->flags);
+	skip_auto_rate = ATH10K_FW_SKIPPED_RATE_CTRL(peer_stats->flags);
+
+	/* Firmware's rate control skips broadcast/management frames,
+	 * if host has configure fixed rates and in some other special cases.
+	 */
+	if (skip_auto_rate)
+		return;
 
 	if (txrate.flags == WMI_RATE_PREAMBLE_VHT && txrate.mcs > 9) {
 		ath10k_warn(ar, "Invalid VHT mcs %hhd peer stats",  txrate.mcs);
@@ -2792,7 +2802,7 @@ static inline int ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 	}
 
 	memset(&arsta->txrate, 0, sizeof(arsta->txrate));
-
+	memset(&arsta->tx_info.status, 0, sizeof(arsta->tx_info.status));
 	if (txrate.flags == WMI_RATE_PREAMBLE_CCK ||
 	    txrate.flags == WMI_RATE_PREAMBLE_OFDM) {
 		rate = ATH10K_HW_LEGACY_RATE(peer_stats->ratecode);
@@ -2811,11 +2821,59 @@ static inline int ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 		arsta->txrate.mcs = txrate.mcs;
 	}
 
-	if (sgi)
-		arsta->txrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
+	switch (txrate.flags) {
+	case WMI_RATE_PREAMBLE_OFDM:
+		if (arsta->arvif && arsta->arvif->vif)
+			conf = rcu_dereference(arsta->arvif->vif->chanctx_conf);
+		if (conf && conf->def.chan->band == NL80211_BAND_5GHZ)
+			arsta->tx_info.status.rates[0].idx = rate_idx - 4;
+		break;
+	case WMI_RATE_PREAMBLE_CCK:
+		arsta->tx_info.status.rates[0].idx = rate_idx;
+		if (sgi)
+			arsta->tx_info.status.rates[0].flags |=
+				(IEEE80211_TX_RC_USE_SHORT_PREAMBLE |
+				 IEEE80211_TX_RC_SHORT_GI);
+		break;
+	case WMI_RATE_PREAMBLE_HT:
+		arsta->tx_info.status.rates[0].idx =
+				txrate.mcs + ((txrate.nss - 1) * 8);
+		if (sgi)
+			arsta->tx_info.status.rates[0].flags |=
+					IEEE80211_TX_RC_SHORT_GI;
+		arsta->tx_info.status.rates[0].flags |= IEEE80211_TX_RC_MCS;
+		break;
+	case WMI_RATE_PREAMBLE_VHT:
+		ieee80211_rate_set_vht(&arsta->tx_info.status.rates[0],
+				       txrate.mcs, txrate.nss);
+		if (sgi)
+			arsta->tx_info.status.rates[0].flags |=
+						IEEE80211_TX_RC_SHORT_GI;
+		arsta->tx_info.status.rates[0].flags |= IEEE80211_TX_RC_VHT_MCS;
+		break;
+	}
 
 	arsta->txrate.nss = txrate.nss;
 	arsta->txrate.bw = ath10k_bw_to_mac80211_bw(txrate.bw);
+	if (sgi)
+		arsta->txrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
+
+	switch (arsta->txrate.bw) {
+	case RATE_INFO_BW_40:
+		arsta->tx_info.status.rates[0].flags |=
+				IEEE80211_TX_RC_40_MHZ_WIDTH;
+		break;
+	case RATE_INFO_BW_80:
+		arsta->tx_info.status.rates[0].flags |=
+				IEEE80211_TX_RC_80_MHZ_WIDTH;
+		break;
+	}
+
+	if (peer_stats->succ_pkts) {
+		arsta->tx_info.flags = IEEE80211_TX_STAT_ACK;
+		arsta->tx_info.status.rates[0].count = 1;
+		ieee80211_tx_rate_update(ar->hw, sta, &arsta->tx_info);
+	}
 
 	if (ath10k_debug_is_extd_tx_stats_enabled(ar))
 		ath10k_accumulate_per_peer_tx_stats(ar, arsta, peer_stats,
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 300f20523204..ef41a0b827f2 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4984,6 +4984,7 @@ enum wmi_rate_preamble {
 	(((preamble) << 6) | ((nss) << 4) | (rate))
 #define ATH10K_HW_AMPDU(flags)		((flags) & 0x1)
 #define ATH10K_HW_BA_FAIL(flags)	(((flags) >> 1) & 0x3)
+#define ATH10K_FW_SKIPPED_RATE_CTRL(flags)	(((flags) >> 6) & 0x1)
 
 #define ATH10K_VHT_MCS_NUM	10
 #define ATH10K_BW_NUM		4
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
