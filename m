Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZQzqW-0007tr-7O
 for ath10k@lists.infradead.org; Sun, 16 Aug 2015 15:27:40 +0000
Received: by igfj19 with SMTP id j19so41468627igf.0
 for <ath10k@lists.infradead.org>; Sun, 16 Aug 2015 08:26:30 -0700 (PDT)
Received: from hash ([2001:470:1d:6db:230:48ff:fe9d:9c89])
 by smtp.gmail.com with ESMTPSA id 102sm10607406iol.30.2015.08.16.08.26.30
 for <ath10k@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 16 Aug 2015 08:26:30 -0700 (PDT)
From: Bob Copeland <me@bobcopeland.com>
Subject: [PATCH 3/3] ath10k: implement mesh support
Date: Sun, 16 Aug 2015 11:25:57 -0400
Message-Id: <1439738757-29199-4-git-send-email-me@bobcopeland.com>
In-Reply-To: <1439738757-29199-1-git-send-email-me@bobcopeland.com>
References: <1439738757-29199-1-git-send-email-me@bobcopeland.com>
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
Cc: Bob Copeland <me@bobcopeland.com>

Add support for mesh to ath10k.  We simply use an AP virtual
interface in the firmware in order to enable beaconing
without TSF adoption, and use the raw (802.11) transmit mode.

Due to firmware limitations, the firmware must operate in raw
(non-native 802.11) mode.  As this is configured at firmware init
time, a new "rawmode" modparam is added, and mesh interfaces
are available only if rawmode=true.

Signed-off-by: Bob Copeland <me@bobcopeland.com>
---
 drivers/net/wireless/ath/ath10k/core.c |  6 ++++++
 drivers/net/wireless/ath/ath10k/mac.c  | 33 ++++++++++++++++++++++++++++-----
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2551067..e176bb4 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -34,16 +34,19 @@ unsigned int ath10k_debug_mask;
 static unsigned int ath10k_cryptmode_param;
 static bool uart_print;
 static bool skip_otp;
+static bool rawmode;
 
 module_param_named(debug_mask, ath10k_debug_mask, uint, 0644);
 module_param_named(cryptmode, ath10k_cryptmode_param, uint, 0644);
 module_param(uart_print, bool, 0644);
 module_param(skip_otp, bool, 0644);
+module_param(rawmode, bool, 0644);
 
 MODULE_PARM_DESC(debug_mask, "Debugging mask");
 MODULE_PARM_DESC(uart_print, "Uart target debugging");
 MODULE_PARM_DESC(skip_otp, "Skip otp failure for calibration in testmode");
 MODULE_PARM_DESC(cryptmode, "Crypto mode: 0-hardware, 1-software");
