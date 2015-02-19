Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YOVKG-00076q-Kk
 for ath10k@lists.infradead.org; Thu, 19 Feb 2015 17:55:49 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 1/2] ath10k: increase duty cycle maximum limit
Date: Thu, 19 Feb 2015 23:25:05 +0530
Message-ID: <1424368506-18193-1-git-send-email-rmanohar@qti.qualcomm.com>
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

Allow user to configure the duty cycle upto 100%. Since thermal
mitigation algorithm is running in user space, remove the driver
level limitation and let the user to control the temperature.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/thermal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.h b/drivers/net/wireless/ath/ath10k/thermal.h
index bccc17a..5e87d9a 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.h
+++ b/drivers/net/wireless/ath/ath10k/thermal.h
@@ -19,7 +19,7 @@
 #define ATH10K_QUIET_PERIOD_DEFAULT     100
 #define ATH10K_QUIET_PERIOD_MIN         25
 #define ATH10K_QUIET_START_OFFSET       10
-#define ATH10K_QUIET_DUTY_CYCLE_MAX     70
+#define ATH10K_QUIET_DUTY_CYCLE_MAX     100
 #define ATH10K_HWMON_NAME_LEN           15
 #define ATH10K_THERMAL_SYNC_TIMEOUT_HZ (5*HZ)
 
-- 
2.3.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
