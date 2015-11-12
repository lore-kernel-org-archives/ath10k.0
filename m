Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwwji-0004sY-P4
 for ath10k@lists.infradead.org; Thu, 12 Nov 2015 18:36:43 +0000
From: Yanbo Li <yanbol@qca.qualcomm.com>
Subject: [PATCH] ath10k: Fix the wrong RX rate idx report at 11G mode
Date: Thu, 12 Nov 2015 10:36:10 -0800
Message-ID: <1447353370-24465-1-git-send-email-yanbol@qca.qualcomm.com>
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
To: kvalo@qca.qualcomm.com
Cc: dreamfly281@gmail.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

The RX rate idx is not correctly for 11G mode OFDM packet.
Because the bitrate table start with CCK index instead of OFDM.

Signed-off-by: Yanbo Li <yanbol@qca.qualcomm.com>

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 6060dda4e910..9dcf93d1bd24 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -674,7 +674,7 @@ static void ath10k_htt_rx_h_rates(struct ath10k *ar,
 		rate &= ~RX_PPDU_START_RATE_FLAG;
 
 		sband = &ar->mac.sbands[status->band];
-		status->rate_idx = ath10k_mac_hw_rate_to_idx(sband, rate);
+		status->rate_idx = ath10k_mac_hw_rate_to_idx(sband, rate, cck);
 		break;
 	case HTT_RX_HT:
 	case HTT_RX_HT_WITH_TXBF:
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 484c1a10372f..02feb5fe27d5 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -90,7 +90,7 @@ static u8 ath10k_mac_bitrate_to_rate(int bitrate)
 }
 
 u8 ath10k_mac_hw_rate_to_idx(const struct ieee80211_supported_band *sband,
-			     u8 hw_rate)
+			     u8 hw_rate, bool cck)
 {
 	const struct ieee80211_rate *rate;
 	int i;
@@ -98,6 +98,9 @@ u8 ath10k_mac_hw_rate_to_idx(const struct ieee80211_supported_band *sband,
 	for (i = 0; i < sband->n_bitrates; i++) {
 		rate = &sband->bitrates[i];
 
+		if (ath10k_mac_bitrate_is_cck(rate->bitrate) != cck)
+			continue;
+
 		if (rate->hw_value == hw_rate)
 			return i;
 		else if (rate->flags & IEEE80211_RATE_SHORT_PREAMBLE &&
diff --git a/drivers/net/wireless/ath/ath10k/mac.h b/drivers/net/wireless/ath/ath10k/mac.h
index e3cefe4c7cfd..3b0f0fd2af9e 100644
--- a/drivers/net/wireless/ath/ath10k/mac.h
+++ b/drivers/net/wireless/ath/ath10k/mac.h
@@ -66,7 +66,7 @@ void ath10k_mac_handle_tx_pause_vdev(struct ath10k *ar, u32 vdev_id,
 				     enum wmi_tlv_tx_pause_action action);
 
 u8 ath10k_mac_hw_rate_to_idx(const struct ieee80211_supported_band *sband,
-			     u8 hw_rate);
+			     u8 hw_rate, bool cck);
 u8 ath10k_mac_bitrate_to_idx(const struct ieee80211_supported_band *sband,
 			     u32 bitrate);
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
