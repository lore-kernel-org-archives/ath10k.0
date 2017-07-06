Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dT5fA-0006GQ-Nu
 for ath10k@lists.infradead.org; Thu, 06 Jul 2017 12:13:42 +0000
Subject: [PATCH v3 1/2] ath10k: various usb related definitions
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 6 Jul 2017 15:11:56 +0300
Message-ID: <149934311592.20024.14245790092679266925.stgit@potku.adurom.net>
In-Reply-To: <149934296332.20024.5652905816164718891.stgit@potku.adurom.net>
References: <149934296332.20024.5652905816164718891.stgit@potku.adurom.net>
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

From: Erik Stromdahl <erik.stromdahl@gmail.com>

Definitions for USB based chipsets

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
Patchwork-Id: 9738771
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c  |    1 +
 drivers/net/wireless/ath/ath10k/core.h  |    3 +++
 drivers/net/wireless/ath/ath10k/debug.h |    2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 75c5c903c8a6..c8016e752838 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1454,6 +1454,7 @@ static void ath10k_core_get_fw_name(struct ath10k *ar, char *fw_name,
 {
 	switch (ar->hif.bus) {
 	case ATH10K_BUS_SDIO:
+	case ATH10K_BUS_USB:
 		scnprintf(fw_name, fw_name_len, "%s-%s-%d.bin",
 			  ATH10K_FW_FILE_BASE, ath10k_bus_str(ar->hif.bus),
 			  fw_api);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 1aa5cf12fce0..bcbde3bc0086 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -92,6 +92,7 @@ enum ath10k_bus {
 	ATH10K_BUS_PCI,
 	ATH10K_BUS_AHB,
 	ATH10K_BUS_SDIO,
+	ATH10K_BUS_USB,
 };
 
 static inline const char *ath10k_bus_str(enum ath10k_bus bus)
@@ -103,6 +104,8 @@ static inline const char *ath10k_bus_str(enum ath10k_bus bus)
 		return "ahb";
 	case ATH10K_BUS_SDIO:
 		return "sdio";
+	case ATH10K_BUS_USB:
+		return "usb";
 	}
 
 	return "unknown";
diff --git a/drivers/net/wireless/ath/ath10k/debug.h b/drivers/net/wireless/ath/ath10k/debug.h
index 257d10985c6e..548ad5483a4a 100644
--- a/drivers/net/wireless/ath/ath10k/debug.h
+++ b/drivers/net/wireless/ath/ath10k/debug.h
@@ -40,6 +40,8 @@ enum ath10k_debug_mask {
 	ATH10K_DBG_AHB		= 0x00008000,
 	ATH10K_DBG_SDIO		= 0x00010000,
 	ATH10K_DBG_SDIO_DUMP	= 0x00020000,
+	ATH10K_DBG_USB		= 0x00040000,
+	ATH10K_DBG_USB_BULK	= 0x00080000,
 	ATH10K_DBG_ANY		= 0xffffffff,
 };
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
