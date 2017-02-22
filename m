Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x231.google.com ([2a00:1450:4010:c07::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cgS5b-0003QR-Dv
 for ath10k@lists.infradead.org; Wed, 22 Feb 2017 08:15:57 +0000
Received: by mail-lf0-x231.google.com with SMTP id b80so2052049lfe.3
 for <ath10k@lists.infradead.org>; Wed, 22 Feb 2017 00:15:31 -0800 (PST)
From: Marcin Rokicki <marcin.rokicki@tieto.com>
Subject: [PATCH] ath10k: Modify macros to fix style issues
Date: Wed, 22 Feb 2017 09:15:27 +0100
Message-Id: <1487751327-2917-1-git-send-email-marcin.rokicki@tieto.com>
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

Both macros are used internally to convert incomming parameters
to strings in a switch case statement.

Current implementation gives following output from checkpatch.pl:
 - ERROR: Macros with complex values should be enclosed in parentheses
 - WARNING: Macros with flow control statements should be avoided

Fix them by modify local variable in the middle and just return at the end.

Btw add const to function that return string literals

Signed-off-by: Marcin Rokicki <marcin.rokicki@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 36 +++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 427220c..0bf578f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -312,9 +312,16 @@ enum wmi_10_4_service {
 	WMI_10_4_SERVICE_TX_MODE_DYNAMIC,
 };
 
-static inline char *wmi_service_name(int service_id)
+#define SVCSTR(x) \
+{ \
+	case x: \
+		str = #x; \
+		break; \
+}
+
+static inline const char *wmi_service_name(int service_id)
 {
-#define SVCSTR(x) case x: return #x
+	const char *str = NULL;
 
 	switch (service_id) {
 	SVCSTR(WMI_SERVICE_BEACON_OFFLOAD);
@@ -408,13 +415,13 @@ static inline char *wmi_service_name(int service_id)
 	SVCSTR(WMI_SERVICE_TX_MODE_PUSH_ONLY);
 	SVCSTR(WMI_SERVICE_TX_MODE_PUSH_PULL);
 	SVCSTR(WMI_SERVICE_TX_MODE_DYNAMIC);
-	default:
-		return NULL;
 	}
 
-#undef SVCSTR
+	return str;
 }
 
+#undef SVCSTR
+
 #define WMI_SERVICE_IS_ENABLED(wmi_svc_bmap, svc_id, len) \
 	((svc_id) < (len) && \
 	 __le32_to_cpu((wmi_svc_bmap)[(svc_id) / (sizeof(u32))]) & \
@@ -6412,10 +6419,17 @@ enum wmi_wow_wakeup_event {
 	WOW_EVENT_MAX,
 };
 
-#define C2S(x) case x: return #x
+#define C2S(x) \
+{ \
+	case x: \
+		str = #x; \
+		break; \
+}
 
 static inline const char *wow_wakeup_event(enum wmi_wow_wakeup_event ev)
 {
+	const char *str = NULL;
+
 	switch (ev) {
 	C2S(WOW_BMISS_EVENT);
 	C2S(WOW_BETTER_AP_EVENT);
@@ -6442,9 +6456,9 @@ static inline const char *wow_wakeup_event(enum wmi_wow_wakeup_event ev)
 	C2S(WOW_BEACON_EVENT);
 	C2S(WOW_CLIENT_KICKOUT_EVENT);
 	C2S(WOW_EVENT_MAX);
-	default:
-		return NULL;
 	}
+
+	return str;
 }
 
 enum wmi_wow_wake_reason {
@@ -6482,6 +6496,8 @@ enum wmi_wow_wake_reason {
 
 static inline const char *wow_reason(enum wmi_wow_wake_reason reason)
 {
+	const char *str = NULL;
+
 	switch (reason) {
 	C2S(WOW_REASON_UNSPECIFIED);
 	C2S(WOW_REASON_NLOD);
@@ -6513,9 +6529,9 @@ static inline const char *wow_reason(enum wmi_wow_wake_reason reason)
 	C2S(WOW_REASON_BEACON_RECV);
 	C2S(WOW_REASON_CLIENT_KICKOUT_EVENT);
 	C2S(WOW_REASON_DEBUG_TEST);
-	default:
-		return NULL;
 	}
+
+	return str;
 }
 
 #undef C2S
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
