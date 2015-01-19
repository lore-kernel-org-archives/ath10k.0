Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22b.google.com ([2a00:1450:400c:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YD86m-0004tU-Fw
 for ath10k@lists.infradead.org; Mon, 19 Jan 2015 08:54:54 +0000
Received: by mail-we0-f171.google.com with SMTP id u56so30134799wes.2
 for <ath10k@lists.infradead.org>; Mon, 19 Jan 2015 00:54:24 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/3] ath10k: implement per-vdev wmm param setup command
Date: Mon, 19 Jan 2015 09:53:42 +0100
Message-Id: <1421657623-11706-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1421657623-11706-1-git-send-email-michal.kazior@tieto.com>
References: <1421657623-11706-1-git-send-email-michal.kazior@tieto.com>
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

New wmi-tlv firmware for qca6174 supports this.
This will be used soon.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi-ops.h | 17 ++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 38 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  4 ++++
 drivers/net/wireless/ath/ath10k/wmi.c     |  3 +++
 drivers/net/wireless/ath/ath10k/wmi.h     |  1 +
 5 files changed, 63 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-ops.h b/drivers/net/wireless/ath/ath10k/wmi-ops.h
index 4bb8cdd..bfc4668 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-ops.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-ops.h
@@ -78,6 +78,8 @@ struct wmi_ops {
 						  const struct wmi_vdev_spectral_conf_arg *arg);
 	struct sk_buff *(*gen_vdev_spectral_enable)(struct ath10k *ar, u32 vdev_id,
 						    u32 trigger, u32 enable);
+	struct sk_buff *(*gen_vdev_wmm_conf)(struct ath10k *ar, u32 vdev_id,
+					     const struct wmi_wmm_params_all_arg *arg);
 	struct sk_buff *(*gen_peer_create)(struct ath10k *ar, u32 vdev_id,
 					   const u8 peer_addr[ETH_ALEN]);
 	struct sk_buff *(*gen_peer_delete)(struct ath10k *ar, u32 vdev_id,
@@ -576,6 +578,21 @@ ath10k_wmi_vdev_spectral_enable(struct ath10k *ar, u32 vdev_id, u32 trigger,
 }
 
 static inline int
+ath10k_wmi_vdev_wmm_conf(struct ath10k *ar, u32 vdev_id,
+			 const struct wmi_wmm_params_all_arg *arg)
+{
+	struct sk_buff *skb;
+	u32 cmd_id;
+
+	skb = ar->wmi.ops->gen_vdev_wmm_conf(ar, vdev_id, arg);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	cmd_id = ar->wmi.cmd->vdev_set_wmm_params_cmdid;
+	return ath10k_wmi_cmd_send(ar, skb, cmd_id);
+}
+
+static inline int
 ath10k_wmi_peer_create(struct ath10k *ar, u32 vdev_id,
 		       const u8 peer_addr[ETH_ALEN])
 {
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 3e9725b..64722f3 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1422,6 +1422,42 @@ static void *ath10k_wmi_tlv_put_wmm(void *ptr,
 }
 
 static struct sk_buff *
+ath10k_wmi_tlv_op_gen_vdev_wmm_conf(struct ath10k *ar, u32 vdev_id,
+				    const struct wmi_wmm_params_all_arg *arg)
+{
+	struct wmi_tlv_vdev_set_wmm_cmd *cmd;
+	struct wmi_wmm_params *wmm;
+	struct wmi_tlv *tlv;
+	struct sk_buff *skb;
+	size_t len;
+	void *ptr;
+
+	len = (sizeof(*tlv) + sizeof(*cmd)) +
+	      (4 * (sizeof(*tlv) + sizeof(*wmm)));
+	skb = ath10k_wmi_alloc_skb(ar, len);
+	if (!skb)
+		return ERR_PTR(-ENOMEM);
+
+	ptr = (void *)skb->data;
+	tlv = ptr;
+	tlv->tag = __cpu_to_le16(WMI_TLV_TAG_STRUCT_VDEV_SET_WMM_PARAMS_CMD);
+	tlv->len = __cpu_to_le16(sizeof(*cmd));
+	cmd = (void *)tlv->value;
+	cmd->vdev_id = __cpu_to_le32(vdev_id);
+
+	ptr += sizeof(*tlv);
+	ptr += sizeof(*cmd);
+
+	ptr = ath10k_wmi_tlv_put_wmm(ptr, &arg->ac_be);
+	ptr = ath10k_wmi_tlv_put_wmm(ptr, &arg->ac_bk);
+	ptr = ath10k_wmi_tlv_put_wmm(ptr, &arg->ac_vi);
+	ptr = ath10k_wmi_tlv_put_wmm(ptr, &arg->ac_vo);
+
+	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi tlv vdev wmm conf\n");
+	return skb;
+}
+
+static struct sk_buff *
 ath10k_wmi_tlv_op_gen_peer_create(struct ath10k *ar, u32 vdev_id,
 				  const u8 peer_addr[ETH_ALEN])
 {
@@ -2248,6 +2284,7 @@ static struct wmi_cmd_map wmi_tlv_cmd_map = {
 	.gpio_config_cmdid = WMI_TLV_GPIO_CONFIG_CMDID,
 	.gpio_output_cmdid = WMI_TLV_GPIO_OUTPUT_CMDID,
 	.pdev_get_temperature_cmdid = WMI_TLV_CMD_UNSUPPORTED,
+	.vdev_set_wmm_params_cmdid = WMI_TLV_VDEV_SET_WMM_PARAMS_CMDID,
 };
 
 static struct wmi_pdev_param_map wmi_tlv_pdev_param_map = {
@@ -2391,6 +2428,7 @@ static const struct wmi_ops wmi_tlv_ops = {
 	.gen_vdev_down = ath10k_wmi_tlv_op_gen_vdev_down,
 	.gen_vdev_set_param = ath10k_wmi_tlv_op_gen_vdev_set_param,
 	.gen_vdev_install_key = ath10k_wmi_tlv_op_gen_vdev_install_key,
+	.gen_vdev_wmm_conf = ath10k_wmi_tlv_op_gen_vdev_wmm_conf,
 	.gen_peer_create = ath10k_wmi_tlv_op_gen_peer_create,
 	.gen_peer_delete = ath10k_wmi_tlv_op_gen_peer_delete,
 	.gen_peer_flush = ath10k_wmi_tlv_op_gen_peer_flush,
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index eb02290..27f7455 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1302,6 +1302,10 @@ struct wmi_tlv_pdev_set_wmm_cmd {
 	__le32 dg_type; /* no idea.. */
 } __packed;
 
+struct wmi_tlv_vdev_set_wmm_cmd {
+	__le32 vdev_id;
+} __packed;
+
 struct wmi_tlv_phyerr_ev {
 	__le32 num_phyerrs;
 	__le32 tsf_l32;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 105d561..1e0ccea 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5015,6 +5015,7 @@ static const struct wmi_ops wmi_ops = {
 	.gen_vdev_install_key = ath10k_wmi_op_gen_vdev_install_key,
 	.gen_vdev_spectral_conf = ath10k_wmi_op_gen_vdev_spectral_conf,
 	.gen_vdev_spectral_enable = ath10k_wmi_op_gen_vdev_spectral_enable,
+	/* .gen_vdev_wmm_conf not implemented */
 	.gen_peer_create = ath10k_wmi_op_gen_peer_create,
 	.gen_peer_delete = ath10k_wmi_op_gen_peer_delete,
 	.gen_peer_flush = ath10k_wmi_op_gen_peer_flush,
@@ -5078,6 +5079,7 @@ static const struct wmi_ops wmi_10_1_ops = {
 	.gen_vdev_install_key = ath10k_wmi_op_gen_vdev_install_key,
 	.gen_vdev_spectral_conf = ath10k_wmi_op_gen_vdev_spectral_conf,
 	.gen_vdev_spectral_enable = ath10k_wmi_op_gen_vdev_spectral_enable,
+	/* .gen_vdev_wmm_conf not implemented */
 	.gen_peer_create = ath10k_wmi_op_gen_peer_create,
 	.gen_peer_delete = ath10k_wmi_op_gen_peer_delete,
 	.gen_peer_flush = ath10k_wmi_op_gen_peer_flush,
@@ -5199,6 +5201,7 @@ static const struct wmi_ops wmi_10_2_4_ops = {
 	.gen_vdev_install_key = ath10k_wmi_op_gen_vdev_install_key,
 	.gen_vdev_spectral_conf = ath10k_wmi_op_gen_vdev_spectral_conf,
 	.gen_vdev_spectral_enable = ath10k_wmi_op_gen_vdev_spectral_enable,
+	/* .gen_vdev_wmm_conf not implemented */
 	.gen_peer_create = ath10k_wmi_op_gen_peer_create,
 	.gen_peer_delete = ath10k_wmi_op_gen_peer_delete,
 	.gen_peer_flush = ath10k_wmi_op_gen_peer_flush,
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index ab89359..8d71249 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -551,6 +551,7 @@ struct wmi_cmd_map {
 	u32 gpio_config_cmdid;
 	u32 gpio_output_cmdid;
 	u32 pdev_get_temperature_cmdid;
+	u32 vdev_set_wmm_params_cmdid;
 };
 
 /*
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
