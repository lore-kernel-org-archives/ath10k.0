Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1vyE-0005aO-CD
 for ath10k@lists.infradead.org; Mon, 08 Jun 2015 12:16:03 +0000
Received: by wgez8 with SMTP id z8so101685447wge.0
 for <ath10k@lists.infradead.org>; Mon, 08 Jun 2015 05:15:40 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/2] ath10k: dump fw features during probing
Date: Mon,  8 Jun 2015 14:15:33 +0200
Message-Id: <1433765734-646-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

This should help when analysing problems from
users and spot fw api blob problems easier.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c  | 45 +++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/core.h  |  3 +++
 drivers/net/wireless/ath/ath10k/debug.c |  9 +++++--
 3 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 59496a90ad5e..efc648a973d0 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -103,6 +103,51 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 	},
 };
 
+static const char *const ath10k_core_fw_feature_str[] = {
+	[ATH10K_FW_FEATURE_EXT_WMI_MGMT_RX] = "wmi-mgmt-rx",
+	[ATH10K_FW_FEATURE_WMI_10X] = "wmi-10.x",
+	[ATH10K_FW_FEATURE_HAS_WMI_MGMT_TX] = "has-wmi-mgmt-tx",
+	[ATH10K_FW_FEATURE_NO_P2P] = "no-p2p",
+	[ATH10K_FW_FEATURE_WMI_10_2] = "wmi-10.2",
+	[ATH10K_FW_FEATURE_MULTI_VIF_PS_SUPPORT] = "multi-vif-ps",
+	[ATH10K_FW_FEATURE_WOWLAN_SUPPORT] = "wowlan",
+	[ATH10K_FW_FEATURE_IGNORE_OTP_RESULT] = "ignore-otp",
+	[ATH10K_FW_FEATURE_NO_NWIFI_DECAP_4ADDR_PADDING] = "no-4addr-pad",
+	[ATH10K_FW_FEATURE_SUPPORTS_SKIP_CLOCK_INIT] = "skip-clock-init",
+};
+
+static unsigned int ath10k_core_get_fw_feature_str(char *buf,
+						   size_t buf_len,
+						   enum ath10k_fw_features feat)
+{
+	if (feat >= ARRAY_SIZE(ath10k_core_fw_feature_str) ||
+	    WARN_ON(!ath10k_core_fw_feature_str[feat])) {
+		return scnprintf(buf, buf_len, "bit%d", feat);
+	} else {
+		return scnprintf(buf, buf_len, "%s",
+				 ath10k_core_fw_feature_str[feat]);
+	}
+}
+
+void ath10k_core_get_fw_features_str(struct ath10k *ar,
+				     char *buf,
+				     size_t buf_len)
+{
+	unsigned int len = 0;
+	int i;
+
+	for (i = 0; i < ATH10K_FW_FEATURE_COUNT; i++) {
+		if (test_bit(i, ar->fw_features)) {
+			if (len > 0)
+				len += scnprintf(buf + len, buf_len - len, ",");
+
+			len += ath10k_core_get_fw_feature_str(buf + len,
+							      buf_len - len,
+							      i);
+		}
+	}
+}
+
 static void ath10k_send_suspend_complete(struct ath10k *ar)
 {
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot suspend complete\n");
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 45f9603a0868..74a6b6883ce5 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -758,6 +758,9 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 				  enum ath10k_hw_rev hw_rev,
 				  const struct ath10k_hif_ops *hif_ops);
 void ath10k_core_destroy(struct ath10k *ar);
+void ath10k_core_get_fw_features_str(struct ath10k *ar,
+				     char *buf,
+				     size_t max_len);
 
 int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode);
 int ath10k_wait_for_suspend(struct ath10k *ar, u32 suspend_opt);
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 8fa606a9c4dd..8a4edfd36e47 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -124,7 +124,11 @@ EXPORT_SYMBOL(ath10k_info);
 
 void ath10k_print_driver_info(struct ath10k *ar)
 {
-	ath10k_info(ar, "%s (0x%08x, 0x%08x%s%s%s) fw %s api %d htt %d.%d wmi %d cal %s max_sta %d\n",
+	char fw_features[128];
+
+	ath10k_core_get_fw_features_str(ar, fw_features, sizeof(fw_features));
+
+	ath10k_info(ar, "%s (0x%08x, 0x%08x%s%s%s) fw %s api %d htt %d.%d wmi %d cal %s max_sta %d features %s\n",
 		    ar->hw_params.name,
 		    ar->target_version,
 		    ar->chip_id,
@@ -138,7 +142,8 @@ void ath10k_print_driver_info(struct ath10k *ar)
 		    ar->htt.target_version_minor,
 		    ar->wmi.op_version,
 		    ath10k_cal_mode_str(ar->cal_mode),
-		    ar->max_num_stations);
+		    ar->max_num_stations,
+		    fw_features);
 	ath10k_info(ar, "debug %d debugfs %d tracing %d dfs %d testmode %d\n",
 		    config_enabled(CONFIG_ATH10K_DEBUG),
 		    config_enabled(CONFIG_ATH10K_DEBUGFS),
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
