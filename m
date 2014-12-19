Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1rVA-0005cK-Ou
 for ath10k@lists.infradead.org; Fri, 19 Dec 2014 06:57:29 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 7/8] ath10k: add support to send addba response
Date: Fri, 19 Dec 2014 12:24:58 +0530
Message-ID: <1418972099-5296-8-git-send-email-rmanohar@qti.qualcomm.com>
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

This per-station debugfs entry helps to send addba response in
manual mode for debugging purpose. It accepts tid and status code
as input arguments.

To send addba response,

echo 0 25 >/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
	   stations/XX:XX:XX:XX:XX:XX/addba_resp

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/debugfs_sta.c | 55 +++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
index 89e5e5a..95eb5a1 100644
--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -136,10 +136,65 @@ static const struct file_operations fops_addba = {
 	.llseek = default_llseek,
 };
 
+static ssize_t ath10k_dbg_sta_write_addba_resp(struct file *file,
+					       const char __user *user_buf,
+					       size_t count, loff_t *ppos)
+{
+	struct ieee80211_sta *sta = file->private_data;
+	struct ath10k_sta *arsta = (struct ath10k_sta *)sta->drv_priv;
+	struct ath10k *ar = arsta->arvif->ar;
+	u32 tid, status;
+	int ret;
+	char buf[64];
+
+	simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
+
+	/* make sure that buf is null terminated */
+	buf[sizeof(buf) - 1] = '\0';
+
+	ret = sscanf(buf, "%u %u", &tid, &status);
+	if (ret != 2) {
+		ath10k_warn(ar, "ex: echo <tid> <status code> >addba_resp\n");
+		return -EINVAL;
+	}
+
+	/* Valid TID values are 0 through 15 */
+	if (tid > HTT_DATA_TX_EXT_TID_MGMT - 2) {
+		ath10k_warn(ar, "Invalid TID %u\n", tid);
+		return -EINVAL;
+	}
+
+	mutex_lock(&ar->conf_mutex);
+	if ((ar->state != ATH10K_STATE_ON) ||
+	    (arsta->aggr_mode != ATH10K_DBG_AGGR_MODE_MANUAL)) {
+		ret = count;
+		goto out;
+	}
+
+	ret = ath10k_wmi_addba_set_resp(ar, arsta->arvif->vdev_id, sta->addr,
+					tid, status);
+	if (ret) {
+		ath10k_warn(ar, "failed to send addba response: vdev_id %u peer %pM tid %u status%u\n",
+			    arsta->arvif->vdev_id, sta->addr, tid, status);
+	}
+	ret = count;
+out:
+	mutex_unlock(&ar->conf_mutex);
+	return ret;
+}
+
+static const struct file_operations fops_addba_resp = {
+	.write = ath10k_dbg_sta_write_addba_resp,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 void ath10k_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta, struct dentry *dir)
 {
 	debugfs_create_file("aggr_mode", S_IRUGO | S_IWUSR, dir, sta,
 			    &fops_aggr_mode);
 	debugfs_create_file("addba", S_IWUSR, dir, sta, &fops_addba);
+	debugfs_create_file("addba_resp", S_IWUSR, dir, sta, &fops_addba_resp);
 }
-- 
2.2.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
