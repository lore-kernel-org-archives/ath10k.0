Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YOnHH-0002Q7-4f
 for ath10k@lists.infradead.org; Fri, 20 Feb 2015 13:05:55 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 3/3] ath10k: add symlink for hwmon device
Date: Fri, 20 Feb 2015 18:34:12 +0530
Message-ID: <1424437452-28161-3-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1424437452-28161-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1424437452-28161-1-git-send-email-rmanohar@qti.qualcomm.com>
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

Add symbloic link "thermal_sensors" for hwmon devices for better
readability.

/sys/class/ieee80211/phyX/device/thermal_sensors ->
sys/class/ieee80211/phyX/device/hwmon/hwmonY

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/thermal.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 7c54bb1..f601e3e 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -276,6 +276,13 @@ int ath10k_thermal_register(struct ath10k *ar)
 		ret = -EINVAL;
 		goto err_remove_file;
 	}
+	ret = sysfs_create_link(&ar->dev->kobj, &hwmon_dev->kobj,
+				"thermal_sensors");
+	if (ret) {
+		ath10k_err(ar, "failed to create hwmon symlink\n");
+		goto err_remove_file;
+	}
+
 	return 0;
 
 err_remove_file:
@@ -292,4 +299,5 @@ void ath10k_thermal_unregister(struct ath10k *ar)
 	thermal_cooling_device_unregister(ar->thermal.cdev);
 	sysfs_remove_link(&ar->dev->kobj, "cooling_device");
 	sysfs_remove_file(&ar->dev->kobj, &dev_attr_quiet_period.attr);
+	sysfs_remove_link(&ar->dev->kobj, "thermal_sensors");
 }
-- 
2.3.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
