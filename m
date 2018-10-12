Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAqUs-0005sC-DK
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 06:00:28 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCHv2] ath10k: Dump tx stats in rate table format
Date: Fri, 12 Oct 2018 11:33:28 +0530
Message-Id: <1539324208-10525-1-git-send-email-akolli@codeaurora.org>
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

This patch adds the tx statistics pkts/bytes dump
in rate table format.

Dump format table is similar to http://mcsindex.com/

Tested on QCA9984/QCA4019/QCA988x
Firmware: 10.4-3.5.3-00057
	  10.2.4-1.0-00037
command:
cat /sys/kernel/debug/ieee80211/phy0/netdev\:wlan0/
    stations/<MACADDR>/tx_stats

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.h        |    1 +
 drivers/net/wireless/ath/ath10k/debugfs_sta.c |   12 +++++++++++-
 drivers/net/wireless/ath/ath10k/htt_rx.c      |   17 ++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi.h         |    1 +
 4 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index c76af343db3d..491eb0d2fc5f 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -474,6 +474,7 @@ struct ath10k_htt_data_stats {
 	u64 bw[ATH10K_COUNTER_TYPE_MAX][ATH10K_BW_NUM];
 	u64 nss[ATH10K_COUNTER_TYPE_MAX][ATH10K_NSS_NUM];
 	u64 gi[ATH10K_COUNTER_TYPE_MAX][ATH10K_GI_NUM];
+	u64 rate_table[ATH10K_COUNTER_TYPE_MAX][ATH10K_RATE_TABLE_NUM];
 };
 
 struct ath10k_htt_tx_stats {
diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
index b09cdc699c69..0f3fd65a459e 100644
--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -665,7 +665,7 @@ static ssize_t ath10k_dbg_sta_dump_tx_stats(struct file *file,
 						       "retry", "ampdu"};
 	const char *str[ATH10K_COUNTER_TYPE_MAX] = {"bytes", "packets"};
 	int len = 0, i, j, k, retval = 0;
-	const int size = 2 * 4096;
+	const int size = 16 * 4096;
 	char *buf;
 
 	buf = kzalloc(size, GFP_KERNEL);
@@ -719,6 +719,16 @@ static ssize_t ath10k_dbg_sta_dump_tx_stats(struct file *file,
 				len += scnprintf(buf + len, size - len, "%llu ",
 						 stats->legacy[j][i]);
 			len += scnprintf(buf + len, size - len, "\n");
+			len += scnprintf(buf + len, size - len,
+					 " Rate table %s (1,2 ... Mbps)\n  ",
+					 str[j]);
+			for (i = 0; i < ATH10K_RATE_TABLE_NUM; i++) {
+				len += scnprintf(buf + len, size - len, "%llu ",
+						 stats->rate_table[j][i]);
+				if (!((i + 1) % 8))
+					len +=
+					scnprintf(buf + len, size - len, "\n  ");
+			}
 		}
 	}
 
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index f2405258a6d3..b862d5de5e2f 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2650,7 +2650,7 @@ static inline int ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 {
 	struct rate_info *txrate = &arsta->txrate;
 	struct ath10k_htt_tx_stats *tx_stats;
-	int ht_idx, gi, mcs, bw, nss;
+	int idx, ht_idx, gi, mcs, bw, nss;
 
 	if (!arsta->tx_stats)
 		return;
@@ -2661,6 +2661,8 @@ static inline int ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 	mcs = txrate->mcs;
 	bw = txrate->bw;
 	nss = txrate->nss;
+	idx = mcs * 8 + 8 * 10 * nss;
+	idx += bw * 2 + gi;
 
 #define STATS_OP_FMT(name) tx_stats->stats[ATH10K_STATS_TYPE_##name]
 
@@ -2711,12 +2713,16 @@ static inline int ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 			pstats->succ_bytes + pstats->retry_bytes;
 		STATS_OP_FMT(AMPDU).gi[0][gi] +=
 			pstats->succ_bytes + pstats->retry_bytes;
+		STATS_OP_FMT(AMPDU).rate_table[0][idx] +=
+			pstats->succ_bytes + pstats->retry_bytes;
 		STATS_OP_FMT(AMPDU).bw[1][bw] +=
 			pstats->succ_pkts + pstats->retry_pkts;
 		STATS_OP_FMT(AMPDU).nss[1][nss] +=
 			pstats->succ_pkts + pstats->retry_pkts;
 		STATS_OP_FMT(AMPDU).gi[1][gi] +=
 			pstats->succ_pkts + pstats->retry_pkts;
+		STATS_OP_FMT(AMPDU).rate_table[1][idx] +=
+			pstats->succ_pkts + pstats->retry_pkts;
 	} else {
 		tx_stats->ack_fails +=
 				ATH10K_HW_BA_FAIL(pstats->flags);
@@ -2745,6 +2751,15 @@ static inline int ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 	STATS_OP_FMT(RETRY).bw[1][bw] += pstats->retry_pkts;
 	STATS_OP_FMT(RETRY).nss[1][nss] += pstats->retry_pkts;
 	STATS_OP_FMT(RETRY).gi[1][gi] += pstats->retry_pkts;
+
+	if (txrate->flags >= RATE_INFO_FLAGS_MCS) {
+		STATS_OP_FMT(SUCC).rate_table[0][idx] += pstats->succ_bytes;
+		STATS_OP_FMT(SUCC).rate_table[1][idx] += pstats->succ_pkts;
+		STATS_OP_FMT(FAIL).rate_table[0][idx] += pstats->failed_bytes;
+		STATS_OP_FMT(FAIL).rate_table[1][idx] += pstats->failed_pkts;
+		STATS_OP_FMT(RETRY).rate_table[0][idx] += pstats->retry_bytes;
+		STATS_OP_FMT(RETRY).rate_table[1][idx] += pstats->retry_pkts;
+	}
 }
 
 static void
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index f67c52757ea6..300f20523204 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4991,6 +4991,7 @@ enum wmi_rate_preamble {
 #define ATH10K_LEGACY_NUM	12
 #define ATH10K_GI_NUM		2
 #define ATH10K_HT_MCS_NUM	32
+#define ATH10K_RATE_TABLE_NUM	320
 
 /* Value to disable fixed rate setting */
 #define WMI_FIXED_RATE_NONE    (0xff)
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
