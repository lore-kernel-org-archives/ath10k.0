Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezEsA-0002Uk-VQ
 for ath10k@lists.infradead.org; Fri, 23 Mar 2018 05:04:20 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v2 09/13] ath10k: Modify hif tx paddr to dma_addr_t type
Date: Fri, 23 Mar 2018 10:33:40 +0530
Message-Id: <1521781424-24972-10-git-send-email-govinds@codeaurora.org>
In-Reply-To: <1521781424-24972-1-git-send-email-govinds@codeaurora.org>
References: <1521781424-24972-1-git-send-email-govinds@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

Change type of hif sg tx paddr to dma_addr_t for
supporting target having addressing mode greater than
32 bit.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/hif.h | 2 +-
 drivers/net/wireless/ath/ath10k/pci.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hif.h b/drivers/net/wireless/ath/ath10k/hif.h
index 6da4e33..7abb13c 100644
--- a/drivers/net/wireless/ath/ath10k/hif.h
+++ b/drivers/net/wireless/ath/ath10k/hif.h
@@ -26,7 +26,7 @@ struct ath10k_hif_sg_item {
 	u16 transfer_id;
 	void *transfer_context; /* NULL = tx completion callback not called */
 	void *vaddr; /* for debugging mostly */
-	u32 paddr;
+	dma_addr_t paddr;
 	u16 len;
 };
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 808f3d6..e7c544b 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1379,8 +1379,8 @@ int ath10k_pci_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
 
 	for (i = 0; i < n_items - 1; i++) {
 		ath10k_dbg(ar, ATH10K_DBG_PCI,
-			   "pci tx item %d paddr 0x%08x len %d n_items %d\n",
-			   i, items[i].paddr, items[i].len, n_items);
+			   "pci tx item %d paddr %pad len %d n_items %d\n",
+			   i, &items[i].paddr, items[i].len, n_items);
 		ath10k_dbg_dump(ar, ATH10K_DBG_PCI_DUMP, NULL, "pci tx data: ",
 				items[i].vaddr, items[i].len);
 
@@ -1397,8 +1397,8 @@ int ath10k_pci_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
 	/* `i` is equal to `n_items -1` after for() */
 
 	ath10k_dbg(ar, ATH10K_DBG_PCI,
-		   "pci tx item %d paddr 0x%08x len %d n_items %d\n",
-		   i, items[i].paddr, items[i].len, n_items);
+		   "pci tx item %d paddr %pad len %d n_items %d\n",
+		   i, &items[i].paddr, items[i].len, n_items);
 	ath10k_dbg_dump(ar, ATH10K_DBG_PCI_DUMP, NULL, "pci tx data: ",
 			items[i].vaddr, items[i].len);
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
