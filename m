Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRRon-00044J-2X
 for ath10k@lists.infradead.org; Thu, 23 Apr 2020 02:42:31 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: add statistics of tx retries and tx failed when tx
 complete disable
Date: Thu, 23 Apr 2020 10:41:34 +0800
Message-Id: <20200423024134.10601-1-wgong@codeaurora.org>
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

When tx complete is disabled, all tx status will be set with status
HTT_TX_COMPL_STATE_ACK and indicate to mac80211 by ieee80211_tx_status,
then it does not have the statistics for retries and failed packets.
count of tx retries and tx failed of command "iw wlan0 station dump"
are both 0. If tx complete is not disabled, then firmware report the
tx status and ath10k indicate the status to mac80211, then mac80211
save the statistics and command "iw wlan0 station dump" show them.

for example:
localhost ~ # iw dev wlan0 station dump
Station 3c:28:6d:96:fd:69 (on wlan0)
	inactive time:	5 ms
	rx bytes:	1325012
	rx packets:	6477
	tx bytes:	85264
	tx packets:	518
	tx retries:	0
	tx failed:	0

This patch only effect chips with tx complete disabled, e.g. SDIO.

with this patch, output of command "iw dev wlan0 station dump":
Station c4:04:15:5d:97:22 (on wlan0)
        inactive time:  608 ms
        rx bytes:       180366
        rx packets:     991
        tx bytes:       98765577
        tx packets:     64624
        tx retries:     14682
        tx failed:      47086

Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00042.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.h   | 2 ++
 drivers/net/wireless/ath/ath10k/htt_rx.c | 7 +++++++
 drivers/net/wireless/ath/ath10k/mac.c    | 7 +++++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index d6adcbaf9616..07935d39d6d6 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -500,6 +500,8 @@ struct ath10k_sta {
 	u16 peer_id;
 	struct rate_info txrate;
 	struct ieee80211_tx_info tx_info;
+	u32 tx_retries;
+	u32 tx_failed;
 	u32 last_tx_bitrate;
 
 	struct work_struct update_wk;
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 816af1a8ad69..d787cbead56a 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -3574,6 +3574,13 @@ ath10k_update_per_peer_tx_stats(struct ath10k *ar,
 		ieee80211_tx_rate_update(ar->hw, sta, &arsta->tx_info);
 	}
 
+	if (ar->htt.disable_tx_comp) {
+		arsta->tx_retries += peer_stats->retry_pkts;
+		arsta->tx_failed += peer_stats->failed_pkts;
+		ath10k_dbg(ar, ATH10K_DBG_HTT, "htt tx retries %d tx failed %d\n",
+			   arsta->tx_retries, arsta->tx_failed);
+	}
+
 	if (ath10k_debug_is_extd_tx_stats_enabled(ar))
 		ath10k_accumulate_per_peer_tx_stats(ar, arsta, peer_stats,
 						    rate_idx);
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 6791c0035be0..842ae5a529ad 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8321,6 +8321,13 @@ static void ath10k_sta_statistics(struct ieee80211_hw *hw,
 	}
 	sinfo->txrate.flags = arsta->txrate.flags;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
+
+	if (ar->htt.disable_tx_comp) {
+		sinfo->tx_retries = arsta->tx_retries;
+		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
+		sinfo->tx_failed = arsta->tx_failed;
+		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_FAILED);
+	}
 }
 
 static const struct ieee80211_ops ath10k_ops = {
-- 
2.23.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
