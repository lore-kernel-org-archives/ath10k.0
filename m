Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuDff-0005lz-V3
 for ath10k@lists.infradead.org; Thu, 05 Nov 2015 06:05:16 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH V3 1/3] ath10k: Fix peer assoc complete WMI command for 10.4
Date: Thu, 5 Nov 2015 11:33:58 +0530
Message-ID: <1446703440-13880-2-git-send-email-vthiagar@qti.qualcomm.com>
In-Reply-To: <1446703440-13880-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1446703440-13880-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

There is an extra 4-byte member when compared to WMI 10.2 added to
assoc complete command in WMI 10.4. This new member is used for 160Mhz
related configuration. This WMI command mismatch between host and
firmware does not cause any real issues because this new member is not
used in 10.4 firmwares so far (10.4.1.00030-1). This difference in WMI
command interface brings in a new wmi_ops for 10.4 gen_peer_assoc().
No noticeable functionality differences with this change can be seen
with the current 10.4 firmwares, but the WMI interface has to be
fixed to work with future 10.4 firmwares which may be using this new
member.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 37 ++++++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi.h |  5 +++++
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 56806d9..9021079 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -6376,6 +6376,16 @@ ath10k_wmi_peer_assoc_fill_10_2(struct ath10k *ar, void *buf,
 	cmd->info0 = __cpu_to_le32(info0);
 }
 
+static void
+ath10k_wmi_peer_assoc_fill_10_4(struct ath10k *ar, void *buf,
+				const struct wmi_peer_assoc_complete_arg *arg)
+{
+	struct wmi_10_4_peer_assoc_complete_cmd *cmd = buf;
+
+	ath10k_wmi_peer_assoc_fill_10_2(ar, buf, arg);
+	cmd->peer_bw_rxnss_override = 0;
+}
+
 static int
 ath10k_wmi_peer_assoc_check_arg(const struct wmi_peer_assoc_complete_arg *arg)
 {
@@ -6465,6 +6475,31 @@ ath10k_wmi_10_2_op_gen_peer_assoc(struct ath10k *ar,
 }
 
 static struct sk_buff *
+ath10k_wmi_10_4_op_gen_peer_assoc(struct ath10k *ar,
+				  const struct wmi_peer_assoc_complete_arg *arg)
+{
+	size_t len = sizeof(struct wmi_10_4_peer_assoc_complete_cmd);
+	struct sk_buff *skb;
+	int ret;
+
+	ret = ath10k_wmi_peer_assoc_check_arg(arg);
+	if (ret)
+		return ERR_PTR(ret);
+
+	skb = ath10k_wmi_alloc_skb(ar, len);
+	if (!skb)
+		return ERR_PTR(-ENOMEM);
+
+	ath10k_wmi_peer_assoc_fill_10_4(ar, skb->data, arg);
+
+	ath10k_dbg(ar, ATH10K_DBG_WMI,
+		   "wmi peer assoc vdev %d addr %pM (%s)\n",
+		   arg->vdev_id, arg->addr,
+		   arg->peer_reassoc ? "reassociate" : "new");
+	return skb;
+}
+
+static struct sk_buff *
 ath10k_wmi_10_2_op_gen_pdev_get_temperature(struct ath10k *ar)
 {
 	struct sk_buff *skb;
@@ -7584,6 +7619,7 @@ static const struct wmi_ops wmi_10_4_ops = {
 	.gen_peer_delete = ath10k_wmi_op_gen_peer_delete,
 	.gen_peer_flush = ath10k_wmi_op_gen_peer_flush,
 	.gen_peer_set_param = ath10k_wmi_op_gen_peer_set_param,
+	.gen_peer_assoc = ath10k_wmi_10_4_op_gen_peer_assoc,
 	.gen_set_psmode = ath10k_wmi_op_gen_set_psmode,
 	.gen_set_sta_ps = ath10k_wmi_op_gen_set_sta_ps,
 	.gen_set_ap_ps = ath10k_wmi_op_gen_set_ap_ps,
@@ -7603,7 +7639,6 @@ static const struct wmi_ops wmi_10_4_ops = {
 	.fw_stats_fill = ath10k_wmi_10_4_op_fw_stats_fill,
 
 	/* shared with 10.2 */
-	.gen_peer_assoc = ath10k_wmi_10_2_op_gen_peer_assoc,
 	.gen_request_stats = ath10k_wmi_op_gen_request_stats,
 	.gen_pdev_get_temperature = ath10k_wmi_10_2_op_gen_pdev_get_temperature,
 };
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index a35c91e..80d3f1c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -5799,6 +5799,11 @@ struct wmi_10_2_peer_assoc_complete_cmd {
 	__le32 info0; /* WMI_PEER_ASSOC_INFO0_ */
 } __packed;
 
+struct wmi_10_4_peer_assoc_complete_cmd {
+	struct wmi_10_2_peer_assoc_complete_cmd cmd;
+	__le32 peer_bw_rxnss_override;
+} __packed;
+
 struct wmi_peer_assoc_complete_arg {
 	u8 addr[ETH_ALEN];
 	u32 vdev_id;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
