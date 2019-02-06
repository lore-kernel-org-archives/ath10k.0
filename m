Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grI6Q-0005LF-0K
 for ath10k@lists.infradead.org; Wed, 06 Feb 2019 07:58:39 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH] ath10k: Add support to configure ftm responder role
Date: Wed,  6 Feb 2019 13:28:30 +0530
Message-Id: <1549439910-9315-1-git-send-email-pradeepc@codeaurora.org>
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org

Configure fine timing measurement (FTM) responder role from the
ftm_responder bss param sent by mac80211. With FTM functionality offloaded
to firmware, adding the interface allows userspace to enable or disable
FTM responder functionality. ath10k disables it at the time of interface
creation.

Supported FW: 10.4

Tested on IPQ4019 with firmware: 10.4-3.2.1.1-00022

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.h |  1 +
 drivers/net/wireless/ath/ath10k/mac.c  | 29 +++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c  |  4 ++++
 drivers/net/wireless/ath/ath10k/wmi.h  | 22 ++++++++++++++++++++++
 4 files changed, 56 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 042418097cf9..7ad2a3a06b9f 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -569,6 +569,7 @@ struct ath10k_vif {
 	bool nohwcrypt;
 	int num_legacy_stations;
 	int txpower;
+	bool ftm_responder;
 	struct wmi_wmm_params_all_arg wmm_params;
 	struct work_struct ap_csa_work;
 	struct delayed_work connection_loss_work;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a1c2801ded10..6771d8185af5 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5283,6 +5283,17 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		goto err_peer_delete;
 	}
 
+	if (test_bit(WMI_SERVICE_RTT_RESPONDER_ROLE, ar->wmi.svc_map)) {
+		vdev_param = ar->wmi.vdev_param->rtt_responder_role;
+		ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
+						arvif->ftm_responder);
+
+		/* It is harmless to not set FTM role. Do not warn */
+		if (ret && ret != -EOPNOTSUPP)
+			ath10k_warn(ar, "failed to set vdev %i FTM Responder: %d\n",
+				    arvif->vdev_id, ret);
+	}
+
 	if (vif->type == NL80211_IFTYPE_MONITOR) {
 		ar->monitor_arvif = arvif;
 		ret = ath10k_monitor_recalc(ar);
@@ -5557,6 +5568,20 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 	if (changed & BSS_CHANGED_BSSID && !is_zero_ether_addr(info->bssid))
 		ether_addr_copy(arvif->bssid, info->bssid);
 
+	if (changed & BSS_CHANGED_FTM_RESPONDER &&
+	    arvif->ftm_responder != info->ftm_responder &&
+	    test_bit(WMI_SERVICE_RTT_RESPONDER_ROLE, ar->wmi.svc_map)) {
+		arvif->ftm_responder = info->ftm_responder;
+
+		vdev_param = ar->wmi.vdev_param->rtt_responder_role;
+		ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
+						arvif->ftm_responder);
+
+		ath10k_dbg(ar, ATH10K_DBG_MAC,
+			   "mac vdev %d ftm_responder %d:ret %d\n",
+			   arvif->vdev_id, arvif->ftm_responder, ret);
+	}
+
 	if (changed & BSS_CHANGED_BEACON_ENABLED)
 		ath10k_control_beaconing(arvif, info);
 
@@ -8578,6 +8603,10 @@ int ath10k_mac_register(struct ath10k *ar)
 		wiphy_ext_feature_set(ar->hw->wiphy,
 				      NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT);
 
+	if (test_bit(WMI_SERVICE_RTT_RESPONDER_ROLE, ar->wmi.svc_map))
+		wiphy_ext_feature_set(ar->hw->wiphy,
+				      NL80211_EXT_FEATURE_ENABLE_FTM_RESPONDER);
+
 	/*
 	 * on LL hardware queues are managed entirely by the FW
 	 * so we only advertise to mac we can do the queues thing
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 25e8fa789e8d..649b27976f0b 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -825,6 +825,7 @@
 	.meru_vc = WMI_VDEV_PARAM_UNSUPPORTED,
 	.rx_decap_type = WMI_VDEV_PARAM_UNSUPPORTED,
 	.bw_nss_ratemask = WMI_VDEV_PARAM_UNSUPPORTED,
+	.rtt_responder_role = WMI_VDEV_PARAM_UNSUPPORTED,
 };
 
 /* 10.X WMI VDEV param map */
@@ -900,6 +901,7 @@
 	.meru_vc = WMI_VDEV_PARAM_UNSUPPORTED,
 	.rx_decap_type = WMI_VDEV_PARAM_UNSUPPORTED,
 	.bw_nss_ratemask = WMI_VDEV_PARAM_UNSUPPORTED,
