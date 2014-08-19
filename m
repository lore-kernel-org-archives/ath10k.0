Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh01.mail.saunalahti.fi ([62.142.5.107])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJehx-0001qh-JR
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 08:23:58 +0000
Subject: [PATCH v7 7/8] ath10k: rename ath10k_pci_hif_dump_area() to
 ath10k_pci_fw_crashed_dump()
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 19 Aug 2014 11:23:34 +0300
Message-ID: <20140819082334.16842.61579.stgit@potku.adurom.net>
In-Reply-To: <20140819082038.16842.46876.stgit@potku.adurom.net>
References: <20140819082038.16842.46876.stgit@potku.adurom.net>
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

Better to have a clear name for the function. While at it, clear up the title
for the register dump.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 4825cef69c6e..8aaaeda7d20b 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1005,7 +1005,7 @@ static void ath10k_pci_dump_registers(struct ath10k *ar,
 
 	BUILD_BUG_ON(REG_DUMP_COUNT_QCA988X % 4);
 
-	ath10k_err("target Register Dump\n");
+	ath10k_err("firmware register dump:\n");
 	for (i = 0; i < REG_DUMP_COUNT_QCA988X; i += 4)
 		ath10k_err("[%02d]: 0x%08X 0x%08X 0x%08X 0x%08X\n",
 			   i,
@@ -1018,7 +1018,7 @@ static void ath10k_pci_dump_registers(struct ath10k *ar,
 	       sizeof(crash_data->reg_dump_values));
 }
 
-static void ath10k_pci_hif_dump_area(struct ath10k *ar)
+static void ath10k_pci_fw_crashed_dump(struct ath10k *ar)
 {
 	struct ath10k_fw_crash_data *crash_data;
 	char uuid[50];
@@ -1970,7 +1970,7 @@ static void ath10k_pci_fw_interrupt_handler(struct ath10k *ar)
 				   fw_indicator & ~FW_IND_EVENT_PENDING);
 
 		if (ar_pci->started) {
-			ath10k_pci_hif_dump_area(ar);
+			ath10k_pci_fw_crashed_dump(ar);
 		} else {
 			/*
 			 * Probable Target failure before we're prepared
@@ -2391,7 +2391,7 @@ static void ath10k_pci_early_irq_tasklet(unsigned long data)
 	if (fw_ind & FW_IND_EVENT_PENDING) {
 		ath10k_pci_write32(ar, FW_INDICATOR_ADDRESS,
 				   fw_ind & ~FW_IND_EVENT_PENDING);
-		ath10k_pci_hif_dump_area(ar);
+		ath10k_pci_fw_crashed_dump(ar);
 	}
 
 	ath10k_pci_enable_legacy_irq(ar);
@@ -2642,7 +2642,7 @@ static int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 		ath10k_warn("device has crashed during init\n");
 		ath10k_pci_write32(ar, FW_INDICATOR_ADDRESS,
 				   val & ~FW_IND_EVENT_PENDING);
-		ath10k_pci_hif_dump_area(ar);
+		ath10k_pci_fw_crashed_dump(ar);
 		return -ECOMM;
 	}
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
