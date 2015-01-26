Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YFs8D-00008x-DO
 for ath10k@lists.infradead.org; Mon, 26 Jan 2015 22:27:41 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH] ath10k: Replace ioread with wmb for data sync
Date: Mon, 26 Jan 2015 14:25:18 -0800
Message-ID: <1422311118-11320-1-git-send-email-poh@qca.qualcomm.com>
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

Using ioread() to perform data sync is excessive.
Use compact API, wmb(), that intended to be used for the case.
It reduces total 14 CPU clocks per interrupt.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 3b40a86..c353a2c 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -346,10 +346,8 @@ static void ath10k_pci_disable_and_clear_legacy_irq(struct ath10k *ar)
 	ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + PCIE_INTR_CLR_ADDRESS,
 			   PCIE_INTR_FIRMWARE_MASK | PCIE_INTR_CE_MASK_ALL);
 
-	/* IMPORTANT: this extra read transaction is required to
-	 * flush the posted write buffer. */
-	(void)ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
-				PCIE_INTR_ENABLE_ADDRESS);
+	/* invoke data sync barrier */
+	wmb();
 }
 
 static void ath10k_pci_enable_legacy_irq(struct ath10k *ar)
@@ -358,10 +356,8 @@ static void ath10k_pci_enable_legacy_irq(struct ath10k *ar)
 			   PCIE_INTR_ENABLE_ADDRESS,
 			   PCIE_INTR_FIRMWARE_MASK | PCIE_INTR_CE_MASK_ALL);
 
-	/* IMPORTANT: this extra read transaction is required to
-	 * flush the posted write buffer. */
-	(void)ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
-				PCIE_INTR_ENABLE_ADDRESS);
+	/* invoke data sync barrier */
+	wmb();
 }
 
 static inline const char *ath10k_pci_get_irq_method(struct ath10k *ar)
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
