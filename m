Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x230.google.com ([2a00:1450:400c:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xttud-0000L3-83
 for ath10k@lists.infradead.org; Thu, 27 Nov 2014 07:54:51 +0000
Received: by mail-wg0-f48.google.com with SMTP id y19so5686315wgg.35
 for <ath10k@lists.infradead.org>; Wed, 26 Nov 2014 23:54:28 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: add pointer constness to traces
Date: Thu, 27 Nov 2014 08:42:11 +0100
Message-Id: <1417074131-18460-1-git-send-email-michal.kazior@tieto.com>
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

Traces shouldn't modified passed data. This will
make it possible to pass const arguments to
traces.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/trace.h | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/trace.h b/drivers/net/wireless/ath/ath10k/trace.h
index ceea566..b289378 100644
--- a/drivers/net/wireless/ath/ath10k/trace.h
+++ b/drivers/net/wireless/ath/ath10k/trace.h
@@ -21,9 +21,11 @@
 #include "core.h"
 
 #if !defined(_TRACE_H_)
-static inline u32 ath10k_frm_hdr_len(void *buf)
+static inline u32 ath10k_frm_hdr_len(const void *buf)
 {
-	return ieee80211_hdrlen(((struct ieee80211_hdr *)buf)->frame_control);
+	const struct ieee80211_hdr *hdr = buf;
+
+	return ieee80211_hdrlen(hdr->frame_control);
 }
 #endif
 
@@ -145,7 +147,8 @@ TRACE_EVENT(ath10k_log_dbg_dump,
 );
 
 TRACE_EVENT(ath10k_wmi_cmd,
-	TP_PROTO(struct ath10k *ar, int id, void *buf, size_t buf_len, int ret),
+	TP_PROTO(struct ath10k *ar, int id, const void *buf, size_t buf_len,
+		 int ret),
 
 	TP_ARGS(ar, id, buf, buf_len, ret),
 
@@ -178,7 +181,7 @@ TRACE_EVENT(ath10k_wmi_cmd,
 );
 
 TRACE_EVENT(ath10k_wmi_event,
-	TP_PROTO(struct ath10k *ar, int id, void *buf, size_t buf_len),
+	TP_PROTO(struct ath10k *ar, int id, const void *buf, size_t buf_len),
 
 	TP_ARGS(ar, id, buf, buf_len),
 
@@ -208,7 +211,7 @@ TRACE_EVENT(ath10k_wmi_event,
 );
 
 TRACE_EVENT(ath10k_htt_stats,
-	TP_PROTO(struct ath10k *ar, void *buf, size_t buf_len),
+	TP_PROTO(struct ath10k *ar, const void *buf, size_t buf_len),
 
 	TP_ARGS(ar, buf, buf_len),
 
@@ -235,7 +238,7 @@ TRACE_EVENT(ath10k_htt_stats,
 );
 
 TRACE_EVENT(ath10k_wmi_dbglog,
-	TP_PROTO(struct ath10k *ar, void *buf, size_t buf_len),
+	TP_PROTO(struct ath10k *ar, const void *buf, size_t buf_len),
 
 	TP_ARGS(ar, buf, buf_len),
 
@@ -262,7 +265,7 @@ TRACE_EVENT(ath10k_wmi_dbglog,
 );
 
 TRACE_EVENT(ath10k_htt_pktlog,
-	    TP_PROTO(struct ath10k *ar, void *buf, u16 buf_len),
+	    TP_PROTO(struct ath10k *ar, const void *buf, u16 buf_len),
 
 	TP_ARGS(ar, buf, buf_len),
 
@@ -349,7 +352,7 @@ TRACE_EVENT(ath10k_txrx_tx_unref,
 );
 
 DECLARE_EVENT_CLASS(ath10k_hdr_event,
-		    TP_PROTO(struct ath10k *ar, void *data, size_t len),
+		    TP_PROTO(struct ath10k *ar, const void *data, size_t len),
 
 	TP_ARGS(ar, data, len),
 
@@ -376,7 +379,7 @@ DECLARE_EVENT_CLASS(ath10k_hdr_event,
 );
 
 DECLARE_EVENT_CLASS(ath10k_payload_event,
-		    TP_PROTO(struct ath10k *ar, void *data, size_t len),
+		    TP_PROTO(struct ath10k *ar, const void *data, size_t len),
 
 	TP_ARGS(ar, data, len),
 
@@ -404,27 +407,27 @@ DECLARE_EVENT_CLASS(ath10k_payload_event,
 );
 
 DEFINE_EVENT(ath10k_hdr_event, ath10k_tx_hdr,
-	     TP_PROTO(struct ath10k *ar, void *data, size_t len),
+	     TP_PROTO(struct ath10k *ar, const void *data, size_t len),
 	     TP_ARGS(ar, data, len)
 );
 
 DEFINE_EVENT(ath10k_payload_event, ath10k_tx_payload,
-	     TP_PROTO(struct ath10k *ar, void *data, size_t len),
+	     TP_PROTO(struct ath10k *ar, const void *data, size_t len),
 	     TP_ARGS(ar, data, len)
 );
 
 DEFINE_EVENT(ath10k_hdr_event, ath10k_rx_hdr,
-	     TP_PROTO(struct ath10k *ar, void *data, size_t len),
+	     TP_PROTO(struct ath10k *ar, const void *data, size_t len),
 	     TP_ARGS(ar, data, len)
 );
 
 DEFINE_EVENT(ath10k_payload_event, ath10k_rx_payload,
-	     TP_PROTO(struct ath10k *ar, void *data, size_t len),
+	     TP_PROTO(struct ath10k *ar, const void *data, size_t len),
 	     TP_ARGS(ar, data, len)
 );
 
 TRACE_EVENT(ath10k_htt_rx_desc,
-	    TP_PROTO(struct ath10k *ar, void *data, size_t len),
+	    TP_PROTO(struct ath10k *ar, const void *data, size_t len),
 
 	TP_ARGS(ar, data, len),
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
