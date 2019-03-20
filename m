Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6T9h-0004sG-Db
 for ath10k@lists.infradead.org; Wed, 20 Mar 2019 04:48:47 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v2 2/2] ath10k: Add xo calibration support for wifi rf clock
Date: Wed, 20 Mar 2019 10:15:11 +0530
Message-Id: <20190320044511.12172-3-govinds@codeaurora.org>
In-Reply-To: <20190320044511.12172-1-govinds@codeaurora.org>
References: <20190320044511.12172-1-govinds@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

PMIC XO is the clock source for wifi rf clock in integrated wifi
chipset ex: WCN3990. Due to board layout errors XO frequency drifts
can cause wifi rf clock inaccuracy.
XO calibration test tree in Factory Test Mode is used to find the
best frequency offset(for example +/-2KHz )by programming XO trim
register. This ensure system clock stays within required 20 ppm
WLAN rf clock.

Retrieve the xo trim offset via system firmware (e.g., device tree),
especially in the case where the device doesn't have a useful EEPROM
on which to store the calibrated XO offset (e.g., for integrated Wifi).
Calibrated XO offset is sent to fw, which compensate the clock drift
by programing the XO trim register.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/qmi.c  | 12 ++++++++++++
 drivers/net/wireless/ath/ath10k/snoc.c | 11 +++++++++++
 drivers/net/wireless/ath/ath10k/snoc.h |  2 ++
 3 files changed, 25 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 37b3bd629f48..99c140a6628d 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -302,10 +302,16 @@ static int ath10k_qmi_send_cal_report_req(struct ath10k_qmi *qmi)
 	struct wlfw_cal_report_resp_msg_v01 resp = {};
 	struct wlfw_cal_report_req_msg_v01 req = {};
 	struct ath10k *ar = qmi->ar;
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 	struct qmi_txn txn;
 	int i, j = 0;
 	int ret;
 
+	if (ar_snoc->xo_cal_supported) {
+		req.xo_cal_data_valid = 1;
+		req.xo_cal_data = ar_snoc->xo_cal_data;
+	}
+
 	ret = qmi_txn_init(&qmi->qmi_hdl, &txn, wlfw_cal_report_resp_msg_v01_ei,
 			   &resp);
 	if (ret < 0)
@@ -636,6 +642,7 @@ ath10k_qmi_ind_register_send_sync_msg(struct ath10k_qmi *qmi)
 	struct wlfw_ind_register_resp_msg_v01 resp = {};
 	struct wlfw_ind_register_req_msg_v01 req = {};
 	struct ath10k *ar = qmi->ar;
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 	struct qmi_txn txn;
 	int ret;
 
@@ -646,6 +653,11 @@ ath10k_qmi_ind_register_send_sync_msg(struct ath10k_qmi *qmi)
 	req.msa_ready_enable_valid = 1;
 	req.msa_ready_enable = 1;
 
+	if (ar_snoc->xo_cal_supported) {
+		req.xo_cal_enable_valid = 1;
+		req.xo_cal_enable = 1;
+	}
+
 	ret = qmi_txn_init(&qmi->qmi_hdl, &txn,
 			   wlfw_ind_register_resp_msg_v01_ei, &resp);
 	if (ret < 0)
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 54efe6be8f1d..7cfd17beb7b0 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 
 #include "ce.h"
@@ -1189,6 +1190,16 @@ static int ath10k_snoc_resource_init(struct ath10k *ar)
 		ar_snoc->ce_irqs[i].irq_line = res->start;
 	}
 
+	ret = device_property_read_u32(&pdev->dev, "xo-cal-data",
+				       &ar_snoc->xo_cal_data);
+	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc xo-cal-data return %d\n", ret);
+	if (ret == 0) {
+		ar_snoc->xo_cal_supported = true;
+		ath10k_dbg(ar, ATH10K_DBG_SNOC, "xo cal data %x\n",
+			   ar_snoc->xo_cal_data);
+	}
+	ret = 0;
+
 out:
 	return ret;
 }
diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
index 2b2f23cf7c5d..25383de8f17d 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.h
+++ b/drivers/net/wireless/ath/ath10k/snoc.h
@@ -91,6 +91,8 @@ struct ath10k_snoc {
 	struct ath10k_clk_info *clk;
 	struct ath10k_qmi *qmi;
 	unsigned long int flags;
+	bool xo_cal_supported;
+	u32 xo_cal_data;
 };
 
 static inline struct ath10k_snoc *ath10k_snoc_priv(struct ath10k *ar)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
