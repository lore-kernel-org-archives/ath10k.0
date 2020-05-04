Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVcBN-0000PS-7T
 for ath10k@lists.infradead.org; Mon, 04 May 2020 14:35:00 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] ath10k: Remove msdu from idr when management pkt send fails
Date: Mon,  4 May 2020 20:04:39 +0530
Message-Id: <1588602879-14098-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

Currently when the sending of any management pkt
via wmi command fails, the packet is being unmapped
freed in the error handling. But the idr entry added,
which is used to track these packet is not getting removed.

Hence, during unload, in wmi cleanup, all the entries
in IDR are removed and the corresponding buffer is
attempted to be freed. This can cause a situation where
one packet is attempted to be freed twice.

Fix this error by rmeoving the msdu from the idr
list when the sending of a management packet over
wmi fails.

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Fixes: 1807da49733e ("ath10k: wmi: add management tx by reference support over wmi")
Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-ops.h |  7 ++++++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 15 +++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-ops.h b/drivers/net/wireless/ath/ath10k/wmi-ops.h
index 1491c25..de15e62 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-ops.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-ops.h
@@ -216,6 +216,7 @@ struct wmi_ops {
 	struct sk_buff *(*gen_bb_timing)
 			(struct ath10k *ar,
 			 const struct wmi_bb_timing_cfg_arg *arg);
+	int (*cleanup_mgmt_tx_send)(struct ath10k *ar, struct sk_buff *msdu);
 
 };
 
@@ -457,8 +458,12 @@ ath10k_wmi_mgmt_tx_send(struct ath10k *ar, struct sk_buff *msdu,
 
 	ret = ath10k_wmi_cmd_send(ar, skb,
 				  ar->wmi.cmd->mgmt_tx_send_cmdid);
-	if (ret)
+	if (ret) {
+		/* remove this msdu from idr tracking */
+		if (ar->wmi.ops->cleanup_mgmt_tx_send)
+			ar->wmi.ops->cleanup_mgmt_tx_send(ar, msdu);
 		return ret;
+	}
 
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index e1ab900f..b2a4a44 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -2898,6 +2898,18 @@ ath10k_wmi_tlv_op_gen_request_stats(struct ath10k *ar, u32 stats_mask)
 }
 
 static int
+ath10k_wmi_tlv_op_cleanup_mgmt_tx_send(struct ath10k *ar,
+				       struct sk_buff *msdu)
+{
+	struct ath10k_skb_cb *cb = ATH10K_SKB_CB(msdu);
+	struct ath10k_wmi *wmi = &ar->wmi;
+
+	idr_remove(&wmi->mgmt_pending_tx, cb->msdu_id);
+
+	return 0;
+}
+
+static int
 ath10k_wmi_mgmt_tx_alloc_msdu_id(struct ath10k *ar, struct sk_buff *skb,
 				 dma_addr_t paddr)
 {
@@ -2971,6 +2983,8 @@ ath10k_wmi_tlv_op_gen_mgmt_tx_send(struct ath10k *ar, struct sk_buff *msdu,
 	if (desc_id < 0)
 		goto err_free_skb;
 
+	cb->msdu_id = desc_id;
+
 	ptr = (void *)skb->data;
 	tlv = ptr;
 	tlv->tag = __cpu_to_le16(WMI_TLV_TAG_STRUCT_MGMT_TX_CMD);
@@ -4447,6 +4461,7 @@ static const struct wmi_ops wmi_tlv_ops = {
 	.gen_echo = ath10k_wmi_tlv_op_gen_echo,
 	.gen_vdev_spectral_conf = ath10k_wmi_tlv_op_gen_vdev_spectral_conf,
 	.gen_vdev_spectral_enable = ath10k_wmi_tlv_op_gen_vdev_spectral_enable,
+	.cleanup_mgmt_tx_send = ath10k_wmi_tlv_op_cleanup_mgmt_tx_send,
 };
 
 static const struct wmi_peer_flags_map wmi_tlv_peer_flags_map = {
-- 
2.7.4

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
