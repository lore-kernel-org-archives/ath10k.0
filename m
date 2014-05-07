Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22d.google.com ([2a00:1450:4013:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wi1ZO-0007G1-Q0
 for ath10k@lists.infradead.org; Wed, 07 May 2014 13:07:35 +0000
Received: by mail-ee0-f45.google.com with SMTP id d49so734468eek.4
 for <ath10k@lists.infradead.org>; Wed, 07 May 2014 06:07:12 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/2] ath10k: fix htt rx ring clean up
Date: Wed,  7 May 2014 14:33:25 +0200
Message-Id: <1399466006-5556-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1399466006-5556-1-git-send-email-michal.kazior@tieto.com>
References: <1399466006-5556-1-git-send-email-michal.kazior@tieto.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, apenwarr@gmail.com

msdu_payId was read before txrx tasklet was killed
so it was possible to end up using an invalid
sk_buff pointer leading to a panic.

Make sure to sanitize rx ring sk_buff pointers and
make the clean up go through all possible entries
and not rely on coherent-DMA mapped u32 index
which could be (in theory) corrupted by the device
as well.

Reported-By: Avery Pennarun <apenwarr@gmail.com>
Reported-By: Ben Greear <greearb@candelatech.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 36 +++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index f85a3cf..db6c8af 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -225,10 +225,26 @@ static void ath10k_htt_rx_ring_refill_retry(unsigned long arg)
 	ath10k_htt_rx_msdu_buff_replenish(htt);
 }
 
-void ath10k_htt_rx_detach(struct ath10k_htt *htt)
+static void ath10k_htt_rx_ring_clean_up(struct ath10k_htt *htt)
 {
-	int sw_rd_idx = htt->rx_ring.sw_rd_idx.msdu_payld;
+	struct sk_buff *skb;
+	int i;
+
+	for (i = 0; i < htt->rx_ring.size; i++) {
+		skb = htt->rx_ring.netbufs_ring[i];
+		if (!skb)
+			continue;
+
+		dma_unmap_single(htt->ar->dev, ATH10K_SKB_CB(skb)->paddr,
+				 skb->len + skb_tailroom(skb),
+				 DMA_FROM_DEVICE);
+		dev_kfree_skb_any(skb);
+		htt->rx_ring.netbufs_ring[i] = NULL;
+	}
+}
 
+void ath10k_htt_rx_detach(struct ath10k_htt *htt)
+{
 	del_timer_sync(&htt->rx_ring.refill_retry_timer);
 	tasklet_kill(&htt->rx_replenish_task);
 	tasklet_kill(&htt->txrx_compl_task);
@@ -236,18 +252,7 @@ void ath10k_htt_rx_detach(struct ath10k_htt *htt)
 	skb_queue_purge(&htt->tx_compl_q);
 	skb_queue_purge(&htt->rx_compl_q);
 
-	while (sw_rd_idx != __le32_to_cpu(*(htt->rx_ring.alloc_idx.vaddr))) {
-		struct sk_buff *skb =
-				htt->rx_ring.netbufs_ring[sw_rd_idx];
-		struct ath10k_skb_cb *cb = ATH10K_SKB_CB(skb);
-
-		dma_unmap_single(htt->ar->dev, cb->paddr,
-				 skb->len + skb_tailroom(skb),
-				 DMA_FROM_DEVICE);
-		dev_kfree_skb_any(htt->rx_ring.netbufs_ring[sw_rd_idx]);
-		sw_rd_idx++;
-		sw_rd_idx &= htt->rx_ring.size_mask;
-	}
+	ath10k_htt_rx_ring_clean_up(htt);
 
 	dma_free_coherent(htt->ar->dev,
 			  (htt->rx_ring.size *
@@ -277,6 +282,7 @@ static inline struct sk_buff *ath10k_htt_rx_netbuf_pop(struct ath10k_htt *htt)
 
 	idx = htt->rx_ring.sw_rd_idx.msdu_payld;
 	msdu = htt->rx_ring.netbufs_ring[idx];
+	htt->rx_ring.netbufs_ring[idx] = NULL;
 
 	idx++;
 	idx &= htt->rx_ring.size_mask;
@@ -494,7 +500,7 @@ int ath10k_htt_rx_attach(struct ath10k_htt *htt)
 	htt->rx_ring.fill_level = ath10k_htt_rx_ring_fill_level(htt);
 
 	htt->rx_ring.netbufs_ring =
-		kmalloc(htt->rx_ring.size * sizeof(struct sk_buff *),
+		kzalloc(htt->rx_ring.size * sizeof(struct sk_buff *),
 			GFP_KERNEL);
 	if (!htt->rx_ring.netbufs_ring)
 		goto err_netbuf;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
