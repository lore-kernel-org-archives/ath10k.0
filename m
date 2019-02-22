Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gx3Tq-0001bx-47
 for ath10k@lists.infradead.org; Fri, 22 Feb 2019 05:34:42 +0000
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: [PATCHv2 7/9] ath10k: Add wmi command support for station specific
 TID config
Date: Fri, 22 Feb 2019 11:02:32 +0530
Message-Id: <1550813554-11581-8-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1550813554-11581-1-git-send-email-tamizhr@codeaurora.org>
References: <1550813554-11581-1-git-send-email-tamizhr@codeaurora.org>
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
To: johannes@sipsolutions.net, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Tamizh chelvam <tamizhr@codeaurora.org>

This patch adds WMI interface to configure station specific
TID configuration . Host needs to send station's MAC address
along with TID number and its configuration to target through
WMI_10_4_PER_PEER_PER_TID_CONFIG_CMDID.

WMI_SERVICE_PEER_TID_CONFIGS_SUPPORT flag is added to advertise
this support.

Testing:
   * Tested HW: QCA9888
   * Tested FW: 10.4-3.5.1-00052

Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-ops.h | 19 +++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c     | 32 +++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h     | 52 +++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-ops.h b/drivers/net/wireless/ath/ath10k/wmi-ops.h
index 1491c25..796badf 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-ops.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-ops.h
@@ -216,6 +216,8 @@ struct wmi_ops {
 	struct sk_buff *(*gen_bb_timing)
 			(struct ath10k *ar,
 			 const struct wmi_bb_timing_cfg_arg *arg);
+	struct sk_buff *(*gen_per_peer_per_tid_cfg)(struct ath10k *ar,
+				const struct wmi_per_peer_per_tid_cfg_arg *arg);
 
 };
 
@@ -1616,4 +1618,21 @@ struct wmi_ops {
 	return ath10k_wmi_cmd_send(ar, skb,
 				   ar->wmi.cmd->set_bb_timing_cmdid);
 }
+
+static inline int
+ath10k_wmi_set_per_peer_per_tid_cfg(struct ath10k *ar,
+				const struct wmi_per_peer_per_tid_cfg_arg *arg)
+{
+	struct sk_buff *skb;
+
+	if (!ar->wmi.ops->gen_per_peer_per_tid_cfg)
+		return -EOPNOTSUPP;
+
+	skb = ar->wmi.ops->gen_per_peer_per_tid_cfg(ar, arg);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	return ath10k_wmi_cmd_send(ar, skb,
+				   ar->wmi.cmd->per_peer_per_tid_config_cmdid);
+}
 #endif
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 97e5b2e..44b66f2 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -740,6 +740,7 @@
 	.tdls_peer_update_cmdid = WMI_10_4_TDLS_PEER_UPDATE_CMDID,
 	.tdls_set_offchan_mode_cmdid = WMI_10_4_TDLS_SET_OFFCHAN_MODE_CMDID,
 	.radar_found_cmdid = WMI_10_4_RADAR_FOUND_CMDID,
+	.per_peer_per_tid_config_cmdid = WMI_10_4_PER_PEER_PER_TID_CONFIG_CMDID,
 };
 
 /* MAIN WMI VDEV param map */
@@ -8862,6 +8863,36 @@ static u32 ath10k_wmi_prepare_peer_qos(u8 uapsd_queues, u8 sp)
 }
 
 static struct sk_buff *
