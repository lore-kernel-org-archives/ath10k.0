Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from static.88-198-24-112.clients.your-server.de ([88.198.24.112]
 helo=nbd.name)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1AyN-0002ko-UC
 for ath10k@lists.infradead.org; Tue, 24 Nov 2015 10:37:20 +0000
From: Felix Fietkau <nbd@openwrt.org>
Subject: [PATCH] ath10k: stop abusing GFP_DMA
Date: Tue, 24 Nov 2015 11:36:52 +0100
Message-Id: <1448361412-22589-1-git-send-email-nbd@openwrt.org>
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
To: linux-wireless@vger.kernel.org
Cc: poh@codeaurora.org, ath10k@lists.infradead.org, kvalo@codeaurora.org

Allocations from the DMA zone were originally added for legacy ISA
stuff, or PCI devices that have specific limitations in their DMA
addressing capabilities. It has no place in ath10k, which can do
full 32-bit DMA.

Fixes memory allocation errors on some platforms.

Signed-off-by: Felix Fietkau <nbd@openwrt.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 4 ++--
 drivers/net/wireless/ath/ath10k/htt_tx.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 396645b..8f240e1 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -536,7 +536,7 @@ int ath10k_htt_rx_alloc(struct ath10k_htt *htt)
 
 	size = htt->rx_ring.size * sizeof(htt->rx_ring.paddrs_ring);
 
-	vaddr = dma_alloc_coherent(htt->ar->dev, size, &paddr, GFP_DMA);
+	vaddr = dma_alloc_coherent(htt->ar->dev, size, &paddr, GFP_KERNEL);
 	if (!vaddr)
 		goto err_dma_ring;
 
@@ -545,7 +545,7 @@ int ath10k_htt_rx_alloc(struct ath10k_htt *htt)
 
 	vaddr = dma_alloc_coherent(htt->ar->dev,
 				   sizeof(*htt->rx_ring.alloc_idx.vaddr),
-				   &paddr, GFP_DMA);
+				   &paddr, GFP_KERNEL);
 	if (!vaddr)
 		goto err_dma_idx;
 
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 8f76b9d..ed62ec8 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -111,7 +111,7 @@ int ath10k_htt_tx_alloc(struct ath10k_htt *htt)
 	size = htt->max_num_pending_tx * sizeof(struct ath10k_htt_txbuf);
 	htt->txbuf.vaddr = dma_alloc_coherent(ar->dev, size,
 						  &htt->txbuf.paddr,
-						  GFP_DMA);
+						  GFP_KERNEL);
 	if (!htt->txbuf.vaddr) {
 		ath10k_err(ar, "failed to alloc tx buffer\n");
 		ret = -ENOMEM;
@@ -124,7 +124,7 @@ int ath10k_htt_tx_alloc(struct ath10k_htt *htt)
 	size = htt->max_num_pending_tx * sizeof(struct htt_msdu_ext_desc);
 	htt->frag_desc.vaddr = dma_alloc_coherent(ar->dev, size,
 						  &htt->frag_desc.paddr,
-						  GFP_DMA);
+						  GFP_KERNEL);
 	if (!htt->frag_desc.vaddr) {
 		ath10k_warn(ar, "failed to alloc fragment desc memory\n");
 		ret = -ENOMEM;
-- 
2.2.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