+	.rtt_responder_role = WMI_VDEV_PARAM_UNSUPPORTED,
 };
 
 static struct wmi_vdev_param_map wmi_10_2_4_vdev_param_map = {
@@ -974,6 +976,7 @@
 	.meru_vc = WMI_VDEV_PARAM_UNSUPPORTED,
 	.rx_decap_type = WMI_VDEV_PARAM_UNSUPPORTED,
 	.bw_nss_ratemask = WMI_VDEV_PARAM_UNSUPPORTED,
+	.rtt_responder_role = WMI_VDEV_PARAM_UNSUPPORTED,
 };
 
 static struct wmi_vdev_param_map wmi_10_4_vdev_param_map = {
@@ -1051,6 +1054,7 @@
 	.bw_nss_ratemask = WMI_10_4_VDEV_PARAM_BW_NSS_RATEMASK,
 	.inc_tsf = WMI_10_4_VDEV_PARAM_TSF_INCREMENT,
 	.dec_tsf = WMI_10_4_VDEV_PARAM_TSF_DECREMENT,
+	.rtt_responder_role = WMI_10_4_VDEV_PARAM_ENABLE_DISABLE_RTT_RESPONDER_ROLE,
 };
 
 static struct wmi_pdev_param_map wmi_pdev_param_map = {
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index f7badd079051..527d3a7647a3 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -205,6 +205,7 @@ enum wmi_service {
 	WMI_SERVICE_SPOOF_MAC_SUPPORT,
 	WMI_SERVICE_TX_DATA_ACK_RSSI,
 	WMI_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT,
+	WMI_SERVICE_RTT_RESPONDER_ROLE,
 
 	/* keep last */
 	WMI_SERVICE_MAX,
@@ -359,6 +360,13 @@ enum wmi_10_4_service {
 	WMI_10_4_SERVICE_PEER_TID_CONFIGS_SUPPORT,
 	WMI_10_4_SERVICE_VDEV_BCN_RATE_CONTROL,
 	WMI_10_4_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT,
+	WMI_10_4_SERVICE_HTT_ASSERT_TRIGGER_SUPPORT,
+	WMI_10_4_SERVICE_VDEV_FILTER_NEIGHBOR_RX_PACKETS,
+	WMI_10_4_SERVICE_VDEV_DISABLE_4_ADDR_SRC_LRN_SUPPORT,
+	WMI_10_4_SERVICE_PEER_CHWIDTH_CHANGE,
+	WMI_10_4_SERVICE_RX_FILTER_OUT_COUNT,
+	WMI_10_4_SERVICE_RTT_RESPONDER_ROLE,
+	WMI_10_4_SERVICE_EXT_PEER_TID_CONFIGS_SUPPORT,
 };
 
 static inline char *wmi_service_name(int service_id)
@@ -474,6 +482,8 @@ static inline char *wmi_service_name(int service_id)
 	SVCSTR(WMI_SERVICE_RESET_CHIP);
 	SVCSTR(WMI_SERVICE_TX_DATA_ACK_RSSI);
 	SVCSTR(WMI_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT);
+	SVCSTR(WMI_SERVICE_RTT_RESPONDER_ROLE);
+
 	default:
 		return NULL;
 	}
@@ -786,6 +796,8 @@ static inline void wmi_10_4_svc_map(const __le32 *in, unsigned long *out,
 	       WMI_SERVICE_TX_DATA_ACK_RSSI, len);
 	SVCMAP(WMI_10_4_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT,
 	       WMI_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT, len);
+	SVCMAP(WMI_10_4_SERVICE_RTT_RESPONDER_ROLE,
+	       WMI_SERVICE_RTT_RESPONDER_ROLE, len);
 }
 
 #undef SVCMAP
@@ -5064,6 +5076,7 @@ struct wmi_vdev_param_map {
 	u32 bw_nss_ratemask;
 	u32 inc_tsf;
 	u32 dec_tsf;
+	u32 rtt_responder_role;
 };
 
 #define WMI_VDEV_PARAM_UNSUPPORTED 0
@@ -5403,6 +5416,15 @@ enum wmi_10_4_vdev_param {
 	WMI_10_4_VDEV_PARAM_ATF_SSID_SCHED_POLICY,
 	WMI_10_4_VDEV_PARAM_DISABLE_DYN_BW_RTS,
 	WMI_10_4_VDEV_PARAM_TSF_DECREMENT,
+	WMI_10_4_VDEV_PARAM_SELFGEN_FIXED_RATE,
+	WMI_10_4_VDEV_PARAM_AMPDU_SUBFRAME_SIZE_PER_AC,
+	WMI_10_4_VDEV_PARAM_NSS_VHT160,
+	WMI_10_4_VDEV_PARAM_NSS_VHT80_80,
+	WMI_10_4_VDEV_PARAM_AMSDU_SUBFRAME_SIZE_PER_AC,
+	WMI_10_4_VDEV_PARAM_DISABLE_CABQ,
+	WMI_10_4_VDEV_PARAM_SIFS_TRIGGER_RATE,
+	WMI_10_4_VDEV_PARAM_TX_POWER,
+	WMI_10_4_VDEV_PARAM_ENABLE_DISABLE_RTT_RESPONDER_ROLE,
 };
 
 #define WMI_VDEV_PARAM_TXBF_SU_TX_BFEE BIT(0)
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
