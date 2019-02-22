Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gx58j-0008ER-Ag
 for ath10k@lists.infradead.org; Fri, 22 Feb 2019 07:20:59 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH 2/4] ath10k: Fix the wrong updation of BW in tx_stats debugfs
 entry
Date: Fri, 22 Feb 2019 12:50:32 +0530
Message-Id: <1550820034-18603-3-git-send-email-svishnoi@codeaurora.org>
In-Reply-To: <1550820034-18603-1-git-send-email-svishnoi@codeaurora.org>
References: <1550820034-18603-1-git-send-email-svishnoi@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Surabhi Vishnoi <svishnoi@codeaurora.org>

Currently, the bandwidth is updated wrongly in BW table in tx_stats
debugfs per sta as there is difference in number of bandwidth type
in mac80211 and driver stats table. This leads to bandwidth getting
updated at wrong index in bandwidth table in tx_stats.

Fix this index mismatch between mac80211 and driver stats table (BW table)
by making the number of bandwidth type in driver compatible with mac80211.

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1

Fixes: a904417fc876 ("ath10k: add extended per sta tx statistics support")
Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/debugfs_sta.c | 8 +++++---
 drivers/net/wireless/ath/ath10k/wmi.h         | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
index 4778a45..645ba9c 100644
--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -696,11 +696,13 @@ static ssize_t ath10k_dbg_sta_dump_tx_stats(struct file *file,
 						 "  %llu ", stats->ht[j][i]);
 			len += scnprintf(buf + len, size - len, "\n");
 			len += scnprintf(buf + len, size - len,
-					" BW %s (20,40,80,160 MHz)\n", str[j]);
+					" BW %s (20,5,10,40,80,160 MHz)\n",
+					str[j]);
 			len += scnprintf(buf + len, size - len,
-					 "  %llu %llu %llu %llu\n",
+					 "  %llu %llu %llu %llu %llu %llu\n",
 					 stats->bw[j][0], stats->bw[j][1],
-					 stats->bw[j][2], stats->bw[j][3]);
+					 stats->bw[j][2], stats->bw[j][3],
+					 stats->bw[j][4], stats->bw[j][5]);
 			len += scnprintf(buf + len, size - len,
 					 " NSS %s (1x1,2x2,3x3,4x4)\n", str[j]);
 			len += scnprintf(buf + len, size - len,
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 0e27878..7053db4 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -5056,7 +5056,7 @@ enum wmi_rate_preamble {
 #define ATH10K_FW_SKIPPED_RATE_CTRL(flags)	(((flags) >> 6) & 0x1)
 
 #define ATH10K_VHT_MCS_NUM	10
-#define ATH10K_BW_NUM		4
+#define ATH10K_BW_NUM		6
 #define ATH10K_NSS_NUM		4
 #define ATH10K_LEGACY_NUM	12
 #define ATH10K_GI_NUM		2
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
