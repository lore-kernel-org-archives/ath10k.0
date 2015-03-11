Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVl0m-0005tG-6R
 for ath10k@lists.infradead.org; Wed, 11 Mar 2015 18:05:40 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH] ath10k: move driver state check before setting throttle
Date: Wed, 11 Mar 2015 23:34:54 +0530
Message-ID: <1426097094-6225-1-git-send-email-rmanohar@qti.qualcomm.com>
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

Since thermal daemon is unaware of the device state, it might
try to adjust the throttle state when the device is powered down.
So the driver caches the value and will configure it while
powering up the target. The cached value will be programed later
once the device is brought up. In such case, returning error
status is confusing and misleading the user application. Hence
moving the driver state check before sending wmi command to target.

Reported-by: Matthias Kaehlcke <mka@google.com>
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/thermal.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 3720c86..c9475ac 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -50,7 +50,6 @@ ath10k_thermal_set_cur_throttle_state(struct thermal_cooling_device *cdev,
 				      unsigned long throttle_state)
 {
 	struct ath10k *ar = cdev->devdata;
-	int ret = 0;
 
 	if (throttle_state > ATH10K_THERMAL_THROTTLE_MAX) {
 		ath10k_warn(ar, "throttle state %ld is exceeding the limit %d\n",
@@ -59,16 +58,9 @@ ath10k_thermal_set_cur_throttle_state(struct thermal_cooling_device *cdev,
 	}
 	mutex_lock(&ar->conf_mutex);
 	ar->thermal.throttle_state = throttle_state;
-
-	if (ar->state != ATH10K_STATE_ON) {
-		ret = -ENETDOWN;
-		goto out;
-	}
-
 	ath10k_thermal_set_throttling(ar);
-out:
 	mutex_unlock(&ar->conf_mutex);
-	return ret;
+	return 0;
 }
 
 static struct thermal_cooling_device_ops ath10k_thermal_ops = {
@@ -190,6 +182,9 @@ void ath10k_thermal_set_throttling(struct ath10k *ar)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	if (ar->state != ATH10K_STATE_ON)
+		return;
+
 	period = ar->thermal.quiet_period;
 	duration = (period * ar->thermal.throttle_state) / 100;
 	enabled = duration ? 1 : 0;
-- 
2.3.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
