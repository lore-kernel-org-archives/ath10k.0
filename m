Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [45.249.212.32] (helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fOi2u-0000xV-LH
 for ath10k@lists.infradead.org; Fri, 01 Jun 2018 11:16:38 +0000
From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] ath10k: fix incorrect size of dma_free_coherent in
 ath10k_ce_alloc_src_ring_64
Date: Fri, 1 Jun 2018 19:16:02 +0800
Message-ID: <20180601111602.24108-1-yuehaibing@huawei.com>
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
To: davem@davemloft.net, kvalo@codeaurora.org
Cc: netdev@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

sizeof(struct ce_desc) should be a copy-paste mistake
just use sizeof(struct ce_desc_64) to avoid mem leak

Fixes: b7ba83f7c414 ("ath10k: add support for shadow register for WNC3990")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/ath/ath10k/ce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 3b96a43..35dec2a 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1512,7 +1512,7 @@ ath10k_ce_alloc_src_ring_64(struct ath10k *ar, unsigned int ce_id,
 		ret = ath10k_ce_alloc_shadow_base(ar, src_ring, nentries);
 		if (ret) {
 			dma_free_coherent(ar->dev,
-					  (nentries * sizeof(struct ce_desc) +
+					  (nentries * sizeof(struct ce_desc64) +
 					   CE_DESC_RING_ALIGN),
 					  src_ring->base_addr_owner_space_unaligned,
 					  base_addr);
-- 
2.7.0



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
