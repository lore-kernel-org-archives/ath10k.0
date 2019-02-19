Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvybF-0000Cz-JJ
 for ath10k@lists.infradead.org; Tue, 19 Feb 2019 06:09:51 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] ath10k: Add peer param map for tlv and non-tlv
Date: Tue, 19 Feb 2019 11:39:36 +0530
Message-Id: <1550556576-19803-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org

The peer param id for PEER_PARAM_USE_FIXED_PWR
is different for tlv and non-tlv firmware. This
causes incorrect peer param to be set by the driver
to the firmware(tlv/non-tlv).

Create seperate peer param map for tlv and non-tlv
firmware and attach the peer param id based on the
firmware type during the init.

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
This change is dependent on the below patchset
ath10k: add support for controlling tx power to a station (https://patchwork.kernel.org/patch/9562405/)
---
 drivers/net/wireless/ath/ath10k/core.h        |  1 +
 drivers/net/wireless/ath/ath10k/debugfs_sta.c |  2 +-
 drivers/net/wireless/ath/ath10k/mac.c         | 16 ++++++++--------
 drivers/net/wireless/ath/ath10k/wmi-tlv.c     | 19 +++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h     | 18 ++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c         | 18 ++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h         | 19 +++++++++++++++++++
 7 files changed, 84 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 2f43600..5be2d5d 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -180,6 +180,7 @@ struct ath10k_wmi {
 	struct wmi_cmd_map *cmd;
 	struct wmi_vdev_param_map *vdev_param;
 	struct wmi_pdev_param_map *pdev_param;
+	struct wmi_peer_param_map *peer_param;
 	const struct wmi_ops *ops;
 	const struct wmi_peer_flags_map *peer_flags;
 
diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
index 4778a45..a887f71 100644
--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -441,7 +441,7 @@ ath10k_dbg_sta_write_peer_debug_trigger(struct file *file,
 	}
 
 	ret = ath10k_wmi_peer_set_param(ar, arsta->arvif->vdev_id, sta->addr,
-					WMI_PEER_DEBUG, peer_debug_trigger);
+					ar->wmi.peer_param->debug, peer_debug_trigger);
 	if (ret) {
 		ath10k_warn(ar, "failed to set param to trigger peer tid logs for station ret: %d\n",
 			    ret);
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index bce2698..dece2b0 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2744,7 +2744,7 @@ static int ath10k_setup_peer_smps(struct ath10k *ar, struct ath10k_vif *arvif,
 		return -EINVAL;
 
 	return ath10k_wmi_peer_set_param(ar, arvif->vdev_id, addr,
-					 WMI_PEER_SMPS_STATE,
+					 ar->wmi.peer_param->smps_state,
 					 ath10k_smps_map[smps]);
 }
 
@@ -2901,7 +2901,7 @@ static void ath10k_bss_assoc(struct ieee80211_hw *hw,
 	 * poked with peer param command.
 	 */
 	ret = ath10k_wmi_peer_set_param(ar, arvif->vdev_id, arvif->bssid,
-					WMI_PEER_DUMMY_VAR, 1);
+					ar->wmi.peer_param->dummy_var, 1);
 	if (ret) {
 		ath10k_warn(ar, "failed to poke peer %pM param for ps workaround on vdev %i: %d\n",
 			    arvif->bssid, arvif->vdev_id, ret);
@@ -6189,7 +6189,7 @@ static int ath10k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	if (sta && sta->tdls)
 		ath10k_wmi_peer_set_param(ar, arvif->vdev_id, sta->addr,
-					  WMI_PEER_AUTHORIZE, 1);
+					  ar->wmi.peer_param->authorize, 1);
 
 exit:
 	mutex_unlock(&ar->conf_mutex);
@@ -6280,7 +6280,7 @@ static void ath10k_sta_rc_update_wk(struct work_struct *wk)
 			   sta->addr, bw, mode);
 
 		err = ath10k_wmi_peer_set_param(ar, arvif->vdev_id, sta->addr,
-						WMI_PEER_PHYMODE, mode);
+						ar->wmi.peer_param->phymode, mode);
 		if (err) {
 			ath10k_warn(ar, "failed to update STA %pM peer phymode %d: %d\n",
 				    sta->addr, mode, err);
@@ -6288,7 +6288,7 @@ static void ath10k_sta_rc_update_wk(struct work_struct *wk)
 		}
 
 		err = ath10k_wmi_peer_set_param(ar, arvif->vdev_id, sta->addr,
-						WMI_PEER_CHAN_WIDTH, bw);
+						ar->wmi.peer_param->chan_width, bw);
 		if (err)
 			ath10k_warn(ar, "failed to update STA %pM peer bw %d: %d\n",
 				    sta->addr, bw, err);
