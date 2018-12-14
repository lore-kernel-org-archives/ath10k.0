Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXkXj-0003IA-BJ
 for ath10k@lists.infradead.org; Fri, 14 Dec 2018 10:18:04 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v2] ath10k: skip sending quiet mode cmd for WCN3990
Date: Fri, 14 Dec 2018 12:17:46 +0200
Message-Id: <1544782666-24837-1-git-send-email-kvalo@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

From: Rakesh Pillai <pillair@codeaurora.org>

HL2.0 firmware does not support setting quiet mode.  If the host driver sends
the quiet mode setting command to the HL2.0 firmware, it crashes with the below
signature.

fatal error received: err_qdi.c:456:EX:wlan_process:1:WLAN RT:207a:PC=b001b4f0

The quiet mode command support is exposed by the firmware via thermal throttle
wmi service. Enable ath10k thermal support if thermal throttle wmi service bit
is set.  10.x firmware versions support this feature by default, but
unfortunately do not advertise the support via service flags, hence have to
manually set the service flag in ath10k_core_compat_services().

Compile tested only.

Co-developed-by: Govind Singh <govinds@codeaurora.org>
Co-developed-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
Signed-off-by: Govind Singh <govinds@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---

v2:

* refactor service bit set to ath10k_core_compat_services() and check for
  wmi_op_version

* do service check in thermal.c


 drivers/net/wireless/ath/ath10k/core.c    | 28 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/debug.c   |  5 +++--
 drivers/net/wireless/ath/ath10k/thermal.c |  9 +++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  3 +++
 drivers/net/wireless/ath/ath10k/wmi.h     |  1 +
 5 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 22cbe9a2e646..399b501f3c3c 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2422,6 +2422,28 @@ static int ath10k_core_reset_rx_filter(struct ath10k *ar)
 	return 0;
 }
 
+static int ath10k_core_compat_services(struct ath10k *ar)
+{
+	struct ath10k_fw_file *fw_file = &ar->normal_mode_fw.fw_file;
+
+	/* all 10.x firmware versions support thermal throttling but don't
+	 * advertise the support via service flags so we have to hardcode
+	 * it here
+	 */
+	switch (fw_file->wmi_op_version) {
+	case ATH10K_FW_WMI_OP_VERSION_10_1:
+	case ATH10K_FW_WMI_OP_VERSION_10_2:
+	case ATH10K_FW_WMI_OP_VERSION_10_2_4:
+	case ATH10K_FW_WMI_OP_VERSION_10_4:
+		set_bit(WMI_SERVICE_THERM_THROT, ar->wmi.svc_map);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 		      const struct ath10k_fw_components *fw)
 {
@@ -2621,6 +2643,12 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 		goto err_hif_stop;
 	}
 
+	status = ath10k_core_compat_services(ar);
+	if (status) {
+		ath10k_err(ar, "compat services failed: %d\n", status);
+		goto err_hif_stop;
+	}
+
 	/* Some firmware revisions do not properly set up hardware rx filter
 	 * registers.
 	 *
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 15964b374f68..02988fc378a1 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -2578,8 +2578,9 @@ int ath10k_debug_register(struct ath10k *ar)
 	debugfs_create_file("pktlog_filter", 0644, ar->debug.debugfs_phy, ar,
 			    &fops_pktlog_filter);
 
-	debugfs_create_file("quiet_period", 0644, ar->debug.debugfs_phy, ar,
-			    &fops_quiet_period);
+	if (test_bit(WMI_SERVICE_THERM_THROT, ar->wmi.svc_map))
+		debugfs_create_file("quiet_period", 0644, ar->debug.debugfs_phy, ar,
+				    &fops_quiet_period);
 
 	debugfs_create_file("tpc_stats", 0400, ar->debug.debugfs_phy, ar,
 			    &fops_tpc_stats);
diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index aa8978a8d751..fe35edcd3ec8 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -140,6 +140,9 @@ void ath10k_thermal_set_throttling(struct ath10k *ar)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	if (!test_bit(WMI_SERVICE_THERM_THROT, ar->wmi.svc_map))
+		return;
+
 	if (!ar->wmi.ops->gen_pdev_set_quiet_mode)
 		return;
 
@@ -165,6 +168,9 @@ int ath10k_thermal_register(struct ath10k *ar)
 	struct device *hwmon_dev;
 	int ret;
 
+	if (!test_bit(WMI_SERVICE_THERM_THROT, ar->wmi.svc_map))
+		return 0;
+
 	cdev = thermal_cooling_device_register("ath10k_thermal", ar,
 					       &ath10k_thermal_ops);
 
@@ -216,6 +222,9 @@ int ath10k_thermal_register(struct ath10k *ar)
 
 void ath10k_thermal_unregister(struct ath10k *ar)
 {
+	if (!test_bit(WMI_SERVICE_THERM_THROT, ar->wmi.svc_map))
+		return;
+
 	sysfs_remove_link(&ar->dev->kobj, "cooling_device");
 	thermal_cooling_device_unregister(ar->thermal.cdev);
 }
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index bf8a4320c39c..e07e9907e355 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1564,6 +1564,9 @@ wmi_tlv_svc_map_ext(const __le32 *in, unsigned long *out, size_t len)
 	SVCMAP(WMI_TLV_SERVICE_SPOOF_MAC_SUPPORT,
 	       WMI_SERVICE_SPOOF_MAC_SUPPORT,
 	       WMI_TLV_MAX_SERVICE);
+	SVCMAP(WMI_TLV_SERVICE_THERM_THROT,
+	       WMI_SERVICE_THERM_THROT,
+	       WMI_TLV_MAX_SERVICE);
 }
 
 #undef SVCMAP
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 58e33ab9e0e9..66222eeaba4c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -205,6 +205,7 @@ enum wmi_service {
 	WMI_SERVICE_SPOOF_MAC_SUPPORT,
 	WMI_SERVICE_TX_DATA_ACK_RSSI,
 	WMI_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT,
+	WMI_SERVICE_THERM_THROT,
 
 	/* keep last */
 	WMI_SERVICE_MAX,
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