+ath10k_wmi_10_4_gen_per_peer_per_tid_cfg(struct ath10k *ar,
+				const struct wmi_per_peer_per_tid_cfg_arg *arg)
+{
+	struct wmi_peer_per_tid_cfg_cmd *cmd;
+	struct sk_buff *skb;
+
+	skb = ath10k_wmi_alloc_skb(ar, sizeof(*cmd));
+	if (!skb)
+		return ERR_PTR(-ENOMEM);
+
+	memset(skb->data, 0, sizeof(*cmd));
+
+	cmd = (struct wmi_peer_per_tid_cfg_cmd *)skb->data;
+	cmd->vdev_id = cpu_to_le32(arg->vdev_id);
+	ether_addr_copy(cmd->peer_macaddr.addr, arg->peer_macaddr.addr);
+	cmd->tid = cpu_to_le32(arg->tid);
+	cmd->ack_policy = cpu_to_le32(arg->ack_policy);
+	cmd->aggr_control = cpu_to_le32(arg->aggr_control);
+	cmd->rate_control = cpu_to_le32(arg->rate_ctrl);
+	cmd->retry_count = cpu_to_le32(arg->retry_count);
+	cmd->rcode_flags = cpu_to_le32(arg->rcode_flags);
+
+	ath10k_dbg(ar, ATH10K_DBG_WMI,
+		   "wmi noack tid %d vdev id %d ack_policy %d aggr %u rate_ctrl %u rcflag %u retry_count %d mac_addr %pM\n",
+		   arg->tid, arg->vdev_id, arg->ack_policy, arg->aggr_control, arg->rate_ctrl,
+		   arg->rcode_flags, arg->retry_count, arg->peer_macaddr.addr);
+	return skb;
+}
+
+static struct sk_buff *
 ath10k_wmi_op_gen_echo(struct ath10k *ar, u32 value)
 {
 	struct wmi_echo_cmd *cmd;
@@ -9270,6 +9301,7 @@ static u32 ath10k_wmi_prepare_peer_qos(u8 uapsd_queues, u8 sp)
 	.gen_pdev_get_tpc_table_cmdid =
 			ath10k_wmi_10_4_op_gen_pdev_get_tpc_table_cmdid,
 	.gen_radar_found = ath10k_wmi_10_4_gen_radar_found,
+	.gen_per_peer_per_tid_cfg = ath10k_wmi_10_4_gen_per_peer_per_tid_cfg,
 
 	/* shared with 10.2 */
 	.pull_echo_ev = ath10k_wmi_op_pull_echo_ev,
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index d9b646f..187c13e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -200,6 +200,7 @@ enum wmi_service {
 	WMI_SERVICE_RTT_RESPONDER_ROLE,
 	WMI_SERVICE_PER_PACKET_SW_ENCRYPT,
 	WMI_SERVICE_REPORT_AIRTIME,
+	WMI_SERVICE_PEER_TID_CONFIGS_SUPPORT,
 
 	/* Remember to add the new value to wmi_service_name()! */
 
@@ -491,6 +492,7 @@ static inline char *wmi_service_name(enum wmi_service service_id)
 	SVCSTR(WMI_SERVICE_RTT_RESPONDER_ROLE);
 	SVCSTR(WMI_SERVICE_PER_PACKET_SW_ENCRYPT);
 	SVCSTR(WMI_SERVICE_REPORT_AIRTIME);
+	SVCSTR(WMI_SERVICE_PEER_TID_CONFIGS_SUPPORT);
 
 	case WMI_SERVICE_MAX:
 		return NULL;
@@ -818,6 +820,8 @@ static inline void wmi_10_4_svc_map(const __le32 *in, unsigned long *out,
 	       WMI_SERVICE_PER_PACKET_SW_ENCRYPT, len);
 	SVCMAP(WMI_10_4_SERVICE_REPORT_AIRTIME,
 	       WMI_SERVICE_REPORT_AIRTIME, len);
+	SVCMAP(WMI_10_4_SERVICE_PEER_TID_CONFIGS_SUPPORT,
+	       WMI_SERVICE_PEER_TID_CONFIGS_SUPPORT, len);
 }
 
 #undef SVCMAP
@@ -1019,6 +1023,7 @@ struct wmi_cmd_map {
 	u32 tdls_set_offchan_mode_cmdid;
 	u32 radar_found_cmdid;
 	u32 set_bb_timing_cmdid;
+	u32 per_peer_per_tid_config_cmdid;
 };
 
 /*
@@ -1860,6 +1865,8 @@ enum wmi_10_4_cmd_id {
 	WMI_10_4_PDEV_SET_BRIDGE_MACADDR_CMDID,
 	WMI_10_4_ATF_GROUP_WMM_AC_CONFIG_REQUEST_CMDID,
 	WMI_10_4_RADAR_FOUND_CMDID,
+	WMI_10_4_PEER_CFR_CAPTURE_CMDID,
+	WMI_10_4_PER_PEER_PER_TID_CONFIG_CMDID,
 	WMI_10_4_PDEV_UTF_CMDID = WMI_10_4_END_CMDID - 1,
 };
 
@@ -7145,6 +7152,51 @@ struct wmi_tdls_peer_event {
 	__le32 vdev_id;
 } __packed;
 
+enum wmi_tid_aggr_control_conf {
+	WMI_TID_CONFIG_AGGR_CONTROL_IGNORE,
+	WMI_TID_CONFIG_AGGR_CONTROL_ENABLE,
+	WMI_TID_CONFIG_AGGR_CONTROL_DISABLE,
+};
+
+enum wmi_noack_tid_conf {
+	WMI_NOACK_TID_CONFIG_IGNORE_ACK_POLICY,
+	WMI_PEER_TID_CONFIG_ACK,
+	WMI_PEER_TID_CONFIG_NOACK,
+};
+
+enum wmi_tid_rate_ctrl_conf {
+	WMI_TID_CONFIG_RATE_CONTROL_IGNORE,
+	WMI_TID_CONFIG_RATE_CONTROL_AUTO,
+	WMI_TID_CONFIG_RATE_CONTROL_FIXED_RATE,
+	WMI_TID_CONFIG_RATE_CONTROL_DEFAULT_LOWEST_RATE,
+};
+
+struct wmi_per_peer_per_tid_cfg_arg {
+	u32 vdev_id;
+	struct wmi_mac_addr peer_macaddr;
+	u32 tid;
+	enum wmi_noack_tid_conf ack_policy;
+	enum wmi_tid_aggr_control_conf aggr_control;
+	u8 rate_ctrl;
+	u32 retry_count;
+	u32 rcode_flags;
+};
+
+struct wmi_peer_per_tid_cfg_cmd {
+	__le32 vdev_id;
+	struct wmi_mac_addr peer_macaddr;
+	__le32 tid;
+
+	/* see enum wmi_noack_tid_conf */
+	__le32 ack_policy;
+	/* see enum wmi_tid_aggr_control_conf */
+	__le32 aggr_control;
+	/* see enum wmi_tid_rate_ctrl_conf */
+	__le32 rate_control;
+	__le32 rcode_flags;
+	__le32 retry_count;
+} __packed;
+
 enum wmi_txbf_conf {
 	WMI_TXBF_CONF_UNSUPPORTED,
 	WMI_TXBF_CONF_BEFORE_ASSOC,
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
