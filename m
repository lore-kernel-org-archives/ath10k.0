Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YU9i3-0006KB-Ol
 for ath10k@lists.infradead.org; Sat, 07 Mar 2015 08:03:44 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 1/4] ath10k: Fix interpretation of cooling device state
Date: Sat, 7 Mar 2015 13:32:57 +0530
Message-ID: <1425715380-11200-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: Matthias Kaehlcke <mka@google.com>, linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Setting the sysfs attribute ends up configuring the duty cycle,
but the interface through which the attribute is exposed
(cooling_device) is for setting the throttle/cooling state. This
is confusing the user. Hence renaming the cooling device interfaces
for better readability.

Cc: Matthias Kaehlcke <mka@google.com>
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/thermal.c | 35 +++++++++++++++++--------------
 drivers/net/wireless/ath/ath10k/thermal.h |  4 ++--
 2 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index eb65da2..246387c 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -46,28 +46,31 @@ static int ath10k_thermal_get_active_vifs(struct ath10k *ar,
 	return count;
 }
 
-static int ath10k_thermal_get_max_dutycycle(struct thermal_cooling_device *cdev,
-					    unsigned long *state)
+static int
+ath10k_thermal_get_max_throttle_state(struct thermal_cooling_device *cdev,
+				      unsigned long *state)
 {
-	*state = ATH10K_QUIET_DUTY_CYCLE_MAX;
+	*state = ATH10K_THERMAL_THROTTLE_MAX;
 
 	return 0;
 }
 
-static int ath10k_thermal_get_cur_dutycycle(struct thermal_cooling_device *cdev,
-					    unsigned long *state)
+static int
+ath10k_thermal_get_cur_throttle_state(struct thermal_cooling_device *cdev,
+				      unsigned long *state)
 {
 	struct ath10k *ar = cdev->devdata;
 
 	mutex_lock(&ar->conf_mutex);
-	*state = ar->thermal.duty_cycle;
+	*state = ar->thermal.throttle_state;
 	mutex_unlock(&ar->conf_mutex);
 
 	return 0;
 }
 
-static int ath10k_thermal_set_cur_dutycycle(struct thermal_cooling_device *cdev,
-					    unsigned long duty_cycle)
+static int
+ath10k_thermal_set_cur_throttle_state(struct thermal_cooling_device *cdev,
+				      unsigned long throttle_state)
 {
 	struct ath10k *ar = cdev->devdata;
 	u32 period, duration, enabled;
@@ -79,9 +82,9 @@ static int ath10k_thermal_set_cur_dutycycle(struct thermal_cooling_device *cdev,
 		goto out;
 	}
 
-	if (duty_cycle > ATH10K_QUIET_DUTY_CYCLE_MAX) {
-		ath10k_warn(ar, "duty cycle %ld is exceeding the limit %d\n",
-			    duty_cycle, ATH10K_QUIET_DUTY_CYCLE_MAX);
+	if (throttle_state > ATH10K_THERMAL_THROTTLE_MAX) {
+		ath10k_warn(ar, "throttle state %ld is exceeding the limit %d\n",
+			    throttle_state, ATH10K_THERMAL_THROTTLE_MAX);
 		ret = -EINVAL;
 		goto out;
 	}
@@ -97,7 +100,7 @@ static int ath10k_thermal_set_cur_dutycycle(struct thermal_cooling_device *cdev,
 		goto out;
 	}
 	period = ar->thermal.quiet_period;
-	duration = (period * duty_cycle) / 100;
+	duration = (period * throttle_state) / 100;
 	enabled = duration ? 1 : 0;
 
 	ret = ath10k_wmi_pdev_set_quiet_mode(ar, period, duration,
@@ -108,16 +111,16 @@ static int ath10k_thermal_set_cur_dutycycle(struct thermal_cooling_device *cdev,
 			    period, duration, enabled, ret);
 		goto out;
 	}
-	ar->thermal.duty_cycle = duty_cycle;
+	ar->thermal.throttle_state = throttle_state;
 out:
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
 }
 
 static struct thermal_cooling_device_ops ath10k_thermal_ops = {
-	.get_max_state = ath10k_thermal_get_max_dutycycle,
-	.get_cur_state = ath10k_thermal_get_cur_dutycycle,
-	.set_cur_state = ath10k_thermal_set_cur_dutycycle,
+	.get_max_state = ath10k_thermal_get_max_throttle_state,
+	.get_cur_state = ath10k_thermal_get_cur_throttle_state,
+	.set_cur_state = ath10k_thermal_set_cur_throttle_state,
 };
 
 static ssize_t ath10k_thermal_show_temp(struct device *dev,
diff --git a/drivers/net/wireless/ath/ath10k/thermal.h b/drivers/net/wireless/ath/ath10k/thermal.h
index 050f41d..5728010 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.h
+++ b/drivers/net/wireless/ath/ath10k/thermal.h
@@ -19,16 +19,16 @@
 #define ATH10K_QUIET_PERIOD_DEFAULT     100
 #define ATH10K_QUIET_PERIOD_MIN         25
 #define ATH10K_QUIET_START_OFFSET       10
-#define ATH10K_QUIET_DUTY_CYCLE_MAX     100
 #define ATH10K_HWMON_NAME_LEN           15
 #define ATH10K_THERMAL_SYNC_TIMEOUT_HZ (5*HZ)
+#define ATH10K_THERMAL_THROTTLE_MAX     100
 
 struct ath10k_thermal {
 	struct thermal_cooling_device *cdev;
 	struct completion wmi_sync;
 
 	/* protected by conf_mutex */
-	u32 duty_cycle;
+	u32 throttle_state;
 	u32 quiet_period;
 	/* temperature value in Celcius degree
 	 * protected by data_lock
-- 
2.3.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
