Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs79r-0007uF-Vu
 for ath10k@lists.infradead.org; Fri, 08 Feb 2019 14:29:37 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH] ath10k: fix line length warning in ath10k_ce_alloc_dest_ring()
Date: Fri,  8 Feb 2019 16:29:31 +0200
Message-Id: <1549636171-32628-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

Commit 750afb08ca71 ("cross-tree: phase out dma_zalloc_coherent()") introduced
a new checkpatch warning:

drivers/net/wireless/ath/ath10k/ce.c:1602: line over 90 characters

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/ce.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 8b4a9102d7eb..17ff65937136 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1599,7 +1599,8 @@ ath10k_ce_alloc_dest_ring(struct ath10k *ar, unsigned int ce_id,
 	 */
 	dest_ring->base_addr_owner_space_unaligned =
 		dma_alloc_coherent(ar->dev,
-				   (nentries * sizeof(struct ce_desc) + CE_DESC_RING_ALIGN),
+				   (nentries * sizeof(struct ce_desc) +
+				    CE_DESC_RING_ALIGN),
 				   &base_addr, GFP_KERNEL);
 	if (!dest_ring->base_addr_owner_space_unaligned) {
 		kfree(dest_ring);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
