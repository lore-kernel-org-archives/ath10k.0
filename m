Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh04.mail.saunalahti.fi ([62.142.5.110])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTRHp-0003Vj-3X
 for ath10k@lists.infradead.org; Fri, 28 Mar 2014 07:33:09 +0000
Subject: [PATCH v2 5/8] ath10k: delete ar_pci->fw_indicator_address
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 28 Mar 2014 09:32:46 +0200
Message-ID: <20140328073246.30438.12181.stgit@potku.adurom.net>
In-Reply-To: <20140328073040.30438.17966.stgit@potku.adurom.net>
References: <20140328073040.30438.17966.stgit@potku.adurom.net>
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

It always contains the same constant, no need to have a separate variable for it.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |   16 ++++++----------
 drivers/net/wireless/ath/ath10k/pci.h |    3 ---
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 085c7ee741b1..14d955b45c00 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1753,16 +1753,15 @@ static int ath10k_pci_ce_init(struct ath10k *ar)
 static void ath10k_pci_fw_interrupt_handler(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
-	u32 fw_indicator_address, fw_indicator;
+	u32 fw_indicator;
 
 	ath10k_pci_wake(ar);
 
-	fw_indicator_address = ar_pci->fw_indicator_address;
-	fw_indicator = ath10k_pci_read32(ar, fw_indicator_address);
+	fw_indicator = ath10k_pci_read32(ar, FW_INDICATOR_ADDRESS);
 
 	if (fw_indicator & FW_IND_EVENT_PENDING) {
 		/* ACK: clear Target-side pending event */
-		ath10k_pci_write32(ar, fw_indicator_address,
+		ath10k_pci_write32(ar, FW_INDICATOR_ADDRESS,
 				   fw_indicator & ~FW_IND_EVENT_PENDING);
 
 		if (ar_pci->started) {
@@ -1781,7 +1780,6 @@ static void ath10k_pci_fw_interrupt_handler(struct ath10k *ar)
 
 static int ath10k_pci_warm_reset(struct ath10k *ar)
 {
-	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	int ret = 0;
 	u32 val;
 
@@ -1813,7 +1811,7 @@ static int ath10k_pci_warm_reset(struct ath10k *ar)
 	msleep(100);
 
 	/* clear fw indicator */
-	ath10k_pci_write32(ar, ar_pci->fw_indicator_address, 0);
+	ath10k_pci_write32(ar, FW_INDICATOR_ADDRESS, 0);
 
 	/* clear target LF timer interrupts */
 	val = ath10k_pci_read32(ar, RTC_SOC_BASE_ADDRESS +
@@ -2154,7 +2152,6 @@ static irqreturn_t ath10k_pci_interrupt_handler(int irq, void *arg)
 static void ath10k_pci_early_irq_tasklet(unsigned long data)
 {
 	struct ath10k *ar = (struct ath10k *)data;
-	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	u32 fw_ind;
 	int ret;
 
@@ -2165,9 +2162,9 @@ static void ath10k_pci_early_irq_tasklet(unsigned long data)
 		return;
 	}
 
-	fw_ind = ath10k_pci_read32(ar, ar_pci->fw_indicator_address);
+	fw_ind = ath10k_pci_read32(ar, FW_INDICATOR_ADDRESS);
 	if (fw_ind & FW_IND_EVENT_PENDING) {
-		ath10k_pci_write32(ar, ar_pci->fw_indicator_address,
+		ath10k_pci_write32(ar, FW_INDICATOR_ADDRESS,
 				   fw_ind & ~FW_IND_EVENT_PENDING);
 
 		/* Some structures are unavailable during early boot or at
@@ -2544,7 +2541,6 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	}
 
 	ar_pci->ar = ar;
-	ar_pci->fw_indicator_address = FW_INDICATOR_ADDRESS;
 	atomic_set(&ar_pci->keep_awake_count, 0);
 
 	pci_set_drvdata(pdev, ar);
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index b43fdb4f7319..dfdebb4157aa 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -189,9 +189,6 @@ struct ath10k_pci {
 
 	struct ath10k_hif_cb msg_callbacks_current;
 
-	/* Target address used to signal a pending firmware event */
-	u32 fw_indicator_address;
-
 	/* Copy Engine used for Diagnostic Accesses */
 	struct ath10k_ce_pipe *ce_diag;
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
