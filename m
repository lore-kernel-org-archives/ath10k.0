Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x230.google.com ([2a00:1450:400c:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBl7y-0006wb-2C
 for ath10k@lists.infradead.org; Mon, 28 Jul 2014 13:38:14 +0000
Received: by mail-we0-f176.google.com with SMTP id q58so7406438wes.35
 for <ath10k@lists.infradead.org>; Mon, 28 Jul 2014 06:37:45 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: improve channel switching
Date: Mon, 28 Jul 2014 15:28:52 +0200
Message-Id: <1406554132-17264-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

In some cases during heavy tx vdev stop-start
would timeout on vdev synchronization causing
traffic to stall for a few seconds.

Instead of stop-starting use a dedicated vdev
restart command and down vdevs explicitly before
doing so.

This gets rid of the synchronization
warnings/timeouts and makes channel switching
smoother during traffic.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 9d61bb1..b76efe2 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -796,7 +796,7 @@ static void ath10k_recalc_radar_detection(struct ath10k *ar)
 	}
 }
 
-static int ath10k_vdev_start(struct ath10k_vif *arvif)
+static int ath10k_vdev_start_restart(struct ath10k_vif *arvif, bool restart)
 {
 	struct ath10k *ar = arvif->ar;
 	struct cfg80211_chan_def *chandef = &ar->chandef;
@@ -838,7 +838,11 @@ static int ath10k_vdev_start(struct ath10k_vif *arvif)
 		   arg.vdev_id, arg.channel.freq,
 		   ath10k_wmi_phymode_str(arg.channel.mode));
 
-	ret = ath10k_wmi_vdev_start(ar, &arg);
+	if (restart)
+		ret = ath10k_wmi_vdev_restart(ar, &arg);
+	else
+		ret = ath10k_wmi_vdev_start(ar, &arg);
+
 	if (ret) {
 		ath10k_warn("failed to start WMI vdev %i: %d\n",
 			    arg.vdev_id, ret);
@@ -858,6 +862,16 @@ static int ath10k_vdev_start(struct ath10k_vif *arvif)
 	return ret;
 }
 
+static int ath10k_vdev_start(struct ath10k_vif *arvif)
+{
+	return ath10k_vdev_start_restart(arvif, false);
+}
+
+static int ath10k_vdev_restart(struct ath10k_vif *arvif)
+{
+	return ath10k_vdev_start_restart(arvif, true);
+}
+
 static int ath10k_vdev_stop(struct ath10k_vif *arvif)
 {
 	struct ath10k *ar = arvif->ar;
@@ -2582,18 +2596,21 @@ static void ath10k_config_chan(struct ath10k *ar)
 		if (!arvif->is_started)
 			continue;
 
+		if (!arvif->is_up)
+			continue;
+
 		if (arvif->vdev_type == WMI_VDEV_TYPE_MONITOR)
 			continue;
 
-		ret = ath10k_vdev_stop(arvif);
+		ret = ath10k_wmi_vdev_down(ar, arvif->vdev_id);
 		if (ret) {
-			ath10k_warn("failed to stop vdev %d: %d\n",
+			ath10k_warn("failed to down vdev %d: %d\n",
 				    arvif->vdev_id, ret);
 			continue;
 		}
 	}
 
-	/* all vdevs are now stopped - now attempt to restart them */
+	/* all vdevs are downed now - attempt to restart and re-up them */
 
 	list_for_each_entry(arvif, &ar->arvifs, list) {
 		if (!arvif->is_started)
@@ -2602,9 +2619,9 @@ static void ath10k_config_chan(struct ath10k *ar)
 		if (arvif->vdev_type == WMI_VDEV_TYPE_MONITOR)
 			continue;
 
-		ret = ath10k_vdev_start(arvif);
+		ret = ath10k_vdev_restart(arvif);
 		if (ret) {
-			ath10k_warn("failed to start vdev %d: %d\n",
+			ath10k_warn("failed to restart vdev %d: %d\n",
 				    arvif->vdev_id, ret);
 			continue;
 		}
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
