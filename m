Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1HZ2-0007g6-GP
 for ath10k@lists.infradead.org; Tue, 24 Nov 2015 17:39:41 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH 1/3] ath10k: update WMI 10.x service map
Date: Tue, 24 Nov 2015 09:37:33 -0800
Message-ID: <1448386655-13936-2-git-send-email-poh@qca.qualcomm.com>
In-Reply-To: <1448386655-13936-1-git-send-email-poh@qca.qualcomm.com>
References: <1448386655-13936-1-git-send-email-poh@qca.qualcomm.com>
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

Update WMI 10.x service map to sync with firmware 10.2.4.70.12-2
released on 11/11/2015 which is the latest QCA988X firmware as of
11/18/2015.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 80d3f1c..0747055 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -208,6 +208,11 @@ enum wmi_10x_service {
 	WMI_10X_SERVICE_SMART_ANTENNA_HW_SUPPORT,
 	WMI_10X_SERVICE_ATF,
 	WMI_10X_SERVICE_COEX_GPIO,
+	WMI_10X_SERVICE_AUX_SPECTRAL_INTF,
+	WMI_10X_SERVICE_AUX_CHAN_LOAD_INTF,
+	WMI_10X_SERVICE_BSS_CHANNEL_INFO_64,
+	WMI_10X_SERVICE_MESH,
+	WMI_10X_SERVICE_EXT_RES_CFG_SUPPORT,
 };
 
 enum wmi_main_service {
@@ -448,6 +453,16 @@ static inline void wmi_10x_svc_map(const __le32 *in, unsigned long *out,
 	       WMI_SERVICE_ATF, len);
 	SVCMAP(WMI_10X_SERVICE_COEX_GPIO,
 	       WMI_SERVICE_COEX_GPIO, len);
+	SVCMAP(WMI_10X_SERVICE_AUX_SPECTRAL_INTF,
+	       WMI_SERVICE_AUX_SPECTRAL_INTF, len);
+	SVCMAP(WMI_10X_SERVICE_AUX_CHAN_LOAD_INTF,
+	       WMI_SERVICE_AUX_CHAN_LOAD_INTF, len);
+	SVCMAP(WMI_10X_SERVICE_BSS_CHANNEL_INFO_64,
+	       WMI_SERVICE_BSS_CHANNEL_INFO_64, len);
+	SVCMAP(WMI_10X_SERVICE_MESH,
+	       WMI_SERVICE_MESH, len);
+	SVCMAP(WMI_10X_SERVICE_EXT_RES_CFG_SUPPORT,
+	       WMI_SERVICE_EXT_RES_CFG_SUPPORT, len);
 }
 
 static inline void wmi_main_svc_map(const __le32 *in, unsigned long *out,
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
