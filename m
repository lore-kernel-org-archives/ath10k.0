Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAxgh-0005Wi-8j
 for ath10k@lists.infradead.org; Tue, 13 Jan 2015 09:23:00 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH] ath10k: fix duration calculation for quiet param
Date: Tue, 13 Jan 2015 14:52:14 +0530
Message-ID: <1421140934-16109-1-git-send-email-rmanohar@qti.qualcomm.com>
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

The duty cycle (% of quiet duration) is used to put the device
in quiet mode for the given period. Currently the quiet duration
is wrongly calculated which results in not enabling quiet mode.
Fix the calculation as below

     duration = (period * duty cycle) / 100

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index edecc6c..aede750 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -98,7 +98,7 @@ static int ath10k_thermal_set_cur_dutycycle(struct thermal_cooling_device *cdev,
 	}
 	period = max(ATH10K_QUIET_PERIOD_MIN,
 		     (ATH10K_QUIET_PERIOD_DEFAULT / num_bss));
-	duration = period * (duty_cycle / 100);
+	duration = (period * duty_cycle) / 100;
 	enabled = duration ? 1 : 0;
 
 	ret = ath10k_wmi_pdev_set_quiet_mode(ar, period, duration,
-- 
2.2.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
