Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrnTT-0007C2-5S
 for ath10k@lists.infradead.org; Thu, 29 Oct 2015 13:42:40 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH 1/3] ath10k: Add new service defines for 10.4
Date: Thu, 29 Oct 2015 19:11:32 +0530
Message-ID: <1446126094-30880-2-git-send-email-vthiagar@qti.qualcomm.com>
In-Reply-To: <1446126094-30880-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1446126094-30880-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

No functional changes, adds new wmi service bits for
10.4 firmware to be sync with 10.4 firmware.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index cec887a..103dd8c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -175,6 +175,8 @@ enum wmi_service {
 	WMI_SERVICE_AUX_SPECTRAL_INTF,
 	WMI_SERVICE_AUX_CHAN_LOAD_INTF,
 	WMI_SERVICE_BSS_CHANNEL_INFO_64,
+	WMI_SERVICE_EXT_RES_CFG_SUPPORT,
+	WMI_SERVICE_MESH,
 
 	/* keep last */
 	WMI_SERVICE_MAX,
@@ -286,6 +288,8 @@ enum wmi_10_4_service {
 	WMI_10_4_SERVICE_AUX_SPECTRAL_INTF,
 	WMI_10_4_SERVICE_AUX_CHAN_LOAD_INTF,
 	WMI_10_4_SERVICE_BSS_CHANNEL_INFO_64,
+	WMI_10_4_SERVICE_EXT_RES_CFG_SUPPORT,
+	WMI_10_4_SERVICE_MESH,
 };
 
 static inline char *wmi_service_name(int service_id)
@@ -375,6 +379,8 @@ static inline char *wmi_service_name(int service_id)
 	SVCSTR(WMI_SERVICE_AUX_SPECTRAL_INTF);
 	SVCSTR(WMI_SERVICE_AUX_CHAN_LOAD_INTF);
 	SVCSTR(WMI_SERVICE_BSS_CHANNEL_INFO_64);
+	SVCSTR(WMI_SERVICE_EXT_RES_CFG_SUPPORT);
+	SVCSTR(WMI_SERVICE_MESH);
 	default:
 		return NULL;
 	}
@@ -600,6 +606,10 @@ static inline void wmi_10_4_svc_map(const __le32 *in, unsigned long *out,
 	       WMI_SERVICE_AUX_CHAN_LOAD_INTF, len);
 	SVCMAP(WMI_10_4_SERVICE_BSS_CHANNEL_INFO_64,
 	       WMI_SERVICE_BSS_CHANNEL_INFO_64, len);
+	SVCMAP(WMI_10_4_SERVICE_EXT_RES_CFG_SUPPORT,
+	       WMI_SERVICE_EXT_RES_CFG_SUPPORT, len);
+	SVCMAP(WMI_10_4_SERVICE_MESH,
+	       WMI_SERVICE_MESH, len);
 }
 
 #undef SVCMAP
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
