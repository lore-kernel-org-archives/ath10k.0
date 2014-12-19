Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1rUR-0007gx-H9
 for ath10k@lists.infradead.org; Fri, 19 Dec 2014 06:56:44 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 3/8] ath10k: add wmi support for addba_set_resp
Date: Fri, 19 Dec 2014 12:24:54 +0530
Message-ID: <1418972099-5296-4-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1418972099-5296-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1418972099-5296-1-git-send-email-rmanohar@qti.qualcomm.com>
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

Add WMI support for sending addba response manually. This command
is used for debugging purpose.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi-ops.h | 20 ++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  1 +
 drivers/net/wireless/ath/ath10k/wmi.c     | 29 +++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-ops.h b/drivers/net/wireless/ath/ath10k/wmi-ops.h
index badf422..e8f49de 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-ops.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-ops.h
@@ -123,6 +123,9 @@ struct wmi_ops {
 						const u8 *mac);
 	struct sk_buff *(*gen_addba_send)(struct ath10k *ar, u32 vdev_id,
 					  const u8 *mac, u32 tid, u32 buf_size);
+	struct sk_buff *(*gen_addba_set_resp)(struct ath10k *ar, u32 vdev_id,
+					      const u8 *mac, u32 tid,
+					      u32 status);
 };
 
 int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id);
@@ -894,4 +897,21 @@ ath10k_wmi_addba_send(struct ath10k *ar, u32 vdev_id, const u8 *mac,
 				   ar->wmi.cmd->addba_send_cmdid);
 }
 
+static inline int
+ath10k_wmi_addba_set_resp(struct ath10k *ar, u32 vdev_id, const u8 *mac,
+			  u32 tid, u32 status)
+{
+	struct sk_buff *skb;
+
+	if (!ar->wmi.ops->gen_addba_set_resp)
+		return -EOPNOTSUPP;
+
+	skb = ar->wmi.ops->gen_addba_set_resp(ar, vdev_id, mac, tid, status);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	return ath10k_wmi_cmd_send(ar, skb,
+				   ar->wmi.cmd->addba_set_resp_cmdid);
+}
+
 #endif
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 74a0598..63f9860 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -2209,6 +2209,7 @@ static const struct wmi_ops wmi_tlv_ops = {
 	/* .gen_pdev_get_temperature not implemented */
 	/* .gen_addba_clear_resp not implemented */
 	/* .gen_addba_send not implemented */
+	/* .gen_addba_set_resp not implemented */
 };
 
 /************/
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index b118795..b5a771f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4694,6 +4694,32 @@ ath10k_wmi_op_gen_addba_send(struct ath10k *ar, u32 vdev_id, const u8 *mac,
 	return skb;
 }
 
+static struct sk_buff *
+ath10k_wmi_op_gen_addba_set_resp(struct ath10k *ar, u32 vdev_id, const u8 *mac,
+				 u32 tid, u32 status)
+{
+	struct wmi_addba_setresponse_cmd *cmd;
+	struct sk_buff *skb;
+
+	if (!mac)
+		return ERR_PTR(-EINVAL);
+
+	skb = ath10k_wmi_alloc_skb(ar, sizeof(*cmd));
+	if (!skb)
+		return ERR_PTR(-ENOMEM);
+
+	cmd = (struct wmi_addba_setresponse_cmd *)skb->data;
+	cmd->vdev_id = __cpu_to_le32(vdev_id);
+	ether_addr_copy(cmd->peer_macaddr.addr, mac);
+	cmd->tid = __cpu_to_le32(tid);
+	cmd->statuscode = __cpu_to_le32(status);
+
+	ath10k_dbg(ar, ATH10K_DBG_WMI,
+		   "wmi addba set resp vdev_id 0x%X mac_addr %pM tid %u status %u\n",
+		   vdev_id, mac, tid, status);
+	return skb;
+}
+
 static const struct wmi_ops wmi_ops = {
 	.rx = ath10k_wmi_op_rx,
 	.map_svc = wmi_main_svc_map,
@@ -4747,6 +4773,7 @@ static const struct wmi_ops wmi_ops = {
 	/* .gen_pdev_get_temperature not implemented */
 	.gen_addba_clear_resp = ath10k_wmi_op_gen_addba_clear_resp,
 	.gen_addba_send = ath10k_wmi_op_gen_addba_send,
+	.gen_addba_set_resp = ath10k_wmi_op_gen_addba_set_resp,
 };
 
 static const struct wmi_ops wmi_10_1_ops = {
@@ -4803,6 +4830,7 @@ static const struct wmi_ops wmi_10_1_ops = {
 	.gen_pdev_set_quiet_mode = ath10k_wmi_op_gen_pdev_set_quiet_mode,
 	.gen_addba_clear_resp = ath10k_wmi_op_gen_addba_clear_resp,
 	.gen_addba_send = ath10k_wmi_op_gen_addba_send,
+	.gen_addba_set_resp = ath10k_wmi_op_gen_addba_set_resp,
 };
 
 static const struct wmi_ops wmi_10_2_ops = {
@@ -4860,6 +4888,7 @@ static const struct wmi_ops wmi_10_2_ops = {
 	.gen_pdev_set_quiet_mode = ath10k_wmi_op_gen_pdev_set_quiet_mode,
 	.gen_addba_clear_resp = ath10k_wmi_op_gen_addba_clear_resp,
 	.gen_addba_send = ath10k_wmi_op_gen_addba_send,
+	.gen_addba_set_resp = ath10k_wmi_op_gen_addba_set_resp,
 };
 
 int ath10k_wmi_attach(struct ath10k *ar)
-- 
2.2.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
