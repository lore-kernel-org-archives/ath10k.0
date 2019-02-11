Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtDDX-0004Qf-It
 for ath10k@lists.infradead.org; Mon, 11 Feb 2019 15:09:56 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 2/6] ath10k: make wmi_service_name() warn about missing
 service ids
Date: Mon, 11 Feb 2019 17:09:43 +0200
Message-Id: <1549897787-28537-2-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1549897787-28537-1-git-send-email-kvalo@codeaurora.org>
References: <1549897787-28537-1-git-send-email-kvalo@codeaurora.org>
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

When adding a new value to enum wmi_service it's very easy to miss that the new
value should be also added to wmi_service_name() mapping function. Modify the
function so that GCC can now warn about this:

drivers/net/wireless/ath/ath10k/wmi.h:385:2: warning: enumeration value 'WMI_SERVICE_FOO' not handled in switch [-Wswitch]

And also add a reminder to the enum.

Thanks to Jouni Malinen for the idea.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 529f5a26f3f3..74ce1a4c0e8f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -212,6 +212,8 @@ enum wmi_service {
 	WMI_SERVICE_PER_PACKET_SW_ENCRYPT,
 	WMI_SERVICE_REPORT_AIRTIME,
 
+	/* Remember to add the new value to wmi_service_name()! */
+
 	/* keep last */
 	WMI_SERVICE_MAX,
 };
@@ -378,7 +380,7 @@ enum wmi_10_4_service {
 	WMI_10_4_SERVICE_REPORT_AIRTIME,
 };
 
-static inline char *wmi_service_name(int service_id)
+static inline char *wmi_service_name(enum wmi_service service_id)
 {
 #define SVCSTR(x) case x: return #x
 
@@ -501,11 +503,13 @@ static inline char *wmi_service_name(int service_id)
 	SVCSTR(WMI_SERVICE_PER_PACKET_SW_ENCRYPT);
 	SVCSTR(WMI_SERVICE_REPORT_AIRTIME);
 
-	default:
+	case WMI_SERVICE_MAX:
 		return NULL;
 	}
 
 #undef SVCSTR
+
+	return NULL;
 }
 
 #define WMI_SERVICE_IS_ENABLED(wmi_svc_bmap, svc_id, len) \
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
