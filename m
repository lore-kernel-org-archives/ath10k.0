Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-02.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXR9A-0002nT-ER
 for ath10k@lists.infradead.org; Tue, 18 Jul 2017 11:58:37 +0000
From: <mpubbise@qti.qualcomm.com>
Subject: [PATCHv2 1/3] ath10k: extend wmi service map to accommodate new
 services
Date: Tue, 18 Jul 2017 17:28:12 +0530
Message-ID: <1500379094-2373-2-git-send-email-mpubbise@qti.qualcomm.com>
In-Reply-To: <1500379094-2373-1-git-send-email-mpubbise@qti.qualcomm.com>
References: <1500379094-2373-1-git-send-email-mpubbise@qti.qualcomm.com>
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

From: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>

Though there is room to accommodate 512 services in wmi service
ready event, target uses only first 4-bits of each 32-bit word for
advertising wmi services thereby limiting max wmi services to 64.

TDLS implementation for 10.4 firmwares introduces new wmi services by
making use of remaining unused bits of each 32-bit word, therefore the
wmi service mapping in host needs to be extended.

This patch adds the logic to extend the wmi SVCMAP to accommodate new
wmi services.

Signed-off-by: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index baa38c8..3a4cbbc 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -420,9 +420,20 @@ static inline char *wmi_service_name(int service_id)
 	 __le32_to_cpu((wmi_svc_bmap)[(svc_id) / (sizeof(u32))]) & \
 	 BIT((svc_id) % (sizeof(u32))))
 
+/* This extension is required to accommodate new services, current limit
+ * for wmi_services is 64 as target is using only 4-bits of each 32-bit
+ * wmi_service word. Extending this to make use of remaining unused bits
+ * for new services.
+ */
+#define WMI_EXT_SERVICE_IS_ENABLED(wmi_svc_bmap, svc_id, len) \
+	((svc_id) >= (len) && \
+	__le32_to_cpu((wmi_svc_bmap)[((svc_id) - (len)) / 28]) & \
+	BIT(((((svc_id) - (len)) % 28) & 0x1f) + 4))
+
 #define SVCMAP(x, y, len) \
 	do { \
-		if (WMI_SERVICE_IS_ENABLED((in), (x), (len))) \
+		if ((WMI_SERVICE_IS_ENABLED((in), (x), (len))) || \
+		    (WMI_EXT_SERVICE_IS_ENABLED((in), (x), (len)))) \
 			__set_bit(y, out); \
 	} while (0)
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
