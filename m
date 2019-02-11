Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtDDW-0004QR-Ou
 for ath10k@lists.infradead.org; Mon, 11 Feb 2019 15:09:56 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 1/6] ath10k: add missing values to wmi_service_name()
Date: Mon, 11 Feb 2019 17:09:42 +0200
Message-Id: <1549897787-28537-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

After implementing the next patch GCC reported:

drivers/net/wireless/ath/ath10k/wmi.h:385:2: warning: enumeration value 'WMI_SERVICE_BTCOEX' not handled in switch [-Wswitch]
drivers/net/wireless/ath/ath10k/wmi.h:385:2: warning: enumeration value 'WMI_SERVICE_MGMT_TX_WMI' not handled in switch [-Wswitch]
drivers/net/wireless/ath/ath10k/wmi.h:385:2: warning: enumeration value 'WMI_SERVICE_SPOOF_MAC_SUPPORT' not handled in switch [-Wswitch]
drivers/net/wireless/ath/ath10k/wmi.h:385:2: warning: enumeration value 'WMI_SERVICE_VDEV_DISABLE_4_ADDR_SRC_LRN_SUPPORT' not handled in switch [-Wswitch]
drivers/net/wireless/ath/ath10k/wmi.h:385:2: warning: enumeration value 'WMI_SERVICE_BB_TIMING_CONFIG_SUPPORT' not handled in switch [-Wswitch]
drivers/net/wireless/ath/ath10k/wmi.h:385:2: warning: enumeration value 'WMI_SERVICE_THERM_THROT' not handled in switch [-Wswitch]

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index b10ed523b99e..529f5a26f3f3 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -475,6 +475,7 @@ static inline char *wmi_service_name(int service_id)
 	SVCSTR(WMI_SERVICE_TX_MODE_PUSH_PULL);
 	SVCSTR(WMI_SERVICE_TX_MODE_DYNAMIC);
 	SVCSTR(WMI_SERVICE_VDEV_RX_FILTER);
+	SVCSTR(WMI_SERVICE_BTCOEX);
 	SVCSTR(WMI_SERVICE_CHECK_CAL_VERSION);
 	SVCSTR(WMI_SERVICE_DBGLOG_WARN2);
 	SVCSTR(WMI_SERVICE_BTCOEX_DUTY_CYCLE);
@@ -484,13 +485,18 @@ static inline char *wmi_service_name(int service_id)
 	SVCSTR(WMI_SERVICE_SMART_LOGGING_SUPPORT);
 	SVCSTR(WMI_SERVICE_TDLS_CONN_TRACKER_IN_HOST_MODE);
 	SVCSTR(WMI_SERVICE_TDLS_EXPLICIT_MODE_ONLY);
+	SVCSTR(WMI_SERVICE_MGMT_TX_WMI);
 	SVCSTR(WMI_SERVICE_TDLS_WIDER_BANDWIDTH);
 	SVCSTR(WMI_SERVICE_HTT_MGMT_TX_COMP_VALID_FLAGS);
 	SVCSTR(WMI_SERVICE_HOST_DFS_CHECK_SUPPORT);
 	SVCSTR(WMI_SERVICE_TPC_STATS_FINAL);
 	SVCSTR(WMI_SERVICE_RESET_CHIP);
+	SVCSTR(WMI_SERVICE_SPOOF_MAC_SUPPORT);
 	SVCSTR(WMI_SERVICE_TX_DATA_ACK_RSSI);
 	SVCSTR(WMI_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT);
+	SVCSTR(WMI_SERVICE_VDEV_DISABLE_4_ADDR_SRC_LRN_SUPPORT);
+	SVCSTR(WMI_SERVICE_BB_TIMING_CONFIG_SUPPORT);
+	SVCSTR(WMI_SERVICE_THERM_THROT);
 	SVCSTR(WMI_SERVICE_RTT_RESPONDER_ROLE);
 	SVCSTR(WMI_SERVICE_PER_PACKET_SW_ENCRYPT);
 	SVCSTR(WMI_SERVICE_REPORT_AIRTIME);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
