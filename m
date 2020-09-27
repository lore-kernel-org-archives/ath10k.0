Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMcIc-0005eI-6g
 for ath10k@lists.infradead.org; Sun, 27 Sep 2020 19:25:31 +0000
Received: by mail-wr1-x444.google.com with SMTP id m6so9578487wrn.0
 for <ath10k@lists.infradead.org>; Sun, 27 Sep 2020 12:25:26 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] ath10k: Try to download pre-cal using nvmem api
Date: Sun, 27 Sep 2020 21:25:14 +0200
Message-Id: <20200927192515.86-2-ansuelsmth@gmail.com>
In-Reply-To: <20200927192515.86-1-ansuelsmth@gmail.com>
References: <20200927192515.86-1-ansuelsmth@gmail.com>
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
To: "0001-ath10k-Try-to-get-mac-address-from-dts . patchKalle Valo" <kvalo@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>

Most of routers that have the ath10k wifi chip integrated in the Soc
have the pre-cal data stored in a dedicated nvmem partition.
Introduce a new function to directly extract and use it if a nvmem with
the name 'pre-cal' is defined and available.
Pre-cal file have still priority to everything else.

Tested-on: QCA9984 hw1.0 PCI 10.4

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 52 +++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/core.h |  3 ++
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 9ed7b9883..dd509a4a8 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -15,6 +15,7 @@
 #include <linux/ctype.h>
 #include <linux/pm_qos.h>
 #include <asm/byteorder.h>
+#include <linux/nvmem-consumer.h>
 
 #include "core.h"
 #include "mac.h"
@@ -920,7 +921,8 @@ static int ath10k_core_get_board_id_from_otp(struct ath10k *ar)
 	}
 
 	if (ar->cal_mode == ATH10K_PRE_CAL_MODE_DT ||
-	    ar->cal_mode == ATH10K_PRE_CAL_MODE_FILE)
+	    ar->cal_mode == ATH10K_PRE_CAL_MODE_FILE ||
+	    ar->cal_mode == ATH10K_PRE_CAL_MODE_NVMEM)
 		bmi_board_id_param = BMI_PARAM_GET_FLASH_BOARD_ID;
 	else
 		bmi_board_id_param = BMI_PARAM_GET_EEPROM_BOARD_ID;
@@ -1682,7 +1684,8 @@ static int ath10k_download_and_run_otp(struct ath10k *ar)
 
 	/* As of now pre-cal is valid for 10_4 variants */
 	if (ar->cal_mode == ATH10K_PRE_CAL_MODE_DT ||
-	    ar->cal_mode == ATH10K_PRE_CAL_MODE_FILE)
+	    ar->cal_mode == ATH10K_PRE_CAL_MODE_FILE ||
+	    ar->cal_mode == ATH10K_PRE_CAL_MODE_NVMEM)
 		bmi_otp_exe_param = BMI_PARAM_FLASH_SECTION_ALL;
 
 	ret = ath10k_bmi_execute(ar, address, bmi_otp_exe_param, &result);
@@ -1703,6 +1706,41 @@ static int ath10k_download_and_run_otp(struct ath10k *ar)
 	return 0;
 }
 
+static int ath10k_download_cal_nvmem(struct ath10k *ar)
+{
+	int ret;
+	size_t len;
+	const void *file;
+	struct nvmem_cell *cell;
+	struct platform_device *pdev = of_find_device_by_node(ar->dev->of_node);
+
+	if (!pdev)
+		return -ENODEV;
+
+	cell = nvmem_cell_get(ar->dev, "pre-cal");
+	if (IS_ERR(cell))
+		return PTR_ERR(cell);
+
+	file = nvmem_cell_read(cell, &len);
+	nvmem_cell_put(cell);
+
+	if (IS_ERR(file))
+		return PTR_ERR(file);
+
+	ret = ath10k_download_board_data(ar, file, len);
+	if (ret) {
+		ath10k_err(ar, "failed to download cal_file data: %d\n", ret);
+		goto err;
+	}
+
+	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot cal file downloaded\n");
+
+	return 0;
+err:
+	kfree(file);
+	return ret;
+}
+
 static int ath10k_download_cal_file(struct ath10k *ar,
 				    const struct firmware *file)
 {
@@ -2049,6 +2087,16 @@ static int ath10k_core_pre_cal_download(struct ath10k *ar)
 		goto success;
 	}
 
+	ath10k_dbg(ar, ATH10K_DBG_BOOT,
+		   "boot did not find a pre calibration file, try NVMEM next: %d\n",
+		   ret);
+
+	ret = ath10k_download_cal_nvmem(ar);
+	if (ret == 0) {
+		ar->cal_mode = ATH10K_PRE_CAL_MODE_NVMEM;
+		goto success;
+	}
+
 	ath10k_dbg(ar, ATH10K_DBG_BOOT,
 		   "boot did not find a pre calibration file, try DT next: %d\n",
 		   ret);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 4cf5bd489..186aba73a 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -864,6 +864,7 @@ enum ath10k_cal_mode {
 	ATH10K_CAL_MODE_OTP,
 	ATH10K_CAL_MODE_DT,
 	ATH10K_PRE_CAL_MODE_FILE,
+	ATH10K_PRE_CAL_MODE_NVMEM,
 	ATH10K_PRE_CAL_MODE_DT,
 	ATH10K_CAL_MODE_EEPROM,
 };
@@ -886,6 +887,8 @@ static inline const char *ath10k_cal_mode_str(enum ath10k_cal_mode mode)
 		return "dt";
 	case ATH10K_PRE_CAL_MODE_FILE:
 		return "pre-cal-file";
+	case ATH10K_PRE_CAL_MODE_NVMEM:
+		return "pre-cal-nvmem";
 	case ATH10K_PRE_CAL_MODE_DT:
 		return "pre-cal-dt";
 	case ATH10K_CAL_MODE_EEPROM:
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
