Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3Z7D-00015d-G3
 for ath10k@lists.infradead.org; Tue, 12 Mar 2019 04:34:12 +0000
From: Brandon Huang <yanghuan@codeaurora.org>
Subject: [PATCH] ath10k: Fix the tx stats bytes & packets parsing
Date: Tue, 12 Mar 2019 12:33:39 +0800
Message-Id: <1552365219-16842-1-git-send-email-yanghuan@codeaurora.org>
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
Cc: Brandon Huang <yanghuan@codeaurora.org>, linux-wireless@vger.kernel.org

In tx_stats debugfs, txrate->flags may contain multiple bits. For
example, RATE_INFO_FLAGS_SHORT_GI could be set, and tx stats bytes
and packets will be not updated correctly.

Fix this issue by using bit operation to check txrate->flags.

Tested HW: QCA9984
Tested Firmware: 10.4-3.9.0.1-00007

Signed-off-by: Brandon Huang <yanghuan@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index a20ea27..584b86b 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2938,14 +2938,14 @@ static inline s8 ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 
 #define STATS_OP_FMT(name) tx_stats->stats[ATH10K_STATS_TYPE_##name]
 
-	if (txrate->flags == RATE_INFO_FLAGS_VHT_MCS) {
+	if (txrate->flags & RATE_INFO_FLAGS_VHT_MCS) {
 		STATS_OP_FMT(SUCC).vht[0][mcs] += pstats->succ_bytes;
 		STATS_OP_FMT(SUCC).vht[1][mcs] += pstats->succ_pkts;
 		STATS_OP_FMT(FAIL).vht[0][mcs] += pstats->failed_bytes;
 		STATS_OP_FMT(FAIL).vht[1][mcs] += pstats->failed_pkts;
 		STATS_OP_FMT(RETRY).vht[0][mcs] += pstats->retry_bytes;
 		STATS_OP_FMT(RETRY).vht[1][mcs] += pstats->retry_pkts;
-	} else if (txrate->flags == RATE_INFO_FLAGS_MCS) {
+	} else if (txrate->flags & RATE_INFO_FLAGS_MCS) {
 		STATS_OP_FMT(SUCC).ht[0][ht_idx] += pstats->succ_bytes;
 		STATS_OP_FMT(SUCC).ht[1][ht_idx] += pstats->succ_pkts;
 		STATS_OP_FMT(FAIL).ht[0][ht_idx] += pstats->failed_bytes;
@@ -2966,7 +2966,7 @@ static inline s8 ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 	if (ATH10K_HW_AMPDU(pstats->flags)) {
 		tx_stats->ba_fails += ATH10K_HW_BA_FAIL(pstats->flags);
 
-		if (txrate->flags == RATE_INFO_FLAGS_MCS) {
+		if (txrate->flags & RATE_INFO_FLAGS_MCS) {
 			STATS_OP_FMT(AMPDU).ht[0][ht_idx] +=
 				pstats->succ_bytes + pstats->retry_bytes;
 			STATS_OP_FMT(AMPDU).ht[1][ht_idx] +=
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
