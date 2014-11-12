Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoeGI-0001by-GD
 for ath10k@lists.infradead.org; Wed, 12 Nov 2014 20:11:31 +0000
Received: by mail-ig0-f177.google.com with SMTP id hl2so3653209igb.4
 for <ath10k@lists.infradead.org>; Wed, 12 Nov 2014 12:11:05 -0800 (PST)
Received: from haru.mtv.corp.google.com ([172.17.73.200])
 by mx.google.com with ESMTPSA id qp8sm8378945igb.15.2014.11.12.12.11.03
 for <ath10k@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Nov 2014 12:11:04 -0800 (PST)
From: Toshi Kikuchi <toshik@chromium.org>
Subject: [PATCH V2] ath10k: read calibration data from Device Tree
Date: Wed, 12 Nov 2014 12:10:56 -0800
Message-Id: <1415823056-10876-1-git-send-email-toshik@chromium.org>
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

V1->V2: fixed a bug that returns an uninitialized value if the node
is not found.

This patch adds support for reading calibration data from Device Tree.
It looks for the calibration data in Device Tree if it can't find it
in a file.

The node for the calibration data should be defined like this:

pci {
        pcie@0 {
                reg = <0 0 0 0 0>;
                #interrupt-cells = <1>;
                #size-cells = <2>;
                #address-cells = <3>;
                device_type = "pci";

                ath10k@0,0 {
                        reg = <0 0 0 0 0>;
                        device_type = "pci";
                        qcom,ath10k-calibration-data = [ 01 02 03 ... ];
                };
        };
};

Change-Id: I6fe3c50fe2de9177d031a4c17bd95152372dd993
Signed-off-by: Toshi Kikuchi <toshik@chromium.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 70 +++++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/core.h |  3 ++
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5c23d00..cea978e 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -17,6 +17,7 @@
 
 #include <linux/module.h>
 #include <linux/firmware.h>
+#include <linux/of.h>
 
 #include "core.h"
 #include "mac.h"
@@ -27,6 +28,7 @@
 #include "debug.h"
 #include "htt.h"
 #include "testmode.h"
+#include "pci.h"
 
 unsigned int ath10k_debug_mask;
 static bool uart_print;
@@ -244,6 +246,66 @@ static int ath10k_download_cal_file(struct ath10k *ar)
 	return 0;
 }
 
+static int ath10k_download_cal_dt(struct ath10k *ar)
+{
+	struct device_node *node;
+	int data_len;
+	void *data;
+	int ret;
+
+	node = pci_device_to_OF_node(ath10k_pci_priv(ar)->pdev);
+	if (!node)
+		/* Device Tree is optional, don't print any warnings if
+		 * there's no node for ath10k.
+		 */
+		return -ENOENT;
+
+	if (!of_get_property(node, "qcom,ath10k-calibration-data",
+			     &data_len)) {
+		/* The calibration data node is optional */
+		return -ENOENT;
+	}
+
+	if (data_len != QCA988X_CAL_DATA_LEN) {
+		ath10k_warn(ar, "invalid calibration data length in DT: %d\n",
+			    data_len);
+		ret = -EMSGSIZE;
+		goto out;
+	}
+
+	data = kmalloc(data_len, GFP_KERNEL);
+	if (!data) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ret = of_property_read_u8_array(node, "qcom,ath10k-calibration-data",
+					data, data_len);
+	if (ret) {
+		ath10k_warn(ar,
+			    "failed to read calibration data from DT: %d\n",
+			    ret);
+		goto out_free;
+	}
+
+	ret = ath10k_download_board_data(ar, data, data_len);
+	if (ret) {
+		ath10k_warn(ar,
+			    "failed to download calibration data from "
+			    "Device Tree: %d\n",
+			    ret);
+		goto out_free;
+	}
+
+	ret = 0;
+
+out_free:
+	kfree(data);
+
+out:
+	return ret;
+}
+
 static int ath10k_download_and_run_otp(struct ath10k *ar)
 {
 	u32 result, address = ar->hw_params.patch_load_addr;
@@ -657,9 +719,15 @@ static int ath10k_download_cal_data(struct ath10k *ar)
 	}
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT,
-		   "boot did not find a calibration file, try OTP next: %d\n",
+		   "boot did not find a calibration file, try DT next: %d\n",
 		   ret);
 
+	ret = ath10k_download_cal_dt(ar);
+	if (ret == 0) {
+		ar->cal_mode = ATH10K_CAL_MODE_DT;
+		goto done;
+	}
+
 	ret = ath10k_download_and_run_otp(ar);
 	if (ret) {
 		ath10k_err(ar, "failed to run otp: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 1e3fd10..8e89e31 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -391,6 +391,7 @@ enum ath10k_dev_flags {
 enum ath10k_cal_mode {
 	ATH10K_CAL_MODE_FILE,
 	ATH10K_CAL_MODE_OTP,
+	ATH10K_CAL_MODE_DT,
 };
 
 static inline const char *ath10k_cal_mode_str(enum ath10k_cal_mode mode)
@@ -400,6 +401,8 @@ static inline const char *ath10k_cal_mode_str(enum ath10k_cal_mode mode)
 		return "file";
 	case ATH10K_CAL_MODE_OTP:
 		return "otp";
+	case ATH10K_CAL_MODE_DT:
+		return "dt";
 	}
 
 	return "unknown";
-- 
2.1.0.rc2.206.gedb03e5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
