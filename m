Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x229.google.com ([2a00:1450:400c:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YC6SI-0000X2-EN
 for ath10k@lists.infradead.org; Fri, 16 Jan 2015 12:56:51 +0000
Received: by mail-we0-f169.google.com with SMTP id m14so20140386wev.0
 for <ath10k@lists.infradead.org>; Fri, 16 Jan 2015 04:56:24 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/2] ath10k: change dma beacon cmd prototype
Date: Fri, 16 Jan 2015 13:53:30 +0100
Message-Id: <1421412811-6387-1-git-send-email-michal.kazior@tieto.com>
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

The command logic shouldn't really care about
arvif structure.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi-ops.h | 14 ++++++++++----
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 20 +++++++++++---------
 drivers/net/wireless/ath/ath10k/wmi.c     | 27 +++++++++++++++++----------
 3 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-ops.h b/drivers/net/wireless/ath/ath10k/wmi-ops.h
index 0dd49a7..129cec4 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-ops.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-ops.h
@@ -102,7 +102,10 @@ struct wmi_ops {
 					 u32 value);
 	struct sk_buff *(*gen_scan_chan_list)(struct ath10k *ar,
 					      const struct wmi_scan_chan_list_arg *arg);
-	struct sk_buff *(*gen_beacon_dma)(struct ath10k_vif *arvif);
+	struct sk_buff *(*gen_beacon_dma)(struct ath10k *ar, u32 vdev_id,
+					  const void *bcn, size_t bcn_len,
+					  u32 bcn_paddr, bool dtim_zero,
+					  bool deliver_cab);
 	struct sk_buff *(*gen_pdev_set_wmm)(struct ath10k *ar,
 					    const struct wmi_pdev_set_wmm_params_arg *arg);
 	struct sk_buff *(*gen_request_stats)(struct ath10k *ar,
@@ -724,16 +727,19 @@ ath10k_wmi_peer_assoc(struct ath10k *ar,
 }
 
 static inline int
-ath10k_wmi_beacon_send_ref_nowait(struct ath10k_vif *arvif)
+ath10k_wmi_beacon_send_ref_nowait(struct ath10k *ar, u32 vdev_id,
+				  const void *bcn, size_t bcn_len,
+				  u32 bcn_paddr, bool dtim_zero,
+				  bool deliver_cab)
 {
-	struct ath10k *ar = arvif->ar;
 	struct sk_buff *skb;
 	int ret;
 
 	if (!ar->wmi.ops->gen_beacon_dma)
 		return -EOPNOTSUPP;
 
-	skb = ar->wmi.ops->gen_beacon_dma(arvif);
+	skb = ar->wmi.ops->gen_beacon_dma(ar, vdev_id, bcn, bcn_len, bcn_paddr,
+					  dtim_zero, deliver_cab);
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 6f34fc7..f44bbf0 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1728,13 +1728,15 @@ ath10k_wmi_tlv_op_gen_scan_chan_list(struct ath10k *ar,
 }
 
 static struct sk_buff *
-ath10k_wmi_tlv_op_gen_beacon_dma(struct ath10k_vif *arvif)
+ath10k_wmi_tlv_op_gen_beacon_dma(struct ath10k *ar, u32 vdev_id,
+				 const void *bcn, size_t bcn_len,
+				 u32 bcn_paddr, bool dtim_zero,
+				 bool deliver_cab)
+
 {
-	struct ath10k *ar = arvif->ar;
 	struct wmi_bcn_tx_ref_cmd *cmd;
 	struct wmi_tlv *tlv;
 	struct sk_buff *skb;
-	struct sk_buff *beacon = arvif->beacon;
 	struct ieee80211_hdr *hdr;
 	u16 fc;
 
@@ -1742,24 +1744,24 @@ ath10k_wmi_tlv_op_gen_beacon_dma(struct ath10k_vif *arvif)
 	if (!skb)
 		return ERR_PTR(-ENOMEM);
 
-	hdr = (struct ieee80211_hdr *)beacon->data;
+	hdr = (struct ieee80211_hdr *)bcn;
 	fc = le16_to_cpu(hdr->frame_control);
 
 	tlv = (void *)skb->data;
 	tlv->tag = __cpu_to_le16(WMI_TLV_TAG_STRUCT_BCN_SEND_FROM_HOST_CMD);
 	tlv->len = __cpu_to_le16(sizeof(*cmd));
 	cmd = (void *)tlv->value;
-	cmd->vdev_id = __cpu_to_le32(arvif->vdev_id);
-	cmd->data_len = __cpu_to_le32(beacon->len);
-	cmd->data_ptr = __cpu_to_le32(ATH10K_SKB_CB(beacon)->paddr);
+	cmd->vdev_id = __cpu_to_le32(vdev_id);
+	cmd->data_len = __cpu_to_le32(bcn_len);
+	cmd->data_ptr = __cpu_to_le32(bcn_paddr);
 	cmd->msdu_id = 0;
 	cmd->frame_control = __cpu_to_le32(fc);
 	cmd->flags = 0;
 
-	if (ATH10K_SKB_CB(beacon)->bcn.dtim_zero)
+	if (dtim_zero)
 		cmd->flags |= __cpu_to_le32(WMI_BCN_TX_REF_FLAG_DTIM_ZERO);
 
-	if (ATH10K_SKB_CB(beacon)->bcn.deliver_cab)
+	if (deliver_cab)
 		cmd->flags |= __cpu_to_le32(WMI_BCN_TX_REF_FLAG_DELIVER_CAB);
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi tlv beacon dma\n");
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 5fe17e8..5cc611f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -956,6 +956,8 @@ err_pull:
 
 static void ath10k_wmi_tx_beacon_nowait(struct ath10k_vif *arvif)
 {
+	struct sk_buff *bcn;
+	struct ath10k_skb_cb *cb;
 	int ret;
 
 	lockdep_assert_held(&arvif->ar->data_lock);
@@ -966,7 +968,12 @@ static void ath10k_wmi_tx_beacon_nowait(struct ath10k_vif *arvif)
 	if (arvif->beacon_sent)
 		return;
 
-	ret = ath10k_wmi_beacon_send_ref_nowait(arvif);
+	bcn = arvif->beacon;
+	cb = ATH10K_SKB_CB(bcn);
+	ret = ath10k_wmi_beacon_send_ref_nowait(arvif->ar, arvif->vdev_id,
+						bcn->data, bcn->len, cb->paddr,
+						cb->bcn.dtim_zero,
+						cb->bcn.deliver_cab);
 	if (ret)
 		return;
 
@@ -4683,12 +4690,12 @@ ath10k_wmi_10_2_op_gen_pdev_get_temperature(struct ath10k *ar)
 
 /* This function assumes the beacon is already DMA mapped */
 static struct sk_buff *
-ath10k_wmi_op_gen_beacon_dma(struct ath10k_vif *arvif)
+ath10k_wmi_op_gen_beacon_dma(struct ath10k *ar, u32 vdev_id, const void *bcn,
+			     size_t bcn_len, u32 bcn_paddr, bool dtim_zero,
+			     bool deliver_cab)
 {
-	struct ath10k *ar = arvif->ar;
 	struct wmi_bcn_tx_ref_cmd *cmd;
 	struct sk_buff *skb;
-	struct sk_buff *beacon = arvif->beacon;
 	struct ieee80211_hdr *hdr;
 	u16 fc;
 
@@ -4696,22 +4703,22 @@ ath10k_wmi_op_gen_beacon_dma(struct ath10k_vif *arvif)
 	if (!skb)
 		return ERR_PTR(-ENOMEM);
 
-	hdr = (struct ieee80211_hdr *)beacon->data;
+	hdr = (struct ieee80211_hdr *)bcn;
 	fc = le16_to_cpu(hdr->frame_control);
 
 	cmd = (struct wmi_bcn_tx_ref_cmd *)skb->data;
-	cmd->vdev_id = __cpu_to_le32(arvif->vdev_id);
-	cmd->data_len = __cpu_to_le32(beacon->len);
-	cmd->data_ptr = __cpu_to_le32(ATH10K_SKB_CB(beacon)->paddr);
+	cmd->vdev_id = __cpu_to_le32(vdev_id);
+	cmd->data_len = __cpu_to_le32(bcn_len);
+	cmd->data_ptr = __cpu_to_le32(bcn_paddr);
 	cmd->msdu_id = 0;
 	cmd->frame_control = __cpu_to_le32(fc);
 	cmd->flags = 0;
 	cmd->antenna_mask = __cpu_to_le32(WMI_BCN_TX_REF_DEF_ANTENNA);
 
-	if (ATH10K_SKB_CB(beacon)->bcn.dtim_zero)
+	if (dtim_zero)
 		cmd->flags |= __cpu_to_le32(WMI_BCN_TX_REF_FLAG_DTIM_ZERO);
 
-	if (ATH10K_SKB_CB(beacon)->bcn.deliver_cab)
+	if (deliver_cab)
 		cmd->flags |= __cpu_to_le32(WMI_BCN_TX_REF_FLAG_DELIVER_CAB);
 
 	return skb;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
