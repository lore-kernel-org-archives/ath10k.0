Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xb7EE-0002uA-CF
 for ath10k@lists.infradead.org; Mon, 06 Oct 2014 12:17:27 +0000
Received: by mail-wg0-f50.google.com with SMTP id a1so6452316wgh.9
 for <ath10k@lists.infradead.org>; Mon, 06 Oct 2014 05:17:02 -0700 (PDT)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH] ath10k: advertise all possible firmware(-api) files
Date: Mon,  6 Oct 2014 14:16:41 +0200
Message-Id: <1412597801-19298-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

This is required if we take into account possibility to load the driver
from initrd (RAM disk), so in other words: very early in the boot process,
before the file system is visible.

In such case we need to have the firmware files accessible from ram disk too,
and this patch guarantee this.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/hw.h  | 1 -
 drivers/net/wireless/ath/ath10k/pci.c | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 006a9cb..6dca960 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -28,7 +28,6 @@
 #define QCA988X_HW_2_0_CHIP_ID_REV	0x2
 #define QCA988X_HW_2_0_FW_DIR		"ath10k/QCA988X/hw2.0"
 #define QCA988X_HW_2_0_FW_FILE		"firmware.bin"
-#define QCA988X_HW_2_0_FW_3_FILE	"firmware-3.bin"
 #define QCA988X_HW_2_0_OTP_FILE		"otp.bin"
 #define QCA988X_HW_2_0_BOARD_DATA_FILE	"board.bin"
 #define QCA988X_HW_2_0_PATCH_LOAD_ADDR	0x1234
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 8a04904..730bb18 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2600,5 +2600,7 @@ module_exit(ath10k_pci_exit);
 MODULE_AUTHOR("Qualcomm Atheros");
 MODULE_DESCRIPTION("Driver support for Atheros QCA988X PCIe devices");
 MODULE_LICENSE("Dual BSD/GPL");
-MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" QCA988X_HW_2_0_FW_3_FILE);
+MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" QCA988X_HW_2_0_FW_FILE);
+MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" ATH10K_FW_API2_FILE);
+MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" ATH10K_FW_API3_FILE);
 MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" QCA988X_HW_2_0_BOARD_DATA_FILE);
-- 
1.8.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
