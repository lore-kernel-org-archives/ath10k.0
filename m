Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W68NE-0001sd-LU
 for ath10k@lists.infradead.org; Thu, 23 Jan 2014 00:42:25 +0000
From: greearb@candelatech.com
Subject: [PATCH 2/2] ath10k:  Support rx-software-crypt mode.
Date: Wed, 22 Jan 2014 16:41:16 -0800
Message-Id: <1390437676-19906-2-git-send-email-greearb@candelatech.com>
In-Reply-To: <1390437676-19906-1-git-send-email-greearb@candelatech.com>
References: <1390437676-19906-1-git-send-email-greearb@candelatech.com>
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
Cc: kvalo@qca.qualcomm.com, Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

With appropriate firmware (probably only CT firmware at this time)
this allows enabling rx-software-crypt mode.  This tells the
firmware to not decrypt any packets received, but do encrypt
(as needed) any packets on transmit.  This is implemented to get
around hardware issues that preclude using two stations to
connect to the same AP while using encryption.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 39 ++++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/mac.c    | 12 ++++++++++
 drivers/net/wireless/ath/ath10k/mac.h    |  2 ++
 drivers/net/wireless/ath/ath10k/txrx.c   | 13 +++++++----
 drivers/net/wireless/ath/ath10k/wmi.c    |  9 +++++++-
 drivers/net/wireless/ath/ath10k/wmi.h    | 15 ++++++++++++
 6 files changed, 80 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 7b0b51f..96542ad 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -21,6 +21,7 @@
 #include "txrx.h"
 #include "debug.h"
 #include "trace.h"
+#include "mac.h"
 
 #include <linux/log2.h>
 
@@ -954,12 +955,42 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 			if (status != HTT_RX_IND_MPDU_STATUS_OK &&
 			    status != HTT_RX_IND_MPDU_STATUS_TKIP_MIC_ERR &&
 			    !htt->ar->monitor_enabled) {
-				ath10k_dbg(ATH10K_DBG_HTT,
-					   "htt rx ignoring frame w/ status %d\n",
-					   status);
+				if (status == HTT_RX_IND_MPDU_STATUS_ERR_DUP) {
+					/* Saw this during some attempts at
+					 * having multiple stations connected
+					 * to same AP.  The CT firmware should
+					 * fix this.
+					 */
+					ath10k_dbg(ATH10K_DBG_HTT,
+						   "htt rx: status DUP\n");
+				} else if (status == HTT_RX_IND_MPDU_STATUS_ERR_INV_PEER) {
+					/* This often happens when in nohwcrypt mode,
+					 * ignore.
+					 */
+					if (ath10k_modparam_nohwcrypt)
+						goto continue_on;
+					ath10k_dbg(ATH10K_DBG_HTT,
+						   "htt rx:  status INVALID_PEER\n");
+				} else if (status == HTT_RX_IND_MPDU_STATUS_ERR_FCS) {
+					/* This is seen when using sw-rx-crypt
+					 * (CT firmware only, other firmware
+					 * will not do sw-rx-crypt at all))
+					 * Ignore this if we are in rx-sw-crypt
+					 * mode.
+					 */
+					if (ath10k_modparam_nohwcrypt)
+						goto continue_on;
+					ath10k_dbg(ATH10K_DBG_HTT,
+						   "htt rx:  status ERR_FCS\n");
+				} else {
+					ath10k_dbg(ATH10K_DBG_HTT,
+						   "htt rx ignoring frame w/ status %d\n",
+						   status);
+				}
 				ath10k_htt_rx_free_msdu_chain(msdu_head);
 				continue;
 			}
