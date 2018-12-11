Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWalK-00085I-G3
 for ath10k@lists.infradead.org; Tue, 11 Dec 2018 05:39:20 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH] ath10k: Skip sending quiet mode cmd for WCN3990
Date: Tue, 11 Dec 2018 11:08:53 +0530
Message-Id: <20181211053853.3557-1-govinds@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

From: Rakesh Pillai <pillair@codeaurora.org>

HL2.0 firmware does not support setting quiet mode.
If the host driver sends the quiet mode setting
command to the HL2.0 firmware, it crashes with the
below signature.

fatal error received: err_qdi.c:456:EX:wlan_process:1:WLAN RT:207a:PC=b001b4f0

The quiet mode command support is exposed by the firmware
via thermal throttle wmi service. Enable ath10k thermal
support if thermal throttle wmi service bit is set.
10X firmware version supports this feature by default, hence
set this service bit by default.

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1

Co-developed-by: Govind Singh <govinds@codeaurora.org>
Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c    | 19 +++++++++++++------
 drivers/net/wireless/ath/ath10k/debug.c   |  5 +++--
 drivers/net/wireless/ath/ath10k/mac.c     |  3 ++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  3 +++
 drivers/net/wireless/ath/ath10k/wmi.h     |  1 +
 5 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 22cbe9a2e646..2bdb632b7b1a 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2621,6 +2621,10 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 		goto err_hif_stop;
 	}
 
+	if (test_bit(ATH10K_FW_FEATURE_WMI_10X,
+		     ar->normal_mode_fw.fw_file.fw_features)) {
+		set_bit(WMI_SERVICE_THERM_THROT, ar->wmi.svc_map);
+	}
 	/* Some firmware revisions do not properly set up hardware rx filter
 	 * registers.
 	 *
@@ -2919,11 +2923,13 @@ static void ath10k_core_register_work(struct work_struct *work)
 		goto err_debug_destroy;
 	}
 
-	status = ath10k_thermal_register(ar);
-	if (status) {
-		ath10k_err(ar, "could not register thermal device: %d\n",
-			   status);
-		goto err_spectral_destroy;
+	if (test_bit(WMI_SERVICE_THERM_THROT, ar->wmi.svc_map)) {
+		status = ath10k_thermal_register(ar);
+		if (status) {
+			ath10k_err(ar, "could not register thermal device: %d\n",
+				   status);
+			goto err_spectral_destroy;
+		}
 	}
 
 	set_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags);
@@ -2964,7 +2970,8 @@ void ath10k_core_unregister(struct ath10k *ar)
 	if (!test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags))
 		return;
 
-	ath10k_thermal_unregister(ar);
+	if (test_bit(WMI_SERVICE_THERM_THROT, ar->wmi.svc_map))
+		ath10k_thermal_unregister(ar);
 	/* Stop spectral before unregistering from mac80211 to remove the
 	 * relayfs debugfs file cleanly. Otherwise the parent debugfs tree
 	 * would be already be free'd recursively, leading to a double free.
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
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index c5130fa264eb..b8a5ec40b949 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4800,7 +4800,8 @@ static int ath10k_start(struct ieee80211_hw *hw)
 	ath10k_regd_update(ar);
 
 	ath10k_spectral_start(ar);
-	ath10k_thermal_set_throttling(ar);
+	if (test_bit(WMI_SERVICE_THERM_THROT, ar->wmi.svc_map))
+		ath10k_thermal_set_throttling(ar);
 
 	ar->radar_conf_state = ATH10K_RADAR_CONFIRMATION_IDLE;
 
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
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
