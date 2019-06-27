Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgYSm-00086v-7p
 for ath10k@lists.infradead.org; Thu, 27 Jun 2019 17:45:37 +0000
Received: by mail-pl1-x644.google.com with SMTP id bh12so1679900plb.4
 for <ath10k@lists.infradead.org>; Thu, 27 Jun 2019 10:45:36 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH 78/87] wireless: ath10k: remove memset after dma_alloc_coherent
Date: Fri, 28 Jun 2019 01:45:27 +0800
Message-Id: <20190627174527.5987-1-huangfq.daxian@gmail.com>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Fuqian Huang <huangfq.daxian@gmail.com>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

In commit af7ddd8a627c
("Merge tag 'dma-mapping-4.21' of git://git.infradead.org/users/hch/dma-mapping"),
dma_alloc_coherent has already zeroed the memory.
So memset is not needed.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/net/wireless/ath/ath10k/ce.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index eca87f7c5b6c..294fbc1e89ab 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1704,9 +1704,6 @@ ath10k_ce_alloc_dest_ring_64(struct ath10k *ar, unsigned int ce_id,
 	/* Correctly initialize memory to 0 to prevent garbage
 	 * data crashing system when download firmware
 	 */
-	memset(dest_ring->base_addr_owner_space_unaligned, 0,
-	       nentries * sizeof(struct ce_desc_64) + CE_DESC_RING_ALIGN);
-
 	dest_ring->base_addr_owner_space =
 			PTR_ALIGN(dest_ring->base_addr_owner_space_unaligned,
 				  CE_DESC_RING_ALIGN);
@@ -2019,8 +2016,6 @@ void ath10k_ce_alloc_rri(struct ath10k *ar)
 		value |= ar->hw_ce_regs->upd->mask;
 		ath10k_ce_write32(ar, ce_base_addr + ctrl1_regs, value);
 	}
-
-	memset(ce->vaddr_rri, 0, CE_COUNT * sizeof(u32));
 }
 EXPORT_SYMBOL(ath10k_ce_alloc_rri);
 
-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
