Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3NF8-0006DE-RI
 for ath10k@lists.infradead.org; Mon, 11 Mar 2019 15:53:40 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH 2/2] ath10k: Fix NSS tx stats for legacy rates
Date: Mon, 11 Mar 2019 21:23:22 +0530
Message-Id: <1552319602-17795-3-git-send-email-pillair@codeaurora.org>
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

The ratecode field given by firmware in the tx stats
gives the details of NSS and MCS, if the preamble
specifies that it is HT/VHT. In case of OFDM/CCK, as
specified by the preamble, the ratecode indicates the
legacy rate instead of NSS/MCS data. For OFDM/CCK cases,
the NSS should always be 1, i.e. 1x1 mode for 11g and 11b.

Currently the legacy rate is misinterpreted as NSS & MCS, leading
to incorrect updation of tx stats corresponding to NSS, which is
displayed in the tx stats via debugfs.

Fix the nss value to 1 for 11b and 11g modes by checking
the preamble indication in the ratecode provided by the firmware.

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1

Fixes: e88975ca37d1 ("ath10k: dump tx stats in rate table format")
Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 8c3c940..c1308a6 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2955,6 +2955,8 @@ ath10k_accumulate_per_peer_tx_stats(struct ath10k *ar,
 		STATS_OP_FMT(RETRY).ht[0][ht_idx] += pstats->retry_bytes;
 		STATS_OP_FMT(RETRY).ht[1][ht_idx] += pstats->retry_pkts;
 	} else {
+		/* For 11g and 11b, NSS is 1x1 */
+		nss = 1;
 		mcs = legacy_rate_idx;
 
 		STATS_OP_FMT(SUCC).legacy[0][mcs] += pstats->succ_bytes;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
