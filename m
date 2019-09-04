Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5Pxv-0000Tf-Ap
 for ath10k@lists.infradead.org; Wed, 04 Sep 2019 07:44:33 +0000
From: zhong jiang <zhongjiang@huawei.com>
Subject: [PATCH] ath10k: Use ARRAY_SIZE instead of dividing sizeof array with
 sizeof an element
Date: Wed, 4 Sep 2019 15:41:18 +0800
Message-ID: <1567582878-18739-1-git-send-email-zhongjiang@huawei.com>
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
To: kvalo@codeaurora.org, davem@davemloft.net
Cc: zhongjiang@huawei.com, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, netdev@vger.kernel.org

With the help of Coccinelle, ARRAY_SIZE can be replaced in ath10k_snoc_wlan_enable.

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index b491361..49fc044 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -976,8 +976,7 @@ static int ath10k_snoc_wlan_enable(struct ath10k *ar,
 				  sizeof(struct ath10k_svc_pipe_cfg);
 	cfg.ce_svc_cfg = (struct ath10k_svc_pipe_cfg *)
 		&target_service_to_ce_map_wlan;
-	cfg.num_shadow_reg_cfg = sizeof(target_shadow_reg_cfg_map) /
-					sizeof(struct ath10k_shadow_reg_cfg);
+	cfg.num_shadow_reg_cfg = ARRAY_SIZE(target_shadow_reg_cfg_map);
 	cfg.shadow_reg_cfg = (struct ath10k_shadow_reg_cfg *)
 		&target_shadow_reg_cfg_map;
 
-- 
1.7.12.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
