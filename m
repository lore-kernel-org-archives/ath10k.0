Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9B1l-0006Vq-NR
 for ath10k@lists.infradead.org; Thu, 08 Jan 2015 11:13:23 +0000
Received: by mail-wi0-f180.google.com with SMTP id n3so2516437wiv.1
 for <ath10k@lists.infradead.org>; Thu, 08 Jan 2015 03:12:55 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 1/5] ath10k: implement new beacon tx status event
Date: Thu,  8 Jan 2015 12:12:26 +0100
Message-Id: <1420715550-16017-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1420715550-16017-1-git-send-email-michal.kazior@tieto.com>
References: <1420715550-16017-1-git-send-email-michal.kazior@tieto.com>
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

This event is delivered to host by firmware if it
supports beacon templates only.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 50 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 12 ++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 4c050ce..ae7c898 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -58,6 +58,8 @@ static const struct wmi_tlv_policy wmi_tlv_policies[] = {
 		= { .min_len = sizeof(struct wlan_host_mem_req) },
 	[WMI_TLV_TAG_STRUCT_READY_EVENT]
 		= { .min_len = sizeof(struct wmi_tlv_rdy_ev) },
+	[WMI_TLV_TAG_STRUCT_OFFLOAD_BCN_TX_STATUS_EVENT]
+		= { .min_len = sizeof(struct wmi_tlv_bcn_tx_status_ev) },
 };
 
 static int
@@ -156,6 +158,51 @@ static u16 ath10k_wmi_tlv_len(const void *ptr)
 	return __le16_to_cpu((((const struct wmi_tlv *)ptr) - 1)->len);
 }
 
+/**************/
+/* TLV events */
+/**************/
+static int ath10k_wmi_tlv_event_bcn_tx_status(struct ath10k *ar,
+					      struct sk_buff *skb)
+{
+	const void **tb;
+	const struct wmi_tlv_bcn_tx_status_ev *ev;
+	u32 vdev_id, tx_status;
+	int ret;
+
+	tb = ath10k_wmi_tlv_parse_alloc(ar, skb->data, skb->len, GFP_ATOMIC);
+	if (IS_ERR(tb)) {
+		ret = PTR_ERR(tb);
+		ath10k_warn(ar, "failed to parse tlv: %d\n", ret);
+		return ret;
+	}
+
+	ev = tb[WMI_TLV_TAG_STRUCT_OFFLOAD_BCN_TX_STATUS_EVENT];
+	if (!ev) {
+		kfree(tb);
+		return -EPROTO;
+	}
+
+	tx_status = __le32_to_cpu(ev->tx_status);
+	vdev_id = __le32_to_cpu(ev->vdev_id);
+
+	switch (tx_status) {
+	case WMI_TLV_BCN_TX_STATUS_OK:
+		break;
+	case WMI_TLV_BCN_TX_STATUS_XRETRY:
+	case WMI_TLV_BCN_TX_STATUS_DROP:
+	case WMI_TLV_BCN_TX_STATUS_FILTERED:
+		/* FIXME: It's probably worth telling mac80211 to stop the
+		 * interface as it is crippled.
+		 */
+		ath10k_warn(ar, "received bcn tmpl tx status on vdev %i: %d",
+			    vdev_id, tx_status);
+		break;
+	}
+
+	kfree(tb);
+	return 0;
+}
+
 /***********/
 /* TLV ops */
 /***********/
@@ -268,6 +315,9 @@ static void ath10k_wmi_tlv_op_rx(struct ath10k *ar, struct sk_buff *skb)
 	case WMI_TLV_READY_EVENTID:
 		ath10k_wmi_event_ready(ar, skb);
 		break;
+	case WMI_TLV_OFFLOAD_BCN_TX_STATUS_EVENTID:
+		ath10k_wmi_tlv_event_bcn_tx_status(ar, skb);
+		break;
 	default:
 		ath10k_warn(ar, "Unknown eventid: %d\n", id);
 		break;
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index 54ffa12..ee19353 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1375,6 +1375,18 @@ struct wmi_tlv_pktlog_disable {
 	__le32 reserved;
 } __packed;
 
+enum wmi_tlv_bcn_tx_status {
+	WMI_TLV_BCN_TX_STATUS_OK,
+	WMI_TLV_BCN_TX_STATUS_XRETRY,
+	WMI_TLV_BCN_TX_STATUS_DROP,
+	WMI_TLV_BCN_TX_STATUS_FILTERED,
+};
+
+struct wmi_tlv_bcn_tx_status_ev {
+	__le32 vdev_id;
+	__le32 tx_status;
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
