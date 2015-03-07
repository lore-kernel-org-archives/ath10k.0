Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YU9ik-0006Wa-2n
 for ath10k@lists.infradead.org; Sat, 07 Mar 2015 08:04:26 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 4/4] ath10k: cache throttle state when device is down
Date: Sat, 7 Mar 2015 13:33:00 +0530
Message-ID: <1425715380-11200-4-git-send-email-rmanohar@qti.qualcomm.com>
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

Allow driver to cache the throttle state when the devie is not
yet started. Configure the cached throttle state while powering
up the device. Since thermal daemon is unaware of the up/down cycle,
it assumes that device is throttled.

Reported-by: Matthias Kaehlcke <mka@google.com>
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/thermal.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 7aef064..3720c86 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -52,19 +52,19 @@ ath10k_thermal_set_cur_throttle_state(struct thermal_cooling_device *cdev,
 	struct ath10k *ar = cdev->devdata;
 	int ret = 0;
 
+	if (throttle_state > ATH10K_THERMAL_THROTTLE_MAX) {
+		ath10k_warn(ar, "throttle state %ld is exceeding the limit %d\n",
+			    throttle_state, ATH10K_THERMAL_THROTTLE_MAX);
+		return -EINVAL;
+	}
 	mutex_lock(&ar->conf_mutex);
+	ar->thermal.throttle_state = throttle_state;
+
 	if (ar->state != ATH10K_STATE_ON) {
 		ret = -ENETDOWN;
 		goto out;
 	}
 
-	if (throttle_state > ATH10K_THERMAL_THROTTLE_MAX) {
-		ath10k_warn(ar, "throttle state %ld is exceeding the limit %d\n",
-			    throttle_state, ATH10K_THERMAL_THROTTLE_MAX);
-		ret = -EINVAL;
-		goto out;
-	}
-	ar->thermal.throttle_state = throttle_state;
 	ath10k_thermal_set_throttling(ar);
 out:
 	mutex_unlock(&ar->conf_mutex);
-- 
2.3.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
