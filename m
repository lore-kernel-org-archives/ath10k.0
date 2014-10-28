Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xj3KC-0000qb-O3
 for ath10k@lists.infradead.org; Tue, 28 Oct 2014 09:44:25 +0000
Received: by mail-lb0-f175.google.com with SMTP id b6so238463lbj.20
 for <ath10k@lists.infradead.org>; Tue, 28 Oct 2014 02:44:02 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v3 1/4] ath10k: change ce ring cleanup logic
Date: Tue, 28 Oct 2014 10:32:05 +0100
Message-Id: <1414488728-31489-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1414488728-31489-1-git-send-email-michal.kazior@tieto.com>
References: <1414488728-31489-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Make ath10k_pci_init_pipes() effectively only
alter shared target-host data.

The per_transfer_context is a host-only thing.
It is necessary to preserve it's contents for a
more robust ring cleanup.

This is required for future warm reset fixes.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

Notes:
    v3:
     * introduced to fix memleak - warm reset will
       reinit rings/pipes in the future so it was
       necessary to rework how clean up of CE rings is
       performed

 drivers/net/wireless/ath/ath10k/ce.c  |  6 ---
 drivers/net/wireless/ath/ath10k/pci.c | 82 ++++++++++++++++++++---------------
 2 files changed, 46 insertions(+), 42 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 9b89ac1..878e1ec 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -835,9 +835,6 @@ static int ath10k_ce_init_src_ring(struct ath10k *ar,
 
 	nentries = roundup_pow_of_two(attr->src_nentries);
 
-	memset(src_ring->per_transfer_context, 0,
-	       nentries * sizeof(*src_ring->per_transfer_context));
-
 	src_ring->sw_index = ath10k_ce_src_ring_read_index_get(ar, ctrl_addr);
 	src_ring->sw_index &= src_ring->nentries_mask;
 	src_ring->hw_index = src_ring->sw_index;
@@ -872,9 +869,6 @@ static int ath10k_ce_init_dest_ring(struct ath10k *ar,
 
 	nentries = roundup_pow_of_two(attr->dest_nentries);
 
-	memset(dest_ring->per_transfer_context, 0,
-	       nentries * sizeof(*dest_ring->per_transfer_context));
-
 	dest_ring->sw_index = ath10k_ce_dest_ring_read_index_get(ar, ctrl_addr);
 	dest_ring->sw_index &= dest_ring->nentries_mask;
 	dest_ring->write_index =
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 4a4740b..a8a3e1b 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1196,64 +1196,74 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
 	return 0;
 }
 
-static void ath10k_pci_rx_pipe_cleanup(struct ath10k_pci_pipe *pipe_info)
+static void ath10k_pci_rx_pipe_cleanup(struct ath10k_pci_pipe *pci_pipe)
 {
 	struct ath10k *ar;
-	struct ath10k_pci *ar_pci;
-	struct ath10k_ce_pipe *ce_hdl;
-	u32 buf_sz;
-	struct sk_buff *netbuf;
-	u32 ce_data;
+	struct ath10k_ce_pipe *ce_pipe;
+	struct ath10k_ce_ring *ce_ring;
+	struct sk_buff *skb;
+	int i;
 
-	buf_sz = pipe_info->buf_sz;
+	ar = pci_pipe->hif_ce_state;
+	ce_pipe = pci_pipe->ce_hdl;
+	ce_ring = ce_pipe->dest_ring;
 
-	/* Unused Copy Engine */
-	if (buf_sz == 0)
+	if (!ce_ring)
 		return;
 
-	ar = pipe_info->hif_ce_state;
-	ar_pci = ath10k_pci_priv(ar);
-	ce_hdl = pipe_info->ce_hdl;
+	if (!pci_pipe->buf_sz)
+		return;
 
-	while (ath10k_ce_revoke_recv_next(ce_hdl, (void **)&netbuf,
-					  &ce_data) == 0) {
-		dma_unmap_single(ar->dev, ATH10K_SKB_CB(netbuf)->paddr,
-				 netbuf->len + skb_tailroom(netbuf),
+	for (i = 0; i < ce_ring->nentries; i++) {
+		skb = ce_ring->per_transfer_context[i];
+		if (!skb)
+			continue;
+
+		ce_ring->per_transfer_context[i] = NULL;
+
+		dma_unmap_single(ar->dev, ATH10K_SKB_CB(skb)->paddr,
+				 skb->len + skb_tailroom(skb),
 				 DMA_FROM_DEVICE);
-		dev_kfree_skb_any(netbuf);
+		dev_kfree_skb_any(skb);
 	}
 }
 
-static void ath10k_pci_tx_pipe_cleanup(struct ath10k_pci_pipe *pipe_info)
+static void ath10k_pci_tx_pipe_cleanup(struct ath10k_pci_pipe *pci_pipe)
 {
 	struct ath10k *ar;
 	struct ath10k_pci *ar_pci;
-	struct ath10k_ce_pipe *ce_hdl;
-	struct sk_buff *netbuf;
-	u32 ce_data;
-	unsigned int nbytes;
+	struct ath10k_ce_pipe *ce_pipe;
+	struct ath10k_ce_ring *ce_ring;
+	struct ce_desc *ce_desc;
+	struct sk_buff *skb;
 	unsigned int id;
-	u32 buf_sz;
+	int i;
 
-	buf_sz = pipe_info->buf_sz;
+	ar = pci_pipe->hif_ce_state;
+	ar_pci = ath10k_pci_priv(ar);
+	ce_pipe = pci_pipe->ce_hdl;
+	ce_ring = ce_pipe->src_ring;
 
-	/* Unused Copy Engine */
-	if (buf_sz == 0)
+	if (!ce_ring)
 		return;
 
-	ar = pipe_info->hif_ce_state;
-	ar_pci = ath10k_pci_priv(ar);
-	ce_hdl = pipe_info->ce_hdl;
+	if (!pci_pipe->buf_sz)
+		return;
 
-	while (ath10k_ce_cancel_send_next(ce_hdl, (void **)&netbuf,
-					  &ce_data, &nbytes, &id) == 0) {
-		/* no need to call tx completion for NULL pointers */
-		if (!netbuf)
+	ce_desc = ce_ring->shadow_base;
+	if (WARN_ON(!ce_desc))
+		return;
+
+	for (i = 0; i < ce_ring->nentries; i++) {
+		skb = ce_ring->per_transfer_context[i];
+		if (!skb)
 			continue;
 
-		ar_pci->msg_callbacks_current.tx_completion(ar,
-							    netbuf,
-							    id);
+		ce_ring->per_transfer_context[i] = NULL;
+		id = MS(__le16_to_cpu(ce_desc[i].flags),
+			CE_DESC_FLAGS_META_DATA);
+
+		ar_pci->msg_callbacks_current.tx_completion(ar, skb, id);
 	}
 }
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
