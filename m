Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZEwg-0005q2-UT
 for ath10k@lists.infradead.org; Thu, 02 Feb 2017 10:48:56 +0000
Subject: [PATCH 3/3] ath10k: few whitespace fixes
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 2 Feb 2017 12:48:08 +0200
Message-ID: <148603248800.7275.3176753002583396340.stgit@potku.adurom.net>
In-Reply-To: <148603246555.7275.3348416808167032391.stgit@potku.adurom.net>
References: <148603246555.7275.3348416808167032391.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

Fixes checkpatch warnings:

drivers/net/wireless/ath/ath10k/pci.c:1593: Statements should start on a tabstop
drivers/net/wireless/ath/ath10k/ce.c:962: Alignment should match open parenthesis

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/ce.c  |    6 +++---
 drivers/net/wireless/ath/ath10k/pci.c |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index da466ab2d823..4045657e0a6e 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -959,9 +959,9 @@ ath10k_ce_alloc_dest_ring(struct ath10k *ar, unsigned int ce_id,
 	 */
 	dest_ring->base_addr_owner_space_unaligned =
 		dma_zalloc_coherent(ar->dev,
-				   (nentries * sizeof(struct ce_desc) +
-				    CE_DESC_RING_ALIGN),
-				   &base_addr, GFP_KERNEL);
+				    (nentries * sizeof(struct ce_desc) +
+				     CE_DESC_RING_ALIGN),
+				    &base_addr, GFP_KERNEL);
 	if (!dest_ring->base_addr_owner_space_unaligned) {
 		kfree(dest_ring);
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index d2aa9e5ec05d..5e84199d68e1 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1590,7 +1590,7 @@ void ath10k_pci_irq_msi_fw_mask(struct ath10k *ar)
 		/* TODO: Find appropriate register configuration for QCA99X0
 		 *  to mask irq/MSI.
 		 */
-		 break;
+		break;
 	}
 }
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
