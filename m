Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1aOuZL-0005UQ-BK
 for ath10k@lists.infradead.org; Thu, 28 Jan 2016 21:57:35 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH v2 2/4] ath10k: update 10.4 WMI service map
Date: Thu, 28 Jan 2016 13:54:08 -0800
Message-ID: <20d44823ecdacb54a92efaf56020c9d2f2cc4ff5.1454015989.git.poh@qca.qualcomm.com>
In-Reply-To: <cover.1454015989.git.poh@qca.qualcomm.com>
References: <cover.1454015989.git.poh@qca.qualcomm.com>
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

Update 10.4 WMI service map to sync to the latest 10.4 firmware
as of 1/20/2016.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 0458bf6..031018a 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -179,6 +179,7 @@ enum wmi_service {
 	WMI_SERVICE_MESH_11S,
 	WMI_SERVICE_MESH_NON_11S,
 	WMI_SERVICE_PEER_STATS,
+	WMI_SERVICE_RESTRT_CHNL_SUPPORT,
 
 	/* keep last */
 	WMI_SERVICE_MAX,
@@ -298,6 +299,9 @@ enum wmi_10_4_service {
 	WMI_10_4_SERVICE_BSS_CHANNEL_INFO_64,
 	WMI_10_4_SERVICE_EXT_RES_CFG_SUPPORT,
 	WMI_10_4_SERVICE_MESH_NON_11S,
+	WMI_10_4_SERVICE_RESTRT_CHNL_SUPPORT,
+	WMI_10_4_SERVICE_PEER_STATS,
+	WMI_10_4_SERVICE_MESH_11S,
 };
 
 static inline char *wmi_service_name(int service_id)
@@ -391,6 +395,7 @@ static inline char *wmi_service_name(int service_id)
 	SVCSTR(WMI_SERVICE_MESH_11S);
 	SVCSTR(WMI_SERVICE_MESH_NON_11S);
 	SVCSTR(WMI_SERVICE_PEER_STATS);
+	SVCSTR(WMI_SERVICE_RESTRT_CHNL_SUPPORT);
 	default:
 		return NULL;
 	}
@@ -632,6 +637,12 @@ static inline void wmi_10_4_svc_map(const __le32 *in, unsigned long *out,
 	       WMI_SERVICE_EXT_RES_CFG_SUPPORT, len);
 	SVCMAP(WMI_10_4_SERVICE_MESH_NON_11S,
 	       WMI_SERVICE_MESH_NON_11S, len);
+	SVCMAP(WMI_10_4_SERVICE_RESTRT_CHNL_SUPPORT,
+	       WMI_SERVICE_RESTRT_CHNL_SUPPORT, len);
+	SVCMAP(WMI_10_4_SERVICE_PEER_STATS,
+	       WMI_SERVICE_PEER_STATS, len);
+	SVCMAP(WMI_10_4_SERVICE_MESH_11S,
+	       WMI_SERVICE_MESH_11S, len);
 }
 
 #undef SVCMAP
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