+MODULE_PARM_DESC(rawmode, "Use raw 802.11 frame datapath");
 
 static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 	{
@@ -1101,6 +1104,9 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 	ar->htt.max_num_amsdu = ATH10K_HTT_MAX_NUM_AMSDU_DEFAULT;
 	ar->htt.max_num_ampdu = ATH10K_HTT_MAX_NUM_AMPDU_DEFAULT;
 
+	if (rawmode)
+		set_bit(ATH10K_FLAG_RAW_MODE, &ar->dev_flags);
+
 	if (test_bit(ATH10K_FLAG_RAW_MODE, &ar->dev_flags)) {
 		ar->wmi.rx_decap_mode = ATH10K_HW_TXRX_RAW;
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5c85896..72b0589 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4153,6 +4153,14 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	case NL80211_IFTYPE_ADHOC:
 		arvif->vdev_type = WMI_VDEV_TYPE_IBSS;
 		break;
+	case NL80211_IFTYPE_MESH_POINT:
+		if (!test_bit(ATH10K_FLAG_RAW_MODE, &ar->dev_flags)) {
+			ret = -EINVAL;
+			ath10k_warn(ar, "must load driver with rawmode=1 to add mesh interfaces\n");
+			goto err;
+		}
+		arvif->vdev_type = WMI_VDEV_TYPE_AP;
+		break;
 	case NL80211_IFTYPE_AP:
 		arvif->vdev_type = WMI_VDEV_TYPE_AP;
 
@@ -4193,6 +4201,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	 * become corrupted, e.g. have garbled IEs or out-of-date TIM bitmap.
 	 */
 	if (vif->type == NL80211_IFTYPE_ADHOC ||
+	    vif->type == NL80211_IFTYPE_MESH_POINT ||
 	    vif->type == NL80211_IFTYPE_AP) {
 		arvif->beacon_buf = dma_zalloc_coherent(ar->dev,
 							IEEE80211_MAX_FRAME_LEN,
@@ -4527,6 +4536,13 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 		if (ret)
 			ath10k_warn(ar, "failed to update beacon template: %d\n",
 				    ret);
+
+		if (ieee80211_vif_is_mesh(vif)) {
+			/* mesh doesn't use SSID but firmware needs it */
+			strncpy(arvif->u.ap.ssid, "mesh",
+				sizeof(arvif->u.ap.ssid));
+			arvif->u.ap.ssid_len = 4;
+		}
 	}
 
 	if (changed & BSS_CHANGED_AP_PROBE_RESP) {
@@ -5266,6 +5282,7 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 	} else if (old_state == IEEE80211_STA_AUTH &&
 		   new_state == IEEE80211_STA_ASSOC &&
 		   (vif->type == NL80211_IFTYPE_AP ||
+		    vif->type == NL80211_IFTYPE_MESH_POINT ||
 		    vif->type == NL80211_IFTYPE_ADHOC)) {
 		/*
 		 * New association.
@@ -5301,6 +5318,7 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 	} else if (old_state == IEEE80211_STA_ASSOC &&
 		    new_state == IEEE80211_STA_AUTH &&
 		    (vif->type == NL80211_IFTYPE_AP ||
+		     vif->type == NL80211_IFTYPE_MESH_POINT ||
 		     vif->type == NL80211_IFTYPE_ADHOC)) {
 		/*
 		 * Disassociation.
@@ -6614,14 +6632,16 @@ static const struct ieee80211_iface_limit ath10k_if_limits[] = {
 	},
 	{
 	.max	= 7,
-	.types	= BIT(NL80211_IFTYPE_AP)
+	.types	= BIT(NL80211_IFTYPE_AP) |
+		  BIT(NL80211_IFTYPE_MESH_POINT)
 	},
 };
 
 static const struct ieee80211_iface_limit ath10k_10x_if_limits[] = {
 	{
 	.max	= 8,
-	.types	= BIT(NL80211_IFTYPE_AP)
+	.types	= BIT(NL80211_IFTYPE_AP) |
+		  BIT(NL80211_IFTYPE_MESH_POINT)
 	},
 };
 
@@ -6660,7 +6680,8 @@ static const struct ieee80211_iface_limit ath10k_tlv_if_limit[] = {
 		.max = 2,
 		.types = BIT(NL80211_IFTYPE_AP) |
 			 BIT(NL80211_IFTYPE_P2P_CLIENT) |
-			 BIT(NL80211_IFTYPE_P2P_GO),
+			 BIT(NL80211_IFTYPE_P2P_GO) |
+			 BIT(NL80211_IFTYPE_MESH_POINT)
 	},
 	{
 		.max = 1,
@@ -6680,7 +6701,8 @@ static const struct ieee80211_iface_limit ath10k_tlv_qcs_if_limit[] = {
 	{
 		.max = 1,
 		.types = BIT(NL80211_IFTYPE_AP) |
-			 BIT(NL80211_IFTYPE_P2P_GO),
+			 BIT(NL80211_IFTYPE_P2P_GO) |
+			 BIT(NL80211_IFTYPE_MESH_POINT),
 	},
 	{
 		.max = 1,
@@ -6970,7 +6992,8 @@ int ath10k_mac_register(struct ath10k *ar)
 
 	ar->hw->wiphy->interface_modes =
 		BIT(NL80211_IFTYPE_STATION) |
-		BIT(NL80211_IFTYPE_AP);
+		BIT(NL80211_IFTYPE_AP) |
+		BIT(NL80211_IFTYPE_MESH_POINT);
 
 	ar->hw->wiphy->available_antennas_rx = ar->supp_rx_chainmask;
 	ar->hw->wiphy->available_antennas_tx = ar->supp_tx_chainmask;
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
