Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG0cc-0007i0-Lc
 for ath10k@lists.infradead.org; Wed, 09 Sep 2020 13:58:52 +0000
From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] ath10k: Remove unused macro ATH10K_ROC_TIMEOUT_HZ
Date: Wed, 9 Sep 2020 21:58:34 +0800
Message-ID: <20200909135834.38448-1-yuehaibing@huawei.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Cc: netdev@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

There is no caller in tree, so can remove it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index fed8682f266f..5991d0ac41ad 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -7033,8 +7033,6 @@ static int ath10k_conf_tx(struct ieee80211_hw *hw,
 	return ret;
 }
 
-#define ATH10K_ROC_TIMEOUT_HZ (2 * HZ)
-
 static int ath10k_remain_on_channel(struct ieee80211_hw *hw,
 				    struct ieee80211_vif *vif,
 				    struct ieee80211_channel *chan,
-- 
2.17.1



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
