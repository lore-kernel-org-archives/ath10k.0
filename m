Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xga5g-0004Vr-Gp
 for ath10k@lists.infradead.org; Tue, 21 Oct 2014 14:07:13 +0000
Received: by mail-la0-f44.google.com with SMTP id hs14so1112253lab.31
 for <ath10k@lists.infradead.org>; Tue, 21 Oct 2014 07:06:45 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: re-use trace class
Date: Tue, 21 Oct 2014 15:55:00 +0200
Message-Id: <1413899700-10717-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1413899700-10717-1-git-send-email-michal.kazior@tieto.com>
References: <1413899700-10717-1-git-send-email-michal.kazior@tieto.com>
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

Instead of defining a completely new tracepoint
use an existing tracepoint class.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/trace.h | 32 +++++---------------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/trace.h b/drivers/net/wireless/ath/ath10k/trace.h
index 2409cb5..b9a2ba6 100644
--- a/drivers/net/wireless/ath/ath10k/trace.h
+++ b/drivers/net/wireless/ath/ath10k/trace.h
@@ -281,33 +281,6 @@ TRACE_EVENT(ath10k_htt_pktlog,
 	 )
 );
 
-TRACE_EVENT(ath10k_htt_rx_desc,
-	    TP_PROTO(struct ath10k *ar, void *rxdesc, u16 len),
-
-	TP_ARGS(ar, rxdesc, len),
-
-	TP_STRUCT__entry(
-		__string(device, dev_name(ar->dev))
-		__string(driver, dev_driver_string(ar->dev))
-		__field(u16, len)
-		__dynamic_array(u8, rxdesc, len)
-	),
-
-	TP_fast_assign(
-		__assign_str(device, dev_name(ar->dev));
-		__assign_str(driver, dev_driver_string(ar->dev));
-		__entry->len = len;
-		memcpy(__get_dynamic_array(rxdesc), rxdesc, len);
-	),
-
-	TP_printk(
-		"%s %s len %hu",
-		__get_str(driver),
-		__get_str(device),
-		__entry->len
-	 )
-);
-
 TRACE_EVENT(ath10k_htt_tx,
 	    TP_PROTO(struct ath10k *ar, u16 msdu_id, u16 msdu_len,
 		     u8 vdev_id, u8 tid),
@@ -414,6 +387,11 @@ DEFINE_EVENT(ath10k_data_event, ath10k_wmi_bcn_tx,
 	     TP_PROTO(struct ath10k *ar, void *data, size_t len),
 	     TP_ARGS(ar, data, len)
 );
+
+DEFINE_EVENT(ath10k_data_event, ath10k_htt_rx_desc,
+	     TP_PROTO(struct ath10k *ar, void *data, size_t len),
+	     TP_ARGS(ar, data, len)
+);
 #endif /* _TRACE_H_ || TRACE_HEADER_MULTI_READ*/
 
 /* we don't want to use include/trace/events */
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
