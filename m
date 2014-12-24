Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3gsA-0002rN-1m
 for ath10k@lists.infradead.org; Wed, 24 Dec 2014 08:00:46 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH v2 4/8] ath10k: add wmi support for delba_send
Date: Wed, 24 Dec 2014 13:29:05 +0530
Message-ID: <1419407949-32367-5-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1419407949-32367-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1419407949-32367-1-git-send-email-rmanohar@qti.qualcomm.com>
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

Add WMI support for sending delba request. This command is used for
debugging purpose.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi-ops.h | 21 +++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  1 +
 drivers/net/wireless/ath/ath10k/wmi.c     | 31 +++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-ops.h b/drivers/net/wireless/ath/ath10k/wmi-ops.h
index e8f49de..3a3d15e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-ops.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-ops.h
@@ -126,6 +126,9 @@ struct wmi_ops {
 	struct sk_buff *(*gen_addba_set_resp)(struct ath10k *ar, u32 vdev_id,
 					      const u8 *mac, u32 tid,
 					      u32 status);
+	struct sk_buff *(*gen_delba_send)(struct ath10k *ar, u32 vdev_id,
+					  const u8 *mac, u32 tid, u32 initiator,
+					  u32 reason);
 };
 
 int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id);
@@ -914,4 +917,22 @@ ath10k_wmi_addba_set_resp(struct ath10k *ar, u32 vdev_id, const u8 *mac,
 				   ar->wmi.cmd->addba_set_resp_cmdid);
 }
 
+static inline int
+ath10k_wmi_delba_send(struct ath10k *ar, u32 vdev_id, const u8 *mac,
+		      u32 tid, u32 initiator, u32 reason)
+{
+	struct sk_buff *skb;
+
+	if (!ar->wmi.ops->gen_delba_send)
+		return -EOPNOTSUPP;
+
+	skb = ar->wmi.ops->gen_delba_send(ar, vdev_id, mac, tid, initiator,
+					  reason);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	return ath10k_wmi_cmd_send(ar, skb,
+				   ar->wmi.cmd->delba_send_cmdid);
+}
+
 #endif
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 63f9860..57d2b50 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -2210,6 +2210,7 @@ static const struct wmi_ops wmi_tlv_ops = {
 	/* .gen_addba_clear_resp not implemented */
 	/* .gen_addba_send not implemented */
 	/* .gen_addba_set_resp not implemented */
+	/* .gen_delba_send not implemented */
 };
 
 /************/
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index dd17c00..26d8139 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4953,6 +4953,33 @@ ath10k_wmi_op_gen_addba_set_resp(struct ath10k *ar, u32 vdev_id, const u8 *mac,
 	return skb;
 }
 
+static struct sk_buff *
+ath10k_wmi_op_gen_delba_send(struct ath10k *ar, u32 vdev_id, const u8 *mac,
+			     u32 tid, u32 initiator, u32 reason)
+{
+	struct wmi_delba_send_cmd *cmd;
+	struct sk_buff *skb;
+
+	if (!mac)
+		return ERR_PTR(-EINVAL);
+
+	skb = ath10k_wmi_alloc_skb(ar, sizeof(*cmd));
+	if (!skb)
+		return ERR_PTR(-ENOMEM);
+
+	cmd = (struct wmi_delba_send_cmd *)skb->data;
+	cmd->vdev_id = __cpu_to_le32(vdev_id);
+	ether_addr_copy(cmd->peer_macaddr.addr, mac);
+	cmd->tid = __cpu_to_le32(tid);
+	cmd->initiator = __cpu_to_le32(initiator);
+	cmd->reasoncode = __cpu_to_le32(reason);
+
+	ath10k_dbg(ar, ATH10K_DBG_WMI,
+		   "wmi delba send vdev_id 0x%X mac_addr %pM tid %u initiator %u reason %u\n",
+		   vdev_id, mac, tid, initiator, reason);
+	return skb;
+}
+
 static const struct wmi_ops wmi_ops = {
 	.rx = ath10k_wmi_op_rx,
 	.map_svc = wmi_main_svc_map,
@@ -5007,6 +5034,7 @@ static const struct wmi_ops wmi_ops = {
 	.gen_addba_clear_resp = ath10k_wmi_op_gen_addba_clear_resp,
 	.gen_addba_send = ath10k_wmi_op_gen_addba_send,
 	.gen_addba_set_resp = ath10k_wmi_op_gen_addba_set_resp,
+	.gen_delba_send = ath10k_wmi_op_gen_delba_send,
 };
 
 static const struct wmi_ops wmi_10_1_ops = {
@@ -5064,6 +5092,7 @@ static const struct wmi_ops wmi_10_1_ops = {
 	.gen_addba_clear_resp = ath10k_wmi_op_gen_addba_clear_resp,
 	.gen_addba_send = ath10k_wmi_op_gen_addba_send,
 	.gen_addba_set_resp = ath10k_wmi_op_gen_addba_set_resp,
+	.gen_delba_send = ath10k_wmi_op_gen_delba_send,
 };
 
 static const struct wmi_ops wmi_10_2_ops = {
@@ -5122,6 +5151,7 @@ static const struct wmi_ops wmi_10_2_ops = {
 	.gen_addba_clear_resp = ath10k_wmi_op_gen_addba_clear_resp,
 	.gen_addba_send = ath10k_wmi_op_gen_addba_send,
 	.gen_addba_set_resp = ath10k_wmi_op_gen_addba_set_resp,
+	.gen_delba_send = ath10k_wmi_op_gen_delba_send,
 };
 
 static const struct wmi_ops wmi_10_2_4_ops = {
@@ -5180,6 +5210,7 @@ static const struct wmi_ops wmi_10_2_4_ops = {
 	.gen_addba_clear_resp = ath10k_wmi_op_gen_addba_clear_resp,
 	.gen_addba_send = ath10k_wmi_op_gen_addba_send,
 	.gen_addba_set_resp = ath10k_wmi_op_gen_addba_set_resp,
+	.gen_delba_send = ath10k_wmi_op_gen_delba_send,
 };
 
 int ath10k_wmi_attach(struct ath10k *ar)
-- 
2.2.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
