Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pb0-x231.google.com ([2607:f8b0:400e:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3j6L-0000C1-0w
 for ath10k@lists.infradead.org; Thu, 16 Jan 2014 09:19:01 +0000
Received: by mail-pb0-f49.google.com with SMTP id up15so1861429pbc.8
 for <ath10k@lists.infradead.org>; Thu, 16 Jan 2014 01:18:36 -0800 (PST)
From: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Subject: [PATCH] ath10k: set the AP keepalive timer
Date: Thu, 16 Jan 2014 17:18:24 +0800
Message-Id: <1389863904-7159-1-git-send-email-yeohchunyeow@gmail.com>
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
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, Chun-Yeow Yeoh <yeohchunyeow@gmail.com>

Set the AP keepalive timer as following:
ap_keepalive_min_idle_inactive_time_secs to 60 seconds
ap_keepalive_max_idle_inactive_time_secs to 120 seconds
ap_keepalive_max_unresponsive_time_secs to 300 seconds

This ensure that the WMI_PEER_STA_KICKOUT_EVENTID is triggered
by the FW only once the unresponsive timer is expired.

Tested with firmware version 999.999.0.636 but the timer
is still default to 100 seconds. Tested with firmware 
version 10.1.467-1, the timer is set according to 
ap_keepalive_max_unresponsive_time_secs.

Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   22 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h |    3 +++
 2 files changed, 25 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 776e364..2141034 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2313,6 +2313,28 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		ret = ath10k_wmi_pdev_set_param(ar, param_id, 0);
 		if (ret)
 			ath10k_warn("Failed to disable STA KICKOUT\n");
+
+		/* Set the AP keepalive timer */
+		vdev_param =
+			ar->wmi.vdev_param->ap_keepalive_min_idle_inactive_time_secs;
+		ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
+			WMI_VDEV_AP_KEEPALIVE_MIN_IDLE_INACTIVE_TIME_SECS);
+		if (ret)
+			ath10k_warn("Failed to set keepalive min idle timer\n");
+
+		vdev_param =
+			ar->wmi.vdev_param->ap_keepalive_max_idle_inactive_time_secs;
+		ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
+			WMI_VDEV_AP_KEEPALIVE_MAX_IDLE_INACTIVE_TIME_SECS);
+		if (ret)
+			ath10k_warn("Failed to set keepalive max idle timer\n");
+
+		vdev_param =
+			ar->wmi.vdev_param->ap_keepalive_max_unresponsive_time_secs;
+		ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
+			WMI_VDEV_AP_KEEPALIVE_MAX_UNRESPONSIVE_TIME_SECS);
+		if (ret)
+			ath10k_warn("Failed to set keepalive unresponsive timer\n");
 	}
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_STA) {
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 4b5e7d3..7ce002a 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -3080,6 +3080,9 @@ struct wmi_vdev_param_map {
 };
 
 #define WMI_VDEV_PARAM_UNSUPPORTED 0
+#define WMI_VDEV_AP_KEEPALIVE_MIN_IDLE_INACTIVE_TIME_SECS 60
+#define WMI_VDEV_AP_KEEPALIVE_MAX_IDLE_INACTIVE_TIME_SECS 120
+#define WMI_VDEV_AP_KEEPALIVE_MAX_UNRESPONSIVE_TIME_SECS 300
 
 /* the definition of different VDEV parameters */
 enum wmi_vdev_param {
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
