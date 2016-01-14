Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJrV2-00059w-9c
 for ath10k@lists.infradead.org; Thu, 14 Jan 2016 23:40:17 +0000
From: Yanbo Li <yanbol@qca.qualcomm.com>
Subject: [PATCH] ath10k: Remove the p2p notice of absence info from 10.2.4 FW
 beacon info
Date: Thu, 14 Jan 2016 15:39:19 -0800
Message-ID: <1452814759-20377-1-git-send-email-yanbol@qca.qualcomm.com>
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
To: kvalo@qca.qualcomm.com
Cc: dreamfly281@gmail.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

The p2p NOA never been supported at 10.2.4 FW, remove it to avoid SWBA
event parse error for multi beacon interval case.

Signed-off-by: Yanbo Li <yanbol@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 46 ++++++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi.h | 10 ++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index a7c3d299639b..fcc9ffd396da 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3244,6 +3244,50 @@ static int ath10k_wmi_op_pull_swba_ev(struct ath10k *ar, struct sk_buff *skb,
 	return 0;
 }
 
+static int ath10k_wmi_10_2_4_op_pull_swba_ev(struct ath10k *ar,
+					     struct sk_buff *skb,
+					     struct wmi_swba_ev_arg *arg)
+{
+	struct wmi_10_2_4_host_swba_event *ev = (void *)skb->data;
+	u32 map;
+	size_t i;
+
+	if (skb->len < sizeof(*ev))
+		return -EPROTO;
+
+	skb_pull(skb, sizeof(*ev));
+	arg->vdev_map = ev->vdev_map;
+
+	for (i = 0, map = __le32_to_cpu(ev->vdev_map); map; map >>= 1) {
+		if (!(map & BIT(0)))
+			continue;
+
+		/* If this happens there were some changes in firmware and
+		 * ath10k should update the max size of tim_info array.
+		 */
+		if (WARN_ON_ONCE(i == ARRAY_SIZE(arg->tim_info)))
+			break;
+
+		if (__le32_to_cpu(ev->bcn_info[i].tim_info.tim_len) >
+		     sizeof(ev->bcn_info[i].tim_info.tim_bitmap)) {
+			ath10k_warn(ar, "refusing to parse invalid swba structure\n");
+			return -EPROTO;
+		}
+
+		arg->tim_info[i].tim_len = ev->bcn_info[i].tim_info.tim_len;
+		arg->tim_info[i].tim_mcast = ev->bcn_info[i].tim_info.tim_mcast;
+		arg->tim_info[i].tim_bitmap =
+				ev->bcn_info[i].tim_info.tim_bitmap;
+		arg->tim_info[i].tim_changed =
+				ev->bcn_info[i].tim_info.tim_changed;
+		arg->tim_info[i].tim_num_ps_pending =
+				ev->bcn_info[i].tim_info.tim_num_ps_pending;
+		i++;
+	}
+
+	return 0;
+}
+
 static int ath10k_wmi_10_4_op_pull_swba_ev(struct ath10k *ar,
 					   struct sk_buff *skb,
 					   struct wmi_swba_ev_arg *arg)
@@ -7566,7 +7610,7 @@ static const struct wmi_ops wmi_10_2_4_ops = {
 	.pull_ch_info = ath10k_wmi_op_pull_ch_info_ev,
 	.pull_vdev_start = ath10k_wmi_op_pull_vdev_start_ev,
 	.pull_peer_kick = ath10k_wmi_op_pull_peer_kick_ev,
-	.pull_swba = ath10k_wmi_op_pull_swba_ev,
+	.pull_swba = ath10k_wmi_10_2_4_op_pull_swba_ev,
 	.pull_phyerr_hdr = ath10k_wmi_op_pull_phyerr_ev_hdr,
 	.pull_phyerr = ath10k_wmi_op_pull_phyerr_ev,
 	.pull_rdy = ath10k_wmi_op_pull_rdy_ev,
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index d85ad7855d20..58d33a7fd5db 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -5442,6 +5442,16 @@ struct wmi_host_swba_event {
 	struct wmi_bcn_info bcn_info[0];
 } __packed;
 
+struct wmi_10_2_4_bcn_info {
+	struct wmi_tim_info tim_info;
+	/* The 10.2.4 FW doesn't have p2p NOA info */
+} __packed;
+
+struct wmi_10_2_4_host_swba_event {
+	__le32 vdev_map;
+	struct wmi_10_2_4_bcn_info bcn_info[0];
+} __packed;
+
 /* 16 words = 512 client + 1 word = for guard */
 #define WMI_10_4_TIM_BITMAP_ARRAY_SIZE 17
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
