Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh01.mail.saunalahti.fi ([62.142.5.107])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XdZQ3-0007wb-8k
 for ath10k@lists.infradead.org; Mon, 13 Oct 2014 06:47:48 +0000
Received: from potku.adurom.net (a91-155-131-35.elisa-laajakaista.fi
 [91.155.131.35])
 by emh01.mail.saunalahti.fi (Postfix) with ESMTP id 3FA9C90047
 for <ath10k@lists.infradead.org>; Mon, 13 Oct 2014 09:47:22 +0300 (EEST)
Subject: [PROTOTYPE PATCH] ath10k: prototype code for Device Tree support
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 13 Oct 2014 09:47:21 +0300
Message-ID: <20141013064721.13072.15153.stgit@potku.adurom.net>
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

Will not work as there's no proper definition for ath10k calibration data
format in DT (yet)! Only compile tested.

Discussion about the DT format here:

http://lists.infradead.org/pipermail/ath10k/2014-October/003402.html

Depends on these patches:

ath10k: add back enum ath10k_bus
ath10k: refactor ath10k_init_download_firmware()
ath10k: retrieve calibration data from file

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |   70 ++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/core.h |    3 +
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5c23d00f7d60..5b60f2fb4b40 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -17,6 +17,7 @@
 
 #include <linux/module.h>
 #include <linux/firmware.h>
+#include <linux/of.h>
 
 #include "core.h"
 #include "mac.h"
@@ -244,6 +245,67 @@ static int ath10k_download_cal_file(struct ath10k *ar)
 	return 0;
 }
 
+static int ath10k_download_cal_dt(struct ath10k *ar)
+{
+	struct device_node *node;
+	u16 data_len;
+	void *data;
+	int ret;
+
+	/* FIXME: design proper format for ath10k calibration data in DT,
+	 * this is just some random stuff at the moment
+	 */
+
+	node = of_find_node_by_name(NULL, "foo, foo");
+	if (!node)
+		/* Device Tree is optional, don't print any warnings if
+		 * there's no node for ath10k.
+		 */
+		return -ENOENT;
+
+	ret = of_property_read_u16(node, "foo, bar", &data_len);
+	if (ret) {
+		ath10k_warn(ar, "failed to find cal data length from DT: %d\n",
+			    ret);
+		goto out;
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
+	ret = of_property_read_u8_array(node, "bar, bar", data, data_len);
+	if (ret)
+		ath10k_warn(ar, "failed to read calibration data from DT: %d\n",
+			    ret);
+		goto out_free;
+
+	ret = ath10k_download_board_data(ar, data, data_len);
+	if (ret) {
+		ath10k_warn(ar, "failed to download calibration data from Device Tree: %d\n",
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
+	of_node_put(node);
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
index 2c286e73dbf7..f7b411948883 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -390,6 +390,7 @@ enum ath10k_dev_flags {
 enum ath10k_cal_mode {
 	ATH10K_CAL_MODE_FILE,
 	ATH10K_CAL_MODE_OTP,
+	ATH10K_CAL_MODE_DT,
 };
 
 static inline const char *ath10k_cal_mode_str(enum ath10k_cal_mode mode)
@@ -399,6 +400,8 @@ static inline const char *ath10k_cal_mode_str(enum ath10k_cal_mode mode)
 		return "file";
 	case ATH10K_CAL_MODE_OTP:
 		return "otp";
+	case ATH10K_CAL_MODE_DT:
+		return "dt";
 	}
 
 	return "unknown";


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
