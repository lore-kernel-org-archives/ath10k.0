Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh07.mail.saunalahti.fi ([62.142.5.117])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSNST-000553-16
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 09:15:45 +0000
Subject: [PATCH 4/8] ath10k: advertise only firmware API 2 files
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 25 Mar 2014 11:15:23 +0200
Message-ID: <20140325091523.16651.54201.stgit@potku.adurom.net>
In-Reply-To: <20140325091311.16651.15747.stgit@potku.adurom.net>
References: <20140325091311.16651.15747.stgit@potku.adurom.net>
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

We do not really support older firmware API 1 anymore, so better remove
MODULE_FIRMWARE() declarations for them and only list for API 2 files.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/hw.h  |    1 +
 drivers/net/wireless/ath/ath10k/pci.c |    3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 35fc44e281f5..007e855f4ba9 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -28,6 +28,7 @@
 #define QCA988X_HW_2_0_CHIP_ID_REV	0x2
 #define QCA988X_HW_2_0_FW_DIR		"ath10k/QCA988X/hw2.0"
 #define QCA988X_HW_2_0_FW_FILE		"firmware.bin"
+#define QCA988X_HW_2_0_FW_2_FILE	"firmware-2.bin"
 #define QCA988X_HW_2_0_OTP_FILE		"otp.bin"
 #define QCA988X_HW_2_0_BOARD_DATA_FILE	"board.bin"
 #define QCA988X_HW_2_0_PATCH_LOAD_ADDR	0x1234
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 2c5a83d2748a..e70dde1beaca 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2701,6 +2701,5 @@ module_exit(ath10k_pci_exit);
 MODULE_AUTHOR("Qualcomm Atheros");
 MODULE_DESCRIPTION("Driver support for Atheros QCA988X PCIe devices");
 MODULE_LICENSE("Dual BSD/GPL");
-MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" QCA988X_HW_2_0_FW_FILE);
-MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" QCA988X_HW_2_0_OTP_FILE);
+MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" QCA988X_HW_2_0_FW_2_FILE);
 MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" QCA988X_HW_2_0_BOARD_DATA_FILE);


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
