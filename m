Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh04.mail.saunalahti.fi ([62.142.5.110])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWkZT-00043D-2W
 for ath10k@lists.infradead.org; Wed, 24 Sep 2014 11:17:19 +0000
Subject: [PATCH v3 3/3] ath10k: add cal_data debugfs file
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 24 Sep 2014 14:16:58 +0300
Message-ID: <20140924111658.6539.73760.stgit@potku.adurom.net>
In-Reply-To: <20140924111416.6539.95299.stgit@potku.adurom.net>
References: <20140924111416.6539.95299.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

Provide calibration data used by the firmware to user space via a debugfs file.
This makes it easier to debug calibration related problems.

Example:

sudo cp /sys/kernel/debug/ieee80211/phy0/ath10k/cal_data 1.cal

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/debug.c |   82 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h    |    2 +
 2 files changed, 84 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 101c6f9cf2a8..f70c0aa59950 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -23,6 +23,7 @@
 
 #include "core.h"
 #include "debug.h"
+#include "hif.h"
 
 /* ms */
 #define ATH10K_DEBUG_HTT_STATS_INTERVAL 1000
@@ -1037,6 +1038,84 @@ static const struct file_operations fops_fw_dbglog = {
 	.llseek = default_llseek,
 };
 
+static int ath10k_debug_cal_data_open(struct inode *inode, struct file *file)
+{
+	struct ath10k *ar = inode->i_private;
+	void *buf;
+	u32 hi_addr;
+	__le32 addr;
+	int ret;
+
+	mutex_lock(&ar->conf_mutex);
+
+	if (ar->state != ATH10K_STATE_ON &&
+	    ar->state != ATH10K_STATE_UTF) {
+		ret = -ENETDOWN;
+		goto err;
+	}
+
+	buf = vmalloc(QCA988X_CAL_DATA_LEN);
+	if (!buf) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	hi_addr = host_interest_item_address(HI_ITEM(hi_board_data));
+
+	ret = ath10k_hif_diag_read(ar, hi_addr, &addr, sizeof(addr));
+	if (ret) {
+		ath10k_warn(ar, "failed to read hi_board_data address: %d\n", ret);
+		goto err_vfree;
+	}
+
+	ret = ath10k_hif_diag_read(ar, le32_to_cpu(addr), buf,
+				   QCA988X_CAL_DATA_LEN);
+	if (ret) {
+		ath10k_warn(ar, "failed to read calibration data: %d\n", ret);
+		goto err_vfree;
+	}
+
+	file->private_data = buf;
+
+	mutex_unlock(&ar->conf_mutex);
+
+	return 0;
+
+err_vfree:
+	vfree(buf);
+
+err:
+	mutex_unlock(&ar->conf_mutex);
+
+	return ret;
+}
+
+static ssize_t ath10k_debug_cal_data_read(struct file *file,
+					  char __user *user_buf,
+					  size_t count, loff_t *ppos)
+{
+	void *buf = file->private_data;
+
+	return simple_read_from_buffer(user_buf, count, ppos,
+				       buf, QCA988X_CAL_DATA_LEN);
+}
+
+static int ath10k_debug_cal_data_release(struct inode *inode,
+					 struct file *file)
+{
+	vfree(file->private_data);
+
+	return 0;
+}
+
+static const struct file_operations fops_cal_data = {
+	.open = ath10k_debug_cal_data_open,
+	.read = ath10k_debug_cal_data_read,
+	.release = ath10k_debug_cal_data_release,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 int ath10k_debug_start(struct ath10k *ar)
 {
 	int ret;
@@ -1210,6 +1289,9 @@ int ath10k_debug_register(struct ath10k *ar)
 	debugfs_create_file("fw_dbglog", S_IRUSR, ar->debug.debugfs_phy,
 			    ar, &fops_fw_dbglog);
 
+	debugfs_create_file("cal_data", S_IRUSR, ar->debug.debugfs_phy,
+			    ar, &fops_cal_data);
+
 	if (config_enabled(CONFIG_ATH10K_DFS_CERTIFIED)) {
 		debugfs_create_file("dfs_simulate_radar", S_IWUSR,
 				    ar->debug.debugfs_phy, ar,
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 3cf5702c1e7e..006a9cbc60b2 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -43,6 +43,8 @@
 
 #define REG_DUMP_COUNT_QCA988X 60
 
+#define QCA988X_CAL_DATA_LEN		2116
+
 struct ath10k_fw_ie {
 	__le32 id;
 	__le32 len;


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