@@ -6299,7 +6299,7 @@ static void ath10k_sta_rc_update_wk(struct work_struct *wk)
 			   sta->addr, nss);
 
 		err = ath10k_wmi_peer_set_param(ar, arvif->vdev_id, sta->addr,
-						WMI_PEER_NSS, nss);
+						ar->wmi.peer_param->nss, nss);
 		if (err)
 			ath10k_warn(ar, "failed to update STA %pM nss %d: %d\n",
 				    sta->addr, nss, err);
@@ -6310,7 +6310,7 @@ static void ath10k_sta_rc_update_wk(struct work_struct *wk)
 			   sta->addr, smps);
 
 		err = ath10k_wmi_peer_set_param(ar, arvif->vdev_id, sta->addr,
-						WMI_PEER_SMPS_STATE, smps);
+						ar->wmi.peer_param->smps_state, smps);
 		if (err)
 			ath10k_warn(ar, "failed to update STA %pM smps %d: %d\n",
 				    sta->addr, smps, err);
@@ -6384,7 +6384,7 @@ static int ath10k_sta_set_txpwr(struct ieee80211_hw *hw,
 	mutex_lock(&ar->conf_mutex);
 
 	ret = ath10k_wmi_peer_set_param(ar, arvif->vdev_id, sta->addr,
-					WMI_PEER_USE_FIXED_PWR, txpwr);
+					ar->wmi.peer_param->use_fixed_power, txpwr);
 	if (ret) {
 		ath10k_warn(ar, "failed to set tx power for station ret: %d\n",
 			    ret);
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 5d05bff..13f9084 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -4077,6 +4077,24 @@ static struct wmi_pdev_param_map wmi_tlv_pdev_param_map = {
 	.arp_dstaddr = WMI_PDEV_PARAM_UNSUPPORTED,
 };
 
+static struct wmi_peer_param_map wmi_tlv_peer_param_map = {
+	.smps_state = WMI_TLV_PEER_SMPS_STATE,
+	.ampdu = WMI_TLV_PEER_AMPDU,
+	.authorize = WMI_TLV_PEER_AUTHORIZE,
+	.chan_width = WMI_TLV_PEER_CHAN_WIDTH,
+	.nss = WMI_TLV_PEER_NSS,
+	.use_4addr = WMI_TLV_PEER_USE_4ADDR,
+	.membership = WMI_TLV_PEER_MEMBERSHIP,
+	.user_pos = WMI_TLV_PEER_USERPOS,
+	.crit_proto_hint_enabled = WMI_TLV_PEER_CRIT_PROTO_HINT_ENABLED,
+	.tx_fail_cnt_thr = WMI_TLV_PEER_TX_FAIL_CNT_THR,
+	.set_hw_retry_cts2s = WMI_TLV_PEER_SET_HW_RETRY_CTS2S,
+	.ibss_atim_win_len = WMI_TLV_PEER_IBSS_ATIM_WINDOW_LENGTH,
+	.phymode = WMI_TLV_PEER_PHYMODE,
+	.use_fixed_power = WMI_TLV_PEER_USE_FIXED_PWR,
+	.dummy_var = WMI_TLV_PEER_DUMMY_VAR,
+};
+
 static struct wmi_vdev_param_map wmi_tlv_vdev_param_map = {
 	.rts_threshold = WMI_TLV_VDEV_PARAM_RTS_THRESHOLD,
 	.fragmentation_threshold = WMI_TLV_VDEV_PARAM_FRAGMENTATION_THRESHOLD,
@@ -4265,6 +4283,7 @@ void ath10k_wmi_tlv_attach(struct ath10k *ar)
 	ar->wmi.cmd = &wmi_tlv_cmd_map;
 	ar->wmi.vdev_param = &wmi_tlv_vdev_param_map;
 	ar->wmi.pdev_param = &wmi_tlv_pdev_param_map;
+	ar->wmi.peer_param = &wmi_tlv_peer_param_map;
 	ar->wmi.ops = &wmi_tlv_ops;
 	ar->wmi.peer_flags = &wmi_tlv_peer_flags_map;
 }
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index 4fba581..8d50808 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -533,6 +533,24 @@ enum wmi_tlv_vdev_param {
 	WMI_TLV_VDEV_PARAM_IBSS_PS_1RX_CHAIN_IN_ATIM_WINDOW_ENABLE,
 };
 
+enum wmi_tlv_peer_param {
+	WMI_TLV_PEER_SMPS_STATE = 0x1, /* see %wmi_peer_smps_state */
+	WMI_TLV_PEER_AMPDU      = 0x2,
+	WMI_TLV_PEER_AUTHORIZE  = 0x3,
+	WMI_TLV_PEER_CHAN_WIDTH = 0x4,
+	WMI_TLV_PEER_NSS        = 0x5,
+	WMI_TLV_PEER_USE_4ADDR  = 0x6,
+	WMI_TLV_PEER_MEMBERSHIP = 0x7,
+	WMI_TLV_PEER_USERPOS = 0x8,
+	WMI_TLV_PEER_CRIT_PROTO_HINT_ENABLED = 0x9,
+	WMI_TLV_PEER_TX_FAIL_CNT_THR = 0xa,
+	WMI_TLV_PEER_SET_HW_RETRY_CTS2S = 0xb,
+	WMI_TLV_PEER_IBSS_ATIM_WINDOW_LENGTH = 0xc,
+	WMI_TLV_PEER_PHYMODE = 0xd,
+	WMI_TLV_PEER_USE_FIXED_PWR = 0xe,
+	WMI_TLV_PEER_DUMMY_VAR = 0xff,
+};
+
 enum wmi_tlv_peer_flags {
 	WMI_TLV_PEER_AUTH = 0x00000001,
 	WMI_TLV_PEER_QOS = 0x00000002,
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 704c71b..35f9f90 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -753,6 +753,19 @@ static struct wmi_cmd_map wmi_10_4_cmd_map = {
 	.radar_found_cmdid = WMI_10_4_RADAR_FOUND_CMDID,
 };
 
+static struct wmi_peer_param_map wmi_peer_param_map = {
+	.smps_state = WMI_PEER_SMPS_STATE,
+	.ampdu = WMI_PEER_AMPDU,
+	.authorize = WMI_PEER_AUTHORIZE,
+	.chan_width = WMI_PEER_CHAN_WIDTH,
+	.nss = WMI_PEER_NSS,
+	.use_4addr = WMI_PEER_USE_4ADDR,
+	.use_fixed_power = WMI_PEER_USE_FIXED_PWR,
+	.debug = WMI_PEER_DEBUG,
+	.phymode = WMI_PEER_PHYMODE,
+	.dummy_var = WMI_PEER_DUMMY_VAR,
+};
+
 /* MAIN WMI VDEV param map */
 static struct wmi_vdev_param_map wmi_vdev_param_map = {
 	.rts_threshold = WMI_VDEV_PARAM_RTS_THRESHOLD,
@@ -9300,6 +9313,7 @@ int ath10k_wmi_attach(struct ath10k *ar)
 		ar->wmi.cmd = &wmi_10_4_cmd_map;
 		ar->wmi.vdev_param = &wmi_10_4_vdev_param_map;
 		ar->wmi.pdev_param = &wmi_10_4_pdev_param_map;
+		ar->wmi.peer_param = &wmi_peer_param_map;
 		ar->wmi.peer_flags = &wmi_10_2_peer_flags_map;
 		ar->wmi_key_cipher = wmi_key_cipher_suites;
 		break;
@@ -9308,6 +9322,7 @@ int ath10k_wmi_attach(struct ath10k *ar)
 		ar->wmi.ops = &wmi_10_2_4_ops;
 		ar->wmi.vdev_param = &wmi_10_2_4_vdev_param_map;
 		ar->wmi.pdev_param = &wmi_10_2_4_pdev_param_map;
+		ar->wmi.peer_param = &wmi_peer_param_map;
 		ar->wmi.peer_flags = &wmi_10_2_peer_flags_map;
 		ar->wmi_key_cipher = wmi_key_cipher_suites;
 		break;
@@ -9316,6 +9331,7 @@ int ath10k_wmi_attach(struct ath10k *ar)
 		ar->wmi.ops = &wmi_10_2_ops;
 		ar->wmi.vdev_param = &wmi_10x_vdev_param_map;
 		ar->wmi.pdev_param = &wmi_10x_pdev_param_map;
+		ar->wmi.peer_param = &wmi_peer_param_map;
 		ar->wmi.peer_flags = &wmi_10_2_peer_flags_map;
 		ar->wmi_key_cipher = wmi_key_cipher_suites;
 		break;
@@ -9324,6 +9340,7 @@ int ath10k_wmi_attach(struct ath10k *ar)
 		ar->wmi.ops = &wmi_10_1_ops;
 		ar->wmi.vdev_param = &wmi_10x_vdev_param_map;
 		ar->wmi.pdev_param = &wmi_10x_pdev_param_map;
+		ar->wmi.peer_param = &wmi_peer_param_map;
 		ar->wmi.peer_flags = &wmi_10x_peer_flags_map;
 		ar->wmi_key_cipher = wmi_key_cipher_suites;
 		break;
@@ -9332,6 +9349,7 @@ int ath10k_wmi_attach(struct ath10k *ar)
 		ar->wmi.ops = &wmi_ops;
 		ar->wmi.vdev_param = &wmi_vdev_param_map;
 		ar->wmi.pdev_param = &wmi_pdev_param_map;
+		ar->wmi.peer_param = &wmi_peer_param_map;
 		ar->wmi.peer_flags = &wmi_peer_flags_map;
 		ar->wmi_key_cipher = wmi_key_cipher_suites;
 		break;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 9b5a7ec..23666ca 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -5083,6 +5083,25 @@ enum wmi_rate_preamble {
 /* Value to disable fixed rate setting */
 #define WMI_FIXED_RATE_NONE    (0xff)
 
+struct wmi_peer_param_map {
+	u32 smps_state;
+	u32 ampdu;
+	u32 authorize;
+	u32 chan_width;
+	u32 nss;
+	u32 use_4addr;
+	u32 membership;
+	u32 use_fixed_power;
+	u32 user_pos;
+	u32 crit_proto_hint_enabled;
+	u32 tx_fail_cnt_thr;
+	u32 set_hw_retry_cts2s;
+	u32 ibss_atim_win_len;
+	u32 debug;
+	u32 phymode;
+	u32 dummy_var;
+};
+
 struct wmi_vdev_param_map {
 	u32 rts_threshold;
 	u32 fragmentation_threshold;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
