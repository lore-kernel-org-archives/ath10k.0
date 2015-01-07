Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8sA0-00006C-I1
 for ath10k@lists.infradead.org; Wed, 07 Jan 2015 15:04:37 +0000
Subject: [PATCH v2] ath10k: fix build error when hwmon is off
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 7 Jan 2015 17:04:10 +0200
Message-ID: <20150107150410.17433.49263.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

kbuild reported a linking error:

ERROR: "devm_hwmon_device_register_with_groups"
[drivers/net/wireless/ath/ath10k/ath10k_core.ko] undefined!

Fix it by returning early and letting the compiler to optimise out the function
call.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/thermal.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index d93913538d18..b14ae8d135f6 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -213,6 +213,11 @@ int ath10k_thermal_register(struct ath10k *ar)
 	if (ar->wmi.op_version != ATH10K_FW_WMI_OP_VERSION_10_2_4)
 		return 0;
 
+	/* Avoid linking error on devm_hwmon_device_register_with_groups, I
+	 * guess linux/hwmon.h is missing proper stubs. */
+	if (!config_enabled(HWMON))
+		return 0;
+
 	hwmon_dev = devm_hwmon_device_register_with_groups(ar->dev,
 							   "ath10k_hwmon", ar,
 							   ath10k_hwmon_groups);


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
