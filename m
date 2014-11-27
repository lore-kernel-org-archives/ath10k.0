Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtvJ5-0006Og-6m
 for ath10k@lists.infradead.org; Thu, 27 Nov 2014 09:24:16 +0000
Received: by mail-wi0-f175.google.com with SMTP id l15so15129909wiw.2
 for <ath10k@lists.infradead.org>; Thu, 27 Nov 2014 01:23:45 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 2/7] ath10k: add sanity checks for service bmap parsing
Date: Thu, 27 Nov 2014 10:11:16 +0100
Message-Id: <1417079481-22255-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1417079481-22255-1-git-send-email-michal.kazior@tieto.com>
References: <1417079481-22255-1-git-send-email-michal.kazior@tieto.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

This shouldn't really happen but take into account
the original service bitmap length when mapping
service ids.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

Notes:
    v2:
     * remove space between brackets as per checkpatch warning

 drivers/net/wireless/ath/ath10k/wmi.c |   6 +-
 drivers/net/wireless/ath/ath10k/wmi.h | 121 +++++++++++++++++-----------------
 2 files changed, 66 insertions(+), 61 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index c6c03e5..81ccc2e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2516,10 +2516,12 @@ static void ath10k_wmi_event_service_ready(struct ath10k *ar,
 
 	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
 		ret = ath10k_wmi_10x_pull_svc_rdy_ev(skb, &arg);
-		wmi_10x_svc_map(arg.service_map, svc_bmap);
+		wmi_10x_svc_map(arg.service_map, svc_bmap,
+				arg.service_map_len);
 	} else {
 		ret = ath10k_wmi_main_pull_svc_rdy_ev(skb, &arg);
-		wmi_main_svc_map(arg.service_map, svc_bmap);
+		wmi_main_svc_map(arg.service_map, svc_bmap,
+				 arg.service_map_len);
 	}
 
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index fc6b844..724929d 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -222,128 +222,131 @@ static inline char *wmi_service_name(int service_id)
 #undef SVCSTR
 }
 
-#define WMI_SERVICE_IS_ENABLED(wmi_svc_bmap, svc_id) \
-	(__le32_to_cpu((wmi_svc_bmap)[(svc_id)/(sizeof(u32))]) & \
+#define WMI_SERVICE_IS_ENABLED(wmi_svc_bmap, svc_id, len) \
+	((svc_id) < (len) && \
+	 __le32_to_cpu((wmi_svc_bmap)[(svc_id)/(sizeof(u32))]) & \
 	 BIT((svc_id)%(sizeof(u32))))
 
-#define SVCMAP(x, y) \
+#define SVCMAP(x, y, len) \
 	do { \
-		if (WMI_SERVICE_IS_ENABLED((in), (x))) \
+		if (WMI_SERVICE_IS_ENABLED((in), (x), (len))) \
 			__set_bit(y, out); \
 	} while (0)
 
-static inline void wmi_10x_svc_map(const __le32 *in, unsigned long *out)
+static inline void wmi_10x_svc_map(const __le32 *in, unsigned long *out,
+				   size_t len)
 {
 	SVCMAP(WMI_10X_SERVICE_BEACON_OFFLOAD,
-	       WMI_SERVICE_BEACON_OFFLOAD);
+	       WMI_SERVICE_BEACON_OFFLOAD, len);
 	SVCMAP(WMI_10X_SERVICE_SCAN_OFFLOAD,
-	       WMI_SERVICE_SCAN_OFFLOAD);
+	       WMI_SERVICE_SCAN_OFFLOAD, len);
 	SVCMAP(WMI_10X_SERVICE_ROAM_OFFLOAD,
-	       WMI_SERVICE_ROAM_OFFLOAD);
+	       WMI_SERVICE_ROAM_OFFLOAD, len);
 	SVCMAP(WMI_10X_SERVICE_BCN_MISS_OFFLOAD,
-	       WMI_SERVICE_BCN_MISS_OFFLOAD);
+	       WMI_SERVICE_BCN_MISS_OFFLOAD, len);
 	SVCMAP(WMI_10X_SERVICE_STA_PWRSAVE,
-	       WMI_SERVICE_STA_PWRSAVE);
+	       WMI_SERVICE_STA_PWRSAVE, len);
 	SVCMAP(WMI_10X_SERVICE_STA_ADVANCED_PWRSAVE,
-	       WMI_SERVICE_STA_ADVANCED_PWRSAVE);
+	       WMI_SERVICE_STA_ADVANCED_PWRSAVE, len);
 	SVCMAP(WMI_10X_SERVICE_AP_UAPSD,
-	       WMI_SERVICE_AP_UAPSD);
+	       WMI_SERVICE_AP_UAPSD, len);
 	SVCMAP(WMI_10X_SERVICE_AP_DFS,
-	       WMI_SERVICE_AP_DFS);
+	       WMI_SERVICE_AP_DFS, len);
 	SVCMAP(WMI_10X_SERVICE_11AC,
-	       WMI_SERVICE_11AC);
+	       WMI_SERVICE_11AC, len);
 	SVCMAP(WMI_10X_SERVICE_BLOCKACK,
-	       WMI_SERVICE_BLOCKACK);
+	       WMI_SERVICE_BLOCKACK, len);
 	SVCMAP(WMI_10X_SERVICE_PHYERR,
-	       WMI_SERVICE_PHYERR);
+	       WMI_SERVICE_PHYERR, len);
 	SVCMAP(WMI_10X_SERVICE_BCN_FILTER,
-	       WMI_SERVICE_BCN_FILTER);
+	       WMI_SERVICE_BCN_FILTER, len);
 	SVCMAP(WMI_10X_SERVICE_RTT,
-	       WMI_SERVICE_RTT);
+	       WMI_SERVICE_RTT, len);
 	SVCMAP(WMI_10X_SERVICE_RATECTRL,
-	       WMI_SERVICE_RATECTRL);
+	       WMI_SERVICE_RATECTRL, len);
 	SVCMAP(WMI_10X_SERVICE_WOW,
-	       WMI_SERVICE_WOW);
+	       WMI_SERVICE_WOW, len);
 	SVCMAP(WMI_10X_SERVICE_RATECTRL_CACHE,
-	       WMI_SERVICE_RATECTRL_CACHE);
+	       WMI_SERVICE_RATECTRL_CACHE, len);
 	SVCMAP(WMI_10X_SERVICE_IRAM_TIDS,
-	       WMI_SERVICE_IRAM_TIDS);
+	       WMI_SERVICE_IRAM_TIDS, len);
 	SVCMAP(WMI_10X_SERVICE_BURST,
-	       WMI_SERVICE_BURST);
+	       WMI_SERVICE_BURST, len);
 	SVCMAP(WMI_10X_SERVICE_SMART_ANTENNA_SW_SUPPORT,
-	       WMI_SERVICE_SMART_ANTENNA_SW_SUPPORT);
+	       WMI_SERVICE_SMART_ANTENNA_SW_SUPPORT, len);
 	SVCMAP(WMI_10X_SERVICE_FORCE_FW_HANG,
-	       WMI_SERVICE_FORCE_FW_HANG);
+	       WMI_SERVICE_FORCE_FW_HANG, len);
 	SVCMAP(WMI_10X_SERVICE_SMART_ANTENNA_HW_SUPPORT,
-	       WMI_SERVICE_SMART_ANTENNA_HW_SUPPORT);
+	       WMI_SERVICE_SMART_ANTENNA_HW_SUPPORT, len);
 }
 
