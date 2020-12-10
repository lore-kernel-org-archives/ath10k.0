Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMVu-0008LH-LC
 for ath10k@lists.infradead.org; Thu, 10 Dec 2020 14:01:48 +0000
From: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH wireless -next] wireless/ath10k: simplify the return
 expression of ath10k_ahb_chip_reset()
Date: Thu, 10 Dec 2020 22:02:04 +0800
Message-ID: <20201210140204.1774-1-zhengyongjun3@huawei.com>
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
To: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Zheng Yongjun <zhengyongjun3@huawei.com>

Simplify the return expression.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/net/wireless/ath/ath10k/ahb.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index 05a61975c83f..0ba31c0bbd24 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -598,16 +598,10 @@ static int ath10k_ahb_prepare_device(struct ath10k *ar)
 
 static int ath10k_ahb_chip_reset(struct ath10k *ar)
 {
-	int ret;
-
 	ath10k_ahb_halt_chip(ar);
 	ath10k_ahb_clock_disable(ar);
 
-	ret = ath10k_ahb_prepare_device(ar);
-	if (ret)
-		return ret;
-
-	return 0;
+	return ath10k_ahb_prepare_device(ar);
 }
 
 static int ath10k_ahb_wake_target_cpu(struct ath10k *ar)
-- 
2.22.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
