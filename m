Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJJGS-0004uq-U9
 for ath10k@lists.infradead.org; Fri, 18 Sep 2020 16:29:37 +0000
Received: by mail-wr1-x443.google.com with SMTP id j2so6252248wrx.7
 for <ath10k@lists.infradead.org>; Fri, 18 Sep 2020 09:29:35 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH] ath10k: Introduce download cal from mtd
Date: Fri, 18 Sep 2020 18:29:27 +0200
Message-Id: <20200918162928.14335-1-ansuelsmth@gmail.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>

Most of routers that have the ath10k wifi chip integrated in the Soc
have the pre-cal data stored in the art (or equivalent) mtd partition.
Introduce a new function to directly extract and use it based on what is
set in the dt if the system have mtd support.
Pre-cal file have still priority to everything else.

Tested-on: QCA9984 hw1.0 PCI 10.4

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 74 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/core.h |  3 ++
 2 files changed, 77 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5f4e12196..eef00d657 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -13,6 +13,7 @@
 #include <linux/ctype.h>
 #include <linux/pm_qos.h>
 #include <asm/byteorder.h>
+#include <linux/mtd/mtd.h>
 
 #include "core.h"
 #include "mac.h"
@@ -1701,6 +1702,69 @@ static int ath10k_download_and_run_otp(struct ath10k *ar)
 	return 0;
 }
 
+static int ath10k_download_cal_mtd(struct ath10k *ar)
+{
+#ifdef CONFIG_MTD
+	struct device_node *node, *mtd_node = NULL;
+	struct mtd_info *mtd;
+	const __be32 *list;
+	u32 offset, size;
+	const char *part;
+	phandle phandle;
+	size_t retlen;
+	char *file;
+	int ret;
+
+	node = ar->dev->of_node;
+	if (!node)
+		return -ENOENT;
+
+	list = of_get_property(node, "qcom,ath10k-pre-calibration-data-mtd", &size);
+	if (!list || (size != (3 * sizeof(*list))))
+		return -EINVAL;
+
+	phandle = be32_to_cpup(list++);
+	if (phandle)
+		mtd_node = of_find_node_by_phandle(phandle);
+
+	if (!mtd_node)
+		return -ENODEV;
+
+	part = of_get_property(mtd_node, "label", NULL);
+	if (!part)
+		part = mtd_node->name;
+
+	mtd = get_mtd_device_nm(part);
+	if (IS_ERR(mtd))
+		return -ENODEV;
+
+	offset = be32_to_cpup(list++);
+	size = be32_to_cpup(list);
+
+	file = kzalloc(size, GFP_KERNEL);
+	if (!file)
+		return -ENOMEM;
+
+	ret = mtd_read(mtd, offset, size, &retlen, file);
+	put_mtd_device(mtd);
+
+	ret = ath10k_download_board_data(ar, file, size);
+	if (ret) {
+		ath10k_err(ar, "failed to download cal_file data: %d\n", ret);
+		goto err;
+	}
+
+	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot cal file downloaded\n");
+
+	return 0;
+
+err:
+	kfree(file);
+	return ret;
+#endif
+	return -EOPNOTSUPP;
+}
+
 static int ath10k_download_cal_file(struct ath10k *ar,
 				    const struct firmware *file)
 {
@@ -2047,6 +2111,16 @@ static int ath10k_core_pre_cal_download(struct ath10k *ar)
 		goto success;
 	}
 
+	ath10k_dbg(ar, ATH10K_DBG_BOOT,
+		   "boot did not find a pre calibration file, try MTD next: %d\n",
+		   ret);
+
+	ret = ath10k_download_cal_mtd(ar);
+	if (ret == 0) {
+		ar->cal_mode = ATH10K_PRE_CAL_MODE_MTD;
+		goto success;
+	}
+
 	ath10k_dbg(ar, ATH10K_DBG_BOOT,
 		   "boot did not find a pre calibration file, try DT next: %d\n",
 		   ret);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 4cf5bd489..3ca158605 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -864,6 +864,7 @@ enum ath10k_cal_mode {
 	ATH10K_CAL_MODE_OTP,
 	ATH10K_CAL_MODE_DT,
 	ATH10K_PRE_CAL_MODE_FILE,
+	ATH10K_PRE_CAL_MODE_MTD,
 	ATH10K_PRE_CAL_MODE_DT,
 	ATH10K_CAL_MODE_EEPROM,
 };
@@ -886,6 +887,8 @@ static inline const char *ath10k_cal_mode_str(enum ath10k_cal_mode mode)
 		return "dt";
 	case ATH10K_PRE_CAL_MODE_FILE:
 		return "pre-cal-file";
+	case ATH10K_PRE_CAL_MODE_MTD:
+		return "pre-cal-mtd";
 	case ATH10K_PRE_CAL_MODE_DT:
 		return "pre-cal-dt";
 	case ATH10K_CAL_MODE_EEPROM:
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
