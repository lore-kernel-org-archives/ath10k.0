Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dtfQt-0008I1-Dg
 for ath10k@lists.infradead.org; Sun, 17 Sep 2017 19:40:52 +0000
Received: by mail-lf0-x241.google.com with SMTP id l196so3535664lfl.3
 for <ath10k@lists.infradead.org>; Sun, 17 Sep 2017 12:40:26 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v3 02/11] ath10k: htt: RX ring config HL support
Date: Sun, 17 Sep 2017 21:40:04 +0200
Message-Id: <20170917194013.8658-3-erik.stromdahl@gmail.com>
In-Reply-To: <20170917194013.8658-1-erik.stromdahl@gmail.com>
References: <20170917194013.8658-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

Special HTT RX ring config message used by high latency
devices.

The main difference between HL and LL is that HL devices
do not use shared memory between device and host and thus,
no host paddr's are added to the RX config message.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt.c    |  5 +++-
 drivers/net/wireless/ath/ath10k/htt.h    |  1 +
 drivers/net/wireless/ath/ath10k/htt_tx.c | 51 ++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.c b/drivers/net/wireless/ath/ath10k/htt.c
index cd160b16db1e..29ed4afe52a4 100644
--- a/drivers/net/wireless/ath/ath10k/htt.c
+++ b/drivers/net/wireless/ath/ath10k/htt.c
@@ -258,7 +258,10 @@ int ath10k_htt_setup(struct ath10k_htt *htt)
 	if (status)
 		return status;
 
-	status = ath10k_htt_send_rx_ring_cfg_ll(htt);
+	if (ar->is_high_latency)
+		status = ath10k_htt_send_rx_ring_cfg_hl(htt);
+	else
+		status = ath10k_htt_send_rx_ring_cfg_ll(htt);
 	if (status) {
 		ath10k_warn(ar, "failed to setup rx ring: %d\n",
 			    status);
diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 6305308422c4..7ffa1d41f478 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1805,6 +1805,7 @@ int ath10k_htt_h2t_ver_req_msg(struct ath10k_htt *htt);
 int ath10k_htt_h2t_stats_req(struct ath10k_htt *htt, u8 mask, u64 cookie);
 int ath10k_htt_send_frag_desc_bank_cfg(struct ath10k_htt *htt);
 int ath10k_htt_send_rx_ring_cfg_ll(struct ath10k_htt *htt);
+int ath10k_htt_send_rx_ring_cfg_hl(struct ath10k_htt *htt);
 int ath10k_htt_h2t_aggr_cfg_msg(struct ath10k_htt *htt,
 				u8 max_subfrms_ampdu,
 				u8 max_subfrms_amsdu);
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 685faac1368f..8d85f82ad8f8 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -693,6 +693,57 @@ int ath10k_htt_send_rx_ring_cfg_ll(struct ath10k_htt *htt)
 	return 0;
 }
 
+int ath10k_htt_send_rx_ring_cfg_hl(struct ath10k_htt *htt)
+{
+	struct ath10k *ar = htt->ar;
+	struct sk_buff *skb;
+	struct htt_cmd *cmd;
+	struct htt_rx_ring_setup_ring *ring;
+	const int num_rx_ring = 1;
+	u16 flags;
+	int len;
+	int ret;
+
+	/*
+	 * the HW expects the buffer to be an integral number of 4-byte
+	 * "words"
+	 */
+	BUILD_BUG_ON(!IS_ALIGNED(HTT_RX_BUF_SIZE, 4));
+	BUILD_BUG_ON((HTT_RX_BUF_SIZE & HTT_MAX_CACHE_LINE_SIZE_MASK) != 0);
+
+	len = sizeof(cmd->hdr) + sizeof(cmd->rx_setup.hdr)
+	    + (sizeof(*ring) * num_rx_ring);
+	skb = ath10k_htc_alloc_skb(ar, len);
+	if (!skb)
+		return -ENOMEM;
+
+	skb_put(skb, len);
+
+	cmd = (struct htt_cmd *)skb->data;
+	ring = &cmd->rx_setup.rings[0];
+
+	cmd->hdr.msg_type = HTT_H2T_MSG_TYPE_RX_RING_CFG;
+	cmd->rx_setup.hdr.num_rings = 1;
+
+	flags = 0;
+	flags |= HTT_RX_RING_FLAGS_MSDU_PAYLOAD;
+	flags |= HTT_RX_RING_FLAGS_UNICAST_RX;
+	flags |= HTT_RX_RING_FLAGS_MULTICAST_RX;
+
+	memset(ring, 0, sizeof(*ring));
+	ring->rx_ring_len = __cpu_to_le16(HTT_RX_RING_SIZE_MIN);
+	ring->rx_ring_bufsize = __cpu_to_le16(HTT_RX_BUF_SIZE);
+	ring->flags = __cpu_to_le16(flags);
+
+	ret = ath10k_htc_send(&htt->ar->htc, htt->eid, skb);
+	if (ret) {
+		dev_kfree_skb_any(skb);
+		return ret;
+	}
+
+	return 0;
+}
+
 int ath10k_htt_h2t_aggr_cfg_msg(struct ath10k_htt *htt,
 				u8 max_subfrms_ampdu,
 				u8 max_subfrms_amsdu)
-- 
2.14.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
