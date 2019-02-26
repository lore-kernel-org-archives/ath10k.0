Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyZ2E-0001U8-Cy
 for ath10k@lists.infradead.org; Tue, 26 Feb 2019 09:28:25 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH v2 3/4] ath10k: Fix the wrong updation of SGI in tx_stats
 debugfs
Date: Tue, 26 Feb 2019 14:57:57 +0530
Message-Id: <1551173278-20926-4-git-send-email-svishnoi@codeaurora.org>
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

The SGI is updated wrongly in tx stats table in debugfs per sta
entry. To know whether the packets/bytes are sent with SHORT GI,
test whether the SGI bit(ATH10K_RATE_INFO_FLAGS_SGI_BIT) is set or
not in the txrate flags.

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1

Fixes: a904417fc876 ("ath10k: add extended per sta tx statistics support")
Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 4 +++-
 drivers/net/wireless/ath/ath10k/wmi.h    | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 941ae20..2394a47 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2913,12 +2913,14 @@ static inline s8 ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 	struct rate_info *txrate = &arsta->txrate;
 	struct ath10k_htt_tx_stats *tx_stats;
 	int idx, ht_idx, gi, mcs, bw, nss;
+	unsigned long flags;
 
 	if (!arsta->tx_stats)
 		return;
 
 	tx_stats = arsta->tx_stats;
-	gi = (arsta->txrate.flags & RATE_INFO_FLAGS_SHORT_GI);
+	flags = txrate->flags;
+	gi = test_bit(ATH10K_RATE_INFO_FLAGS_SGI_BIT, &flags);
 	ht_idx = txrate->mcs + txrate->nss * 8;
 	mcs = txrate->mcs;
 	bw = txrate->bw;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index d915942..6df9a59 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -5051,6 +5051,7 @@ enum wmi_rate_preamble {
 #define ATH10K_GI_NUM		2
 #define ATH10K_HT_MCS_NUM	32
 #define ATH10K_RATE_TABLE_NUM	320
+#define ATH10K_RATE_INFO_FLAGS_SGI_BIT	2
 
 /* Value to disable fixed rate setting */
 #define WMI_FIXED_RATE_NONE    (0xff)
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
