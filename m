Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zrixk-0003k5-7c
 for ath10k@lists.infradead.org; Thu, 29 Oct 2015 08:53:36 +0000
From: <c_traja@qti.qualcomm.com>
Subject: [PATCH] ath10k: Add thermal throttling support for 10.4 firmware.
Date: Thu, 29 Oct 2015 14:23:44 +0530
Message-ID: <1446108824-4675-1-git-send-email-c_traja@qti.qualcomm.com>
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
Cc: Tamizh chelvam <c_traja@qti.qualcomm.com>, linux-wireless@vger.kernel.org

From: Tamizh chelvam <c_traja@qti.qualcomm.com>

This patch enables thermal throttling support for 10.4 firmware.

Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/thermal.c |    2 +-
 drivers/net/wireless/ath/ath10k/wmi.c     |    4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 60fe562..444b52c 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -187,7 +187,7 @@ int ath10k_thermal_register(struct ath10k *ar)
 	/* Do not register hwmon device when temperature reading is not
 	 * supported by firmware
 	 */
-	if (ar->wmi.op_version != ATH10K_FW_WMI_OP_VERSION_10_2_4)
+	if (!(ar->wmi.ops->gen_pdev_get_temperature))
 		return 0;
 
 	/* Avoid linking error on devm_hwmon_device_register_with_groups, I
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 2b32f02..3e45770 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4935,6 +4935,9 @@ static void ath10k_wmi_10_4_op_rx(struct ath10k *ar, struct sk_buff *skb)
 		ath10k_dbg(ar, ATH10K_DBG_WMI,
 			   "received event id %d not implemented\n", id);
 		break;
+	case WMI_10_4_PDEV_TEMPERATURE_EVENTID:
+		ath10k_wmi_event_temperature(ar, skb);
+		break;
 	default:
 		ath10k_warn(ar, "Unknown eventid: %d\n", id);
 		break;
@@ -7344,6 +7347,7 @@ static const struct wmi_ops wmi_10_4_ops = {
 
 	/* shared with 10.2 */
 	.gen_peer_assoc = ath10k_wmi_10_2_op_gen_peer_assoc,
+	.gen_pdev_get_temperature = ath10k_wmi_10_2_op_gen_pdev_get_temperature,
 };
 
 int ath10k_wmi_attach(struct ath10k *ar)
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
