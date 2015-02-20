Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YOnGt-0002J1-BI
 for ath10k@lists.infradead.org; Fri, 20 Feb 2015 13:05:31 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 1/3] ath10k: add sysfs entry to configure quiet period
Date: Fri, 20 Feb 2015 18:34:10 +0530
Message-ID: <1424437452-28161-1-git-send-email-rmanohar@qti.qualcomm.com>
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

Add support to configure quiet period via sysfs entry. This will
be helpful to experiment different quiet period values along with
different duty cycle ratio.

To configure quiet period as 30ms,

echo 30 >/sys/class/ieee80211/phyX/device/quiet_period

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/thermal.c | 57 +++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/thermal.h |  1 +
 2 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 0d89ab5..8992c17 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -96,8 +96,7 @@ static int ath10k_thermal_set_cur_dutycycle(struct thermal_cooling_device *cdev,
 		ret = -ENETDOWN;
 		goto out;
 	}
-	period = max(ATH10K_QUIET_PERIOD_MIN,
-		     (ATH10K_QUIET_PERIOD_DEFAULT / num_bss));
+	period = ar->thermal.quiet_period;
 	duration = (period * (100 - duty_cycle)) / 100;
 	enabled = duration ? 1 : 0;
 
@@ -184,6 +183,48 @@ static struct attribute *ath10k_hwmon_attrs[] = {
 };
 ATTRIBUTE_GROUPS(ath10k_hwmon);
 
+static ssize_t ath10k_thermal_show_quiet_period(struct device *dev,
+						struct device_attribute *attr,
+						char *buf)
+{
+	struct ath10k *ar = dev_get_drvdata(dev);
+	u32 period;
+
+	mutex_lock(&ar->conf_mutex);
+	period = ar->thermal.quiet_period;
+	mutex_unlock(&ar->conf_mutex);
+
+	return sprintf(buf, "%u\n", period);
+}
+
+static ssize_t ath10k_thermal_store_quiet_period(struct device *dev,
+						 struct device_attribute *attr,
+						 const char *buf, size_t count)
+{
+	struct ath10k *ar = dev_get_drvdata(dev);
+	u32 period;
+	int ret;
+
+	ret = kstrtou32(buf, 0, &period);
+	if (ret)
+		return ret;
+
+	if (period < ATH10K_QUIET_PERIOD_MIN) {
+		ath10k_warn(ar, "Quiet period %u can not be lesser than 25ms\n",
+			    period);
+		return -EINVAL;
+	}
+	mutex_lock(&ar->conf_mutex);
+	ar->thermal.quiet_period = period;
+	mutex_unlock(&ar->conf_mutex);
+
+	return count;
+}
+
+static DEVICE_ATTR(quiet_period, S_IRUGO | S_IWUSR,
+		   ath10k_thermal_show_quiet_period,
+		   ath10k_thermal_store_quiet_period);
+
 int ath10k_thermal_register(struct ath10k *ar)
 {
 	struct thermal_cooling_device *cdev;
@@ -208,6 +249,13 @@ int ath10k_thermal_register(struct ath10k *ar)
 
 	ar->thermal.cdev = cdev;
 
+	ret = sysfs_create_file(&ar->dev->kobj, &dev_attr_quiet_period.attr);
+	if (ret) {
+		ath10k_err(ar, "failed to create quiet period sysfs entry\n");
+		goto err_remove_link;
+	}
+	ar->thermal.quiet_period = ATH10K_QUIET_PERIOD_DEFAULT;
+
 	/* Do not register hwmon device when temperature reading is not
 	 * supported by firmware
 	 */
@@ -226,10 +274,12 @@ int ath10k_thermal_register(struct ath10k *ar)
 		ath10k_err(ar, "failed to register hwmon device: %ld\n",
 			   PTR_ERR(hwmon_dev));
 		ret = -EINVAL;
-		goto err_remove_link;
+		goto err_remove_file;
 	}
 	return 0;
 
+err_remove_file:
+	sysfs_remove_file(&ar->dev->kobj, &dev_attr_quiet_period.attr);
 err_remove_link:
 	sysfs_remove_link(&ar->dev->kobj, "thermal_sensor");
 err_cooling_destroy:
@@ -241,4 +291,5 @@ void ath10k_thermal_unregister(struct ath10k *ar)
 {
 	thermal_cooling_device_unregister(ar->thermal.cdev);
 	sysfs_remove_link(&ar->dev->kobj, "cooling_device");
+	sysfs_remove_file(&ar->dev->kobj, &dev_attr_quiet_period.attr);
 }
diff --git a/drivers/net/wireless/ath/ath10k/thermal.h b/drivers/net/wireless/ath/ath10k/thermal.h
index 5e87d9a..050f41d 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.h
+++ b/drivers/net/wireless/ath/ath10k/thermal.h
@@ -29,6 +29,7 @@ struct ath10k_thermal {
 
 	/* protected by conf_mutex */
 	u32 duty_cycle;
+	u32 quiet_period;
 	/* temperature value in Celcius degree
 	 * protected by data_lock
 	 */
-- 
2.3.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
