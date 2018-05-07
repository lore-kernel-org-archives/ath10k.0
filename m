Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fFcck-0008GJ-Eq
 for ath10k@lists.infradead.org; Mon, 07 May 2018 09:40:05 +0000
Received: by mail-pg0-x244.google.com with SMTP id z4-v6so19805707pgu.13
 for <ath10k@lists.infradead.org>; Mon, 07 May 2018 02:39:51 -0700 (PDT)
Date: Mon, 7 May 2018 17:39:48 +0800
From: Kenneth Lu <kuohsianglu@gmail.com>
Subject: [PATCH v2] ath10k: remove variables which set but not used
Message-ID: <20180507093948.GA7905@blackstone>
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
To: kvalo@qca.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Variable buf_len and num_vdev_stats are bging assigned but never read.
These are redundant and can be remove.

Signed-off-by: Kenneth Lu <kuohsianglu@gmail.com>
---
Changes in v2:
Fixed compile failed in function 'ath10k_wmi_10_4_op_pull_fw_stats'
error: 'num_vdev_stats' undeclared
---
 drivers/net/wireless/ath/ath10k/wmi.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index bb8e9e2..46fb96e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2318,7 +2318,6 @@ int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	u32 phy_mode;
 	u32 snr;
 	u32 rate;
-	u32 buf_len;
 	u16 fc;
 	int ret;
 
@@ -2330,7 +2329,6 @@ int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	}
 
 	channel = __le32_to_cpu(arg.channel);
-	buf_len = __le32_to_cpu(arg.buf_len);
 	rx_status = __le32_to_cpu(arg.status);
 	snr = __le32_to_cpu(arg.snr);
 	phy_mode = __le32_to_cpu(arg.phy_mode);
@@ -2740,14 +2738,13 @@ static int ath10k_wmi_main_op_pull_fw_stats(struct ath10k *ar,
 					    struct ath10k_fw_stats *stats)
 {
 	const struct wmi_stats_event *ev = (void *)skb->data;
-	u32 num_pdev_stats, num_vdev_stats, num_peer_stats;
+	u32 num_pdev_stats, num_peer_stats;
 	int i;
 
 	if (!skb_pull(skb, sizeof(*ev)))
 		return -EPROTO;
 
 	num_pdev_stats = __le32_to_cpu(ev->num_pdev_stats);
-	num_vdev_stats = __le32_to_cpu(ev->num_vdev_stats);
 	num_peer_stats = __le32_to_cpu(ev->num_peer_stats);
 
 	for (i = 0; i < num_pdev_stats; i++) {
@@ -2795,14 +2792,13 @@ static int ath10k_wmi_10x_op_pull_fw_stats(struct ath10k *ar,
 					   struct ath10k_fw_stats *stats)
 {
 	const struct wmi_stats_event *ev = (void *)skb->data;
-	u32 num_pdev_stats, num_vdev_stats, num_peer_stats;
+	u32 num_pdev_stats, num_peer_stats;
 	int i;
 
 	if (!skb_pull(skb, sizeof(*ev)))
 		return -EPROTO;
 
 	num_pdev_stats = __le32_to_cpu(ev->num_pdev_stats);
-	num_vdev_stats = __le32_to_cpu(ev->num_vdev_stats);
 	num_peer_stats = __le32_to_cpu(ev->num_peer_stats);
 
 	for (i = 0; i < num_pdev_stats; i++) {
@@ -2856,7 +2852,6 @@ static int ath10k_wmi_10_2_op_pull_fw_stats(struct ath10k *ar,
 	const struct wmi_10_2_stats_event *ev = (void *)skb->data;
 	u32 num_pdev_stats;
 	u32 num_pdev_ext_stats;
-	u32 num_vdev_stats;
 	u32 num_peer_stats;
 	int i;
 
@@ -2865,7 +2860,6 @@ static int ath10k_wmi_10_2_op_pull_fw_stats(struct ath10k *ar,
 
 	num_pdev_stats = __le32_to_cpu(ev->num_pdev_stats);
 	num_pdev_ext_stats = __le32_to_cpu(ev->num_pdev_ext_stats);
-	num_vdev_stats = __le32_to_cpu(ev->num_vdev_stats);
 	num_peer_stats = __le32_to_cpu(ev->num_peer_stats);
 
 	for (i = 0; i < num_pdev_stats; i++) {
@@ -2935,7 +2929,6 @@ static int ath10k_wmi_10_2_4_op_pull_fw_stats(struct ath10k *ar,
 	const struct wmi_10_2_stats_event *ev = (void *)skb->data;
 	u32 num_pdev_stats;
 	u32 num_pdev_ext_stats;
-	u32 num_vdev_stats;
 	u32 num_peer_stats;
 	int i;
 
@@ -2944,7 +2937,6 @@ static int ath10k_wmi_10_2_4_op_pull_fw_stats(struct ath10k *ar,
 
 	num_pdev_stats = __le32_to_cpu(ev->num_pdev_stats);
 	num_pdev_ext_stats = __le32_to_cpu(ev->num_pdev_ext_stats);
-	num_vdev_stats = __le32_to_cpu(ev->num_vdev_stats);
 	num_peer_stats = __le32_to_cpu(ev->num_peer_stats);
 
 	for (i = 0; i < num_pdev_stats; i++) {
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
