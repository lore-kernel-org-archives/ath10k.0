Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3k3Y-0002k3-Cb
 for ath10k@lists.infradead.org; Wed, 24 Dec 2014 11:24:44 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH] ath10k: fix build error when hwmon is off
Date: Wed, 24 Dec 2014 16:54:00 +0530
Message-ID: <1419420240-11208-1-git-send-email-rmanohar@qti.qualcomm.com>
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

Place hwmon APIs inside CONFIG_HWMON switch to fix undefined
errors when hwmon is not enabled.

ERROR: "devm_hwmon_device_register_with_groups"
[drivers/net/wireless/ath/ath10k/ath10k_core.ko] undefined!

Reported-by: Kalle Valo <kvalo@qca.qualcomm.com>
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/thermal.c | 8 ++++++++
 drivers/net/wireless/ath/ath10k/thermal.h | 7 +++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index d939135..7e982e4 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -121,6 +121,7 @@ static struct thermal_cooling_device_ops ath10k_thermal_ops = {
 	.set_cur_state = ath10k_thermal_set_cur_dutycycle,
 };
 
+#ifdef CONFIG_HWMON
 static ssize_t ath10k_thermal_show_temp(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
@@ -182,11 +183,14 @@ static struct attribute *ath10k_hwmon_attrs[] = {
 	NULL,
 };
 ATTRIBUTE_GROUPS(ath10k_hwmon);
+#endif
 
 int ath10k_thermal_register(struct ath10k *ar)
 {
 	struct thermal_cooling_device *cdev;
+#ifdef CONFIG_HWMON
 	struct device *hwmon_dev;
+#endif
 	int ret;
 
 	cdev = thermal_cooling_device_register("ath10k_thermal", ar,
@@ -207,6 +211,7 @@ int ath10k_thermal_register(struct ath10k *ar)
 
 	ar->thermal.cdev = cdev;
 
+#ifdef CONFIG_HWMON
 	/* Do not register hwmon device when temperature reading is not
 	 * supported by firmware
 	 */
@@ -222,10 +227,13 @@ int ath10k_thermal_register(struct ath10k *ar)
 		ret = -EINVAL;
 		goto err_remove_link;
 	}
+#endif
 	return 0;
 
+#ifdef CONFIG_HWMON
 err_remove_link:
 	sysfs_remove_link(&ar->dev->kobj, "thermal_sensor");
+#endif
 err_cooling_destroy:
 	thermal_cooling_device_unregister(cdev);
 	return ret;
diff --git a/drivers/net/wireless/ath/ath10k/thermal.h b/drivers/net/wireless/ath/ath10k/thermal.h
index bccc17a..9607e1a 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.h
+++ b/drivers/net/wireless/ath/ath10k/thermal.h
@@ -38,7 +38,6 @@ struct ath10k_thermal {
 #ifdef CONFIG_THERMAL
 int ath10k_thermal_register(struct ath10k *ar);
 void ath10k_thermal_unregister(struct ath10k *ar);
-void ath10k_thermal_event_temperature(struct ath10k *ar, int temperature);
 #else
 static inline int ath10k_thermal_register(struct ath10k *ar)
 {
@@ -49,10 +48,14 @@ static inline void ath10k_thermal_unregister(struct ath10k *ar)
 {
 }
 
+#endif /* CONFIG_THERMAL */
+#ifdef CONFIG_HWMON
+void ath10k_thermal_event_temperature(struct ath10k *ar, int temperature);
+#else
 static inline void ath10k_thermal_event_temperature(struct ath10k *ar,
 						    int temperature)
 {
 }
 
-#endif
+#endif /* CONFIG_HWMON */
 #endif /* _THERMAL_ */
-- 
2.2.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
