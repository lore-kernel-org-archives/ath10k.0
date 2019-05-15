Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQkdU-0003vF-SN
 for ath10k@lists.infradead.org; Wed, 15 May 2019 03:31:22 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: change firmware file name for UTF mode of SDIO/USB
Date: Wed, 15 May 2019 11:30:47 +0800
Message-Id: <1557891047-16606-1-git-send-email-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

Firmware name for UTF mode of SDIO has changed from utf-2.bin to
utf-sdio-2.bin, so it need to change in ath10k, otherwise it will
fail for UTF mode.

After change the name in ath10k, it will success for UTF mode of
SDIO/USB.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/hw.h       |  2 ++
 drivers/net/wireless/ath/ath10k/testmode.c | 17 ++++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 7131499..d4fc13d 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -151,6 +151,8 @@ enum qca9377_chip_id_rev {
 #define ATH10K_FW_UTF_FILE		"utf.bin"
 #define ATH10K_FW_UTF_API2_FILE		"utf-2.bin"
 
+#define ATH10K_FW_UTF_FILE_BASE		"utf"
+
 /* includes also the null byte */
 #define ATH10K_FIRMWARE_MAGIC               "QCA-ATH10K"
 #define ATH10K_BOARD_MAGIC                  "QCA-ATH10K-BOARD"
diff --git a/drivers/net/wireless/ath/ath10k/testmode.c b/drivers/net/wireless/ath/ath10k/testmode.c
index 6433ff1..da9c596 100644
--- a/drivers/net/wireless/ath/ath10k/testmode.c
+++ b/drivers/net/wireless/ath/ath10k/testmode.c
@@ -174,8 +174,23 @@ static int ath10k_tm_fetch_firmware(struct ath10k *ar)
 {
 	struct ath10k_fw_components *utf_mode_fw;
 	int ret;
+	char fw_name[100];
+	int fw_api2 = 2;
+
+	switch (ar->hif.bus) {
+	case ATH10K_BUS_SDIO:
+	case ATH10K_BUS_USB:
+		scnprintf(fw_name, sizeof(fw_name), "%s-%s-%d.bin",
+			  ATH10K_FW_UTF_FILE_BASE, ath10k_bus_str(ar->hif.bus),
+			  fw_api2);
+		break;
+	default:
+		scnprintf(fw_name, sizeof(fw_name), "%s-%d.bin",
+			  ATH10K_FW_UTF_FILE_BASE, fw_api2);
+		break;
+	}
 
-	ret = ath10k_core_fetch_firmware_api_n(ar, ATH10K_FW_UTF_API2_FILE,
+	ret = ath10k_core_fetch_firmware_api_n(ar, fw_name,
 					       &ar->testmode.utf_mode_fw.fw_file);
 	if (ret == 0) {
 		ath10k_dbg(ar, ATH10K_DBG_TESTMODE, "testmode using fw utf api 2");
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
