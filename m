Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69oy-0005vL-Cz
 for ath10k@lists.infradead.org; Thu, 13 Aug 2020 09:46:58 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH 2/3] ath10k: remove return for NL80211_STA_INFO_TX_BITRATE
Date: Thu, 13 Aug 2020 17:47:08 +0800
Message-Id: <1597312029-32348-3-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1597312029-32348-1-git-send-email-wgong@codeaurora.org>
References: <1597312029-32348-1-git-send-email-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org

ath10k_sta_statistics is used to report many info to iw wlan0 link,
if it return for empty legacy and nss of arsta->txrate, then the other
stats after it will not be set.

It has 4 bit to set after the return:
NL80211_STA_INFO_TX_FAILED
NL80211_STA_INFO_RX_BITRATE
NL80211_STA_INFO_TX_BITRATE
NL80211_STA_INFO_TX_RETRIES

This patch not effect the info of above 4 bit for all hardware, reason
as below:

NL80211_STA_INFO_TX_FAILED is only for htt.disable_tx_comp is true, it
is for QCA6174 SDIO.

NL80211_STA_INFO_RX_BITRATE and NL80211_STA_INFO_TX_BITRATE are both
set in ath10k_mac_sta_get_peer_stats_info, it is only enabled for chips
which supports_peer_stats_info is true in hw_params, recently only for
QCA6174 SDIO, NL80211_STA_INFO_TX_BITRATE is set again in function
ath10k_mac_sta_get_peer_stats_info because the value which parsed from
arsta->tx_rate_code and arsta->tx_bitrate_kbps is correct for QCA6174
SDIO and PCIe, and the value arsta->txrate is not correct for QCA6174
SDIO and PCIe, so it need to set again with the correct value.

NL80211_STA_INFO_TX_RETRIES is use value of arsta->tx_retries, it is set
in ath10k_update_per_peer_tx_stats, which accumulate the retry_pkts in
HTT message from firmware, if the chips not support this feature, then
it is always 0 after accumulate, then iw wlan0 station dump always show
0 for retry count. If not set NL80211_STA_INFO_TX_RETRIES here, then it
is still 0, so the result is same, then set NL80211_STA_INFO_TX_RETRIES
has no effect.

Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00048
Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3e3896214e8b..4554a82d0105 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8533,18 +8533,17 @@ static void ath10k_sta_statistics(struct ieee80211_hw *hw,
 	sinfo->rx_duration = arsta->rx_duration;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_DURATION);
 
-	if (!arsta->txrate.legacy && !arsta->txrate.nss)
-		return;
-
-	if (arsta->txrate.legacy) {
-		sinfo->txrate.legacy = arsta->txrate.legacy;
-	} else {
-		sinfo->txrate.mcs = arsta->txrate.mcs;
-		sinfo->txrate.nss = arsta->txrate.nss;
-		sinfo->txrate.bw = arsta->txrate.bw;
+	if (arsta->txrate.legacy || arsta->txrate.nss) {
+		if (arsta->txrate.legacy) {
+			sinfo->txrate.legacy = arsta->txrate.legacy;
+		} else {
+			sinfo->txrate.mcs = arsta->txrate.mcs;
+			sinfo->txrate.nss = arsta->txrate.nss;
+			sinfo->txrate.bw = arsta->txrate.bw;
+		}
+		sinfo->txrate.flags = arsta->txrate.flags;
+		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
 	}
-	sinfo->txrate.flags = arsta->txrate.flags;
-	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
 
 	if (ar->htt.disable_tx_comp) {
 		sinfo->tx_failed = arsta->tx_failed;
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
