Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YajFX-0004ep-Ke
 for ath10k@lists.infradead.org; Wed, 25 Mar 2015 11:13:28 +0000
Subject: [PATCH v2 2/2] ath10k: bump up FW API to 5
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 25 Mar 2015 13:12:42 +0200
Message-ID: <20150325111242.30133.15132.stgit@x230>
In-Reply-To: <20150325110835.30133.509.stgit@x230>
References: <20150325110835.30133.509.stgit@x230>
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

Firmware 10.2.4.48-3 now supports management frames over HTT feature and has
ATH10K_FW_FEATURE_HAS_WMI_MGMT_TX. But as 10.2.4 branch has conflicting HTT ids
patch "ath10k: add ATH10K_FW_IE_HTT_OP_VERSION" is needed to fix the issue.
Older ath10k versions don't have support that support and to maintain backwards
compatibility we need bump up the FW API to 5 not break older versions.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |    7 +++++++
 drivers/net/wireless/ath/ath10k/hw.h   |    3 +++
 drivers/net/wireless/ath/ath10k/pci.c  |    1 +
 3 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index f4f91b230af0..81c02b566255 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -741,6 +741,13 @@ static int ath10k_core_fetch_firmware_files(struct ath10k *ar)
 	/* calibration file is optional, don't check for any errors */
 	ath10k_fetch_cal_file(ar);
 
+	ar->fw_api = 5;
+	ath10k_dbg(ar, ATH10K_DBG_BOOT, "trying fw api %d\n", ar->fw_api);
+
+	ret = ath10k_core_fetch_firmware_api_n(ar, ATH10K_FW_API5_FILE);
+	if (ret == 0)
+		goto success;
+
 	ar->fw_api = 4;
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "trying fw api %d\n", ar->fw_api);
 
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index ec6eb401ea29..a40b7be010fa 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -78,6 +78,9 @@ enum qca6174_chip_id_rev {
 /* added support for ATH10K_FW_IE_WMI_OP_VERSION */
 #define ATH10K_FW_API4_FILE		"firmware-4.bin"
 
+/* HTT id conflict fix for management frames over HTT */
+#define ATH10K_FW_API5_FILE		"firmware-5.bin"
+
 #define ATH10K_FW_UTF_FILE		"utf.bin"
 
 /* includes also the null byte */
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index b4aacfad4b24..262a84f67f62 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2780,6 +2780,7 @@ MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" QCA988X_HW_2_0_FW_FILE);
 MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" ATH10K_FW_API2_FILE);
 MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" ATH10K_FW_API3_FILE);
 MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" ATH10K_FW_API4_FILE);
+MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" ATH10K_FW_API5_FILE);
 MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" QCA988X_HW_2_0_BOARD_DATA_FILE);
 
 /* QCA6174 2.1 firmware files */


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
