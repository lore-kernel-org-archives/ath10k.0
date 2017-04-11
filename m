Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cy2yj-00060J-AN
 for ath10k@lists.infradead.org; Tue, 11 Apr 2017 21:05:35 +0000
From: <ryanhsu@qti.qualcomm.com>
Subject: [PATCH] ath10k: ath10k: bump up FW API to 6
Date: Tue, 11 Apr 2017 14:04:48 -0700
Message-ID: <1491944688-5795-1-git-send-email-ryanhsu@qca.qualcomm.com>
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: ryanhsu@qti.qualcomm.com

From: Ryan Hsu <ryanhsu@qca.qualcomm.com>

For QCA6174 hw3.0, since WLAN.RM.4.4-00022-QCARMSWPZ-2, it starts to
support the board ID information from otp, with some devices released on
the market that didn't calibrated with OTP, will have 0 for board ID
information, which cause the backward compatibility issue and was fixed
in commit 'd2e202c06ca4 ("ath10k: ignore configuring the incorrect board_id")'

So bump the fw api version to differentiate the latest firmware support.

Signed-off-by: Ryan Hsu <ryanhsu@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/hw.h  | 5 ++++-
 drivers/net/wireless/ath/ath10k/pci.c | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index f7c5c13..cd3dd11 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -129,7 +129,7 @@ enum qca9377_chip_id_rev {
 #define QCA4019_HW_1_0_PATCH_LOAD_ADDR  0x1234
 
 #define ATH10K_FW_FILE_BASE		"firmware"
-#define ATH10K_FW_API_MAX		5
+#define ATH10K_FW_API_MAX		6
 #define ATH10K_FW_API_MIN		2
 
 #define ATH10K_FW_API2_FILE		"firmware-2.bin"
@@ -141,6 +141,9 @@ enum qca9377_chip_id_rev {
 /* HTT id conflict fix for management frames over HTT */
 #define ATH10K_FW_API5_FILE		"firmware-5.bin"
 
+/* the firmware-6.bin blob */
+#define ATH10K_FW_API6_FILE		"firmware-6.bin"
+
 #define ATH10K_FW_UTF_FILE		"utf.bin"
 #define ATH10K_FW_UTF_API2_FILE		"utf-2.bin"
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 5d2f9b9..66e27a3 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3429,6 +3429,7 @@ static void __exit ath10k_pci_exit(void)
 /* QCA6174 3.1 firmware files */
 MODULE_FIRMWARE(QCA6174_HW_3_0_FW_DIR "/" ATH10K_FW_API4_FILE);
 MODULE_FIRMWARE(QCA6174_HW_3_0_FW_DIR "/" ATH10K_FW_API5_FILE);
+MODULE_FIRMWARE(QCA6174_HW_3_0_FW_DIR "/" ATH10K_FW_API6_FILE);
 MODULE_FIRMWARE(QCA6174_HW_3_0_FW_DIR "/" QCA6174_HW_3_0_BOARD_DATA_FILE);
 MODULE_FIRMWARE(QCA6174_HW_3_0_FW_DIR "/" ATH10K_BOARD_API2_FILE);
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
