Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YceDY-0000lq-FD
 for ath10k@lists.infradead.org; Mon, 30 Mar 2015 18:15:21 +0000
From: Yanbo Li <yanbol@qca.qualcomm.com>
Subject: [PATCH 2/2] ath10k: Enable the BT-coex feature
Date: Mon, 30 Mar 2015 11:14:06 -0700
Message-ID: <1427739246-2734-2-git-send-email-yanbol@qca.qualcomm.com>
In-Reply-To: <1427739246-2734-1-git-send-email-yanbol@qca.qualcomm.com>
References: <1427739246-2734-1-git-send-email-yanbol@qca.qualcomm.com>
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
To: kvalo@qca.qualcomm.com
Cc: dreamfly281@gmail.com, linux-wireless@vger.kernel.org, michal.kazior@tieto.com, ath10k@lists.infradead.org

The new 10.2.4 FW support the BT-coex feature with external BT module,
The external BT modules can communicate with it via the GPIO. This patch
check the BT-coex capability of the FW and enable it by default.

Signed-off-by: Yanbo Li <yanbol@qca.qualcomm.com>

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 54430a1a3f73..bff55188af9b 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3960,6 +3960,8 @@ static struct sk_buff *ath10k_wmi_10_2_op_gen_init(struct ath10k *ar)
 	cmd = (struct wmi_init_cmd_10_2 *)buf->data;
 
 	features = WMI_10_2_RX_BATCH_MODE;
+	if (test_bit(WMI_SERVICE_COEX_GPIO, ar->wmi.svc_map))
+		features |= WMI_10_2_COEX_GPIO;
 	cmd->resource_config.feature_mask = __cpu_to_le32(features);
 
 	memcpy(&cmd->resource_config.common, &config, sizeof(config));
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index a8f39d69eee2..b570dd391efa 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -149,6 +149,7 @@ enum wmi_service {
 	WMI_SERVICE_MDNS_OFFLOAD,
 	WMI_SERVICE_SAP_AUTH_OFFLOAD,
 	WMI_SERVICE_ATF,
+	WMI_SERVICE_COEX_GPIO,
 
 	/* keep last */
 	WMI_SERVICE_MAX,
@@ -179,6 +180,7 @@ enum wmi_10x_service {
 	WMI_10X_SERVICE_FORCE_FW_HANG,
 	WMI_10X_SERVICE_SMART_ANTENNA_HW_SUPPORT,
 	WMI_10X_SERVICE_ATF,
+	WMI_10X_SERVICE_COEX_GPIO,
 };
 
 enum wmi_main_service {
@@ -296,6 +298,7 @@ static inline char *wmi_service_name(int service_id)
 	SVCSTR(WMI_SERVICE_MDNS_OFFLOAD);
 	SVCSTR(WMI_SERVICE_SAP_AUTH_OFFLOAD);
 	SVCSTR(WMI_SERVICE_ATF);
+	SVCSTR(WMI_SERVICE_COEX_GPIO);
 	default:
 		return NULL;
 	}
@@ -361,6 +364,8 @@ static inline void wmi_10x_svc_map(const __le32 *in, unsigned long *out,
 	       WMI_SERVICE_SMART_ANTENNA_HW_SUPPORT, len);
 	SVCMAP(WMI_10X_SERVICE_ATF,
 	       WMI_SERVICE_ATF, len);
+	SVCMAP(WMI_10X_SERVICE_COEX_GPIO,
+	       WMI_SERVICE_COEX_GPIO, len);
 }
 
 static inline void wmi_main_svc_map(const __le32 *in, unsigned long *out,
@@ -1957,6 +1962,7 @@ struct wmi_resource_config_10x {
 enum wmi_10_2_feature_mask {
 	WMI_10_2_RX_BATCH_MODE = BIT(0),
 	WMI_10_2_ATF_CONFIG    = BIT(1),
+	WMI_10_2_COEX_GPIO     = BIT(3),
 };
 
 struct wmi_resource_config_10_2 {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
