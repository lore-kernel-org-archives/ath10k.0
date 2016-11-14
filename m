Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6HG3-0006O9-NY
 for ath10k@lists.infradead.org; Mon, 14 Nov 2016 13:25:13 +0000
Received: by mail-lf0-x22e.google.com with SMTP id t196so58153940lff.3
 for <ath10k@lists.infradead.org>; Mon, 14 Nov 2016 05:24:51 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: add spectral scan support to wmi-tlv
Date: Mon, 14 Nov 2016 14:26:40 +0100
Message-Id: <1479130000-11551-1-git-send-email-michal.kazior@tieto.com>
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

Command structure and event flow doesn't seem to
be any different compared to existing
implementation for other firmware branches.

This patch effectively adds in-driver support for
spectral scanning on QCA61x4 and QCA9377.

Tested QCA9377 w/ WLAN.TF.1.0-00267-1.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 72 +++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index e64f59300a7c..7f9b1185b549 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -3136,6 +3136,76 @@ ath10k_wmi_tlv_op_gen_echo(struct ath10k *ar, u32 value)
 	return skb;
 }
 
+static struct sk_buff *
+ath10k_wmi_tlv_op_gen_vdev_spectral_conf(struct ath10k *ar,
+					 const struct wmi_vdev_spectral_conf_arg *arg)
+{
+	struct wmi_vdev_spectral_conf_cmd *cmd;
+	struct sk_buff *skb;
+	struct wmi_tlv *tlv;
+	void *ptr;
+	size_t len;
+
+	len = sizeof(*tlv) + sizeof(*cmd);
+	skb = ath10k_wmi_alloc_skb(ar, len);
+	if (!skb)
+		return ERR_PTR(-ENOMEM);
+
+	ptr = (void *)skb->data;
+	tlv = ptr;
+	tlv->tag = __cpu_to_le16(WMI_TLV_TAG_STRUCT_VDEV_SPECTRAL_CONFIGURE_CMD);
+	tlv->len = __cpu_to_le16(sizeof(*cmd));
+	cmd = (void *)tlv->value;
+	cmd->vdev_id = __cpu_to_le32(arg->vdev_id);
+	cmd->scan_count = __cpu_to_le32(arg->scan_count);
+	cmd->scan_period = __cpu_to_le32(arg->scan_period);
+	cmd->scan_priority = __cpu_to_le32(arg->scan_priority);
+	cmd->scan_fft_size = __cpu_to_le32(arg->scan_fft_size);
+	cmd->scan_gc_ena = __cpu_to_le32(arg->scan_gc_ena);
+	cmd->scan_restart_ena = __cpu_to_le32(arg->scan_restart_ena);
+	cmd->scan_noise_floor_ref = __cpu_to_le32(arg->scan_noise_floor_ref);
+	cmd->scan_init_delay = __cpu_to_le32(arg->scan_init_delay);
+	cmd->scan_nb_tone_thr = __cpu_to_le32(arg->scan_nb_tone_thr);
+	cmd->scan_str_bin_thr = __cpu_to_le32(arg->scan_str_bin_thr);
+	cmd->scan_wb_rpt_mode = __cpu_to_le32(arg->scan_wb_rpt_mode);
+	cmd->scan_rssi_rpt_mode = __cpu_to_le32(arg->scan_rssi_rpt_mode);
+	cmd->scan_rssi_thr = __cpu_to_le32(arg->scan_rssi_thr);
+	cmd->scan_pwr_format = __cpu_to_le32(arg->scan_pwr_format);
+	cmd->scan_rpt_mode = __cpu_to_le32(arg->scan_rpt_mode);
+	cmd->scan_bin_scale = __cpu_to_le32(arg->scan_bin_scale);
+	cmd->scan_dbm_adj = __cpu_to_le32(arg->scan_dbm_adj);
+	cmd->scan_chn_mask = __cpu_to_le32(arg->scan_chn_mask);
+
+	return skb;
+}
+
+static struct sk_buff *
+ath10k_wmi_tlv_op_gen_vdev_spectral_enable(struct ath10k *ar, u32 vdev_id,
+					   u32 trigger, u32 enable)
+{
+	struct wmi_vdev_spectral_enable_cmd *cmd;
+	struct sk_buff *skb;
+	struct wmi_tlv *tlv;
+	void *ptr;
+	size_t len;
+
+	len = sizeof(*tlv) + sizeof(*cmd);
+	skb = ath10k_wmi_alloc_skb(ar, len);
+	if (!skb)
+		return ERR_PTR(-ENOMEM);
+
+	ptr = (void *)skb->data;
+	tlv = ptr;
+	tlv->tag = __cpu_to_le16(WMI_TLV_TAG_STRUCT_VDEV_SPECTRAL_ENABLE_CMD);
+	tlv->len = __cpu_to_le16(sizeof(*cmd));
+	cmd = (void *)tlv->value;
+	cmd->vdev_id = __cpu_to_le32(vdev_id);
+	cmd->trigger_cmd = __cpu_to_le32(trigger);
+	cmd->enable_cmd = __cpu_to_le32(enable);
+
+	return skb;
+}
+
 /****************/
 /* TLV mappings */
 /****************/
@@ -3542,6 +3612,8 @@ static const struct wmi_ops wmi_tlv_ops = {
 	.fw_stats_fill = ath10k_wmi_main_op_fw_stats_fill,
 	.get_vdev_subtype = ath10k_wmi_op_get_vdev_subtype,
 	.gen_echo = ath10k_wmi_tlv_op_gen_echo,
+	.gen_vdev_spectral_conf = ath10k_wmi_tlv_op_gen_vdev_spectral_conf,
+	.gen_vdev_spectral_enable = ath10k_wmi_tlv_op_gen_vdev_spectral_enable,
 };
 
 static const struct wmi_peer_flags_map wmi_tlv_peer_flags_map = {
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
