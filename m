Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gx58p-0008T2-Pt
 for ath10k@lists.infradead.org; Fri, 22 Feb 2019 07:21:05 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH 4/4] ath10k: Fix the wrong calculation ht_idx and idx of rate
 table for tx_stats
Date: Fri, 22 Feb 2019 12:50:34 +0530
Message-Id: <1550820034-18603-5-git-send-email-svishnoi@codeaurora.org>
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

ht_idx (ht rate index) and idx (rate table index) are calculated based on
mcs index. This mcs index used in the above calculation should be 0-9 for
getting the correct ht_idx and idx.

Currently the mcs index used for the above calculations is mcs index which
can be 0-31 (in case of HT), leading to incorrect rate index and ht index
values.

Fix the issue by obtaining mcs value from the ratecode reported by firmware
and use it for calculating ht_idx and idx (rate-table index).

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1

Fixes: e88975ca37d1 ("ath10k: dump tx stats in rate table format")
Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 5b1dd58..b504c4f 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2931,11 +2931,11 @@ static inline s8 ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 
 	tx_stats = arsta->tx_stats;
 	gi = test_bit(ATH10K_RATE_INFO_FLAGS_SGI_BIT, &flags);
-	ht_idx = txrate->mcs + txrate->nss * 8;
-	mcs = txrate->mcs;
+	mcs = ATH10K_HW_MCS_RATE(pstats->ratecode);
 	bw = txrate->bw;
 	nss = txrate->nss;
-	idx = mcs * 8 + 8 * 10 * nss;
+	ht_idx = mcs + (nss - 1) * 8;
+	idx = mcs * 8 + 8 * 10 * (nss - 1);
 	idx += bw * 2 + gi;
 
 #define STATS_OP_FMT(name) tx_stats->stats[ATH10K_STATS_TYPE_##name]
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
