Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyxIr-00075y-9F
 for ath10k@lists.infradead.org; Wed, 27 Feb 2019 11:23:11 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 2/2] ath10k: Added support to reset HTT stats in debugfs
Date: Wed, 27 Feb 2019 16:54:42 +0530
Message-Id: <1551266682-32073-2-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1551266682-32073-1-git-send-email-mkenna@codeaurora.org>
References: <1551266682-32073-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, vikpatel@codeaurora.org, arnagara@codeaurora.org, linux-wireless@vger.kernel.org

Reset HTT stats helps to get the aggregated HTT stats via
tracing and also we can clear the accumulated HTT stats with
this debugfs file.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.h   |  1 +
 drivers/net/wireless/ath/ath10k/debug.c  | 43 +++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/htt.h    |  3 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c |  5 +--
 4 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 27ec5557de88..317a41c2a9b1 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -614,6 +614,7 @@ struct ath10k_debug {
 	bool fw_stats_done;
 
 	unsigned long htt_stats_mask;
+	unsigned long reset_htt_stats;
 	struct delayed_work htt_stats_dwork;
 	struct ath10k_dfs_stats dfs_stats;
 	struct ath_dfs_pool_stats dfs_pool_stats;
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index ca1af0e1623c..daf30eaa53c5 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -873,7 +873,7 @@ static int ath10k_debug_htt_stats_req(struct ath10k *ar)
 	cookie = get_jiffies_64();
 
 	ret = ath10k_htt_h2t_stats_req(&ar->htt, ar->debug.htt_stats_mask,
-				       cookie);
+				       ar->debug.reset_htt_stats, cookie);
 	if (ret) {
 		ath10k_warn(ar, "failed to send htt stats request: %d\n", ret);
 		return ret;
@@ -2466,6 +2466,44 @@ static const struct file_operations fops_ps_state_enable = {
 	.llseek = default_llseek,
 };
 
+static ssize_t ath10k_write_reset_htt_stats(struct file *file,
+					    const char __user *user_buf,
+					    size_t count, loff_t *ppos)
+{
+	struct ath10k *ar = file->private_data;
+	unsigned long reset;
+	int ret;
+
+	ret = kstrtoul_from_user(user_buf, count, 0, &reset);
+	if (ret)
+		return ret;
+
+	if (reset == 0 || reset > 0x1ffff)
+		return -EINVAL;
+
+	mutex_lock(&ar->conf_mutex);
+
+	ar->debug.reset_htt_stats = reset;
+
+	ret = ath10k_debug_htt_stats_req(ar);
+	if (ret)
+		goto out;
+
+	ar->debug.reset_htt_stats = 0;
+	ret = count;
+
+out:
+	mutex_unlock(&ar->conf_mutex);
+	return ret;
+}
+
+static const struct file_operations fops_reset_htt_stats = {
+	.write = ath10k_write_reset_htt_stats,
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.llseek = default_llseek,
+};
+
 int ath10k_debug_create(struct ath10k *ar)
 {
 	ar->debug.cal_data = vzalloc(ATH10K_DEBUG_CAL_DATA_LEN);
@@ -2606,6 +2644,9 @@ int ath10k_debug_register(struct ath10k *ar)
 	debugfs_create_file("ps_state_enable", 0600, ar->debug.debugfs_phy, ar,
 			    &fops_ps_state_enable);
 
+	debugfs_create_file("reset_htt_stats", 0200, ar->debug.debugfs_phy, ar,
+			    &fops_reset_htt_stats);
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 8ff432bb2e86..b909f2f079c7 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -2110,7 +2110,8 @@ void ath10k_htt_htc_tx_complete(struct ath10k *ar, struct sk_buff *skb);
 void ath10k_htt_htc_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb);
 bool ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb);
 int ath10k_htt_h2t_ver_req_msg(struct ath10k_htt *htt);
-int ath10k_htt_h2t_stats_req(struct ath10k_htt *htt, u32 mask, u64 cookie);
+int ath10k_htt_h2t_stats_req(struct ath10k_htt *htt, u32 mask, u32 reset_mask,
+			     u64 cookie);
 int ath10k_htt_h2t_aggr_cfg_msg(struct ath10k_htt *htt,
 				u8 max_subfrms_ampdu,
 				u8 max_subfrms_amsdu);
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 7e5f0eba043b..524bd8b44580 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -580,7 +580,8 @@ int ath10k_htt_h2t_ver_req_msg(struct ath10k_htt *htt)
 	return 0;
 }
 
-int ath10k_htt_h2t_stats_req(struct ath10k_htt *htt, u32 mask, u64 cookie)
+int ath10k_htt_h2t_stats_req(struct ath10k_htt *htt, u32 mask, u32 reset_mask,
+			     u64 cookie)
 {
 	struct ath10k *ar = htt->ar;
 	struct htt_stats_req *req;
@@ -607,7 +608,7 @@ int ath10k_htt_h2t_stats_req(struct ath10k_htt *htt, u32 mask, u64 cookie)
 	 * about endian support
 	 */
 	memcpy(req->upload_types, &mask, 3);
-	memcpy(req->reset_types, &mask, 3);
+	memcpy(req->reset_types, &reset_mask, 3);
 	req->stat_type = HTT_STATS_REQ_CFG_STAT_TYPE_INVALID;
 	req->cookie_lsb = cpu_to_le32(cookie & 0xffffffff);
 	req->cookie_msb = cpu_to_le32((cookie & 0xffffffff00000000ULL) >> 32);
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
