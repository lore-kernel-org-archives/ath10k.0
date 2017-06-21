Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNbtW-0000Qo-5i
 for ath10k@lists.infradead.org; Wed, 21 Jun 2017 09:25:51 +0000
Received: by mail-pg0-x241.google.com with SMTP id e187so17812163pgc.3
 for <ath10k@lists.infradead.org>; Wed, 21 Jun 2017 02:25:29 -0700 (PDT)
From: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH] ath10k: add const to thermal_cooling_device_ops structure
Date: Wed, 21 Jun 2017 14:53:30 +0530
Message-Id: <1498037010-21024-1-git-send-email-bhumirks@gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: julia.lawall@lip6.fr, kvalo@qca.qualcomm.com, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>

Declare thermal_cooling_device_ops structure as const as it is only passed
as an argument to the function thermal_cooling_device_register and this
argument is of type const. So, declare the structure as const.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/net/wireless/ath/ath10k/thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 87948af..ef717b6 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -63,7 +63,7 @@ ath10k_thermal_set_cur_throttle_state(struct thermal_cooling_device *cdev,
 	return 0;
 }
 
-static struct thermal_cooling_device_ops ath10k_thermal_ops = {
+static const struct thermal_cooling_device_ops ath10k_thermal_ops = {
 	.get_max_state = ath10k_thermal_get_max_throttle_state,
 	.get_cur_state = ath10k_thermal_get_cur_throttle_state,
 	.set_cur_state = ath10k_thermal_set_cur_throttle_state,
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
