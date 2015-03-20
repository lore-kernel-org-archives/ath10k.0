Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x236.google.com ([2a00:1450:4010:c04::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYxQN-0006dt-HV
 for ath10k@lists.infradead.org; Fri, 20 Mar 2015 13:57:20 +0000
Received: by lbbsy1 with SMTP id sy1so75919509lbb.1
 for <ath10k@lists.infradead.org>; Fri, 20 Mar 2015 06:56:57 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 8/9] ath10k: deduplicate bitrate to rate idx conversion
Date: Fri, 20 Mar 2015 13:54:14 +0000
Message-Id: <1426859655-11797-9-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1426859655-11797-1-git-send-email-michal.kazior@tieto.com>
References: <1426859655-11797-1-git-send-email-michal.kazior@tieto.com>
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

It's possible to derive rate index from bitrate
without any additional mapping structures/logic.

This should have little to none impact on
performance since this is only done for management
frames and the previous approach wasn't
particularly optimized.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 12 +++++++
 drivers/net/wireless/ath/ath10k/mac.h |  3 ++
 drivers/net/wireless/ath/ath10k/wmi.c | 62 +++--------------------------------
 3 files changed, 19 insertions(+), 58 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index e1902e3..c39a300 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -103,6 +103,18 @@ u8 ath10k_mac_hw_rate_to_idx(const struct ieee80211_supported_band *sband,
 	return 0;
 }
 
+u8 ath10k_mac_bitrate_to_idx(const struct ieee80211_supported_band *sband,
+			     u32 bitrate)
+{
+	int i;
+
+	for (i = 0; i < sband->n_bitrates; i++)
+		if (sband->bitrates[i].bitrate == bitrate)
+			return i;
+
+	return 0;
+}
+
 /**********/
 /* Crypto */
 /**********/
diff --git a/drivers/net/wireless/ath/ath10k/mac.h b/drivers/net/wireless/ath/ath10k/mac.h
index e615490..e7df017 100644
--- a/drivers/net/wireless/ath/ath10k/mac.h
+++ b/drivers/net/wireless/ath/ath10k/mac.h
@@ -47,8 +47,11 @@ bool ath10k_mac_is_peer_wep_key_set(struct ath10k *ar, const u8 *addr,
 				    u8 keyidx);
 void ath10k_mac_handle_beacon(struct ath10k *ar, struct sk_buff *skb);
 void ath10k_mac_handle_beacon_miss(struct ath10k *ar, u32 vdev_id);
+
 u8 ath10k_mac_hw_rate_to_idx(const struct ieee80211_supported_band *sband,
 			     u8 hw_rate);
+u8 ath10k_mac_bitrate_to_idx(const struct ieee80211_supported_band *sband,
+			     u32 bitrate);
 
 static inline struct ath10k_vif *ath10k_vif_to_arvif(struct ieee80211_vif *vif)
 {
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 54430a1..bd7a119 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1352,63 +1352,6 @@ static inline enum ieee80211_band phy_mode_to_band(u32 phy_mode)
 	return band;
 }
 
-static inline u8 get_rate_idx(u32 rate, enum ieee80211_band band)
-{
-	u8 rate_idx = 0;
-
-	/* rate in Kbps */
-	switch (rate) {
-	case 1000:
-		rate_idx = 0;
-		break;
-	case 2000:
-		rate_idx = 1;
-		break;
-	case 5500:
-		rate_idx = 2;
-		break;
-	case 11000:
-		rate_idx = 3;
-		break;
-	case 6000:
-		rate_idx = 4;
-		break;
-	case 9000:
-		rate_idx = 5;
-		break;
-	case 12000:
-		rate_idx = 6;
-		break;
-	case 18000:
-		rate_idx = 7;
-		break;
-	case 24000:
-		rate_idx = 8;
-		break;
-	case 36000:
-		rate_idx = 9;
-		break;
-	case 48000:
-		rate_idx = 10;
-		break;
-	case 54000:
-		rate_idx = 11;
-		break;
-	default:
-		break;
-	}
-
-	if (band == IEEE80211_BAND_5GHZ) {
-		if (rate_idx > 3)
-			/* Omit CCK rates */
-			rate_idx -= 4;
-		else
-			rate_idx = 0;
-	}
-
-	return rate_idx;
-}
-
 /* If keys are configured, HW decrypts all frames
  * with protected bit set. Mark such frames as decrypted.
  */
@@ -1490,6 +1433,7 @@ int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	struct wmi_mgmt_rx_ev_arg arg = {};
 	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 	struct ieee80211_hdr *hdr;
+	struct ieee80211_supported_band *sband;
 	u32 rx_status;
 	u32 channel;
 	u32 phy_mode;
@@ -1560,9 +1504,11 @@ int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	if (phy_mode == MODE_11B && status->band == IEEE80211_BAND_5GHZ)
 		ath10k_dbg(ar, ATH10K_DBG_MGMT, "wmi mgmt rx 11b (CCK) on 5GHz\n");
 
+	sband = &ar->mac.sbands[status->band];
+
 	status->freq = ieee80211_channel_to_frequency(channel, status->band);
 	status->signal = snr + ATH10K_DEFAULT_NOISE_FLOOR;
-	status->rate_idx = get_rate_idx(rate, status->band);
+	status->rate_idx = ath10k_mac_bitrate_to_idx(sband, rate / 100);
 
 	hdr = (struct ieee80211_hdr *)skb->data;
 	fc = le16_to_cpu(hdr->frame_control);
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
