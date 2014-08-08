Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh02.mail.saunalahti.fi ([62.142.5.108])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFqnQ-0005JP-6Q
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 20:29:52 +0000
Received: from potku.adurom.net (a91-155-131-35.elisa-laajakaista.fi
 [91.155.131.35])
 by emh02.mail.saunalahti.fi (Postfix) with ESMTP id 93F0381855
 for <ath10k@lists.infradead.org>; Fri,  8 Aug 2014 23:29:30 +0300 (EEST)
Subject: [PATCH v5 7/7] ath10k: rename ath10k_pci_hif_dump_area() to
 ath10k_pci_firmware_crashed()
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 08 Aug 2014 23:29:28 +0300
Message-ID: <20140808202928.20713.34916.stgit@potku.adurom.net>
In-Reply-To: <20140808201815.20713.85582.stgit@potku.adurom.net>
References: <20140808201815.20713.85582.stgit@potku.adurom.net>
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

Better to have a clear name for the function.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index a65d45c78542..fe7159c3c8b1 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1045,7 +1045,7 @@ static void ath10k_pci_dump_registers(struct ath10k *ar,
 }
 
 
-static void ath10k_pci_hif_dump_area(struct ath10k *ar)
+static void ath10k_pci_firmware_crashed(struct ath10k *ar)
 {
 	struct ath10k_fw_crash_data *crash_data;
 	char uuid[20];
@@ -2000,7 +2000,7 @@ static void ath10k_pci_fw_interrupt_handler(struct ath10k *ar)
 				   fw_indicator & ~FW_IND_EVENT_PENDING);
 
 		if (ar_pci->started) {
-			ath10k_pci_hif_dump_area(ar);
+			ath10k_pci_firmware_crashed(ar);
 		} else {
 			/*
 			 * Probable Target failure before we're prepared
@@ -2451,7 +2451,7 @@ static void ath10k_pci_early_irq_tasklet(unsigned long data)
 	if (fw_ind & FW_IND_EVENT_PENDING) {
 		ath10k_pci_write32(ar, FW_INDICATOR_ADDRESS,
 				   fw_ind & ~FW_IND_EVENT_PENDING);
-		ath10k_pci_hif_dump_area(ar);
+		ath10k_pci_firmware_crashed(ar);
 	}
 
 	ath10k_pci_sleep(ar);
@@ -2730,7 +2730,7 @@ static int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 		ath10k_warn("device has crashed during init\n");
 		ath10k_pci_write32(ar, FW_INDICATOR_ADDRESS,
 				   val & ~FW_IND_EVENT_PENDING);
-		ath10k_pci_hif_dump_area(ar);
+		ath10k_pci_firmware_crashed(ar);
 		ret = -ECOMM;
 		goto out;
 	}


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
