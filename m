Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffEB3-0007KA-Id
 for ath10k@lists.infradead.org; Tue, 17 Jul 2018 00:49:18 +0000
From: greearb@candelatech.com
Subject: [RFC] ath10k:  Support configuring firmware tx-retry counter.
Date: Mon, 16 Jul 2018 17:48:59 -0700
Message-Id: <1531788539-17937-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

Firmware already supports this, so just enable the path
to configure the vdev parameter.

One potential issue:  The firmware (10.1 at least) defaults to 2,
and the mac80211 stack defaults to 4.  So applying this patch would
change the firmware behaviour regardless of user settings.

I verified this tweaked the proper firmware setting when I
ran this command:

iw phy wiphy0 set retry short 2 long 2

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 31 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c |  2 +-
 drivers/net/wireless/ath/ath10k/wmi.h |  2 ++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index c90c8bb..b458e5b 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2027,6 +2027,16 @@ static int ath10k_mac_vif_setup_ps(struct ath10k_vif *arvif)
 	return 0;
 }
 
+static int ath10k_mac_vif_config_retry_limit(struct ath10k_vif *arvif, int limit)
+{
+	struct ath10k *ar = arvif->ar;
+	int vdev_param = ar->wmi.vdev_param->rc_num_retries;
+
+	lockdep_assert_held(&arvif->ar->conf_mutex);
+
+	return ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param, limit);
+}
+
 static int ath10k_mac_vif_disable_keepalive(struct ath10k_vif *arvif)
 {
 	struct ath10k *ar = arvif->ar;
@@ -5516,6 +5526,24 @@ static int ath10k_config_ps(struct ath10k *ar)
 	return ret;
 }
 
+static int ath10k_config_retry_limit(struct ath10k *ar, int limit)
+{
+	struct ath10k_vif *arvif;
+	int ret = 0;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	list_for_each_entry(arvif, &ar->arvifs, list) {
+		ret = ath10k_mac_vif_config_retry_limit(arvif, limit);
+		if (ret) {
+			ath10k_warn(ar, "failed to setup retry-limit: %d\n", ret);
+			break;
+		}
+	}
+
+	return ret;
+}
+
 static int ath10k_mac_txpower_setup(struct ath10k *ar, int txpower)
 {
 	int ret;
@@ -5592,6 +5620,9 @@ static int ath10k_config(struct ieee80211_hw *hw, u32 changed)
 			ath10k_warn(ar, "failed to recalc monitor: %d\n", ret);
 	}
 
+	if (changed & IEEE80211_CONF_CHANGE_RETRY_LIMITS)
+		ret = ath10k_config_retry_limit(ar, conf->long_frame_max_tx_count);
+
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
 }
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 6aaa439..816883d 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -874,7 +874,7 @@ static struct wmi_vdev_param_map wmi_10x_vdev_param_map = {
 	.tx_encap_type = WMI_VDEV_PARAM_UNSUPPORTED,
 	.ap_detect_out_of_sync_sleeping_sta_time_secs =
 		WMI_10X_VDEV_PARAM_AP_DETECT_OUT_OF_SYNC_SLEEPING_STA_TIME_SECS,
-	.rc_num_retries = WMI_VDEV_PARAM_UNSUPPORTED,
+	.rc_num_retries = WMI_10X_VDEV_PARAM_RC_NUM_RETRIES,
 	.cabq_maxdur = WMI_VDEV_PARAM_UNSUPPORTED,
 	.mfptest_set = WMI_VDEV_PARAM_UNSUPPORTED,
 	.rts_fixed_rate = WMI_VDEV_PARAM_UNSUPPORTED,
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 95ff280..b01778e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -5369,6 +5369,8 @@ enum wmi_10x_vdev_param {
 	WMI_10X_VDEV_PARAM_MCAST2UCAST_SET,
 	/* Enable/Disable RTS-CTS */
 	WMI_10X_VDEV_PARAM_ENABLE_RTSCTS,
+	/** Total number of HW retries */
+	WMI_10X_VDEV_PARAM_RC_NUM_RETRIES,
 
 	WMI_10X_VDEV_PARAM_AP_DETECT_OUT_OF_SYNC_SLEEPING_STA_TIME_SECS,
 
-- 
2.4.11


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
