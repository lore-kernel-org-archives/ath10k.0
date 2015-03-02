Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSPKh-0003YC-78
 for ath10k@lists.infradead.org; Mon, 02 Mar 2015 12:20:23 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH V5 1/2] ath10k: Move ath10k_vdev_stop() up before
 ath10k_vdev_start_restart()
Date: Mon, 2 Mar 2015 17:45:27 +0530
Message-ID: <1425298528-3067-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

This patches does not modify any functionality. Just a code move
so that ath10k_vdev_stop() can be used in ath10k_vdev_start_restart()
for any failure cases which involves vdev_stop().

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
V2:
     - Call ath10k_vdev_stop() when ath10k_monitor_recalc() failed.
       This results in code move done in patch 1.

V3:
     - Make change specific to AP mode and update the commit log.

V4:
     - Rename the helper which is used to check is promisc mode is
       to be disbled.
     - Add warn when ath10k_monitor_recalc() and ath10k_vdev_stop()
       fails.

V5:
    - Do not clear FIF_PROMISC_IN_BSS in ath10k_mac_should_disable_promisc().
     
 drivers/net/wireless/ath/ath10k/mac.c |   66 ++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 0f39af7..3b5aaa3 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -872,6 +872,39 @@ static void ath10k_recalc_radar_detection(struct ath10k *ar)
 	}
 }
 
+static int ath10k_vdev_stop(struct ath10k_vif *arvif)
+{
+	struct ath10k *ar = arvif->ar;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	reinit_completion(&ar->vdev_setup_done);
+
+	ret = ath10k_wmi_vdev_stop(ar, arvif->vdev_id);
+	if (ret) {
+		ath10k_warn(ar, "failed to stop WMI vdev %i: %d\n",
+			    arvif->vdev_id, ret);
+		return ret;
+	}
+
+	ret = ath10k_vdev_setup_sync(ar);
+	if (ret) {
+		ath10k_warn(ar, "failed to syncronise setup for vdev %i: %d\n",
+			    arvif->vdev_id, ret);
+		return ret;
+	}
+
+	WARN_ON(ar->num_started_vdevs == 0);
+
+	if (ar->num_started_vdevs != 0) {
+		ar->num_started_vdevs--;
+		ath10k_recalc_radar_detection(ar);
+	}
+
+	return ret;
+}
+
 static int ath10k_vdev_start_restart(struct ath10k_vif *arvif, bool restart)
 {
 	struct ath10k *ar = arvif->ar;
@@ -949,39 +982,6 @@ static int ath10k_vdev_restart(struct ath10k_vif *arvif)
 	return ath10k_vdev_start_restart(arvif, true);
 }
 
-static int ath10k_vdev_stop(struct ath10k_vif *arvif)
-{
-	struct ath10k *ar = arvif->ar;
-	int ret;
-
-	lockdep_assert_held(&ar->conf_mutex);
-
-	reinit_completion(&ar->vdev_setup_done);
-
-	ret = ath10k_wmi_vdev_stop(ar, arvif->vdev_id);
-	if (ret) {
-		ath10k_warn(ar, "failed to stop WMI vdev %i: %d\n",
-			    arvif->vdev_id, ret);
-		return ret;
-	}
-
-	ret = ath10k_vdev_setup_sync(ar);
-	if (ret) {
-		ath10k_warn(ar, "failed to synchronize setup for vdev %i stop: %d\n",
-			    arvif->vdev_id, ret);
-		return ret;
-	}
-
-	WARN_ON(ar->num_started_vdevs == 0);
-
-	if (ar->num_started_vdevs != 0) {
-		ar->num_started_vdevs--;
-		ath10k_recalc_radar_detection(ar);
-	}
-
-	return ret;
-}
-
 static int ath10k_mac_setup_bcn_p2p_ie(struct ath10k_vif *arvif,
 				       struct sk_buff *bcn)
 {
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
