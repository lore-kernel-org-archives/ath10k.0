Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJNeO-0002rn-Ta
 for ath10k@lists.infradead.org; Wed, 13 Jan 2016 15:47:57 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH 3/7] ath10k: Cleanup setting pdev paramaters
Date: Wed, 13 Jan 2016 21:16:30 +0530
Message-ID: <1452699994-5078-4-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1452699994-5078-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1452699994-5078-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Replace the local variable 'burst_enable' with 'param'
for mapping and setting pdev paraemeters and with this patch
pretty easy to extend support for new parameters adhering to
linux kernel coding guidelines

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index b4bdeb0..2dba57c 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3987,7 +3987,7 @@ static int ath10k_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 static int ath10k_start(struct ieee80211_hw *hw)
 {
 	struct ath10k *ar = hw->priv;
-	u32 burst_enable;
+	u32 param;
 	int ret = 0;
 
 	/*
@@ -4030,13 +4030,15 @@ static int ath10k_start(struct ieee80211_hw *hw)
 		goto err_power_down;
 	}
 
-	ret = ath10k_wmi_pdev_set_param(ar, ar->wmi.pdev_param->pmf_qos, 1);
+	param = ar->wmi.pdev_param->pmf_qos;
+	ret = ath10k_wmi_pdev_set_param(ar, param, 1);
 	if (ret) {
 		ath10k_warn(ar, "failed to enable PMF QOS: %d\n", ret);
 		goto err_core_stop;
 	}
 
-	ret = ath10k_wmi_pdev_set_param(ar, ar->wmi.pdev_param->dynamic_bw, 1);
+	param = ar->wmi.pdev_param->dynamic_bw;
+	ret = ath10k_wmi_pdev_set_param(ar, param, 1);
 	if (ret) {
 		ath10k_warn(ar, "failed to enable dynamic BW: %d\n", ret);
 		goto err_core_stop;
@@ -4052,8 +4054,8 @@ static int ath10k_start(struct ieee80211_hw *hw)
 	}
 
 	if (test_bit(WMI_SERVICE_BURST, ar->wmi.svc_map)) {
-		burst_enable = ar->wmi.pdev_param->burst_enable;
-		ret = ath10k_wmi_pdev_set_param(ar, burst_enable, 0);
+		param = ar->wmi.pdev_param->burst_enable;
+		ret = ath10k_wmi_pdev_set_param(ar, param, 0);
 		if (ret) {
 			ath10k_warn(ar, "failed to disable burst: %d\n", ret);
 			goto err_core_stop;
@@ -4071,8 +4073,8 @@ static int ath10k_start(struct ieee80211_hw *hw)
 	 * this problem.
 	 */
 
-	ret = ath10k_wmi_pdev_set_param(ar,
-					ar->wmi.pdev_param->arp_ac_override, 0);
+	param = ar->wmi.pdev_param->arp_ac_override;
+	ret = ath10k_wmi_pdev_set_param(ar, param, 0);
 	if (ret) {
 		ath10k_warn(ar, "failed to set arp ac override parameter: %d\n",
 			    ret);
@@ -4091,8 +4093,8 @@ static int ath10k_start(struct ieee80211_hw *hw)
 		}
 	}
 
-	ret = ath10k_wmi_pdev_set_param(ar,
-					ar->wmi.pdev_param->ani_enable, 1);
+	param = ar->wmi.pdev_param->ani_enable;
+	ret = ath10k_wmi_pdev_set_param(ar, param, 1);
 	if (ret) {
 		ath10k_warn(ar, "failed to enable ani by default: %d\n",
 			    ret);
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
