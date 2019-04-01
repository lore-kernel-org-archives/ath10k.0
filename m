Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAwt7-0005oK-Oa
 for ath10k@lists.infradead.org; Mon, 01 Apr 2019 13:22:11 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH] ath10k: Add WMI diag fw logging support for WCN3990
Date: Mon,  1 Apr 2019 18:52:02 +0530
Message-Id: <20190401132202.29626-1-govinds@codeaurora.org>
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

Integrated WiFi chipset ex:WCN399x supports fw logging
using WMI copy engine and shared mem DIAG based fw logging.
By default shared mem DIAG based fw logging is enabled.
To support WMI copy engine based fw logging add QMI
control message to enable WMI copy engine based fw logging.

Enable WMI based fw logging using fw_diag_log module parameter.

insmod ath10k_core.ko fw_diag_log=1

DIAG utility(https://github.com/andersson/diag) implements extraction
of diagnostics related messages between application processor and
various subsystems while shared mem DIAG based fw logging is enabled.

Testing: Tested on WCN3990/QCA6174 HW
Tested FW: WLAN.HL.3.1-00959-QCAHLSWMTPLZ-1

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c |  9 ++++++
 drivers/net/wireless/ath/ath10k/core.h |  1 +
 drivers/net/wireless/ath/ath10k/hif.h  | 15 +++++++++
 drivers/net/wireless/ath/ath10k/qmi.c  | 45 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/qmi.h  |  1 +
 drivers/net/wireless/ath/ath10k/snoc.c | 14 ++++++++
 6 files changed, 85 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 399b501f3c3c..ebf6071bfe15 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -41,6 +41,7 @@ static unsigned int ath10k_cryptmode_param;
 static bool uart_print;
 static bool skip_otp;
 static bool rawmode;
+static bool fw_diag_log;
 
 unsigned long ath10k_coredump_mask = BIT(ATH10K_FW_CRASH_DUMP_REGISTERS) |
 				     BIT(ATH10K_FW_CRASH_DUMP_CE_DATA);
@@ -51,6 +52,7 @@ module_param_named(cryptmode, ath10k_cryptmode_param, uint, 0644);
 module_param(uart_print, bool, 0644);
 module_param(skip_otp, bool, 0644);
 module_param(rawmode, bool, 0644);
+module_param(fw_diag_log, bool, 0644);
 module_param_named(coredump_mask, ath10k_coredump_mask, ulong, 0444);
 
 MODULE_PARM_DESC(debug_mask, "Debugging mask");
@@ -59,6 +61,7 @@ MODULE_PARM_DESC(skip_otp, "Skip otp failure for calibration in testmode");
 MODULE_PARM_DESC(cryptmode, "Crypto mode: 0-hardware, 1-software");
 MODULE_PARM_DESC(rawmode, "Use raw 802.11 frame datapath");
 MODULE_PARM_DESC(coredump_mask, "Bitfield of what to include in firmware crash file");
+MODULE_PARM_DESC(fw_diag_log, "Diag based fw log debugging");
 
 static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 	{
@@ -2698,6 +2701,12 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 	if (status)
 		goto err_hif_stop;
 
+	status = ath10k_hif_set_target_log_mode(ar, fw_diag_log);
+	if (status && status != -EOPNOTSUPP) {
+		ath10k_warn(ar, "set traget log mode faileds: %d\n", status);
+		goto err_hif_stop;
+	}
+
 	return 0;
 
 err_hif_stop:
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 46e9c8c97a4d..bfd2b3e23f54 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -635,6 +635,7 @@ struct ath10k_debug {
 	u32 nf_cal_period;
 	void *cal_data;
 	u32 enable_extd_tx_stats;
+	u8 fw_dbglog_mode;
 };
 
 enum ath10k_state {
diff --git a/drivers/net/wireless/ath/ath10k/hif.h b/drivers/net/wireless/ath/ath10k/hif.h
index 1a59ea0068c2..ee825a78480d 100644
--- a/drivers/net/wireless/ath/ath10k/hif.h
+++ b/drivers/net/wireless/ath/ath10k/hif.h
@@ -23,6 +23,12 @@
 #include "bmi.h"
 #include "debug.h"
 
+/* Types of fw logging mode */
+enum ath_dbg_mode {
+	ATH10K_ENABLE_FW_LOG_DIAG,
+	ATH10K_ENABLE_FW_LOG_CE,
+};
+
 struct ath10k_hif_sg_item {
 	u16 transfer_id;
 	void *transfer_context; /* NULL = tx completion callback not called */
@@ -97,6 +103,7 @@ struct ath10k_hif_ops {
 
 	int (*get_target_info)(struct ath10k *ar,
 			       struct bmi_target_info *target_info);
+	int (*set_target_log_mode)(struct ath10k *ar, u8 fw_log_mode);
 };
 
 static inline int ath10k_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
@@ -231,4 +238,12 @@ static inline int ath10k_hif_get_target_info(struct ath10k *ar,
 	return ar->hif.ops->get_target_info(ar, tgt_info);
 }
 
+static inline int ath10k_hif_set_target_log_mode(struct ath10k *ar,
+						 u8 fw_log_mode)
+{
+	if (!ar->hif.ops->set_target_log_mode)
+		return -EOPNOTSUPP;
+
+	return ar->hif.ops->set_target_log_mode(ar, fw_log_mode);
+}
 #endif /* _HIF_H_ */
diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 99c140a6628d..ba8f5a8f83d1 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -636,6 +636,51 @@ static int ath10k_qmi_host_cap_send_sync(struct ath10k_qmi *qmi)
 	return ret;
 }
 
+int ath10k_qmi_set_fw_log_mode(struct ath10k *ar, u8 fw_log_mode)
+{
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
+	struct wlfw_ini_resp_msg_v01 resp = {};
+	struct ath10k_qmi *qmi = ar_snoc->qmi;
+	struct wlfw_ini_req_msg_v01 req = {};
+	struct qmi_txn txn;
+	int ret;
+
+	req.enablefwlog_valid = 1;
+	req.enablefwlog = fw_log_mode;
+
+	ret = qmi_txn_init(&qmi->qmi_hdl, &txn, wlfw_ini_resp_msg_v01_ei,
+			   &resp);
+	if (ret < 0)
+		goto out;
+
+	ret = qmi_send_request(&qmi->qmi_hdl, NULL, &txn,
+			       QMI_WLFW_INI_REQ_V01,
+			       WLFW_INI_REQ_MSG_V01_MAX_MSG_LEN,
+			       wlfw_ini_req_msg_v01_ei, &req);
+	if (ret < 0) {
+		qmi_txn_cancel(&txn);
+		ath10k_err(ar, "fail to send fw log reqest: %d\n", ret);
+		goto out;
+	}
+
+	ret = qmi_txn_wait(&txn, ATH10K_QMI_TIMEOUT * HZ);
+	if (ret < 0)
+		goto out;
+
+	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
+		ath10k_err(ar, "fw log request rejectedr: %d\n",
+			   resp.resp.error);
+		ret = -EINVAL;
+		goto out;
+	}
+	ath10k_dbg(ar, ATH10K_DBG_QMI, "qmi fw log request completed, mode: %d\n",
+		   fw_log_mode);
+	return 0;
+
+out:
+	return ret;
+}
+
 static int
 ath10k_qmi_ind_register_send_sync_msg(struct ath10k_qmi *qmi)
 {
diff --git a/drivers/net/wireless/ath/ath10k/qmi.h b/drivers/net/wireless/ath/ath10k/qmi.h
index 1efe1d22fc2f..4ab21b223aaf 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.h
+++ b/drivers/net/wireless/ath/ath10k/qmi.h
@@ -125,5 +125,6 @@ int ath10k_qmi_wlan_disable(struct ath10k *ar);
 int ath10k_qmi_register_service_notifier(struct notifier_block *nb);
 int ath10k_qmi_init(struct ath10k *ar, u32 msa_size);
 int ath10k_qmi_deinit(struct ath10k *ar);
+int ath10k_qmi_set_fw_log_mode(struct ath10k *ar, u8 fw_log_mode);
 
 #endif /* ATH10K_QMI_H */
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index a7f837f4dc53..0be12996beba 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1042,6 +1042,19 @@ static int ath10k_snoc_hif_power_up(struct ath10k *ar)
 	return ret;
 }
 
+static int ath10k_snoc_hif_set_target_log_mode(struct ath10k *ar,
+					       u8 fw_log_mode)
+{
+	u8 fw_dbg_mode;
+
+	if (fw_log_mode)
+		fw_dbg_mode = ATH10K_ENABLE_FW_LOG_CE;
+	else
+		fw_dbg_mode = ATH10K_ENABLE_FW_LOG_DIAG;
+
+	return ath10k_qmi_set_fw_log_mode(ar, fw_dbg_mode);
+}
+
 static const struct ath10k_hif_ops ath10k_snoc_hif_ops = {
 	.read32		= ath10k_snoc_read32,
 	.write32	= ath10k_snoc_write32,
@@ -1055,6 +1068,7 @@ static const struct ath10k_hif_ops ath10k_snoc_hif_ops = {
 	.send_complete_check	= ath10k_snoc_hif_send_complete_check,
 	.get_free_queue_number	= ath10k_snoc_hif_get_free_queue_number,
 	.get_target_info	= ath10k_snoc_hif_get_target_info,
+	.set_target_log_mode    = ath10k_snoc_hif_set_target_log_mode,
 };
 
 static const struct ath10k_bus_ops ath10k_snoc_bus_ops = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
