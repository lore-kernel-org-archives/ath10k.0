Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZpHTd-0000IS-NX
 for ath10k@lists.infradead.org; Thu, 22 Oct 2015 15:08:26 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 4/4] ath10k: remove shadow copy of CE descriptors for source
 ring
Date: Thu, 22 Oct 2015 20:36:42 +0530
Message-ID: <1445526402-28522-5-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1445526402-28522-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1445526402-28522-1-git-send-email-rmanohar@qti.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

For the messages from host to target, shadow copy of CE descriptors
are maintained in source ring. Before writing actual CE descriptor,
first shadow copy is filled and then it is copied to CE address space.
To optimize in download path and to reduce d-cache pressure, removing
shadow copy of CE descriptors. This will also reduce driver memory
consumption by 33KB during on device probing.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/ce.c  | 22 ----------------------
 drivers/net/wireless/ath/ath10k/ce.h  |  6 ------
 drivers/net/wireless/ath/ath10k/pci.c |  5 -----
 3 files changed, 33 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 52021a9..edf3629 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -921,27 +921,6 @@ ath10k_ce_alloc_src_ring(struct ath10k *ar, unsigned int ce_id,
 			src_ring->base_addr_ce_space_unaligned,
 			CE_DESC_RING_ALIGN);
 
-	/*
-	 * Also allocate a shadow src ring in regular
-	 * mem to use for faster access.
-	 */
-	src_ring->shadow_base_unaligned =
-		kmalloc((nentries * sizeof(struct ce_desc) +
-			 CE_DESC_RING_ALIGN), GFP_KERNEL);
-	if (!src_ring->shadow_base_unaligned) {
-		dma_free_coherent(ar->dev,
-				  (nentries * sizeof(struct ce_desc) +
-				   CE_DESC_RING_ALIGN),
-				  src_ring->base_addr_owner_space,
-				  src_ring->base_addr_ce_space);
-		kfree(src_ring);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	src_ring->shadow_base = PTR_ALIGN(
-			src_ring->shadow_base_unaligned,
-			CE_DESC_RING_ALIGN);
-
 	return src_ring;
 }
 
@@ -1120,7 +1099,6 @@ void ath10k_ce_free_pipe(struct ath10k *ar, int ce_id)
 	struct ath10k_ce_pipe *ce_state = &ar_pci->ce_states[ce_id];
 
 	if (ce_state->src_ring) {
-		kfree(ce_state->src_ring->shadow_base_unaligned);
 		dma_free_coherent(ar->dev,
 				  (ce_state->src_ring->nentries *
 				   sizeof(struct ce_desc) +
diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index 67f90ec..47b734c 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -100,12 +100,6 @@ struct ath10k_ce_ring {
 
 	/* CE address space */
 	u32 base_addr_ce_space;
-	/*
-	 * Start of shadow copy of descriptors, within regular memory.
-	 * Aligned to descriptor-size boundary.
-	 */
-	void *shadow_base_unaligned;
-	struct ce_desc *shadow_base;
 
 	/* keep last */
 	void *per_transfer_context[0];
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 8100025..4a65385 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1594,7 +1594,6 @@ static void ath10k_pci_tx_pipe_cleanup(struct ath10k_pci_pipe *pci_pipe)
 	struct ath10k_pci *ar_pci;
 	struct ath10k_ce_pipe *ce_pipe;
 	struct ath10k_ce_ring *ce_ring;
-	struct ce_desc *ce_desc;
 	struct sk_buff *skb;
 	int i;
 
@@ -1609,10 +1608,6 @@ static void ath10k_pci_tx_pipe_cleanup(struct ath10k_pci_pipe *pci_pipe)
 	if (!pci_pipe->buf_sz)
 		return;
 
-	ce_desc = ce_ring->shadow_base;
-	if (WARN_ON(!ce_desc))
-		return;
-
 	for (i = 0; i < ce_ring->nentries; i++) {
 		skb = ce_ring->per_transfer_context[i];
 		if (!skb)
-- 
2.6.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
