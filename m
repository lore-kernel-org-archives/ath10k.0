Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from static.88-198-24-112.clients.your-server.de ([88.198.24.112]
 helo=nbd.name)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0r1a-0008JA-2v
 for ath10k@lists.infradead.org; Mon, 23 Nov 2015 13:19:19 +0000
From: Felix Fietkau <nbd@openwrt.org>
Subject: [PATCH 1/2] ath10k: do not use coherent memory for allocated device
 memory chunks
Date: Mon, 23 Nov 2015 14:18:48 +0100
Message-Id: <1448284729-98078-1-git-send-email-nbd@openwrt.org>
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
Cc: ath10k@lists.infradead.org, kvalo@codeaurora.org

Coherent memory is more expensive to allocate (and constrained on some
architectures where it has to be pre-allocated). It is also completely
unnecessary, since the host has no reason to even access these allocated
memory spaces

Signed-off-by: Felix Fietkau <nbd@openwrt.org>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 59 +++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 9021079..6cd097c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4300,34 +4300,58 @@ void ath10k_wmi_event_vdev_resume_req(struct ath10k *ar, struct sk_buff *skb)
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "WMI_VDEV_RESUME_REQ_EVENTID\n");
 }
 
-static int ath10k_wmi_alloc_host_mem(struct ath10k *ar, u32 req_id,
-				     u32 num_units, u32 unit_len)
+static int ath10k_wmi_alloc_chunk(struct ath10k *ar, u32 req_id,
+				  u32 num_units, u32 unit_len)
 {
 	dma_addr_t paddr;
 	u32 pool_size;
 	int idx = ar->wmi.num_mem_chunks;
+	void *vaddr = NULL;
 
-	pool_size = num_units * round_up(unit_len, 4);
+	if (ar->wmi.num_mem_chunks == ARRAY_SIZE(ar->wmi.mem_chunks))
+		return -ENOMEM;
 
-	if (!pool_size)
-		return -EINVAL;
+	while (!vaddr && num_units) {
+		pool_size = num_units * round_up(unit_len, 4);
+		if (!pool_size)
+			return -EINVAL;
 
-	ar->wmi.mem_chunks[idx].vaddr = dma_alloc_coherent(ar->dev,
-							   pool_size,
-							   &paddr,
-							   GFP_KERNEL);
-	if (!ar->wmi.mem_chunks[idx].vaddr) {
-		ath10k_warn(ar, "failed to allocate memory chunk\n");
-		return -ENOMEM;
+		vaddr = kzalloc(pool_size, GFP_KERNEL | __GFP_NOWARN);
+		if (!vaddr)
+			num_units /= 2;
 	}
 
-	memset(ar->wmi.mem_chunks[idx].vaddr, 0, pool_size);
+	if (!num_units)
+		return -ENOMEM;
 
+	paddr = dma_map_single(ar->dev, vaddr, pool_size, DMA_TO_DEVICE);
+	if (dma_mapping_error(ar->dev, paddr)) {
+		kfree(vaddr);
+		return -ENOMEM;
+	}
+
+	ar->wmi.mem_chunks[idx].vaddr = vaddr;
 	ar->wmi.mem_chunks[idx].paddr = paddr;
 	ar->wmi.mem_chunks[idx].len = pool_size;
 	ar->wmi.mem_chunks[idx].req_id = req_id;
 	ar->wmi.num_mem_chunks++;
 
+	return num_units;
+}
+
+static int ath10k_wmi_alloc_host_mem(struct ath10k *ar, u32 req_id,
+				     u32 num_units, u32 unit_len)
+{
+	int ret;
+
+	while (num_units) {
+		ret = ath10k_wmi_alloc_chunk(ar, req_id, num_units, unit_len);
+		if (ret < 0)
+			return ret;
+
+		num_units -= ret;
+	}
+
 	return 0;
 }
 
@@ -7705,10 +7729,11 @@ void ath10k_wmi_free_host_mem(struct ath10k *ar)
 
 	/* free the host memory chunks requested by firmware */
 	for (i = 0; i < ar->wmi.num_mem_chunks; i++) {
-		dma_free_coherent(ar->dev,
-				  ar->wmi.mem_chunks[i].len,
-				  ar->wmi.mem_chunks[i].vaddr,
-				  ar->wmi.mem_chunks[i].paddr);
+		dma_unmap_single(ar->dev,
+				 ar->wmi.mem_chunks[i].paddr,
+				 ar->wmi.mem_chunks[i].len,
+				 DMA_TO_DEVICE);
+		kfree(ar->wmi.mem_chunks[i].vaddr);
 	}
 
 	ar->wmi.num_mem_chunks = 0;
-- 
2.2.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
