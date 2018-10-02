Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7P1d-0005Y9-T8
 for ath10k@lists.infradead.org; Tue, 02 Oct 2018 18:04:04 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH 1/2] ath10k: Handle bundled tx completion for managenent frames
Date: Tue,  2 Oct 2018 23:33:40 +0530
Message-Id: <1538503421-17607-2-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1538503421-17607-1-git-send-email-pillair@codeaurora.org>
References: <1538503421-17607-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org

WCN3990 supports sending tx completion for multiple
management frames bundled together in a single event.

Add support to handle the bundled tx completion
event for WCN3990.

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-ops.h | 13 +++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 63 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  1 +
 drivers/net/wireless/ath/ath10k/wmi.c     | 26 +++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h     |  7 ++++
 5 files changed, 110 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-ops.h b/drivers/net/wireless/ath/ath10k/wmi-ops.h
index 7fd63bb..b460993 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-ops.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-ops.h
@@ -33,6 +33,9 @@ struct wmi_ops {
 			    struct wmi_mgmt_rx_ev_arg *arg);
 	int (*pull_mgmt_tx_compl)(struct ath10k *ar, struct sk_buff *skb,
 				  struct wmi_tlv_mgmt_tx_compl_ev_arg *arg);
+	int (*pull_mgmt_tx_bundle_compl)(
+				struct ath10k *ar, struct sk_buff *skb,
+				struct wmi_tlv_mgmt_tx_bundle_compl_ev_arg *arg);
 	int (*pull_ch_info)(struct ath10k *ar, struct sk_buff *skb,
 			    struct wmi_ch_info_ev_arg *arg);
 	int (*pull_vdev_start)(struct ath10k *ar, struct sk_buff *skb,
@@ -274,6 +277,16 @@ ath10k_wmi_pull_mgmt_tx_compl(struct ath10k *ar, struct sk_buff *skb,
 }
 
 static inline int
+ath10k_wmi_pull_mgmt_tx_bundle_compl(struct ath10k *ar, struct sk_buff *skb,
+				     struct wmi_tlv_mgmt_tx_bundle_compl_ev_arg *arg)
+{
+	if (!ar->wmi.ops->pull_mgmt_tx_bundle_compl)
+		return -EOPNOTSUPP;
+
+	return ar->wmi.ops->pull_mgmt_tx_bundle_compl(ar, skb, arg);
+}
+
+static inline int
 ath10k_wmi_pull_mgmt_rx(struct ath10k *ar, struct sk_buff *skb,
 			struct wmi_mgmt_rx_ev_arg *arg)
 {
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 731ceae..f7d4f01 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -620,6 +620,9 @@ static void ath10k_wmi_tlv_op_rx(struct ath10k *ar, struct sk_buff *skb)
 	case WMI_TLV_MGMT_TX_COMPLETION_EVENTID:
 		ath10k_wmi_event_mgmt_tx_compl(ar, skb);
 		break;
+	case WMI_TLV_MGMT_TX_BUNDLE_COMPLETION_EVENTID:
+		ath10k_wmi_event_mgmt_tx_bundle_compl(ar, skb);
+		break;
 	default:
 		ath10k_warn(ar, "Unknown eventid: %d\n", id);
 		break;
@@ -686,6 +689,65 @@ ath10k_wmi_tlv_op_pull_mgmt_tx_compl_ev(struct ath10k *ar, struct sk_buff *skb,
 	return 0;
 }
 
+struct wmi_tlv_tx_bundle_compl_parse {
+	const __le32 *num_reports;
+	const __le32 *desc_ids;
+	const __le32 *status;
+	bool desc_ids_done;
+	bool status_done;
+};
+
+static int
+ath10k_wmi_tlv_mgmt_tx_bundle_compl_parse(struct ath10k *ar, u16 tag, u16 len,
+					  const void *ptr, void *data)
+{
+	struct wmi_tlv_tx_bundle_compl_parse *bundle_tx_compl = data;
+
+	switch (tag) {
+	case WMI_TLV_TAG_STRUCT_MGMT_TX_COMPL_BUNDLE_EVENT:
+		bundle_tx_compl->num_reports = ptr;
+		break;
+	case WMI_TLV_TAG_ARRAY_UINT32:
+		if (!bundle_tx_compl->desc_ids_done) {
+			bundle_tx_compl->desc_ids_done = true;
+			bundle_tx_compl->desc_ids = ptr;
+		} else if (!bundle_tx_compl->status_done) {
+			bundle_tx_compl->status_done = true;
+			bundle_tx_compl->status = ptr;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int ath10k_wmi_tlv_op_pull_mgmt_tx_bundle_compl_ev(
+				struct ath10k *ar, struct sk_buff *skb,
+				struct wmi_tlv_mgmt_tx_bundle_compl_ev_arg *arg)
+{
+	struct wmi_tlv_tx_bundle_compl_parse bundle_tx_compl = { };
+	int ret;
+
+	ret = ath10k_wmi_tlv_iter(ar, skb->data, skb->len,
+				  ath10k_wmi_tlv_mgmt_tx_bundle_compl_parse,
+				  &bundle_tx_compl);
+	if (ret) {
+		ath10k_warn(ar, "failed to parse tlv: %d\n", ret);
+		return ret;
+	}
+
+	if (!bundle_tx_compl.num_reports || !bundle_tx_compl.desc_ids ||
+	    !bundle_tx_compl.status)
+		return -EPROTO;
+
+	arg->num_reports = __le32_to_cpu(*bundle_tx_compl.num_reports);
+	arg->desc_ids = (__le32 *)bundle_tx_compl.desc_ids;
+	arg->status = (__le32 *)bundle_tx_compl.status;
+
+	return 0;
+}
+
 static int ath10k_wmi_tlv_op_pull_mgmt_rx_ev(struct ath10k *ar,
 					     struct sk_buff *skb,
 					     struct wmi_mgmt_rx_ev_arg *arg)
@@ -3907,6 +3969,7 @@ static const struct wmi_ops wmi_tlv_ops = {
 	.pull_scan = ath10k_wmi_tlv_op_pull_scan_ev,
 	.pull_mgmt_rx = ath10k_wmi_tlv_op_pull_mgmt_rx_ev,
 	.pull_mgmt_tx_compl = ath10k_wmi_tlv_op_pull_mgmt_tx_compl_ev,
+	.pull_mgmt_tx_bundle_compl = ath10k_wmi_tlv_op_pull_mgmt_tx_bundle_compl_ev,
 	.pull_ch_info = ath10k_wmi_tlv_op_pull_ch_info_ev,
 	.pull_vdev_start = ath10k_wmi_tlv_op_pull_vdev_start_ev,
 	.pull_peer_kick = ath10k_wmi_tlv_op_pull_peer_kick_ev,
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index 4f0c20c..c575921 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -321,6 +321,7 @@ enum wmi_tlv_event_id {
 	WMI_TLV_OFFLOAD_BCN_TX_STATUS_EVENTID,
 	WMI_TLV_OFFLOAD_PROB_RESP_TX_STATUS_EVENTID,
 	WMI_TLV_MGMT_TX_COMPLETION_EVENTID,
+	WMI_TLV_MGMT_TX_BUNDLE_COMPLETION_EVENTID,
 	WMI_TLV_TX_DELBA_COMPLETE_EVENTID = WMI_TLV_EV(WMI_TLV_GRP_BA_NEG),
 	WMI_TLV_TX_ADDBA_COMPLETE_EVENTID,
 	WMI_TLV_BA_RSP_SSN_EVENTID,
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 25e8fa7..8f62a85 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2378,6 +2378,32 @@ int ath10k_wmi_event_mgmt_tx_compl(struct ath10k *ar, struct sk_buff *skb)
 	return 0;
 }
 
+int ath10k_wmi_event_mgmt_tx_bundle_compl(struct ath10k *ar, struct sk_buff *skb)
+{
+	struct wmi_tlv_mgmt_tx_bundle_compl_ev_arg arg;
+	u32 *desc_ids, *status;
+	u32 num_reports;
+	int i, ret;
+
+	ret = ath10k_wmi_pull_mgmt_tx_bundle_compl(ar, skb, &arg);
+	if (ret) {
+		ath10k_warn(ar, "failed to parse bundle mgmt compl event: %d\n", ret);
+		return ret;
+	}
+
+	num_reports = __le32_to_cpu(arg.num_reports);
+	desc_ids = (u32 *)arg.desc_ids;
+	status = (u32 *)arg.status;
+
+	for (i = 0; i < num_reports; i++)
+		wmi_process_mgmt_tx_comp(ar, __le32_to_cpu(desc_ids[i]),
+					 __le32_to_cpu(status[i]));
+
+	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi tlv event bundle mgmt tx completion\n");
+
+	return 0;
+}
+
 int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 {
 	struct wmi_mgmt_rx_ev_arg arg = {};
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index f67c527..1287687 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -6649,6 +6649,12 @@ struct wmi_tlv_mgmt_tx_compl_ev_arg {
 	__le32 pdev_id;
 };
 
+struct wmi_tlv_mgmt_tx_bundle_compl_ev_arg {
+	__le32 num_reports;
+	__le32 *desc_ids;
+	__le32 *status;
+};
+
 struct wmi_mgmt_rx_ev_arg {
 	__le32 channel;
 	__le32 snr;
@@ -7127,6 +7133,7 @@ int ath10k_wmi_start_scan_verify(const struct wmi_start_scan_arg *arg);
 int ath10k_wmi_event_scan(struct ath10k *ar, struct sk_buff *skb);
 int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb);
 int ath10k_wmi_event_mgmt_tx_compl(struct ath10k *ar, struct sk_buff *skb);
+int ath10k_wmi_event_mgmt_tx_bundle_compl(struct ath10k *ar, struct sk_buff *skb);
 void ath10k_wmi_event_chan_info(struct ath10k *ar, struct sk_buff *skb);
 void ath10k_wmi_event_echo(struct ath10k *ar, struct sk_buff *skb);
 int ath10k_wmi_event_debug_mesg(struct ath10k *ar, struct sk_buff *skb);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
