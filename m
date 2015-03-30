Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YceDY-0000m3-VI
 for ath10k@lists.infradead.org; Mon, 30 Mar 2015 18:15:21 +0000
From: Yanbo Li <yanbol@qca.qualcomm.com>
Subject: [PATCH 1/2] ath10k: Add the WMI Air Time Fairness service define
Date: Mon, 30 Mar 2015 11:14:05 -0700
Message-ID: <1427739246-2734-1-git-send-email-yanbol@qca.qualcomm.com>
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

Add the FW ATF (Air Time Fairness) service define to keep consistent
with 10.2 FW capability

Signed-off-by: Yanbo Li <yanbol@qca.qualcomm.com>

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 938e6521776b..a8f39d69eee2 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -148,6 +148,7 @@ enum wmi_service {
 	WMI_SERVICE_STA_RX_IPA_OFFLOAD_SUPPORT,
 	WMI_SERVICE_MDNS_OFFLOAD,
 	WMI_SERVICE_SAP_AUTH_OFFLOAD,
+	WMI_SERVICE_ATF,
 
 	/* keep last */
 	WMI_SERVICE_MAX,
@@ -177,6 +178,7 @@ enum wmi_10x_service {
 	WMI_10X_SERVICE_SMART_ANTENNA_SW_SUPPORT,
 	WMI_10X_SERVICE_FORCE_FW_HANG,
 	WMI_10X_SERVICE_SMART_ANTENNA_HW_SUPPORT,
+	WMI_10X_SERVICE_ATF,
 };
 
 enum wmi_main_service {
@@ -293,6 +295,7 @@ static inline char *wmi_service_name(int service_id)
 	SVCSTR(WMI_SERVICE_STA_RX_IPA_OFFLOAD_SUPPORT);
 	SVCSTR(WMI_SERVICE_MDNS_OFFLOAD);
 	SVCSTR(WMI_SERVICE_SAP_AUTH_OFFLOAD);
+	SVCSTR(WMI_SERVICE_ATF);
 	default:
 		return NULL;
 	}
@@ -356,6 +359,8 @@ static inline void wmi_10x_svc_map(const __le32 *in, unsigned long *out,
 	       WMI_SERVICE_FORCE_FW_HANG, len);
 	SVCMAP(WMI_10X_SERVICE_SMART_ANTENNA_HW_SUPPORT,
 	       WMI_SERVICE_SMART_ANTENNA_HW_SUPPORT, len);
+	SVCMAP(WMI_10X_SERVICE_ATF,
+	       WMI_SERVICE_ATF, len);
 }
 
 static inline void wmi_main_svc_map(const __le32 *in, unsigned long *out,
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
