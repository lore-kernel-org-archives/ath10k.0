Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPzTq-0006BZ-IA
 for ath10k@lists.infradead.org; Thu, 31 Oct 2019 01:42:31 +0000
From: Zhi Chen <zhichen@codeaurora.org>
Subject: [PATCH] ath10k: fix potential issue of peer stats allocation
Date: Thu, 31 Oct 2019 09:42:13 +0800
Message-Id: <1572486133-23516-1-git-send-email-zhichen@codeaurora.org>
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
Cc: Zhi Chen <zhichen@codeaurora.org>, linux-wireless@vger.kernel.org

STA number was not restored if OOM happened.

Tested: QCA9984 with firmware ver 10.4-3.9.0.1-00018
Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index b73c23d..61efc00 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6419,6 +6419,7 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 			arsta->tx_stats = kzalloc(sizeof(*arsta->tx_stats),
 						  GFP_KERNEL);
 			if (!arsta->tx_stats) {
+				ath10k_mac_dec_num_stations(arvif, sta);
 				ret = -ENOMEM;
 				goto exit;
 			}
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
