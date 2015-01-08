Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9B7C-00081v-UE
 for ath10k@lists.infradead.org; Thu, 08 Jan 2015 11:19:00 +0000
Received: by mail-wi0-f174.google.com with SMTP id h11so2537698wiw.1
 for <ath10k@lists.infradead.org>; Thu, 08 Jan 2015 03:18:36 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: implement diag event
Date: Thu,  8 Jan 2015 12:18:17 +0100
Message-Id: <1420715897-18706-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1420715897-18706-1-git-send-email-michal.kazior@tieto.com>
References: <1420715897-18706-1-git-send-email-michal.kazior@tieto.com>
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

Some firmware revisions may report this event as
part of their diagnostics.

This avoids `unknown event` warnings and adds
tracing for the event.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/trace.h   | 27 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/trace.h b/drivers/net/wireless/ath/ath10k/trace.h
index 1c541f7..5407887 100644
--- a/drivers/net/wireless/ath/ath10k/trace.h
+++ b/drivers/net/wireless/ath/ath10k/trace.h
@@ -494,6 +494,33 @@ TRACE_EVENT(ath10k_wmi_diag_container,
 	)
 );
 
+TRACE_EVENT(ath10k_wmi_diag,
+	    TP_PROTO(struct ath10k *ar, const void *data, size_t len),
+
+	TP_ARGS(ar, data, len),
+
+	TP_STRUCT__entry(
+		__string(device, dev_name(ar->dev))
+		__string(driver, dev_driver_string(ar->dev))
+		__field(u16, len)
+		__dynamic_array(u8, data, len)
+	),
+
+	TP_fast_assign(
+		__assign_str(device, dev_name(ar->dev));
+		__assign_str(driver, dev_driver_string(ar->dev));
+		__entry->len = len;
+		memcpy(__get_dynamic_array(data), data, len);
+	),
+
+	TP_printk(
+		"%s %s tlv diag len %d",
+		__get_str(driver),
+		__get_str(device),
+		__entry->len
+	)
+);
+
 #endif /* _TRACE_H_ || TRACE_HEADER_MULTI_READ*/
 
 /* we don't want to use include/trace/events */
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 46a9f50..a2ad886 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -224,6 +224,34 @@ static int ath10k_wmi_tlv_event_diag_data(struct ath10k *ar,
 	return 0;
 }
 
+static int ath10k_wmi_tlv_event_diag(struct ath10k *ar,
+				     struct sk_buff *skb)
+{
+	const void **tb;
+	const void *data;
+	int ret, len;
+
+	tb = ath10k_wmi_tlv_parse_alloc(ar, skb->data, skb->len, GFP_ATOMIC);
+	if (IS_ERR(tb)) {
+		ret = PTR_ERR(tb);
+		ath10k_warn(ar, "failed to parse tlv: %d\n", ret);
+		return ret;
+	}
+
+	data = tb[WMI_TLV_TAG_ARRAY_BYTE];
+	if (!data) {
+		kfree(tb);
+		return -EPROTO;
+	}
+	len = ath10k_wmi_tlv_len(data);
+
+	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi tlv diag event len %d\n", len);
+	trace_ath10k_wmi_diag(ar, data, len);
+
+	kfree(tb);
+	return 0;
+}
+
 /***********/
 /* TLV ops */
 /***********/
@@ -339,6 +367,9 @@ static void ath10k_wmi_tlv_op_rx(struct ath10k *ar, struct sk_buff *skb)
 	case WMI_TLV_DIAG_DATA_CONTAINER_EVENTID:
 		ath10k_wmi_tlv_event_diag_data(ar, skb);
 		break;
+	case WMI_TLV_DIAG_EVENTID:
+		ath10k_wmi_tlv_event_diag(ar, skb);
+		break;
 	default:
 		ath10k_warn(ar, "Unknown eventid: %d\n", id);
 		break;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
