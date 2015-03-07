Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YU9iV-0006Qt-7T
 for ath10k@lists.infradead.org; Sat, 07 Mar 2015 08:04:11 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 3/4] ath10k: do not restrict thermal throttling to ap mode
Date: Sat, 7 Mar 2015 13:32:59 +0530
Message-ID: <1425715380-11200-3-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1425715380-11200-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1425715380-11200-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Recently thermal mitigation is validated in station mode as well.
Hence allowing thermal throttling for all interfaces. This enables
user to validate thermal mitigation with different modes.

Reported-by: Matthias Kaehlcke <mka@google.com>
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/thermal.c | 36 +------------------------------
 1 file changed, 1 insertion(+), 35 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 61acdf0..7aef064 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -23,29 +23,6 @@
 #include "debug.h"
 #include "wmi-ops.h"
 
-static int ath10k_thermal_get_active_vifs(struct ath10k *ar,
-					  enum wmi_vdev_type type)
-{
-	struct ath10k_vif *arvif;
-	int count = 0;
-
-	lockdep_assert_held(&ar->conf_mutex);
-
-	list_for_each_entry(arvif, &ar->arvifs, list) {
-		if (!arvif->is_started)
-			continue;
-
-		if (!arvif->is_up)
-			continue;
-
-		if (arvif->vdev_type != type)
-			continue;
-
-		count++;
-	}
-	return count;
-}
-
 static int
 ath10k_thermal_get_max_throttle_state(struct thermal_cooling_device *cdev,
 				      unsigned long *state)
@@ -73,7 +50,7 @@ ath10k_thermal_set_cur_throttle_state(struct thermal_cooling_device *cdev,
 				      unsigned long throttle_state)
 {
 	struct ath10k *ar = cdev->devdata;
-	int num_bss, ret = 0;
+	int ret = 0;
 
 	mutex_lock(&ar->conf_mutex);
 	if (ar->state != ATH10K_STATE_ON) {
@@ -87,17 +64,6 @@ ath10k_thermal_set_cur_throttle_state(struct thermal_cooling_device *cdev,
 		ret = -EINVAL;
 		goto out;
 	}
-	/* TODO: Right now, thermal mitigation is handled only for single/multi
-	 * vif AP mode. Since quiet param is not validated in STA mode, it needs
-	 * to be investigated further to handle multi STA and multi-vif (AP+STA)
-	 * mode properly.
-	 */
-	num_bss = ath10k_thermal_get_active_vifs(ar, WMI_VDEV_TYPE_AP);
-	if (!num_bss) {
-		ath10k_warn(ar, "no active AP interfaces\n");
-		ret = -ENETDOWN;
-		goto out;
-	}
 	ar->thermal.throttle_state = throttle_state;
 	ath10k_thermal_set_throttling(ar);
 out:
-- 
2.3.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
