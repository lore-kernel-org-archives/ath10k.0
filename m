Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyZ26-0001M4-67
 for ath10k@lists.infradead.org; Tue, 26 Feb 2019 09:28:15 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH v2 1/4] ath10k: Fix the incorrect updation of NSS data in tx
 stats
Date: Tue, 26 Feb 2019 14:57:55 +0530
Message-Id: <1551173278-20926-2-git-send-email-svishnoi@codeaurora.org>
In-Reply-To: <1551173278-20926-1-git-send-email-svishnoi@codeaurora.org>
References: <1551173278-20926-1-git-send-email-svishnoi@codeaurora.org>
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

The NSS data is updated incorrectly in the tx stats as the array
indexing starts from zero.

Fix the incorrect updation of NSS data in tx_stats by taking into
consideration the array index starting from zero.

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1

Fixes: a904417fc876 ("ath10k: add extended per sta tx statistics support")
Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 4fc8856..941ae20 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2969,7 +2969,7 @@ static inline s8 ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 		}
 		STATS_OP_FMT(AMPDU).bw[0][bw] +=
 			pstats->succ_bytes + pstats->retry_bytes;
-		STATS_OP_FMT(AMPDU).nss[0][nss] +=
+		STATS_OP_FMT(AMPDU).nss[0][nss - 1] +=
 			pstats->succ_bytes + pstats->retry_bytes;
 		STATS_OP_FMT(AMPDU).gi[0][gi] +=
 			pstats->succ_bytes + pstats->retry_bytes;
@@ -2977,7 +2977,7 @@ static inline s8 ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 			pstats->succ_bytes + pstats->retry_bytes;
 		STATS_OP_FMT(AMPDU).bw[1][bw] +=
 			pstats->succ_pkts + pstats->retry_pkts;
-		STATS_OP_FMT(AMPDU).nss[1][nss] +=
+		STATS_OP_FMT(AMPDU).nss[1][nss - 1] +=
 			pstats->succ_pkts + pstats->retry_pkts;
 		STATS_OP_FMT(AMPDU).gi[1][gi] +=
 			pstats->succ_pkts + pstats->retry_pkts;
@@ -2989,27 +2989,27 @@ static inline s8 ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 	}
 
 	STATS_OP_FMT(SUCC).bw[0][bw] += pstats->succ_bytes;
-	STATS_OP_FMT(SUCC).nss[0][nss] += pstats->succ_bytes;
+	STATS_OP_FMT(SUCC).nss[0][nss - 1] += pstats->succ_bytes;
 	STATS_OP_FMT(SUCC).gi[0][gi] += pstats->succ_bytes;
 
 	STATS_OP_FMT(SUCC).bw[1][bw] += pstats->succ_pkts;
-	STATS_OP_FMT(SUCC).nss[1][nss] += pstats->succ_pkts;
+	STATS_OP_FMT(SUCC).nss[1][nss - 1] += pstats->succ_pkts;
 	STATS_OP_FMT(SUCC).gi[1][gi] += pstats->succ_pkts;
 
 	STATS_OP_FMT(FAIL).bw[0][bw] += pstats->failed_bytes;
-	STATS_OP_FMT(FAIL).nss[0][nss] += pstats->failed_bytes;
+	STATS_OP_FMT(FAIL).nss[0][nss - 1] += pstats->failed_bytes;
 	STATS_OP_FMT(FAIL).gi[0][gi] += pstats->failed_bytes;
 
 	STATS_OP_FMT(FAIL).bw[1][bw] += pstats->failed_pkts;
-	STATS_OP_FMT(FAIL).nss[1][nss] += pstats->failed_pkts;
+	STATS_OP_FMT(FAIL).nss[1][nss - 1] += pstats->failed_pkts;
 	STATS_OP_FMT(FAIL).gi[1][gi] += pstats->failed_pkts;
 
 	STATS_OP_FMT(RETRY).bw[0][bw] += pstats->retry_bytes;
-	STATS_OP_FMT(RETRY).nss[0][nss] += pstats->retry_bytes;
+	STATS_OP_FMT(RETRY).nss[0][nss - 1] += pstats->retry_bytes;
 	STATS_OP_FMT(RETRY).gi[0][gi] += pstats->retry_bytes;
 
 	STATS_OP_FMT(RETRY).bw[1][bw] += pstats->retry_pkts;
-	STATS_OP_FMT(RETRY).nss[1][nss] += pstats->retry_pkts;
+	STATS_OP_FMT(RETRY).nss[1][nss - 1] += pstats->retry_pkts;
 	STATS_OP_FMT(RETRY).gi[1][gi] += pstats->retry_pkts;
 
 	if (txrate->flags >= RATE_INFO_FLAGS_MCS) {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
