Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f7ggP-00017w-G0
 for ath10k@lists.infradead.org; Sun, 15 Apr 2018 12:23:02 +0000
Received: by mail-lf0-x244.google.com with SMTP id i18-v6so3215681lfc.7
 for <ath10k@lists.infradead.org>; Sun, 15 Apr 2018 05:22:51 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 2/2] ath10k: add inlined wrappers for htt rx ops
Date: Sun, 15 Apr 2018 14:22:28 +0200
Message-Id: <20180415122228.12565-3-erik.stromdahl@gmail.com>
In-Reply-To: <20180415122228.12565-1-erik.stromdahl@gmail.com>
References: <20180415122228.12565-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

Added for the same reason as the TX wrappers.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt.h    | 37 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/htt_rx.c | 14 ++++-----
 2 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index c76f6daafe70..3fa1be7749b2 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1908,6 +1908,43 @@ struct ath10k_htt_rx_ops {
 	void (*htt_reset_paddrs_ring)(struct ath10k_htt *htt, int idx);
 };
 
+static inline size_t ath10k_htt_get_rx_ring_size(struct ath10k_htt *htt)
+{
+	if (!htt->rx_ops->htt_get_rx_ring_size)
+		return 0;
+
+	return htt->rx_ops->htt_get_rx_ring_size(htt);
+}
+
+static inline void ath10k_htt_config_paddrs_ring(struct ath10k_htt *htt,
+						 void *vaddr)
+{
+	if (htt->rx_ops->htt_config_paddrs_ring)
+		htt->rx_ops->htt_config_paddrs_ring(htt, vaddr);
+}
+
+static inline void ath10k_htt_set_paddrs_ring(struct ath10k_htt *htt,
+					      dma_addr_t paddr,
+					      int idx)
+{
+	if (htt->rx_ops->htt_set_paddrs_ring)
+		htt->rx_ops->htt_set_paddrs_ring(htt, paddr, idx);
+}
+
+static inline void *ath10k_htt_get_vaddr_ring(struct ath10k_htt *htt)
+{
+	if (!htt->rx_ops->htt_get_vaddr_ring)
+		return NULL;
+
+	return htt->rx_ops->htt_get_vaddr_ring(htt);
+}
+
+static inline void ath10k_htt_reset_paddrs_ring(struct ath10k_htt *htt, int idx)
+{
+	if (htt->rx_ops->htt_reset_paddrs_ring)
+		htt->rx_ops->htt_reset_paddrs_ring(htt, idx);
+}
+
 #define RX_HTT_HDR_STATUS_LEN 64
 
 /* This structure layout is programmed via rx ring setup
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 5e02e26158f6..5e8a84fa5422 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -181,7 +181,7 @@ static int __ath10k_htt_rx_ring_fill_n(struct ath10k_htt *htt, int num)
 		rxcb = ATH10K_SKB_RXCB(skb);
 		rxcb->paddr = paddr;
 		htt->rx_ring.netbufs_ring[idx] = skb;
-		htt->rx_ops->htt_set_paddrs_ring(htt, paddr, idx);
+		ath10k_htt_set_paddrs_ring(htt, paddr, idx);
 		htt->rx_ring.fill_cnt++;
 
 		if (htt->rx_ring.in_ord_rx) {
@@ -286,8 +286,8 @@ void ath10k_htt_rx_free(struct ath10k_htt *htt)
 	ath10k_htt_rx_ring_free(htt);
 
 	dma_free_coherent(htt->ar->dev,
-			  htt->rx_ops->htt_get_rx_ring_size(htt),
-			  htt->rx_ops->htt_get_vaddr_ring(htt),
+			  ath10k_htt_get_rx_ring_size(htt),
+			  ath10k_htt_get_vaddr_ring(htt),
 			  htt->rx_ring.base_paddr);
 
 	dma_free_coherent(htt->ar->dev,
@@ -314,7 +314,7 @@ static inline struct sk_buff *ath10k_htt_rx_netbuf_pop(struct ath10k_htt *htt)
 	idx = htt->rx_ring.sw_rd_idx.msdu_payld;
 	msdu = htt->rx_ring.netbufs_ring[idx];
 	htt->rx_ring.netbufs_ring[idx] = NULL;
-	htt->rx_ops->htt_reset_paddrs_ring(htt, idx);
+	ath10k_htt_reset_paddrs_ring(htt, idx);
 
 	idx++;
 	idx &= htt->rx_ring.size_mask;
@@ -586,13 +586,13 @@ int ath10k_htt_rx_alloc(struct ath10k_htt *htt)
 	if (!htt->rx_ring.netbufs_ring)
 		goto err_netbuf;
 
-	size = htt->rx_ops->htt_get_rx_ring_size(htt);
+	size = ath10k_htt_get_rx_ring_size(htt);
 
 	vaddr_ring = dma_alloc_coherent(htt->ar->dev, size, &paddr, GFP_KERNEL);
 	if (!vaddr_ring)
 		goto err_dma_ring;
 
-	htt->rx_ops->htt_config_paddrs_ring(htt, vaddr_ring);
+	ath10k_htt_config_paddrs_ring(htt, vaddr_ring);
 	htt->rx_ring.base_paddr = paddr;
 
 	vaddr = dma_alloc_coherent(htt->ar->dev,
@@ -626,7 +626,7 @@ int ath10k_htt_rx_alloc(struct ath10k_htt *htt)
 
 err_dma_idx:
 	dma_free_coherent(htt->ar->dev,
-			  htt->rx_ops->htt_get_rx_ring_size(htt),
+			  ath10k_htt_get_rx_ring_size(htt),
 			  vaddr_ring,
 			  htt->rx_ring.base_paddr);
 err_dma_ring:
-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
