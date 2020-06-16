Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlKLN-0002F8-Id
 for ath10k@lists.infradead.org; Tue, 16 Jun 2020 22:46:14 +0000
Date: Tue, 16 Jun 2020 17:51:32 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH][next] ath10k: wmi: Use struct_size() helper in
 ath10k_wmi_alloc_skb()
Message-ID: <20200616225132.GA19873@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes. Also, remove unnecessary
variable _len_.

This code was detected with the help of Coccinelle and, audited and
fixed manually.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 32 +++++++--------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index a81a1ab2de19..b89681394a15 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -6551,7 +6551,7 @@ static struct sk_buff *ath10k_wmi_op_gen_init(struct ath10k *ar)
 	struct wmi_init_cmd *cmd;
 	struct sk_buff *buf;
 	struct wmi_resource_config config = {};
-	u32 len, val;
+	u32 val;
 
 	config.num_vdevs = __cpu_to_le32(TARGET_NUM_VDEVS);
 	config.num_peers = __cpu_to_le32(TARGET_NUM_PEERS);
@@ -6603,10 +6603,7 @@ static struct sk_buff *ath10k_wmi_op_gen_init(struct ath10k *ar)
 	config.num_msdu_desc = __cpu_to_le32(TARGET_NUM_MSDU_DESC);
 	config.max_frag_entries = __cpu_to_le32(TARGET_MAX_FRAG_ENTRIES);
 
-	len = sizeof(*cmd) +
-	      (sizeof(struct host_memory_chunk) * ar->wmi.num_mem_chunks);
-
-	buf = ath10k_wmi_alloc_skb(ar, len);
+	buf = ath10k_wmi_alloc_skb(ar, struct_size(cmd, mem_chunks.items, ar->wmi.num_mem_chunks));
 	if (!buf)
 		return ERR_PTR(-ENOMEM);
 
@@ -6624,7 +6621,7 @@ static struct sk_buff *ath10k_wmi_10_1_op_gen_init(struct ath10k *ar)
 	struct wmi_init_cmd_10x *cmd;
 	struct sk_buff *buf;
 	struct wmi_resource_config_10x config = {};
-	u32 len, val;
+	u32 val;
 
 	config.num_vdevs = __cpu_to_le32(TARGET_10X_NUM_VDEVS);
 	config.num_peers = __cpu_to_le32(TARGET_10X_NUM_PEERS);
@@ -6668,10 +6665,7 @@ static struct sk_buff *ath10k_wmi_10_1_op_gen_init(struct ath10k *ar)
 	config.num_msdu_desc = __cpu_to_le32(TARGET_10X_NUM_MSDU_DESC);
 	config.max_frag_entries = __cpu_to_le32(TARGET_10X_MAX_FRAG_ENTRIES);
 
-	len = sizeof(*cmd) +
-	      (sizeof(struct host_memory_chunk) * ar->wmi.num_mem_chunks);
-
-	buf = ath10k_wmi_alloc_skb(ar, len);
+	buf = ath10k_wmi_alloc_skb(ar, struct_size(cmd, mem_chunks.items, ar->wmi.num_mem_chunks));
 	if (!buf)
 		return ERR_PTR(-ENOMEM);
 
@@ -6689,7 +6683,7 @@ static struct sk_buff *ath10k_wmi_10_2_op_gen_init(struct ath10k *ar)
 	struct wmi_init_cmd_10_2 *cmd;
 	struct sk_buff *buf;
 	struct wmi_resource_config_10x config = {};
-	u32 len, val, features;
+	u32 val, features;
 
 	config.num_vdevs = __cpu_to_le32(TARGET_10X_NUM_VDEVS);
 	config.num_peer_keys = __cpu_to_le32(TARGET_10X_NUM_PEER_KEYS);
@@ -6741,10 +6735,7 @@ static struct sk_buff *ath10k_wmi_10_2_op_gen_init(struct ath10k *ar)
 	config.num_msdu_desc = __cpu_to_le32(TARGET_10X_NUM_MSDU_DESC);
 	config.max_frag_entries = __cpu_to_le32(TARGET_10X_MAX_FRAG_ENTRIES);
 
-	len = sizeof(*cmd) +
-	      (sizeof(struct host_memory_chunk) * ar->wmi.num_mem_chunks);
-
-	buf = ath10k_wmi_alloc_skb(ar, len);
+	buf = ath10k_wmi_alloc_skb(ar, struct_size(cmd, mem_chunks.items, ar->wmi.num_mem_chunks));
 	if (!buf)
 		return ERR_PTR(-ENOMEM);
 
@@ -6776,7 +6767,6 @@ static struct sk_buff *ath10k_wmi_10_4_op_gen_init(struct ath10k *ar)
 	struct wmi_init_cmd_10_4 *cmd;
 	struct sk_buff *buf;
 	struct wmi_resource_config_10_4 config = {};
-	u32 len;
 
 	config.num_vdevs = __cpu_to_le32(ar->max_num_vdevs);
 	config.num_peers = __cpu_to_le32(ar->max_num_peers);
@@ -6838,10 +6828,7 @@ static struct sk_buff *ath10k_wmi_10_4_op_gen_init(struct ath10k *ar)
 	config.iphdr_pad_config = __cpu_to_le32(TARGET_10_4_IPHDR_PAD_CONFIG);
 	config.qwrap_config = __cpu_to_le32(TARGET_10_4_QWRAP_CONFIG);
 
-	len = sizeof(*cmd) +
-	      (sizeof(struct host_memory_chunk) * ar->wmi.num_mem_chunks);
-
-	buf = ath10k_wmi_alloc_skb(ar, len);
+	buf = ath10k_wmi_alloc_skb(ar, struct_size(cmd, mem_chunks.items, ar->wmi.num_mem_chunks));
 	if (!buf)
 		return ERR_PTR(-ENOMEM);
 
@@ -7549,12 +7536,9 @@ ath10k_wmi_op_gen_scan_chan_list(struct ath10k *ar,
 	struct sk_buff *skb;
 	struct wmi_channel_arg *ch;
 	struct wmi_channel *ci;
-	int len;
 	int i;
 
-	len = sizeof(*cmd) + arg->n_channels * sizeof(struct wmi_channel);
-
-	skb = ath10k_wmi_alloc_skb(ar, len);
+	skb = ath10k_wmi_alloc_skb(ar, struct_size(cmd, chan_info, arg->n_channels));
 	if (!skb)
 		return ERR_PTR(-EINVAL);
 
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
