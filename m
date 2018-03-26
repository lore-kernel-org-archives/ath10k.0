Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from da1vs02.rockwellcollins.com ([205.175.227.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0TnH-0004Uk-40
 for ath10k@lists.infradead.org; Mon, 26 Mar 2018 15:12:24 +0000
From: Jared Bents <jared.bents@rockwellcollins.com>
Subject: [PATCH v1 1/1] ath10k: convert kmemdup to dma_alloc_coherent
Date: Mon, 26 Mar 2018 10:12:02 -0500
Message-Id: <1522077122-31134-1-git-send-email-jared.bents@rockwellcollins.com>
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>

Update to convert the use of kmemdup to dma_alloc_coherent as
dma_alloc_coherent will consider DMA region limits such as
those seen with CONFIG_FSL_PCI && CONFIG_ZONE_DMA32 whereas
kmemdup does not take those limitations into account.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 36 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 3c4c800..8637bfe 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1372,28 +1372,16 @@ static int ath10k_pci_hif_exchange_bmi_msg(struct ath10k *ar,
 	if (resp && resp_len && *resp_len == 0)
 		return -EINVAL;
 
-	treq = kmemdup(req, req_len, GFP_KERNEL);
-	if (!treq)
-		return -ENOMEM;
-
-	req_paddr = dma_map_single(ar->dev, treq, req_len, DMA_TO_DEVICE);
-	ret = dma_mapping_error(ar->dev, req_paddr);
-	if (ret) {
+	treq = dma_alloc_coherent(ar->dev, req_len, &req_paddr, GFP_KERNEL);
+	if (!treq) {
 		ret = -EIO;
 		goto err_dma;
 	}
+	memcpy(treq, req, req_len);
 
 	if (resp && resp_len) {
-		tresp = kzalloc(*resp_len, GFP_KERNEL);
+		tresp = dma_alloc_coherent(ar->dev, *resp_len, &resp_paddr, GFP_KERNEL);
 		if (!tresp) {
-			ret = -ENOMEM;
-			goto err_req;
-		}
-
-		resp_paddr = dma_map_single(ar->dev, tresp, *resp_len,
-					    DMA_FROM_DEVICE);
-		ret = dma_mapping_error(ar->dev, resp_paddr);
-		if (ret) {
 			ret = EIO;
 			goto err_req;
 		}
@@ -1422,23 +1410,19 @@ static int ath10k_pci_hif_exchange_bmi_msg(struct ath10k *ar,
 	}
 
 err_resp:
+	if (ret == 0 && resp_len) {
+		*resp_len = min(*resp_len, xfer.resp_len);
+		memcpy(resp, tresp, xfer.resp_len);
+	}
 	if (resp) {
 		u32 unused_buffer;
 
 		ath10k_ce_revoke_recv_next(ce_rx, NULL, &unused_buffer);
-		dma_unmap_single(ar->dev, resp_paddr,
-				 *resp_len, DMA_FROM_DEVICE);
+		dma_free_coherent(ar->dev, *resp_len, tresp, resp_paddr);
 	}
 err_req:
-	dma_unmap_single(ar->dev, req_paddr, req_len, DMA_TO_DEVICE);
-
-	if (ret == 0 && resp_len) {
-		*resp_len = min(*resp_len, xfer.resp_len);
-		memcpy(resp, tresp, xfer.resp_len);
-	}
+	dma_free_coherent(ar->dev, req_len, treq, req_paddr);
 err_dma:
-	kfree(treq);
-	kfree(tresp);
 
 	return ret;
 }
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
