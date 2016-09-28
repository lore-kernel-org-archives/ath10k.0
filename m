Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpOkJ-0006WS-4j
 for ath10k@lists.infradead.org; Wed, 28 Sep 2016 23:58:40 +0000
From: Thomas Pedersen <twp@qca.qualcomm.com>
Subject: [PATCH 3/4] ath10k: remove set/get_tsf ieee80211_ops
Date: Wed, 28 Sep 2016 16:56:30 -0700
Message-ID: <20160928235631.9197-4-twp@qca.qualcomm.com>
In-Reply-To: <20160928235631.9197-1-twp@qca.qualcomm.com>
References: <20160928235631.9197-1-twp@qca.qualcomm.com>
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
To: ath10k <ath10k@lists.infradead.org>
Cc: Thomas Pedersen <twp@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>

Neither of these did the right thing:

- get_tsf just returned 0
- set_tsf assumed a simple offset was applied against
  get_tsf(), which works, except in the case of
  calculating TSF from rx_mactime (actual TSF).

Just remove them for now. We can reimplement set_tsf in
terms of TSF increment/decrement in the future if get_tsf
is ever supported by FW.

Signed-off-by: Thomas Pedersen <twp@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c     | 38 -------------------------------
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  1 -
 drivers/net/wireless/ath/ath10k/wmi.c     |  4 ----
 drivers/net/wireless/ath/ath10k/wmi.h     |  1 -
 4 files changed, 44 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 06bd027..9806546 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6956,42 +6956,6 @@ static void ath10k_sta_rc_update(struct ieee80211_hw *hw,
 	ieee80211_queue_work(hw, &arsta->update_wk);
 }
 
-static u64 ath10k_get_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
-{
-	/*
-	 * FIXME: Return 0 for time being. Need to figure out whether FW
-	 * has the API to fetch 64-bit local TSF
-	 */
-
-	return 0;
-}
-
-static void ath10k_set_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
-			   u64 tsf)
-{
-	struct ath10k *ar = hw->priv;
-	struct ath10k_vif *arvif = ath10k_vif_to_arvif(vif);
-	u32 tsf_offset, vdev_param = ar->wmi.vdev_param->set_tsf;
-	int ret;
-
-	/* Workaround:
-	 *
-	 * Given tsf argument is entire TSF value, but firmware accepts
-	 * only TSF offset to current TSF.
-	 *
-	 * get_tsf function is used to get offset value, however since
-	 * ath10k_get_tsf is not implemented properly, it will return 0 always.
-	 * Luckily all the caller functions to set_tsf, as of now, also rely on
-	 * get_tsf function to get entire tsf value such get_tsf() + tsf_delta,
-	 * final tsf offset value to firmware will be arithmetically correct.
-	 */
-	tsf_offset = tsf - ath10k_get_tsf(hw, vif);
-	ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id,
-					vdev_param, tsf_offset);
-	if (ret && ret != -EOPNOTSUPP)
-		ath10k_warn(ar, "failed to set tsf offset: %d\n", ret);
-}
-
 static void ath10k_offset_tsf(struct ieee80211_hw *hw,
 			      struct ieee80211_vif *vif, s64 tsf_offset)
 {
@@ -7477,8 +7441,6 @@ static const struct ieee80211_ops ath10k_ops = {
 	.get_survey			= ath10k_get_survey,
 	.set_bitrate_mask		= ath10k_mac_op_set_bitrate_mask,
 	.sta_rc_update			= ath10k_sta_rc_update,
-	.get_tsf			= ath10k_get_tsf,
-	.set_tsf			= ath10k_set_tsf,
 	.offset_tsf			= ath10k_offset_tsf,
 	.ampdu_action			= ath10k_ampdu_action,
 	.get_et_sset_count		= ath10k_debug_get_et_sset_count,
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index e64f593..5e399c6 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -3464,7 +3464,6 @@ static struct wmi_vdev_param_map wmi_tlv_vdev_param_map = {
 	.meru_vc = WMI_VDEV_PARAM_UNSUPPORTED,
 	.rx_decap_type = WMI_VDEV_PARAM_UNSUPPORTED,
 	.bw_nss_ratemask = WMI_VDEV_PARAM_UNSUPPORTED,
-	.set_tsf = WMI_VDEV_PARAM_UNSUPPORTED,
 };
 
 static const struct wmi_ops wmi_tlv_ops = {
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 430074b..8661400 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -785,7 +785,6 @@ static struct wmi_vdev_param_map wmi_vdev_param_map = {
 	.meru_vc = WMI_VDEV_PARAM_UNSUPPORTED,
 	.rx_decap_type = WMI_VDEV_PARAM_UNSUPPORTED,
 	.bw_nss_ratemask = WMI_VDEV_PARAM_UNSUPPORTED,
-	.set_tsf = WMI_VDEV_PARAM_UNSUPPORTED,
 };
 
 /* 10.X WMI VDEV param map */
@@ -861,7 +860,6 @@ static struct wmi_vdev_param_map wmi_10x_vdev_param_map = {
 	.meru_vc = WMI_VDEV_PARAM_UNSUPPORTED,
 	.rx_decap_type = WMI_VDEV_PARAM_UNSUPPORTED,
 	.bw_nss_ratemask = WMI_VDEV_PARAM_UNSUPPORTED,
-	.set_tsf = WMI_VDEV_PARAM_UNSUPPORTED,
 };
 
 static struct wmi_vdev_param_map wmi_10_2_4_vdev_param_map = {
@@ -936,7 +934,6 @@ static struct wmi_vdev_param_map wmi_10_2_4_vdev_param_map = {
 	.meru_vc = WMI_VDEV_PARAM_UNSUPPORTED,
 	.rx_decap_type = WMI_VDEV_PARAM_UNSUPPORTED,
 	.bw_nss_ratemask = WMI_VDEV_PARAM_UNSUPPORTED,
-	.set_tsf = WMI_10X_VDEV_PARAM_TSF_INCREMENT,
 };
 
 static struct wmi_vdev_param_map wmi_10_4_vdev_param_map = {
@@ -1012,7 +1009,6 @@ static struct wmi_vdev_param_map wmi_10_4_vdev_param_map = {
 	.meru_vc = WMI_10_4_VDEV_PARAM_MERU_VC,
 	.rx_decap_type = WMI_10_4_VDEV_PARAM_RX_DECAP_TYPE,
 	.bw_nss_ratemask = WMI_10_4_VDEV_PARAM_BW_NSS_RATEMASK,
-	.set_tsf = WMI_10_4_VDEV_PARAM_TSF_INCREMENT,
 	.inc_tsf = WMI_10_4_VDEV_PARAM_TSF_INCREMENT,
 	.dec_tsf = WMI_10_4_VDEV_PARAM_TSF_DECREMENT,
 };
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 9d13c6f..3a73b5c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4676,7 +4676,6 @@ struct wmi_vdev_param_map {
 	u32 meru_vc;
 	u32 rx_decap_type;
 	u32 bw_nss_ratemask;
-	u32 set_tsf;
 	u32 inc_tsf;
 	u32 dec_tsf;
 };
-- 
2.10.0.297.gf6727b0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