+continue_on:
 
 			if (test_bit(ATH10K_CAC_RUNNING, &htt->ar->dev_flags)) {
 				ath10k_warn("htt rx: CAC running\n");
@@ -979,7 +1010,7 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 			info.fcs_err = ath10k_htt_rx_has_fcs_err(msdu_head);
 			info.mic_err = ath10k_htt_rx_has_mic_err(msdu_head);
 
-			if (info.fcs_err)
+			if (info.fcs_err && !ath10k_modparam_nohwcrypt)
 				ath10k_warn("htt rx has FCS err\n");
 
 			if (info.mic_err)
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 7b79ddd..89a52ca 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -19,6 +19,7 @@
 
 #include <net/mac80211.h>
 #include <linux/etherdevice.h>
+#include <linux/module.h>
 
 #include "hif.h"
 #include "core.h"
@@ -27,6 +28,13 @@
 #include "htt.h"
 #include "txrx.h"
 
+/* 0:  Full hardware crypt
+ * 1:  Tx hardware crypt, but expect rx software crypt (use native wifi tx type)
+ */
+int ath10k_modparam_nohwcrypt;
+module_param_named(nohwcrypt, ath10k_modparam_nohwcrypt, int, 0444);
+MODULE_PARM_DESC(nohwcrypt, "Disable hardware rx decrypt feature");
+
 /**********/
 /* Crypto */
 /**********/
@@ -77,6 +85,8 @@ static int ath10k_send_key(struct ath10k_vif *arvif,
 	if (cmd == DISABLE_KEY) {
 		arg.key_cipher = WMI_CIPHER_NONE;
 		arg.key_data = NULL;
+	} else if (ath10k_modparam_nohwcrypt) {
+		key->flags |= IEEE80211_KEY_FLAG_SW_RX_CRYPT;
 	}
 
 	return ath10k_wmi_vdev_install_key(arvif->ar, &arg);
@@ -2792,6 +2802,8 @@ static int ath10k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	mutex_lock(&ar->conf_mutex);
 
+	key->flags &= ~IEEE80211_KEY_FLAG_SW_RX_CRYPT;
+
 	if (sta)
 		peer_addr = sta->addr;
 	else if (arvif->vdev_type == WMI_VDEV_TYPE_STA)
diff --git a/drivers/net/wireless/ath/ath10k/mac.h b/drivers/net/wireless/ath/ath10k/mac.h
index ba10219..66dc604 100644
--- a/drivers/net/wireless/ath/ath10k/mac.h
+++ b/drivers/net/wireless/ath/ath10k/mac.h
@@ -21,6 +21,8 @@
 #include <net/mac80211.h>
 #include "core.h"
 
+extern int ath10k_modparam_nohwcrypt;
+
 struct ath10k_generic_iter {
 	struct ath10k *ar;
 	int ret;
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index fc3a651..4c0bace 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -224,11 +224,14 @@ void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
 	memset(status, 0, sizeof(*status));
 
 	if (info->encrypt_type != HTT_RX_MPDU_ENCRYPT_NONE) {
-		status->flag |= RX_FLAG_DECRYPTED | RX_FLAG_IV_STRIPPED |
-				RX_FLAG_MMIC_STRIPPED;
-		hdr->frame_control = __cpu_to_le16(
-				__le16_to_cpu(hdr->frame_control) &
-				~IEEE80211_FCTL_PROTECTED);
+		if (!ath10k_modparam_nohwcrypt) {
+			status->flag |= (RX_FLAG_DECRYPTED |
+					 RX_FLAG_IV_STRIPPED |
+					 RX_FLAG_MMIC_STRIPPED);
+			hdr->frame_control = __cpu_to_le16(
+					__le16_to_cpu(hdr->frame_control) &
+					~IEEE80211_FCTL_PROTECTED);
+		}
 	}
 
 	if (info->mic_err)
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 3adc4a8..4b8f643 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2586,7 +2586,14 @@ static int ath10k_wmi_10x_cmd_init(struct ath10k *ar)
 	config.rx_timeout_pri_vi = __cpu_to_le32(TARGET_10X_RX_TIMEOUT_LO_PRI);
 	config.rx_timeout_pri_be = __cpu_to_le32(TARGET_10X_RX_TIMEOUT_LO_PRI);
 	config.rx_timeout_pri_bk = __cpu_to_le32(TARGET_10X_RX_TIMEOUT_HI_PRI);
-	config.rx_decap_mode = __cpu_to_le32(TARGET_10X_RX_DECAP_MODE);
+	if (ath10k_modparam_nohwcrypt)
+		/* This will disable rx decryption in hardware, enable raw
+		 * rx mode, and native-wifi tx mode.  Requires 'CT' firmware.
+		 */
+		config.rx_decap_mode = __cpu_to_le32(ATH10K_HW_TXRX_RAW |
+						     ATH10k_USE_SW_RX_CRYPT);
+	else
+		config.rx_decap_mode = __cpu_to_le32(TARGET_10X_RX_DECAP_MODE);
 
 	config.scan_max_pending_reqs =
 		__cpu_to_le32(TARGET_10X_SCAN_MAX_PENDING_REQS);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 4b5e7d3..0f856d0 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -1447,7 +1447,22 @@ struct wmi_resource_config_10x {
 	 *   MAC can decap to RAW (no decap), native wifi or Ethernet types
 	 *   THis setting also determines the default TX behavior, however TX
 	 *   behavior can be modified on a per VAP basis during VAP init
+	 *
+	 *  NOTE:  Stealing some of this field for flags, only usable when
+	 *         running "CT" firmware.
+	 *   first byte: rx_decap_mode
+	 *   second byte:  reserved
+	 */
+	#define ATH10K_RX_DECAP_MODE_MASK 0xff
+	/*  Use software rx crypt.  This disables rx checksumming
+	 *  and may turn off some firmware/hardware optimizations for
+	 *  normal use case.  BUT, it does allow us to run multiple
+	 *  stations connected to the same AP.  This flag causes
+	 *  rx encapsulation to be 'raw', and tx mode to be native-wifi.
+	 *  You should probably not enable this unless you need to
+	 *  connect multiple stations to same AP.
 	 */
+	#define ATH10k_USE_SW_RX_CRYPT 0x10000
 	__le32 rx_decap_mode;
 
 	/* what is the maximum scan requests than can be queued */
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
