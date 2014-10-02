Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZfF0-0007fH-VX
 for ath10k@lists.infradead.org; Thu, 02 Oct 2014 12:12:15 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 3/4] ath10k: add tracing for rx descriptor
Date: Thu, 2 Oct 2014 17:42:13 +0530
Message-ID: <1412251934-7011-4-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1412251934-7011-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1412251934-7011-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Upon the reception of frame, the descriptor status are reported
to user space by tracepoint. This is useful for collecting rx
statistics for pktlog.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/debug.c  | 17 +++++++++++++++++
 drivers/net/wireless/ath/ath10k/debug.h  |  5 +++++
 drivers/net/wireless/ath/ath10k/htt_rx.c |  2 ++
 drivers/net/wireless/ath/ath10k/trace.h  | 29 +++++++++++++++++++++++++++++
 4 files changed, 53 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 48672da..29fa820 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1439,6 +1439,23 @@ void ath10k_debug_unregister(struct ath10k *ar)
 	cancel_delayed_work_sync(&ar->debug.htt_stats_dwork);
 }
 
+void ath10k_debug_pktlog_rx(struct ath10k *ar, struct sk_buff *msdu)
+{
+	struct htt_rx_desc *rxd;
+	u32 tsf;
+
+	if (!(ar->debug.pktlog_filter & ATH10K_PKTLOG_RX))
+		return;
+
+	while (msdu) {
+		rxd = (void *)msdu->data - sizeof(*rxd);
+		tsf = __le32_to_cpu(rxd->ppdu_end.tsf_timestamp);
+
+		trace_ath10k_rx_pktlog(ar, tsf, &rxd->attention,
+				       sizeof(*rxd) - sizeof(u32));
+		msdu = msdu->next;
+	}
+}
 #endif /* CONFIG_ATH10K_DEBUGFS */
 
 #ifdef CONFIG_ATH10K_DEBUG
diff --git a/drivers/net/wireless/ath/ath10k/debug.h b/drivers/net/wireless/ath/ath10k/debug.h
index aafdcab..389387c 100644
--- a/drivers/net/wireless/ath/ath10k/debug.h
+++ b/drivers/net/wireless/ath/ath10k/debug.h
@@ -71,6 +71,7 @@ ath10k_debug_get_new_fw_crash_data(struct ath10k *ar);
 void ath10k_debug_dbglog_add(struct ath10k *ar, u8 *buffer, int len);
 #define ATH10K_DFS_STAT_INC(ar, c) (ar->debug.dfs_stats.c++)
 
+void ath10k_debug_pktlog_rx(struct ath10k *ar, struct sk_buff *msdu);
 #else
 static inline int ath10k_debug_start(struct ath10k *ar)
 {
@@ -121,6 +122,10 @@ ath10k_debug_get_new_fw_crash_data(struct ath10k *ar)
 	return NULL;
 }
 
+static inline void ath10k_debug_pktlog_rx(struct ath10k *ar,
+					  struct sk_buff *msdu)
+{
+}
 #define ATH10K_DFS_STAT_INC(ar, c) do { } while (0)
 
 #endif /* CONFIG_ATH10K_DEBUGFS */
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index a078451..be24071 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1295,6 +1295,8 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 				continue;
 			}
 
+			ath10k_debug_pktlog_rx(ar, msdu_head);
+
 			rxd = container_of((void *)msdu_head->data,
 					   struct htt_rx_desc,
 					   msdu_payload);
diff --git a/drivers/net/wireless/ath/ath10k/trace.h b/drivers/net/wireless/ath/ath10k/trace.h
index 971ff23..3dff799 100644
--- a/drivers/net/wireless/ath/ath10k/trace.h
+++ b/drivers/net/wireless/ath/ath10k/trace.h
@@ -281,6 +281,35 @@ TRACE_EVENT(ath10k_htt_pktlog,
 	 )
 );
 
+TRACE_EVENT(ath10k_rx_pktlog,
+	    TP_PROTO(struct ath10k *ar, u32 tsf, void *rxdesc, u16 len),
+
+	TP_ARGS(ar, tsf, rxdesc, len),
+
+	TP_STRUCT__entry(
+		__string(device, dev_name(ar->dev))
+		__string(driver, dev_driver_string(ar->dev))
+		__field(u32, tsf)
+		__field(u16, len)
+		__dynamic_array(u8, rxdesc, len)
+	),
+
+	TP_fast_assign(
+		__assign_str(device, dev_name(ar->dev));
+		__assign_str(driver, dev_driver_string(ar->dev));
+		__entry->tsf = tsf;
+		__entry->len = len;
+		memcpy(__get_dynamic_array(rxdesc), rxdesc, len);
+	),
+
+	TP_printk(
+		"%s %s %u len %hu",
+		__get_str(driver),
+		__get_str(device),
+		__entry->tsf,
+		__entry->len
+	 )
+);
 #endif /* _TRACE_H_ || TRACE_HEADER_MULTI_READ*/
 
 /* we don't want to use include/trace/events */
-- 
2.1.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
