Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adYbm-0006T0-G3
 for ath10k@lists.infradead.org; Wed, 09 Mar 2016 07:32:39 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH v1 2/2] ath10k: Remove debugfs support for Per STA total rx
 duration
Date: Wed, 9 Mar 2016 13:01:21 +0530
Message-ID: <1457508681-17546-2-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1457508681-17546-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1457508681-17546-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: mohammed@codeaurora.org, Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, kvalo@codeaurora.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

cfg80211/nl80211 interface changes for per STA total rx-duration and
very basic 'ath10k_sta_statistics'  mac80211 callback is implemented
to extend support for per station statistics from the driver.

Also provision in 'iw dev wlan#N station dump' to parse rx-duration
is supported. So its safer to remove the debugfs entry for per STA
rx-duration

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
Dependencies:

1. cfg80211/nl80211: Add support for NL80211_STA_INFO_RX_DURATION
2. iw: Add support for NL80211_STA_INFO_RX_DURATION netlink.
3. ath10k: Add support for ath10k_sta_statistics support
4. ath10k: Enable debugfs provision to enable Peer Stats feature

 drivers/net/wireless/ath/ath10k/debugfs_sta.c |   24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
index 4c459f2..0f24327 100644
--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -271,28 +271,6 @@ static const struct file_operations fops_delba = {
 	.llseek = default_llseek,
 };
 
-static ssize_t ath10k_dbg_sta_read_rx_duration(struct file *file,
-					       char __user *user_buf,
-					       size_t count, loff_t *ppos)
-{
-	struct ieee80211_sta *sta = file->private_data;
-	struct ath10k_sta *arsta = (struct ath10k_sta *)sta->drv_priv;
-	char buf[100];
-	int len = 0;
-
-	len = scnprintf(buf, sizeof(buf),
-			"%llu usecs\n", arsta->rx_duration);
-
-	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
-}
-
-static const struct file_operations fops_rx_duration = {
-	.read = ath10k_dbg_sta_read_rx_duration,
-	.open = simple_open,
-	.owner = THIS_MODULE,
-	.llseek = default_llseek,
-};
-
 void ath10k_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta, struct dentry *dir)
 {
@@ -301,6 +279,4 @@ void ath10k_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	debugfs_create_file("addba", S_IWUSR, dir, sta, &fops_addba);
 	debugfs_create_file("addba_resp", S_IWUSR, dir, sta, &fops_addba_resp);
 	debugfs_create_file("delba", S_IWUSR, dir, sta, &fops_delba);
-	debugfs_create_file("rx_duration", S_IRUGO, dir, sta,
-			    &fops_rx_duration);
 }
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
