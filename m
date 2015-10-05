Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zj4nz-0007nh-7B
 for ath10k@lists.infradead.org; Mon, 05 Oct 2015 12:23:47 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH] ath10k: optimize ce_lock on post rx buffer processing
Date: Mon, 5 Oct 2015 17:52:58 +0530
Message-ID: <1444047778-22900-1-git-send-email-rmanohar@qti.qualcomm.com>
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

After processing received packets from copy engine, host will allocate
new buffer and queue them back to copy engine ring for further
packet reception. On post rx processing path, skb allocation and
dma mapping are unnecessarily handled within ce_lock. This is affecting
peak throughput and also causing more CPU consumption. Optimize this
by acquiring ce_lock only when accessing copy engine ring and moving
skb allocation out of ce_lock.

In AP148 platform with QCA99x0 in conducted environment, UDP uplink peak
throughput is improved from ~1320 Mbps to ~1450 Mbps and TCP uplink peak
throughput is increased from ~1240 Mbps (70% host CPU load) to ~1300 Mbps
(71% CPU load). Similarly ~40Mbps improvement is observed in downlink
path.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/ce.c  |  2 +-
 drivers/net/wireless/ath/ath10k/pci.c | 27 ++++++++-------------------
 2 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index e90840d..84220c3 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -413,7 +413,7 @@ int __ath10k_ce_rx_post_buf(struct ath10k_ce_pipe *pipe, void *ctx, u32 paddr)
 	lockdep_assert_held(&ar_pci->ce_lock);
 
 	if (CE_RING_DELTA(nentries_mask, write_index, sw_index - 1) == 0)
-		return -EIO;
+		return -ENOSPC;
 
 	desc->addr = __cpu_to_le32(paddr);
 	desc->nbytes = 0;
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 687150a..a1a9cab 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -698,8 +698,6 @@ static int __ath10k_pci_rx_post_buf(struct ath10k_pci_pipe *pipe)
 	dma_addr_t paddr;
 	int ret;
 
-	lockdep_assert_held(&ar_pci->ce_lock);
-
 	skb = dev_alloc_skb(pipe->buf_sz);
 	if (!skb)
 		return -ENOMEM;
@@ -717,9 +715,10 @@ static int __ath10k_pci_rx_post_buf(struct ath10k_pci_pipe *pipe)
 
 	ATH10K_SKB_RXCB(skb)->paddr = paddr;
 
+	spin_lock_bh(&ar_pci->ce_lock);
 	ret = __ath10k_ce_rx_post_buf(ce_pipe, skb, paddr);
+	spin_unlock_bh(&ar_pci->ce_lock);
 	if (ret) {
-		ath10k_warn(ar, "failed to post pci rx buf: %d\n", ret);
 		dma_unmap_single(ar->dev, paddr, skb->len + skb_tailroom(skb),
 				 DMA_FROM_DEVICE);
 		dev_kfree_skb_any(skb);
@@ -729,25 +728,27 @@ static int __ath10k_pci_rx_post_buf(struct ath10k_pci_pipe *pipe)
 	return 0;
 }
 
-static void __ath10k_pci_rx_post_pipe(struct ath10k_pci_pipe *pipe)
+static void ath10k_pci_rx_post_pipe(struct ath10k_pci_pipe *pipe)
 {
 	struct ath10k *ar = pipe->hif_ce_state;
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	struct ath10k_ce_pipe *ce_pipe = pipe->ce_hdl;
 	int ret, num;
 
-	lockdep_assert_held(&ar_pci->ce_lock);
-
 	if (pipe->buf_sz == 0)
 		return;
 
 	if (!ce_pipe->dest_ring)
 		return;
 
+	spin_lock_bh(&ar_pci->ce_lock);
 	num = __ath10k_ce_rx_num_free_bufs(ce_pipe);
+	spin_unlock_bh(&ar_pci->ce_lock);
 	while (num--) {
 		ret = __ath10k_pci_rx_post_buf(pipe);
 		if (ret) {
+			if (ret == -ENOSPC)
+				break;
 			ath10k_warn(ar, "failed to post pci rx buf: %d\n", ret);
 			mod_timer(&ar_pci->rx_post_retry, jiffies +
 				  ATH10K_PCI_RX_POST_RETRY_MS);
@@ -756,25 +757,13 @@ static void __ath10k_pci_rx_post_pipe(struct ath10k_pci_pipe *pipe)
 	}
 }
 
-static void ath10k_pci_rx_post_pipe(struct ath10k_pci_pipe *pipe)
-{
-	struct ath10k *ar = pipe->hif_ce_state;
-	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
-
-	spin_lock_bh(&ar_pci->ce_lock);
-	__ath10k_pci_rx_post_pipe(pipe);
-	spin_unlock_bh(&ar_pci->ce_lock);
-}
-
 static void ath10k_pci_rx_post(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	int i;
 
-	spin_lock_bh(&ar_pci->ce_lock);
 	for (i = 0; i < CE_COUNT; i++)
-		__ath10k_pci_rx_post_pipe(&ar_pci->pipe_info[i]);
-	spin_unlock_bh(&ar_pci->ce_lock);
+		ath10k_pci_rx_post_pipe(&ar_pci->pipe_info[i]);
 }
 
 static void ath10k_pci_rx_replenish_retry(unsigned long ptr)
-- 
2.6.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