-static inline void wmi_main_svc_map(const __le32 *in, unsigned long *out)
+static inline void wmi_main_svc_map(const __le32 *in, unsigned long *out,
+				    size_t len)
 {
 	SVCMAP(WMI_MAIN_SERVICE_BEACON_OFFLOAD,
-	       WMI_SERVICE_BEACON_OFFLOAD);
+	       WMI_SERVICE_BEACON_OFFLOAD, len);
 	SVCMAP(WMI_MAIN_SERVICE_SCAN_OFFLOAD,
-	       WMI_SERVICE_SCAN_OFFLOAD);
+	       WMI_SERVICE_SCAN_OFFLOAD, len);
 	SVCMAP(WMI_MAIN_SERVICE_ROAM_OFFLOAD,
-	       WMI_SERVICE_ROAM_OFFLOAD);
+	       WMI_SERVICE_ROAM_OFFLOAD, len);
 	SVCMAP(WMI_MAIN_SERVICE_BCN_MISS_OFFLOAD,
-	       WMI_SERVICE_BCN_MISS_OFFLOAD);
+	       WMI_SERVICE_BCN_MISS_OFFLOAD, len);
 	SVCMAP(WMI_MAIN_SERVICE_STA_PWRSAVE,
-	       WMI_SERVICE_STA_PWRSAVE);
+	       WMI_SERVICE_STA_PWRSAVE, len);
 	SVCMAP(WMI_MAIN_SERVICE_STA_ADVANCED_PWRSAVE,
-	       WMI_SERVICE_STA_ADVANCED_PWRSAVE);
+	       WMI_SERVICE_STA_ADVANCED_PWRSAVE, len);
 	SVCMAP(WMI_MAIN_SERVICE_AP_UAPSD,
-	       WMI_SERVICE_AP_UAPSD);
+	       WMI_SERVICE_AP_UAPSD, len);
 	SVCMAP(WMI_MAIN_SERVICE_AP_DFS,
-	       WMI_SERVICE_AP_DFS);
+	       WMI_SERVICE_AP_DFS, len);
 	SVCMAP(WMI_MAIN_SERVICE_11AC,
-	       WMI_SERVICE_11AC);
+	       WMI_SERVICE_11AC, len);
 	SVCMAP(WMI_MAIN_SERVICE_BLOCKACK,
-	       WMI_SERVICE_BLOCKACK);
+	       WMI_SERVICE_BLOCKACK, len);
 	SVCMAP(WMI_MAIN_SERVICE_PHYERR,
-	       WMI_SERVICE_PHYERR);
+	       WMI_SERVICE_PHYERR, len);
 	SVCMAP(WMI_MAIN_SERVICE_BCN_FILTER,
-	       WMI_SERVICE_BCN_FILTER);
+	       WMI_SERVICE_BCN_FILTER, len);
 	SVCMAP(WMI_MAIN_SERVICE_RTT,
-	       WMI_SERVICE_RTT);
+	       WMI_SERVICE_RTT, len);
 	SVCMAP(WMI_MAIN_SERVICE_RATECTRL,
-	       WMI_SERVICE_RATECTRL);
+	       WMI_SERVICE_RATECTRL, len);
 	SVCMAP(WMI_MAIN_SERVICE_WOW,
-	       WMI_SERVICE_WOW);
+	       WMI_SERVICE_WOW, len);
 	SVCMAP(WMI_MAIN_SERVICE_RATECTRL_CACHE,
-	       WMI_SERVICE_RATECTRL_CACHE);
+	       WMI_SERVICE_RATECTRL_CACHE, len);
 	SVCMAP(WMI_MAIN_SERVICE_IRAM_TIDS,
-	       WMI_SERVICE_IRAM_TIDS);
+	       WMI_SERVICE_IRAM_TIDS, len);
 	SVCMAP(WMI_MAIN_SERVICE_ARPNS_OFFLOAD,
-	       WMI_SERVICE_ARPNS_OFFLOAD);
+	       WMI_SERVICE_ARPNS_OFFLOAD, len);
 	SVCMAP(WMI_MAIN_SERVICE_NLO,
-	       WMI_SERVICE_NLO);
+	       WMI_SERVICE_NLO, len);
 	SVCMAP(WMI_MAIN_SERVICE_GTK_OFFLOAD,
-	       WMI_SERVICE_GTK_OFFLOAD);
+	       WMI_SERVICE_GTK_OFFLOAD, len);
 	SVCMAP(WMI_MAIN_SERVICE_SCAN_SCH,
-	       WMI_SERVICE_SCAN_SCH);
+	       WMI_SERVICE_SCAN_SCH, len);
 	SVCMAP(WMI_MAIN_SERVICE_CSA_OFFLOAD,
-	       WMI_SERVICE_CSA_OFFLOAD);
+	       WMI_SERVICE_CSA_OFFLOAD, len);
 	SVCMAP(WMI_MAIN_SERVICE_CHATTER,
-	       WMI_SERVICE_CHATTER);
+	       WMI_SERVICE_CHATTER, len);
 	SVCMAP(WMI_MAIN_SERVICE_COEX_FREQAVOID,
-	       WMI_SERVICE_COEX_FREQAVOID);
+	       WMI_SERVICE_COEX_FREQAVOID, len);
 	SVCMAP(WMI_MAIN_SERVICE_PACKET_POWER_SAVE,
-	       WMI_SERVICE_PACKET_POWER_SAVE);
+	       WMI_SERVICE_PACKET_POWER_SAVE, len);
 	SVCMAP(WMI_MAIN_SERVICE_FORCE_FW_HANG,
-	       WMI_SERVICE_FORCE_FW_HANG);
+	       WMI_SERVICE_FORCE_FW_HANG, len);
 	SVCMAP(WMI_MAIN_SERVICE_GPIO,
-	       WMI_SERVICE_GPIO);
+	       WMI_SERVICE_GPIO, len);
 	SVCMAP(WMI_MAIN_SERVICE_STA_DTIM_PS_MODULATED_DTIM,
-	       WMI_SERVICE_STA_DTIM_PS_MODULATED_DTIM);
+	       WMI_SERVICE_STA_DTIM_PS_MODULATED_DTIM, len);
 	SVCMAP(WMI_MAIN_SERVICE_STA_UAPSD_BASIC_AUTO_TRIG,
-	       WMI_SERVICE_STA_UAPSD_BASIC_AUTO_TRIG);
+	       WMI_SERVICE_STA_UAPSD_BASIC_AUTO_TRIG, len);
 	SVCMAP(WMI_MAIN_SERVICE_STA_UAPSD_VAR_AUTO_TRIG,
-	       WMI_SERVICE_STA_UAPSD_VAR_AUTO_TRIG);
+	       WMI_SERVICE_STA_UAPSD_VAR_AUTO_TRIG, len);
 	SVCMAP(WMI_MAIN_SERVICE_STA_KEEP_ALIVE,
-	       WMI_SERVICE_STA_KEEP_ALIVE);
+	       WMI_SERVICE_STA_KEEP_ALIVE, len);
 	SVCMAP(WMI_MAIN_SERVICE_TX_ENCAP,
-	       WMI_SERVICE_TX_ENCAP);
+	       WMI_SERVICE_TX_ENCAP, len);
 }
 
 #undef SVCMAP
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
