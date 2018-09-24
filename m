Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4JPs-0002WI-7w
 for ath10k@lists.infradead.org; Mon, 24 Sep 2018 05:28:17 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH] ath10k: Add wrapper function to ath10k debug
Date: Mon, 24 Sep 2018 10:57:58 +0530
Message-Id: <1537766878-11238-1-git-send-email-vnaralas@codeaurora.org>
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
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>, linux-wireless@vger.kernel.org, Kan Yan <kyan@chromium.org>

ath10k_dbg() is called in ath10k_process_rx() with huge set of arguments
which is causing CPU overhead even when debug_mask is not set.
Good improvement was observed in the receive side performance when call
to ath10k_dbg() is avoided in the RX path.

Since currently all debug messages are sent via tracing infrastructure,
we cannot entirely avoid calling ath10k_dbg. Therefore, call to
ath10k_dbg() is made conditional based on tracing config in the driver.

Trasmit performance remains unchanged with this patch; below are some
experimental results with this patch and tracing disabled.

mesh mode:

                      w/o this patch          with this patch
        Traffic       TP      CPU Usage      TP      CPU usage

        TCP          840Mbps    76.53%      960Mbps    78.14%
        UDP          1030Mbps   74.58%      1132Mbps   74.31%

Infra mode:

                      w/o this patch          with this patch
        Traffic        TP      CPU Usage      TP      CPU usage

        TCP Rx       1241Mbps   80.89%      1270Mbps   73.50%
        UDP Rx       1433Mbps   81.77%      1472Mbps   72.80%

Tested platform	: IPQ8064
hardware used	: QCA9984
firmware ver	: ver 10.4-3.5.3-00057

Signed-off-by: Kan Yan <kyan@chromium.org>
Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c  |  2 ++
 drivers/net/wireless/ath/ath10k/debug.c | 11 +++++------
 drivers/net/wireless/ath/ath10k/debug.h | 22 ++++++++++++++++------
 3 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index cf3c47b..8460037 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -37,6 +37,8 @@
 #include "coredump.h"
 
 unsigned int ath10k_debug_mask;
+EXPORT_SYMBOL(ath10k_debug_mask);
+
 static unsigned int ath10k_cryptmode_param;
 static bool uart_print;
 static bool skip_otp;
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index ada29a4..8f305c6 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -2545,8 +2545,8 @@ void ath10k_debug_unregister(struct ath10k *ar)
 #endif /* CONFIG_ATH10K_DEBUGFS */
 
 #ifdef CONFIG_ATH10K_DEBUG
-void ath10k_dbg(struct ath10k *ar, enum ath10k_debug_mask mask,
-		const char *fmt, ...)
+void __ath10k_dbg(struct ath10k *ar, enum ath10k_debug_mask mask,
+		  const char *fmt, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -2556,14 +2556,13 @@ void ath10k_dbg(struct ath10k *ar, enum ath10k_debug_mask mask,
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	if (ath10k_debug_mask & mask)
-		dev_printk(KERN_DEBUG, ar->dev, "%pV", &vaf);
+	dev_printk(KERN_DEBUG, ar->dev, "%pV", &vaf);
 
 	trace_ath10k_log_dbg(ar, mask, &vaf);
 
 	va_end(args);
 }
-EXPORT_SYMBOL(ath10k_dbg);
+EXPORT_SYMBOL(__ath10k_dbg);
 
 void ath10k_dbg_dump(struct ath10k *ar,
 		     enum ath10k_debug_mask mask,
@@ -2576,7 +2575,7 @@ void ath10k_dbg_dump(struct ath10k *ar,
 
 	if (ath10k_debug_mask & mask) {
 		if (msg)
-			ath10k_dbg(ar, mask, "%s\n", msg);
+			__ath10k_dbg(ar, mask, "%s\n", msg);
 
 		for (ptr = buf; (ptr - buf) < len; ptr += 16) {
 			linebuflen = 0;
diff --git a/drivers/net/wireless/ath/ath10k/debug.h b/drivers/net/wireless/ath/ath10k/debug.h
index 3a6191c..88fead6 100644
--- a/drivers/net/wireless/ath/ath10k/debug.h
+++ b/drivers/net/wireless/ath/ath10k/debug.h
@@ -250,18 +250,18 @@ void ath10k_sta_update_rx_tid_stats_ampdu(struct ath10k *ar,
 #endif /* CONFIG_MAC80211_DEBUGFS */
 
 #ifdef CONFIG_ATH10K_DEBUG
-__printf(3, 4) void ath10k_dbg(struct ath10k *ar,
-			       enum ath10k_debug_mask mask,
-			       const char *fmt, ...);
+__printf(3, 4) void __ath10k_dbg(struct ath10k *ar,
+				 enum ath10k_debug_mask mask,
+				 const char *fmt, ...);
 void ath10k_dbg_dump(struct ath10k *ar,
 		     enum ath10k_debug_mask mask,
 		     const char *msg, const char *prefix,
 		     const void *buf, size_t len);
 #else /* CONFIG_ATH10K_DEBUG */
 
-static inline int ath10k_dbg(struct ath10k *ar,
-			     enum ath10k_debug_mask dbg_mask,
-			     const char *fmt, ...)
+static inline int __ath10k_dbg(struct ath10k *ar,
+			       enum ath10k_debug_mask dbg_mask,
+			       const char *fmt, ...)
 {
 	return 0;
 }
@@ -273,4 +273,14 @@ static inline void ath10k_dbg_dump(struct ath10k *ar,
 {
 }
 #endif /* CONFIG_ATH10K_DEBUG */
+
+/* Avoid calling __ath10k_dbg() if debug_mask is not set and tracing
+ * disabled.
+ */
+#define ath10k_dbg(ar, dbg_mask, fmt, ...)				\
+do {									\
+	if (IS_ENABLED(CONFIG_ATH10K_TRACING) ||			\
+	    (ath10k_debug_mask & dbg_mask))				\
+		__ath10k_dbg(ar, dbg_mask, fmt, ##__VA_ARGS__);		\
+} while (0)
 #endif /* _DEBUG_H_ */
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
