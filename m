Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3NF7-0006Bh-0t
 for ath10k@lists.infradead.org; Mon, 11 Mar 2019 15:53:34 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH 1/2] ath10k: Fix rate table updation in tx stats
Date: Mon, 11 Mar 2019 21:23:21 +0530
Message-Id: <1552319602-17795-2-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1552319602-17795-1-git-send-email-pillair@codeaurora.org>
References: <1552319602-17795-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org

The index for updating rate table, which is displayed
in the tx stats via debugfs, is calculated using the
bandwidth value. The bandwidth values do not map
correctly with the bandwidth values shown in the rate table.

Correct the bandwidth value calculation which is used
to calculate the index for rate table updation for tx stats.

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1

Fixes: e88975ca37d1 ("ath10k: dump tx stats in rate table format")
Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index a20ea27..8c3c940 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2922,6 +2922,7 @@ ath10k_accumulate_per_peer_tx_stats(struct ath10k *ar,
 	struct ath10k_htt_tx_stats *tx_stats;
 	int idx, ht_idx, gi, mcs, bw, nss;
 	unsigned long flags;
+	int rtable_bw;
 
 	if (!arsta->tx_stats)
 		return;
@@ -2930,11 +2931,12 @@ ath10k_accumulate_per_peer_tx_stats(struct ath10k *ar,
 	flags = txrate->flags;
 	gi = test_bit(ATH10K_RATE_INFO_FLAGS_SGI_BIT, &flags);
 	mcs = ATH10K_HW_MCS_RATE(pstats->ratecode);
+	rtable_bw = ath10k_get_bw(&ar->hw_params, pstats->flags);
 	bw = txrate->bw;
 	nss = txrate->nss;
 	ht_idx = mcs + (nss - 1) * 8;
 	idx = mcs * 8 + 8 * 10 * (nss - 1);
-	idx += bw * 2 + gi;
+	idx += rtable_bw * 2 + gi;
 
 #define STATS_OP_FMT(name) tx_stats->stats[ATH10K_STATS_TYPE_##name]
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
