Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh06.mail.saunalahti.fi ([62.142.5.116])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XT6L3-00047B-M4
 for ath10k@lists.infradead.org; Sun, 14 Sep 2014 09:43:22 +0000
Subject: [PATCH 05/10] ath10k: fix space after a cast style errors
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Sun, 14 Sep 2014 12:50:23 +0300
Message-ID: <20140914095023.9063.66403.stgit@x230>
In-Reply-To: <20140914094728.9063.32593.stgit@x230>
References: <20140914094728.9063.32593.stgit@x230>
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

CHECK: No space is necessary after a cast

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 52f273b92fa3..08e88a3758c1 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -340,8 +340,8 @@ static void ath10k_pci_disable_and_clear_legacy_irq(struct ath10k *ar)
 
 	/* IMPORTANT: this extra read transaction is required to
 	 * flush the posted write buffer. */
-	(void) ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
-				 PCIE_INTR_ENABLE_ADDRESS);
+	(void)ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
+				PCIE_INTR_ENABLE_ADDRESS);
 }
 
 static void ath10k_pci_enable_legacy_irq(struct ath10k *ar)
@@ -352,8 +352,8 @@ static void ath10k_pci_enable_legacy_irq(struct ath10k *ar)
 
 	/* IMPORTANT: this extra read transaction is required to
 	 * flush the posted write buffer. */
-	(void) ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
-				 PCIE_INTR_ENABLE_ADDRESS);
+	(void)ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
+				PCIE_INTR_ENABLE_ADDRESS);
 }
 
 static inline const char *ath10k_pci_get_irq_method(struct ath10k *ar)
@@ -547,7 +547,7 @@ static int ath10k_pci_diag_read_mem(struct ath10k *ar, u32 address, void *data,
 			goto done;
 		}
 
-		if (buf != (u32) address) {
+		if (buf != (u32)address) {
 			ret = -EIO;
 			goto done;
 		}
@@ -695,7 +695,7 @@ static int ath10k_pci_diag_write_mem(struct ath10k *ar, u32 address,
 		 * Request CE to send caller-supplied data that
 		 * was copied to bounce buffer to Target(!) address.
 		 */
-		ret = ath10k_ce_send(ce_diag, NULL, (u32) ce_data,
+		ret = ath10k_ce_send(ce_diag, NULL, (u32)ce_data,
 				     nbytes, 0, 0);
 		if (ret != 0)
 			goto done;
@@ -1624,7 +1624,7 @@ static int ath10k_pci_ce_init(struct ath10k *ar)
 			continue;
 		}
 
-		pipe_info->buf_sz = (size_t) (attr->src_sz_max);
+		pipe_info->buf_sz = (size_t)(attr->src_sz_max);
 	}
 
 	return 0;


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
