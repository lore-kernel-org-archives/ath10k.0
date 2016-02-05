Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aRiXw-00011q-0x
 for ath10k@lists.infradead.org; Fri, 05 Feb 2016 15:43:47 +0000
From: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
Subject: [PATCH 2/2] ath10k: add hw_rev to trace events to support pktlog
Date: Fri, 5 Feb 2016 21:12:49 +0530
Message-ID: <1454686969-5740-2-git-send-email-arnagara@qti.qualcomm.com>
In-Reply-To: <1454686969-5740-1-git-send-email-arnagara@qti.qualcomm.com>
References: <1454686969-5740-1-git-send-email-arnagara@qti.qualcomm.com>
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
Cc: arnagara@qti.qualcomm.com, kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org

pktlog data is different between firmware variants (eg. 10.2 vs 10.4). To
have a unified user space script to decode pktlog trace events generated,
it is desirable to know which firmware variant has provided the events and
thereby decode the pktlogs appropriately. Hardware revision (hw_rev) helps
to determine the firmware variant sending these trace events. So add hw_rev
to trace events.

Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/trace.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/trace.h b/drivers/net/wireless/ath/ath10k/trace.h
index 71bdb36..e0d00ce 100644
--- a/drivers/net/wireless/ath/ath10k/trace.h
+++ b/drivers/net/wireless/ath/ath10k/trace.h
@@ -250,6 +250,7 @@ TRACE_EVENT(ath10k_wmi_dbglog,
 	TP_STRUCT__entry(
 		__string(device, dev_name(ar->dev))
 		__string(driver, dev_driver_string(ar->dev))
+		__field(u8, hw_type);
 		__field(size_t, buf_len)
 		__dynamic_array(u8, buf, buf_len)
 	),
@@ -257,14 +258,16 @@ TRACE_EVENT(ath10k_wmi_dbglog,
 	TP_fast_assign(
 		__assign_str(device, dev_name(ar->dev));
 		__assign_str(driver, dev_driver_string(ar->dev));
+		__entry->hw_type = ar->hw_rev;
 		__entry->buf_len = buf_len;
 		memcpy(__get_dynamic_array(buf), buf, buf_len);
 	),
 
 	TP_printk(
-		"%s %s len %zu",
+		"%s %s %d len %zu",
 		__get_str(driver),
 		__get_str(device),
+		__entry->hw_type,
 		__entry->buf_len
 	)
 );
@@ -277,6 +280,7 @@ TRACE_EVENT(ath10k_htt_pktlog,
 	TP_STRUCT__entry(
 		__string(device, dev_name(ar->dev))
 		__string(driver, dev_driver_string(ar->dev))
+		__field(u8, hw_type);
 		__field(u16, buf_len)
 		__dynamic_array(u8, pktlog, buf_len)
 	),
@@ -284,14 +288,16 @@ TRACE_EVENT(ath10k_htt_pktlog,
 	TP_fast_assign(
 		__assign_str(device, dev_name(ar->dev));
 		__assign_str(driver, dev_driver_string(ar->dev));
+		__entry->hw_type = ar->hw_rev;
 		__entry->buf_len = buf_len;
 		memcpy(__get_dynamic_array(pktlog), buf, buf_len);
 	),
 
 	TP_printk(
-		"%s %s size %hu",
+		"%s %s %d size %hu",
 		__get_str(driver),
 		__get_str(device),
+		__entry->hw_type,
 		__entry->buf_len
 	 )
 );
@@ -440,6 +446,7 @@ TRACE_EVENT(ath10k_htt_rx_desc,
 	TP_STRUCT__entry(
 		__string(device, dev_name(ar->dev))
 		__string(driver, dev_driver_string(ar->dev))
+		__field(u8, hw_type);
 		__field(u16, len)
 		__dynamic_array(u8, rxdesc, len)
 	),
@@ -447,14 +454,16 @@ TRACE_EVENT(ath10k_htt_rx_desc,
 	TP_fast_assign(
 		__assign_str(device, dev_name(ar->dev));
 		__assign_str(driver, dev_driver_string(ar->dev));
+		__entry->hw_type = ar->hw_rev;
 		__entry->len = len;
 		memcpy(__get_dynamic_array(rxdesc), data, len);
 	),
 
 	TP_printk(
-		"%s %s rxdesc len %d",
+		"%s %s %d rxdesc len %d",
 		__get_str(driver),
 		__get_str(device),
+		__entry->hw_type,
 		__entry->len
 	 )
 );
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
