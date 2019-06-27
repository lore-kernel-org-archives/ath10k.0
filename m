Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgZQm-0007bh-BW
 for ath10k@lists.infradead.org; Thu, 27 Jun 2019 18:47:37 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 2/2] ath10k: pci: remove unnecessary casts
Date: Thu, 27 Jun 2019 21:47:30 +0300
Message-Id: <1561661250-30528-2-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1561661250-30528-1-git-send-email-kvalo@codeaurora.org>
References: <1561661250-30528-1-git-send-email-kvalo@codeaurora.org>
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

Fixes checkpatch warnings:

drivers/net/wireless/ath/ath10k/pci.c:926: unnecessary cast may hide bugs, see http://c-faq.com/malloc/ma
drivers/net/wireless/ath/ath10k/pci.c:1072: unnecessary cast may hide bugs, see http://c-faq.com/malloc/m

While at it, also remove unnecessary initialisation of data_buf variable in both cases.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/pci.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 80bcb2ef5926..a0b4d265c6eb 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -909,7 +909,7 @@ static int ath10k_pci_diag_read_mem(struct ath10k *ar, u32 address, void *data,
 	/* Host buffer address in CE space */
 	u32 ce_data;
 	dma_addr_t ce_data_base = 0;
-	void *data_buf = NULL;
+	void *data_buf;
 	int i;
 
 	mutex_lock(&ar_pci->ce_diag_mutex);
@@ -923,10 +923,8 @@ static int ath10k_pci_diag_read_mem(struct ath10k *ar, u32 address, void *data,
 	 */
 	alloc_nbytes = min_t(unsigned int, nbytes, DIAG_TRANSFER_LIMIT);
 
-	data_buf = (unsigned char *)dma_alloc_coherent(ar->dev, alloc_nbytes,
-						       &ce_data_base,
-						       GFP_ATOMIC);
-
+	data_buf = dma_alloc_coherent(ar->dev, alloc_nbytes, &ce_data_base,
+				      GFP_ATOMIC);
 	if (!data_buf) {
 		ret = -ENOMEM;
 		goto done;
@@ -1054,7 +1052,7 @@ int ath10k_pci_diag_write_mem(struct ath10k *ar, u32 address,
 	u32 *buf;
 	unsigned int completed_nbytes, alloc_nbytes, remaining_bytes;
 	struct ath10k_ce_pipe *ce_diag;
-	void *data_buf = NULL;
+	void *data_buf;
 	dma_addr_t ce_data_base = 0;
 	int i;
 
@@ -1069,10 +1067,8 @@ int ath10k_pci_diag_write_mem(struct ath10k *ar, u32 address,
 	 */
 	alloc_nbytes = min_t(unsigned int, nbytes, DIAG_TRANSFER_LIMIT);
 
-	data_buf = (unsigned char *)dma_alloc_coherent(ar->dev,
-						       alloc_nbytes,
-						       &ce_data_base,
-						       GFP_ATOMIC);
+	data_buf = dma_alloc_coherent(ar->dev, alloc_nbytes, &ce_data_base,
+				      GFP_ATOMIC);
 	if (!data_buf) {
 		ret = -ENOMEM;
 		goto done;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
