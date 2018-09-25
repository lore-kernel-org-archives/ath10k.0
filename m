Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4g4J-0006hl-TG
 for ath10k@lists.infradead.org; Tue, 25 Sep 2018 05:39:34 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH v2] ath10k: Add support for configuring management packet rate
Date: Tue, 25 Sep 2018 11:08:18 +0530
Message-Id: <1537853898-3793-1-git-send-email-srirrama@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Sriram R <srirrama@codeaurora.org>

By default the firmware uses 1Mbps and 6Mbps rate for management packets
in 2G and 5G bands respectively. But when the user selects different
basic rates from the userspace, we need to send the management
packets at the lowest basic rate selected by the user.

This change makes use of WMI_VDEV_PARAM_MGMT_RATE param for configuring the
management packets rate to the firmware.

Chipsets Tested : QCA988X, QCA9887, QCA9984
FW Tested 	: 10.2.4-1.0-41, 10.4-3.6.104

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 v2:
     * Correction to ath10k_rates array indexing.
     * Usage of appropriate indent.

 drivers/net/wireless/ath/ath10k/mac.c | 45 +++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 97548f9..c0cde94 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -157,6 +157,22 @@ u8 ath10k_mac_bitrate_to_idx(const struct ieee80211_supported_band *sband,
 	return 0;
 }
 
+static int ath10k_mac_get_rate_hw_value(int bitrate)
+{
+	int i;
+	u8 hw_value_prefix = 0;
+
+	if (ath10k_mac_bitrate_is_cck(bitrate))
+		hw_value_prefix = WMI_RATE_PREAMBLE_CCK << 6;
+
+	for (i = 0; i < ARRAY_SIZE(ath10k_rates); i++) {
+		if (ath10k_rates[i].bitrate == bitrate)
+			return hw_value_prefix | ath10k_rates[i].hw_value;
+	}
+
+	return -EINVAL;
+}
+
 static int ath10k_mac_get_max_vht_mcs_map(u16 mcs_map, int nss)
 {
 	switch ((mcs_map >> (2 * nss)) & 0x3) {
@@ -5452,9 +5468,10 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 	struct cfg80211_chan_def def;
 	u32 vdev_param, pdev_param, slottime, preamble;
 	u16 bitrate, hw_value;
-	u8 rate;
-	int rateidx, ret = 0;
+	u8 rate, basic_rate_idx;
+	int rateidx, ret = 0, hw_rate_code;
 	enum nl80211_band band;
+	const struct ieee80211_supported_band *sband;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -5660,6 +5677,30 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 				    arvif->vdev_id,  ret);
 	}
 
+	if (changed & BSS_CHANGED_BASIC_RATES) {
+		if (WARN_ON(ath10k_mac_vif_chan(vif, &def))) {
+			mutex_unlock(&ar->conf_mutex);
+			return;
+		}
+
+		sband = ar->hw->wiphy->bands[def.chan->band];
+		basic_rate_idx = ffs(vif->bss_conf.basic_rates) - 1;
+		bitrate = sband->bitrates[basic_rate_idx].bitrate;
+
+		hw_rate_code = ath10k_mac_get_rate_hw_value(bitrate);
+		if (hw_rate_code < 0) {
+			ath10k_warn(ar, "bitrate not supported %d\n", bitrate);
+			mutex_unlock(&ar->conf_mutex);
+			return;
+		}
+
+		vdev_param = ar->wmi.vdev_param->mgmt_rate;
+		ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
+						hw_rate_code);
+		if (ret)
+			ath10k_warn(ar, "failed to set mgmt tx rate %d\n", ret);
+	}
+
 	mutex_unlock(&ar->conf_mutex);
 }
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
