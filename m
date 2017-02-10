Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccAIP-0006sk-JS
 for ath10k@lists.infradead.org; Fri, 10 Feb 2017 12:27:38 +0000
Subject: [PATCH v2 1/4] ath10k: fetch firmware images in a loop
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 10 Feb 2017 14:26:32 +0200
Message-ID: <148672959257.8556.14481306395015426550.stgit@potku.adurom.net>
In-Reply-To: <148672934198.8556.5588600166627442652.stgit@potku.adurom.net>
References: <148672934198.8556.5588600166627442652.stgit@potku.adurom.net>
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

To make it easier to handle minimum and maximum firmware API numbers convert
the firmware fetch functionality to a loop. If no firmware image is found print
an error with minimum and maximum API numbers and the name of firmware
directory. This is needed when we switch to using request_firmware_direct()
which doesn't print any errors anymore.

Also add a new function for creating the fw file name dynamically which makes it
easier to add new bus support, for example SDIO and USB, later.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
[kvalo@qca.qualcomm.com: remove sdio/usb part, new error message, clarify commit log]
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |   51 ++++++++++++++------------------
 drivers/net/wireless/ath/ath10k/hw.h   |    4 +++
 2 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index c27e7ea38a65..9674c08464ab 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1358,44 +1358,39 @@ int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name,
 	return ret;
 }
 
+static void ath10k_core_get_fw_name(struct ath10k *ar, char *fw_name,
+				    size_t fw_name_len, int fw_api)
+{
+	scnprintf(fw_name, fw_name_len, "%s-%d.bin", ATH10K_FW_FILE_BASE, fw_api);
+}
+
 static int ath10k_core_fetch_firmware_files(struct ath10k *ar)
 {
-	int ret;
+	int ret, i;
+	char fw_name[100];
 
 	/* calibration file is optional, don't check for any errors */
 	ath10k_fetch_cal_file(ar);
 
-	ar->fw_api = 5;
-	ath10k_dbg(ar, ATH10K_DBG_BOOT, "trying fw api %d\n", ar->fw_api);
-
-	ret = ath10k_core_fetch_firmware_api_n(ar, ATH10K_FW_API5_FILE,
-					       &ar->normal_mode_fw.fw_file);
-	if (ret == 0)
-		goto success;
-
-	ar->fw_api = 4;
-	ath10k_dbg(ar, ATH10K_DBG_BOOT, "trying fw api %d\n", ar->fw_api);
-
-	ret = ath10k_core_fetch_firmware_api_n(ar, ATH10K_FW_API4_FILE,
-					       &ar->normal_mode_fw.fw_file);
-	if (ret == 0)
-		goto success;
+	for (i = ATH10K_FW_API_MAX; i >= ATH10K_FW_API_MIN; i--) {
+		ar->fw_api = i;
+		ath10k_dbg(ar, ATH10K_DBG_BOOT, "trying fw api %d\n",
+			   ar->fw_api);
 
-	ar->fw_api = 3;
-	ath10k_dbg(ar, ATH10K_DBG_BOOT, "trying fw api %d\n", ar->fw_api);
+		ath10k_core_get_fw_name(ar, fw_name, sizeof(fw_name), ar->fw_api);
+		ret = ath10k_core_fetch_firmware_api_n(ar, fw_name,
+						       &ar->normal_mode_fw.fw_file);
+		if (!ret)
+			goto success;
+	}
 
-	ret = ath10k_core_fetch_firmware_api_n(ar, ATH10K_FW_API3_FILE,
-					       &ar->normal_mode_fw.fw_file);
-	if (ret == 0)
-		goto success;
+	/* we end up here if we couldn't fetch any firmware */
 
-	ar->fw_api = 2;
-	ath10k_dbg(ar, ATH10K_DBG_BOOT, "trying fw api %d\n", ar->fw_api);
+	ath10k_err(ar, "Failed to find firmware-N.bin (N between %d and %d) from %s: %d",
+		   ATH10K_FW_API_MIN, ATH10K_FW_API_MAX, ar->hw_params.fw.dir,
+		   ret);
 
-	ret = ath10k_core_fetch_firmware_api_n(ar, ATH10K_FW_API2_FILE,
-					       &ar->normal_mode_fw.fw_file);
-	if (ret)
-		return ret;
+	return ret;
 
 success:
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "using fw api %d\n", ar->fw_api);
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 38aa7c95732e..f0fda0f2b3b4 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -128,6 +128,10 @@ enum qca9377_chip_id_rev {
 #define QCA4019_HW_1_0_BOARD_DATA_FILE "board.bin"
 #define QCA4019_HW_1_0_PATCH_LOAD_ADDR  0x1234
 
+#define ATH10K_FW_FILE_BASE		"firmware"
+#define ATH10K_FW_API_MAX		5
+#define ATH10K_FW_API_MIN		2
+
 #define ATH10K_FW_API2_FILE		"firmware-2.bin"
 #define ATH10K_FW_API3_FILE		"firmware-3.bin"
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
