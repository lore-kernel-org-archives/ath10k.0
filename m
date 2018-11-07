Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKT0k-0002Jf-Db
 for ath10k@lists.infradead.org; Wed, 07 Nov 2018 18:57:08 +0000
Received: by mail-pf1-x443.google.com with SMTP id n11-v6so8088781pfb.6
 for <ath10k@lists.infradead.org>; Wed, 07 Nov 2018 10:56:56 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH REGRESSION] Revert "ath10k: add quiet mode support for
 QCA6174/QCA9377"
Date: Wed,  7 Nov 2018 10:56:43 -0800
Message-Id: <20181107185643.240346-1-briannorris@chromium.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Yu Wang <yyuwang@codeaurora.org>, Rakesh Pillai <pillair@codeaurora.org>

This reverts commit cfb353c0dc058bc1619cc226d3cbbda1f360bdd3.

WCN3990 firmware does not yet implement this feature, and so it crashes
like this:

  fatal error received: err_qdi.c:456:EX:wlan_process:1:WLAN RT:207a:PC=b001b4f0

This feature can be re-implemented with a proper service bitmap or other
feature-discovery mechanism in the future. But it should not break
working boards.

Fixes: cfb353c0dc05 ("ath10k: add quiet mode support for QCA6174/QCA9377")
Cc: Yu Wang <yyuwang@codeaurora.org>
Cc: Rakesh Pillai <pillair@codeaurora.org>
Cc: Govind Singh <govinds@codeaurora.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 33 +----------------------
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 16 -----------
 2 files changed, 1 insertion(+), 48 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index ad4114a88170..099e78b5de1f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -3209,37 +3209,6 @@ ath10k_wmi_tlv_op_gen_tdls_peer_update(struct ath10k *ar,
 	return skb;
 }
 
-static struct sk_buff *
-ath10k_wmi_tlv_op_gen_pdev_set_quiet_mode(struct ath10k *ar, u32 period,
-					  u32 duration, u32 next_offset,
-					  u32 enabled)
-{
-	struct wmi_tlv_set_quiet_cmd *cmd;
-	struct wmi_tlv *tlv;
-	struct sk_buff *skb;
-
-	skb = ath10k_wmi_alloc_skb(ar, sizeof(*tlv) + sizeof(*cmd));
-	if (!skb)
-		return ERR_PTR(-ENOMEM);
-
-	tlv = (void *)skb->data;
-	tlv->tag = __cpu_to_le16(WMI_TLV_TAG_STRUCT_PDEV_SET_QUIET_CMD);
-	tlv->len = __cpu_to_le16(sizeof(*cmd));
-	cmd = (void *)tlv->value;
-
-	/* vdev_id is not in use, set to 0 */
-	cmd->vdev_id = __cpu_to_le32(0);
-	cmd->period = __cpu_to_le32(period);
-	cmd->duration = __cpu_to_le32(duration);
-	cmd->next_start = __cpu_to_le32(next_offset);
-	cmd->enabled = __cpu_to_le32(enabled);
-
-	ath10k_dbg(ar, ATH10K_DBG_WMI,
-		   "wmi tlv quiet param: period %u duration %u enabled %d\n",
-		   period, duration, enabled);
-	return skb;
-}
-
 static struct sk_buff *
 ath10k_wmi_tlv_op_gen_wow_enable(struct ath10k *ar)
 {
@@ -4143,7 +4112,7 @@ static const struct wmi_ops wmi_tlv_ops = {
 	.gen_dbglog_cfg = ath10k_wmi_tlv_op_gen_dbglog_cfg,
 	.gen_pktlog_enable = ath10k_wmi_tlv_op_gen_pktlog_enable,
 	.gen_pktlog_disable = ath10k_wmi_tlv_op_gen_pktlog_disable,
-	.gen_pdev_set_quiet_mode = ath10k_wmi_tlv_op_gen_pdev_set_quiet_mode,
+	/* .gen_pdev_set_quiet_mode not implemented */
 	.gen_pdev_get_temperature = ath10k_wmi_tlv_op_gen_pdev_get_temperature,
 	/* .gen_addba_clear_resp not implemented */
 	/* .gen_addba_send not implemented */
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index bf8a4320c39c..5db294558ce5 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1,7 +1,6 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
  * purpose with or without fee is hereby granted, provided that the above
@@ -1980,21 +1979,6 @@ struct wmi_tlv_wow_add_del_event_cmd {
 	__le32 event_bitmap;
 } __packed;
 
-/* Command to set/unset chip in quiet mode */
-struct wmi_tlv_set_quiet_cmd {
-	__le32 vdev_id;
-
-	/* in TUs */
-	__le32 period;
-
-	/* in TUs */
-	__le32 duration;
-
-	/* offset in TUs */
-	__le32 next_start;
-	__le32 enabled;
-} __packed;
-
 struct wmi_tlv_wow_enable_cmd {
 	__le32 enable;
 } __packed;
-- 
2.19.1.930.g4563a0d9d0-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
