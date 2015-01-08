Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9B7B-00081L-Qf
 for ath10k@lists.infradead.org; Thu, 08 Jan 2015 11:18:59 +0000
Received: by mail-wi0-f173.google.com with SMTP id r20so2540476wiv.0
 for <ath10k@lists.infradead.org>; Thu, 08 Jan 2015 03:18:35 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/2] ath10k: implement diag data container event
Date: Thu,  8 Jan 2015 12:18:16 +0100
Message-Id: <1420715897-18706-2-git-send-email-michal.kazior@tieto.com>
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
 drivers/net/wireless/ath/ath10k/trace.h   | 41 ++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 71 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 19 +++++++++
 3 files changed, 131 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/trace.h b/drivers/net/wireless/ath/ath10k/trace.h
index b289378..1c541f7 100644
--- a/drivers/net/wireless/ath/ath10k/trace.h
+++ b/drivers/net/wireless/ath/ath10k/trace.h
@@ -453,6 +453,47 @@ TRACE_EVENT(ath10k_htt_rx_desc,
 	 )
 );
 
+TRACE_EVENT(ath10k_wmi_diag_container,
+	    TP_PROTO(struct ath10k *ar,
+		     u8 type,
+		     u32 timestamp,
+		     u32 code,
+		     u16 len,
+		     const void *data),
+
+	TP_ARGS(ar, type, timestamp, code, len, data),
+
+	TP_STRUCT__entry(
+		__string(device, dev_name(ar->dev))
+		__string(driver, dev_driver_string(ar->dev))
+		__field(u8, type)
+		__field(u32, timestamp)
+		__field(u32, code)
+		__field(u16, len)
+		__dynamic_array(u8, data, len)
+	),
+
+	TP_fast_assign(
+		__assign_str(device, dev_name(ar->dev));
+		__assign_str(driver, dev_driver_string(ar->dev));
+		__entry->type = type;
+		__entry->timestamp = timestamp;
+		__entry->code = code;
+		__entry->len = len;
+		memcpy(__get_dynamic_array(data), data, len);
+	),
+
+	TP_printk(
+		"%s %s diag container type %hhu timestamp %u code %u len %d",
+		__get_str(driver),
+		__get_str(device),
+		__entry->type,
+		__entry->timestamp,
+		__entry->code,
+		__entry->len
+	)
+);
+
 #endif /* _TRACE_H_ || TRACE_HEADER_MULTI_READ*/
 
 /* we don't want to use include/trace/events */
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 4c050ce..46a9f50 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -58,6 +58,8 @@ static const struct wmi_tlv_policy wmi_tlv_policies[] = {
 		= { .min_len = sizeof(struct wlan_host_mem_req) },
 	[WMI_TLV_TAG_STRUCT_READY_EVENT]
 		= { .min_len = sizeof(struct wmi_tlv_rdy_ev) },
+	[WMI_TLV_TAG_STRUCT_DIAG_DATA_CONTAINER_EVENT]
+		= { .min_len = sizeof(struct wmi_tlv_diag_data_ev) },
 };
 
 static int
@@ -156,6 +158,72 @@ static u16 ath10k_wmi_tlv_len(const void *ptr)
 	return __le16_to_cpu((((const struct wmi_tlv *)ptr) - 1)->len);
 }
 
+/**************/
+/* TLV events */
+/**************/
+static int ath10k_wmi_tlv_event_diag_data(struct ath10k *ar,
+					  struct sk_buff *skb)
+{
+	const void **tb;
+	const struct wmi_tlv_diag_data_ev *ev;
+	const struct wmi_tlv_diag_item *item;
+	const void *data;
+	int ret, num_items, len;
+
+	tb = ath10k_wmi_tlv_parse_alloc(ar, skb->data, skb->len, GFP_ATOMIC);
+	if (IS_ERR(tb)) {
+		ret = PTR_ERR(tb);
+		ath10k_warn(ar, "failed to parse tlv: %d\n", ret);
+		return ret;
+	}
+
+	ev = tb[WMI_TLV_TAG_STRUCT_DIAG_DATA_CONTAINER_EVENT];
+	data = tb[WMI_TLV_TAG_ARRAY_BYTE];
+	if (!ev || !data) {
+		kfree(tb);
+		return -EPROTO;
+	}
+
+	num_items = __le32_to_cpu(ev->num_items);
+	len = ath10k_wmi_tlv_len(data);
+
+	while (num_items--) {
+		if (len == 0)
+			break;
+		if (len < sizeof(*item)) {
+			ath10k_warn(ar, "failed to parse diag data: can't fit item header\n");
+			break;
+		}
+
+		item = data;
+
+		if (len < sizeof(*item) + __le16_to_cpu(item->len)) {
+			ath10k_warn(ar, "failed to parse diag data: item is too long\n");
+			break;
+		}
+
+		trace_ath10k_wmi_diag_container(ar,
+						item->type,
+						__le32_to_cpu(item->timestamp),
+						__le32_to_cpu(item->code),
+						__le16_to_cpu(item->len),
+						item->payload);
+
+		len -= sizeof(*item);
+		len -= roundup(__le16_to_cpu(item->len), 4);
+
+		data += sizeof(*item);
+		data += roundup(__le16_to_cpu(item->len), 4);
+	}
+
+	if (num_items != -1 || len != 0)
+		ath10k_warn(ar, "failed to parse diag data event: num_items %d len %d\n",
+			    num_items, len);
+
+	kfree(tb);
+	return 0;
+}
+
 /***********/
 /* TLV ops */
 /***********/
@@ -268,6 +336,9 @@ static void ath10k_wmi_tlv_op_rx(struct ath10k *ar, struct sk_buff *skb)
 	case WMI_TLV_READY_EVENTID:
 		ath10k_wmi_event_ready(ar, skb);
 		break;
+	case WMI_TLV_DIAG_DATA_CONTAINER_EVENTID:
+		ath10k_wmi_tlv_event_diag_data(ar, skb);
+		break;
 	default:
 		ath10k_warn(ar, "Unknown eventid: %d\n", id);
 		break;
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index 54ffa12..c1cde3c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1375,6 +1375,25 @@ struct wmi_tlv_pktlog_disable {
 	__le32 reserved;
 } __packed;
 
+enum wmi_tlv_diag_item_type {
+	WMI_TLV_DIAG_ITEM_TYPE_FW_EVENT,
+	WMI_TLV_DIAG_ITEM_TYPE_FW_LOG,
+	WMI_TLV_DIAG_ITEM_TYPE_FW_DEBUG_MSG,
+};
+
+struct wmi_tlv_diag_item {
+	u8 type;
+	u8 reserved;
+	__le16 len;
+	__le32 timestamp;
+	__le32 code;
+	u8 payload[0];
+} __packed;
+
+struct wmi_tlv_diag_data_ev {
+	__le32 num_items;
+} __packed;
+
 void ath10k_wmi_tlv_attach(struct ath10k *ar);
 
 #endif
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
