Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpRVE-0004hk-Ob
 for ath10k@lists.infradead.org; Fri, 01 Feb 2019 05:36:46 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH] ath10k: Fill tx_duration for each peer in Tx stats per STA
Date: Fri,  1 Feb 2019 11:06:30 +0530
Message-Id: <1548999390-25576-1-git-send-email-svishnoi@codeaurora.org>
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

Firmware sends the tx_duration for each in HTT_T2H_MSG_TYPE_PEER_STATS
msg. Fill the tx_duration sent by firmware in the tx stats information
per STA.

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0

Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index f42bac2..89d84dc 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2975,6 +2975,8 @@ static inline s8 ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 		STATS_OP_FMT(RETRY).rate_table[0][idx] += pstats->retry_bytes;
 		STATS_OP_FMT(RETRY).rate_table[1][idx] += pstats->retry_pkts;
 	}
+
+	tx_stats->tx_duration += pstats->duration;
 }
 
 static void
@@ -3141,6 +3143,7 @@ static void ath10k_htt_fetch_peer_stats(struct ath10k *ar,
 		p_tx_stats->succ_pkts = __le16_to_cpu(tx_stats->succ_pkts);
 		p_tx_stats->retry_pkts = __le16_to_cpu(tx_stats->retry_pkts);
 		p_tx_stats->failed_pkts = __le16_to_cpu(tx_stats->failed_pkts);
+		p_tx_stats->duration = __le16_to_cpu(tx_stats->tx_duration);
 
 		ath10k_update_per_peer_tx_stats(ar, sta, p_tx_stats);
 	}
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
