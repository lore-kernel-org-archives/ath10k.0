Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YOnH7-0002Lb-GE
 for ath10k@lists.infradead.org; Fri, 20 Feb 2015 13:05:45 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 2/3] ath10k: fix wrong symlink name on error path
Date: Fri, 20 Feb 2015 18:34:11 +0530
Message-ID: <1424437452-28161-2-git-send-email-rmanohar@qti.qualcomm.com>
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

Wrong symlink name is used on error path of thermal registration
and also correcting the error message.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/thermal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 8992c17..7c54bb1 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -243,7 +243,7 @@ int ath10k_thermal_register(struct ath10k *ar)
 	ret = sysfs_create_link(&ar->dev->kobj, &cdev->device.kobj,
 				"cooling_device");
 	if (ret) {
-		ath10k_err(ar, "failed to create thermal symlink\n");
+		ath10k_err(ar, "failed to create cooling device symlink\n");
 		goto err_cooling_destroy;
 	}
 
@@ -281,7 +281,7 @@ int ath10k_thermal_register(struct ath10k *ar)
 err_remove_file:
 	sysfs_remove_file(&ar->dev->kobj, &dev_attr_quiet_period.attr);
 err_remove_link:
-	sysfs_remove_link(&ar->dev->kobj, "thermal_sensor");
+	sysfs_remove_link(&ar->dev->kobj, "cooling_device");
 err_cooling_destroy:
 	thermal_cooling_device_unregister(cdev);
 	return ret;
-- 
2.3.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
