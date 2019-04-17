Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGflB-0008OU-Qz
 for ath10k@lists.infradead.org; Wed, 17 Apr 2019 08:17:40 +0000
From: Lei Wang <leiwa@codeaurora.org>
Subject: [PATCH v2] ath10k: fix different tx duration output
Date: Wed, 17 Apr 2019 16:17:25 +0800
Message-Id: <1555489045-18070-1-git-send-email-leiwa@codeaurora.org>
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
Cc: Lei Wang <leiwa@codeaurora.org>, linux-wireless@vger.kernel.org

TX duration output of tx_stats in debugfs and station dump had big
difference because they got tx duration value from different statistic
data. We should use the same statistic data.

Tested: QCA988X with firmware ver 10.2.4-1.0-00043

Signed-off-by: Lei Wang <leiwa@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index b73c23d..5414169 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -7977,6 +7977,11 @@ static void ath10k_sta_statistics(struct ieee80211_hw *hw,
 	sinfo->rx_duration = arsta->rx_duration;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_DURATION);
 
+	if (arsta->tx_stats && ath10k_debug_is_extd_tx_stats_enabled(ar)) {
+		sinfo->tx_duration = arsta->tx_stats->tx_duration;
+		sinfo->filled |= 1ULL << NL80211_STA_INFO_TX_DURATION;
+	}
+
 	if (!arsta->txrate.legacy && !arsta->txrate.nss)
 		return;
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
