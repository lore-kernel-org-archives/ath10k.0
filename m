Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4ji2-0000IW-Kj
 for ath10k@lists.infradead.org; Tue, 16 Jun 2015 05:46:56 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH 02/10] ath10k: add 10.4 fw wmi service bitmap definition
Date: Tue, 16 Jun 2015 11:15:15 +0530
Message-ID: <1434433523-8357-3-git-send-email-rmani@qti.qualcomm.com>
In-Reply-To: <1434433523-8357-1-git-send-email-rmani@qti.qualcomm.com>
References: <1434433523-8357-1-git-send-email-rmani@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>

Include new enum to define wmi service bitmap definitions for
10.4 firmware and a function wmi_10_4_svc_map() to remap 10.4
firmware wmi service bitmap definitions to ath10k generic wmi
services.

Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c |   5 ++
 drivers/net/wireless/ath/ath10k/wmi.h | 128 ++++++++++++++++++++++++++++++++++
 2 files changed, 133 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index b32bb68..52493d1 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5412,10 +5412,15 @@ static const struct wmi_ops wmi_10_2_4_ops = {
 	/* .gen_adaptive_qcs not implemented */
 };
 
+static const struct wmi_ops wmi_10_4_ops = {
+	.map_svc = wmi_10_4_svc_map,
+};
+
 int ath10k_wmi_attach(struct ath10k *ar)
 {
 	switch (ar->wmi.op_version) {
 	case ATH10K_FW_WMI_OP_VERSION_10_4:
+		ar->wmi.ops = &wmi_10_4_ops;
 		break;
 	case ATH10K_FW_WMI_OP_VERSION_10_2_4:
 		ar->wmi.cmd = &wmi_10_2_4_cmd_map;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index cf44a3d..95b7c89 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -150,6 +150,9 @@ enum wmi_service {
 	WMI_SERVICE_SAP_AUTH_OFFLOAD,
 	WMI_SERVICE_ATF,
 	WMI_SERVICE_COEX_GPIO,
+	WMI_SERVICE_ENHANCED_PROXY_STA,
+	WMI_SERVICE_TT,
+	WMI_SERVICE_PEER_CACHING,
 
 	/* keep last */
 	WMI_SERVICE_MAX,
@@ -218,6 +221,47 @@ enum wmi_main_service {
 	WMI_MAIN_SERVICE_TX_ENCAP,
 };
 
+enum wmi_10_4_service {
+	WMI_10_4_SERVICE_BEACON_OFFLOAD = 0,
+	WMI_10_4_SERVICE_SCAN_OFFLOAD,
+	WMI_10_4_SERVICE_ROAM_OFFLOAD,
+	WMI_10_4_SERVICE_BCN_MISS_OFFLOAD,
+	WMI_10_4_SERVICE_STA_PWRSAVE,
+	WMI_10_4_SERVICE_STA_ADVANCED_PWRSAVE,
+	WMI_10_4_SERVICE_AP_UAPSD,
+	WMI_10_4_SERVICE_AP_DFS,
+	WMI_10_4_SERVICE_11AC,
+	WMI_10_4_SERVICE_BLOCKACK,
+	WMI_10_4_SERVICE_PHYERR,
+	WMI_10_4_SERVICE_BCN_FILTER,
+	WMI_10_4_SERVICE_RTT,
+	WMI_10_4_SERVICE_RATECTRL,
+	WMI_10_4_SERVICE_WOW,
+	WMI_10_4_SERVICE_RATECTRL_CACHE,
+	WMI_10_4_SERVICE_IRAM_TIDS,
+	WMI_10_4_SERVICE_BURST,
+	WMI_10_4_SERVICE_SMART_ANTENNA_SW_SUPPORT,
+	WMI_10_4_SERVICE_GTK_OFFLOAD,
+	WMI_10_4_SERVICE_SCAN_SCH,
+	WMI_10_4_SERVICE_CSA_OFFLOAD,
+	WMI_10_4_SERVICE_CHATTER,
+	WMI_10_4_SERVICE_COEX_FREQAVOID,
+	WMI_10_4_SERVICE_PACKET_POWER_SAVE,
+	WMI_10_4_SERVICE_FORCE_FW_HANG,
+	WMI_10_4_SERVICE_SMART_ANTENNA_HW_SUPPORT,
+	WMI_10_4_SERVICE_GPIO,
+	WMI_10_4_SERVICE_STA_UAPSD_BASIC_AUTO_TRIG,
+	WMI_10_4_SERVICE_STA_UAPSD_VAR_AUTO_TRIG,
+	WMI_10_4_SERVICE_STA_KEEP_ALIVE,
+	WMI_10_4_SERVICE_TX_ENCAP,
+	WMI_10_4_SERVICE_AP_PS_DETECT_OUT_OF_SYNC,
+	WMI_10_4_SERVICE_EARLY_RX,
+	WMI_10_4_SERVICE_ENHANCED_PROXY_STA,
+	WMI_10_4_SERVICE_TT,
+	WMI_10_4_SERVICE_ATF,
+	WMI_10_4_SERVICE_PEER_CACHING,
+};
+
 static inline char *wmi_service_name(int service_id)
 {
 #define SVCSTR(x) case x: return #x
@@ -299,6 +343,9 @@ static inline char *wmi_service_name(int service_id)
 	SVCSTR(WMI_SERVICE_SAP_AUTH_OFFLOAD);
 	SVCSTR(WMI_SERVICE_ATF);
 	SVCSTR(WMI_SERVICE_COEX_GPIO);
+	SVCSTR(WMI_SERVICE_ENHANCED_PROXY_STA);
+	SVCSTR(WMI_SERVICE_TT);
+	SVCSTR(WMI_SERVICE_PEER_CACHING);
 	default:
 		return NULL;
 	}
@@ -437,6 +484,87 @@ static inline void wmi_main_svc_map(const __le32 *in, unsigned long *out,
 	       WMI_SERVICE_TX_ENCAP, len);
 }
 
+static inline void wmi_10_4_svc_map(const __le32 *in, unsigned long *out,
+				    size_t len)
+{
+	SVCMAP(WMI_10_4_SERVICE_BEACON_OFFLOAD,
+	       WMI_SERVICE_BEACON_OFFLOAD, len);
+	SVCMAP(WMI_10_4_SERVICE_SCAN_OFFLOAD,
+	       WMI_SERVICE_SCAN_OFFLOAD, len);
+	SVCMAP(WMI_10_4_SERVICE_ROAM_OFFLOAD,
+	       WMI_SERVICE_ROAM_OFFLOAD, len);
+	SVCMAP(WMI_10_4_SERVICE_BCN_MISS_OFFLOAD,
+	       WMI_SERVICE_BCN_MISS_OFFLOAD, len);
+	SVCMAP(WMI_10_4_SERVICE_STA_PWRSAVE,
+	       WMI_SERVICE_STA_PWRSAVE, len);
+	SVCMAP(WMI_10_4_SERVICE_STA_ADVANCED_PWRSAVE,
+	       WMI_SERVICE_STA_ADVANCED_PWRSAVE, len);
+	SVCMAP(WMI_10_4_SERVICE_AP_UAPSD,
+	       WMI_SERVICE_AP_UAPSD, len);
+	SVCMAP(WMI_10_4_SERVICE_AP_DFS,
+	       WMI_SERVICE_AP_DFS, len);
+	SVCMAP(WMI_10_4_SERVICE_11AC,
+	       WMI_SERVICE_11AC, len);
+	SVCMAP(WMI_10_4_SERVICE_BLOCKACK,
+	       WMI_SERVICE_BLOCKACK, len);
+	SVCMAP(WMI_10_4_SERVICE_PHYERR,
+	       WMI_SERVICE_PHYERR, len);
+	SVCMAP(WMI_10_4_SERVICE_BCN_FILTER,
+	       WMI_SERVICE_BCN_FILTER, len);
+	SVCMAP(WMI_10_4_SERVICE_RTT,
+	       WMI_SERVICE_RTT, len);
+	SVCMAP(WMI_10_4_SERVICE_RATECTRL,
+	       WMI_SERVICE_RATECTRL, len);
+	SVCMAP(WMI_10_4_SERVICE_WOW,
+	       WMI_SERVICE_WOW, len);
+	SVCMAP(WMI_10_4_SERVICE_RATECTRL_CACHE,
+	       WMI_SERVICE_RATECTRL_CACHE, len);
+	SVCMAP(WMI_10_4_SERVICE_IRAM_TIDS,
+	       WMI_SERVICE_IRAM_TIDS, len);
+	SVCMAP(WMI_10_4_SERVICE_BURST,
+	       WMI_SERVICE_BURST, len);
+	SVCMAP(WMI_10_4_SERVICE_SMART_ANTENNA_SW_SUPPORT,
+	       WMI_SERVICE_SMART_ANTENNA_SW_SUPPORT, len);
+	SVCMAP(WMI_10_4_SERVICE_GTK_OFFLOAD,
+	       WMI_SERVICE_GTK_OFFLOAD, len);
+	SVCMAP(WMI_10_4_SERVICE_SCAN_SCH,
+	       WMI_SERVICE_SCAN_SCH, len);
+	SVCMAP(WMI_10_4_SERVICE_CSA_OFFLOAD,
+	       WMI_SERVICE_CSA_OFFLOAD, len);
+	SVCMAP(WMI_10_4_SERVICE_CHATTER,
+	       WMI_SERVICE_CHATTER, len);
+	SVCMAP(WMI_10_4_SERVICE_COEX_FREQAVOID,
+	       WMI_SERVICE_COEX_FREQAVOID, len);
+	SVCMAP(WMI_10_4_SERVICE_PACKET_POWER_SAVE,
+	       WMI_SERVICE_PACKET_POWER_SAVE, len);
+	SVCMAP(WMI_10_4_SERVICE_FORCE_FW_HANG,
+	       WMI_SERVICE_FORCE_FW_HANG, len);
+	SVCMAP(WMI_10_4_SERVICE_SMART_ANTENNA_HW_SUPPORT,
+	       WMI_SERVICE_SMART_ANTENNA_HW_SUPPORT, len);
+	SVCMAP(WMI_10_4_SERVICE_GPIO,
+	       WMI_SERVICE_GPIO, len);
+	SVCMAP(WMI_10_4_SERVICE_STA_UAPSD_BASIC_AUTO_TRIG,
+	       WMI_SERVICE_STA_UAPSD_BASIC_AUTO_TRIG, len);
+	SVCMAP(WMI_10_4_SERVICE_STA_UAPSD_VAR_AUTO_TRIG,
+	       WMI_SERVICE_STA_UAPSD_VAR_AUTO_TRIG, len);
+	SVCMAP(WMI_10_4_SERVICE_STA_KEEP_ALIVE,
+	       WMI_SERVICE_STA_KEEP_ALIVE, len);
+	SVCMAP(WMI_10_4_SERVICE_TX_ENCAP,
+	       WMI_SERVICE_TX_ENCAP, len);
+	SVCMAP(WMI_10_4_SERVICE_AP_PS_DETECT_OUT_OF_SYNC,
+	       WMI_SERVICE_AP_PS_DETECT_OUT_OF_SYNC, len);
+	SVCMAP(WMI_10_4_SERVICE_EARLY_RX,
+	       WMI_SERVICE_EARLY_RX, len);
+	SVCMAP(WMI_10_4_SERVICE_ENHANCED_PROXY_STA,
+	       WMI_SERVICE_ENHANCED_PROXY_STA, len);
+	SVCMAP(WMI_10_4_SERVICE_TT,
+	       WMI_SERVICE_TT, len);
+	SVCMAP(WMI_10_4_SERVICE_ATF,
+	       WMI_SERVICE_ATF, len);
+	SVCMAP(WMI_10_4_SERVICE_PEER_CACHING,
+	       WMI_SERVICE_PEER_CACHING, len);
+}
+
 #undef SVCMAP
 
 /* 2 word representation of MAC addr */
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
