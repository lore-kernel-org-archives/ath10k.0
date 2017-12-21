Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eS1ue-00055w-3A
 for ath10k@lists.infradead.org; Thu, 21 Dec 2017 14:33:33 +0000
From: <bpothuno@qti.qualcomm.com>
Subject: [PATCH] ath10k: advertising tdls wider bandwidth support for 5GHz
Date: Thu, 21 Dec 2017 20:00:42 +0530
Message-ID: <1513866642-709-1-git-send-email-bpothuno@qti.qualcomm.com>
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
Cc: Balaji Pothunoori <bpothuno@qti.qualcomm.com>, linux-wireless@vger.kernel.org

From: Balaji Pothunoori <bpothuno@qti.qualcomm.com>

This patch advertise tdls wider bandwidth support for 5GHz
based on firmware wmi capabilties.

This patch is required for chipset QCA9888.
Firmware Versoin : 10.4-3.5.1-00018.

Signed-off-by: Balaji Pothunoori <bpothuno@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 ++-
 drivers/net/wireless/ath/ath10k/wmi.h | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 0298cce..9df455f 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8271,7 +8271,8 @@ int ath10k_mac_register(struct ath10k *ar)
 	if (test_bit(WMI_SERVICE_TDLS, ar->wmi.svc_map) ||
 	    test_bit(WMI_SERVICE_TDLS_EXPLICIT_MODE_ONLY, ar->wmi.svc_map)) {
 		ar->hw->wiphy->flags |= WIPHY_FLAG_SUPPORTS_TDLS;
-		ieee80211_hw_set(ar->hw, TDLS_WIDER_BW);
+		if (test_bit(WMI_SERVICE_TDLS_WIDER_BANDWIDTH, ar->wmi.svc_map))
+			ieee80211_hw_set(ar->hw, TDLS_WIDER_BW);
 	}
 
 	ar->hw->wiphy->flags |= WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index f6d60dc..0fe87ab 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -196,6 +196,7 @@ enum wmi_service {
 	WMI_SERVICE_TDLS_CONN_TRACKER_IN_HOST_MODE,
 	WMI_SERVICE_TDLS_EXPLICIT_MODE_ONLY,
 	WMI_SERVICE_MGMT_TX_WMI,
+	WMI_SERVICE_TDLS_WIDER_BANDWIDTH,
 
 	/* keep last */
 	WMI_SERVICE_MAX,
@@ -337,6 +338,7 @@ enum wmi_10_4_service {
 	WMI_10_4_SERVICE_TDLS_UAPSD_SLEEP_STA,
 	WMI_10_4_SERVICE_TDLS_CONN_TRACKER_IN_HOST_MODE,
 	WMI_10_4_SERVICE_TDLS_EXPLICIT_MODE_ONLY,
+	WMI_10_4_SERVICE_TDLS_WIDER_BANDWIDTH,
 };
 
 static inline char *wmi_service_name(int service_id)
@@ -445,6 +447,7 @@ static inline char *wmi_service_name(int service_id)
 	SVCSTR(WMI_SERVICE_SMART_LOGGING_SUPPORT);
 	SVCSTR(WMI_SERVICE_TDLS_CONN_TRACKER_IN_HOST_MODE);
 	SVCSTR(WMI_SERVICE_TDLS_EXPLICIT_MODE_ONLY);
+	SVCSTR(WMI_SERVICE_TDLS_WIDER_BANDWIDTH);
 	default:
 		return NULL;
 	}
@@ -741,6 +744,8 @@ static inline void wmi_10_4_svc_map(const __le32 *in, unsigned long *out,
 	       WMI_SERVICE_TDLS_CONN_TRACKER_IN_HOST_MODE, len);
 	SVCMAP(WMI_10_4_SERVICE_TDLS_EXPLICIT_MODE_ONLY,
 	       WMI_SERVICE_TDLS_EXPLICIT_MODE_ONLY, len);
+	SVCMAP(WMI_10_4_SERVICE_TDLS_WIDER_BANDWIDTH,
+	       WMI_SERVICE_TDLS_WIDER_BANDWIDTH, len);
 }
 
 #undef SVCMAP
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
