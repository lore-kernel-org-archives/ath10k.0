Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSyl9-0008AG-Dr
 for ath10k@lists.infradead.org; Mon, 27 Apr 2020 08:05:00 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v2 4/4] ath10k: correct tx bitrate of iw for SDIO
Date: Mon, 27 Apr 2020 16:04:16 +0800
Message-Id: <20200427080416.8265-5-wgong@codeaurora.org>
In-Reply-To: <20200427080416.8265-1-wgong@codeaurora.org>
References: <20200427080416.8265-1-wgong@codeaurora.org>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org

For legacy mode, tx bitrate not show correct sometimes, for example:
iw wlan0 link
Connected to 8c:21:0a:b3:5a:64 (on wlan0)
        SSID: tplinkgw
        freq: 2462
        RX: 19672 bytes (184 packets)
        TX: 9851 bytes (87 packets)
        signal: -51 dBm
        rx bitrate: 54.0 MBit/s
        tx bitrate: 2.8 MBit/s

This patch use the tx bitrate info from WMI_TLV_PEER_STATS_INFO_EVENTID
report from firmware, and tx bitrate show correct.

iw wlan0 link
Connected to 8c:21:0a:b3:5a:64 (on wlan0)
        SSID: tplinkgw
        freq: 2462
        RX: 13973 bytes (120 packets)
        TX: 6737 bytes (57 packets)
        signal: -52 dBm
        rx bitrate: 54.0 MBit/s
        tx bitrate: 54.0 MBit/s

This patch only effect SDIO chip, ath10k_mac_sta_get_peer_stats_info
has check for bitrate_statistics of hw_params, it is enabled only for
"qca6174 hw3.2 sdio".

Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00042.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.h    |  2 ++
 drivers/net/wireless/ath/ath10k/mac.c     | 10 ++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  2 ++
 3 files changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 1700bf59e8fa..ad6ef8d492c8 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -526,6 +526,8 @@ struct ath10k_sta {
 
 	u32 rx_rate_code;
 	u32 rx_bitrate_kbps;
+	u32 tx_rate_code;
+	u32 tx_bitrate_kbps;
 	struct work_struct update_wk;
 	u64 rx_duration;
 	struct ath10k_htt_tx_stats *tx_stats;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 38fc8cb3aac9..0b7d510d2725 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8502,6 +8502,16 @@ static void ath10k_mac_sta_get_peer_stats_info(struct ath10k *ar,
 		arsta->rx_rate_code = 0;
 		arsta->rx_bitrate_kbps = 0;
 	}
+
+	if (arsta->tx_rate_code != 0 && arsta->tx_bitrate_kbps != 0) {
+		ath10k_mac_parse_bitrate(ar, arsta->tx_rate_code,
+					 arsta->tx_bitrate_kbps,
+					 &sinfo->txrate);
+
+		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
+		arsta->tx_rate_code = 0;
+		arsta->tx_bitrate_kbps = 0;
+	}
 }
 
 static void ath10k_sta_statistics(struct ieee80211_hw *hw,
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index eec1f1f27dec..9187b62b331c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -249,6 +249,8 @@ static int ath10k_wmi_tlv_parse_peer_stats_info(struct ath10k *ar, u16 tag, u16
 	arsta = (struct ath10k_sta *)sta->drv_priv;
 	arsta->rx_rate_code = __le32_to_cpu(stat->last_rx_rate_code);
 	arsta->rx_bitrate_kbps = __le32_to_cpu(stat->last_rx_bitrate_kbps);
+	arsta->tx_rate_code = __le32_to_cpu(stat->last_tx_rate_code);
+	arsta->tx_bitrate_kbps = __le32_to_cpu(stat->last_tx_bitrate_kbps);
 
 	return 0;
 }
-- 
2.23.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
