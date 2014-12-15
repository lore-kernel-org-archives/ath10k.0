Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0NyE-0003M0-J7
 for ath10k@lists.infradead.org; Mon, 15 Dec 2014 05:13:23 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 2/5] ath10k: add wmi support for pdev_set_quiet_mode
Date: Mon, 15 Dec 2014 10:41:11 +0530
Message-ID: <1418620274-3081-3-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1418620274-3081-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1418620274-3081-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Add WMI support to send pdev_set_quiet_mode command to target.
This will be used for thermal mitigation purpose.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi-ops.h | 22 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  1 +
 drivers/net/wireless/ath/ath10k/wmi.c     | 27 +++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-ops.h b/drivers/net/wireless/ath/ath10k/wmi-ops.h
index 1fbc520..feed0fe 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-ops.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-ops.h
@@ -114,6 +114,10 @@ struct wmi_ops {
 	struct sk_buff *(*gen_dbglog_cfg)(struct ath10k *ar, u32 module_enable);
 	struct sk_buff *(*gen_pktlog_enable)(struct ath10k *ar, u32 filter);
 	struct sk_buff *(*gen_pktlog_disable)(struct ath10k *ar);
+	struct sk_buff *(*gen_pdev_set_quiet_mode)(struct ath10k *ar,
+						   u32 period, u32 duration,
+						   u32 next_offset,
+						   u32 enabled);
 };
 
 int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id);
@@ -818,4 +822,22 @@ ath10k_wmi_pdev_pktlog_disable(struct ath10k *ar)
 				   ar->wmi.cmd->pdev_pktlog_disable_cmdid);
 }
 
+static inline int
+ath10k_wmi_pdev_set_quiet_mode(struct ath10k *ar, u32 period, u32 duration,
+			       u32 next_offset, u32 enabled)
+{
+	struct sk_buff *skb;
+
+	if (!ar->wmi.ops->gen_pdev_set_quiet_mode)
+		return -EOPNOTSUPP;
+
+	skb = ar->wmi.ops->gen_pdev_set_quiet_mode(ar, period, duration,
+						   next_offset, enabled);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	return ath10k_wmi_cmd_send(ar, skb,
+				   ar->wmi.cmd->pdev_set_quiet_mode_cmdid);
+}
+
 #endif
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 1627ec5..e203dad 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -2204,6 +2204,7 @@ static const struct wmi_ops wmi_tlv_ops = {
 	.gen_dbglog_cfg = ath10k_wmi_tlv_op_gen_dbglog_cfg,
 	.gen_pktlog_enable = ath10k_wmi_tlv_op_gen_pktlog_enable,
 	.gen_pktlog_disable = ath10k_wmi_tlv_op_gen_pktlog_disable,
+	/* .gen_pdev_set_quiet_mode not implemented */
 };
 
 /************/
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index c42382c..abf4c98 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4589,6 +4589,30 @@ ath10k_wmi_op_gen_pktlog_disable(struct ath10k *ar)
 	return skb;
 }
 
+static struct sk_buff *
+ath10k_wmi_op_gen_pdev_set_quiet_mode(struct ath10k *ar, u32 period,
+				      u32 duration, u32 next_offset,
+				      u32 enabled)
+{
+	struct wmi_pdev_set_quiet_cmd *cmd;
+	struct sk_buff *skb;
+
+	skb = ath10k_wmi_alloc_skb(ar, sizeof(*cmd));
+	if (!skb)
+		return ERR_PTR(-ENOMEM);
+
+	cmd = (struct wmi_pdev_set_quiet_cmd *)skb->data;
+	cmd->period = __cpu_to_le32(period);
+	cmd->duration = __cpu_to_le32(duration);
+	cmd->next_start = __cpu_to_le32(next_offset);
+	cmd->enabled = __cpu_to_le32(enabled);
+
+	ath10k_dbg(ar, ATH10K_DBG_WMI,
+		   "wmi quiet param: period %u duration %u enabled %d\n",
+		   period, duration, enabled);
+	return skb;
+}
+
 static const struct wmi_ops wmi_ops = {
 	.rx = ath10k_wmi_op_rx,
 	.map_svc = wmi_main_svc_map,
@@ -4638,6 +4662,7 @@ static const struct wmi_ops wmi_ops = {
 	.gen_dbglog_cfg = ath10k_wmi_op_gen_dbglog_cfg,
 	.gen_pktlog_enable = ath10k_wmi_op_gen_pktlog_enable,
 	.gen_pktlog_disable = ath10k_wmi_op_gen_pktlog_disable,
+	.gen_pdev_set_quiet_mode = ath10k_wmi_op_gen_pdev_set_quiet_mode,
 };
 
 static const struct wmi_ops wmi_10_1_ops = {
@@ -4690,6 +4715,7 @@ static const struct wmi_ops wmi_10_1_ops = {
 	.gen_dbglog_cfg = ath10k_wmi_op_gen_dbglog_cfg,
 	.gen_pktlog_enable = ath10k_wmi_op_gen_pktlog_enable,
 	.gen_pktlog_disable = ath10k_wmi_op_gen_pktlog_disable,
+	.gen_pdev_set_quiet_mode = ath10k_wmi_op_gen_pdev_set_quiet_mode,
 };
 
 static const struct wmi_ops wmi_10_2_ops = {
@@ -4743,6 +4769,7 @@ static const struct wmi_ops wmi_10_2_ops = {
 	.gen_dbglog_cfg = ath10k_wmi_op_gen_dbglog_cfg,
 	.gen_pktlog_enable = ath10k_wmi_op_gen_pktlog_enable,
 	.gen_pktlog_disable = ath10k_wmi_op_gen_pktlog_disable,
+	.gen_pdev_set_quiet_mode = ath10k_wmi_op_gen_pdev_set_quiet_mode,
 };
 
 int ath10k_wmi_attach(struct ath10k *ar)
-- 
2.1.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
