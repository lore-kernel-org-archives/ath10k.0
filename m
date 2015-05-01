Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YoIF9-00008H-LD
 for ath10k@lists.infradead.org; Fri, 01 May 2015 21:13:08 +0000
From: Yanbo Li <yanbol@qca.qualcomm.com>
Subject: [PATCH] ath10k: Debugfs entry to enable/disable BTC feature
Date: Fri, 1 May 2015 14:10:59 -0700
Message-ID: <1430514659-11743-1-git-send-email-yanbol@qca.qualcomm.com>
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
Cc: dreamfly281@gmail.com, linux-wireless@vger.kernel.org, michal.kazior@tieto.com, ath10k@lists.infradead.org

As some radio have no connection with BT modules, enable the BTC feature
will has some side effect if the radio's GPIO connect with any other HW
modules. Add the control switcher "btc_feature" at debugfs and set the
feature as disable by default to avoid such case.

To enable this feature, execute:
echo 1 > /sys/kernel/debug/ieee80211/phyX/ath10k/btc_feature
To disable:
echo 0 > /sys/kernel/debug/ieee80211/phyX/ath10k/btc_feature

Signed-off-by: Yanbo Li <yanbol@qca.qualcomm.com>

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 8444adf42195..6852e7fc5d5f 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -720,6 +720,8 @@ struct ath10k {
 		u32 fw_cold_reset_counter;
 	} stats;
 
+	bool btc_feature;
+
 	struct ath10k_thermal thermal;
 	struct ath10k_wow wow;
 
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 8fa606a9c4dd..d686aff2e0cc 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -2092,6 +2092,54 @@ static const struct file_operations fops_quiet_period = {
 	.open = simple_open
 };
 
+static ssize_t ath10k_write_btc_feature(struct file *file,
+					const char __user *ubuf,
+					size_t count, loff_t *ppos)
+{
+	struct ath10k *ar = file->private_data;
+	char buf[32];
+	size_t buf_size;
+	bool val;
+
+	buf_size = min(count, (sizeof(buf) - 1));
+	if (copy_from_user(buf, ubuf, buf_size))
+		return -EFAULT;
+
+	buf[buf_size] = '\0';
+	if (strtobool(buf, &val) != 0) {
+		ath10k_warn(ar, "Wrong BTC feature setting\n");
+		return -EINVAL;
+	}
+
+	mutex_lock(&ar->conf_mutex);
+	ar->btc_feature = val;
+	queue_work(ar->workqueue, &ar->restart_work);
+	mutex_unlock(&ar->conf_mutex);
+
+	return count;
+}
+
+static ssize_t ath10k_read_btc_feature(struct file *file, char __user *ubuf,
+				       size_t count, loff_t *ppos)
+{
+	char buf[32];
+	struct ath10k *ar = file->private_data;
+	int len = 0;
+
+	mutex_lock(&ar->conf_mutex);
+	len = scnprintf(buf, sizeof(buf) - len, "%d\n",
+			ar->btc_feature);
+	mutex_unlock(&ar->conf_mutex);
+
+	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
+}
+
+static const struct file_operations fops_btc_feature = {
+	.read = ath10k_read_btc_feature,
+	.write = ath10k_write_btc_feature,
+	.open = simple_open
+};
+
 int ath10k_debug_create(struct ath10k *ar)
 {
 	ar->debug.fw_crash_data = vzalloc(sizeof(*ar->debug.fw_crash_data));
@@ -2195,6 +2243,8 @@ int ath10k_debug_register(struct ath10k *ar)
 	debugfs_create_file("quiet_period", S_IRUGO | S_IWUSR,
 			    ar->debug.debugfs_phy, ar, &fops_quiet_period);
 
+	debugfs_create_file("btc_feature", S_IRUGO | S_IWUSR,
+			    ar->debug.debugfs_phy, ar, &fops_btc_feature);
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index ebaa096cf200..0d46168fbbb3 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3933,7 +3933,8 @@ static struct sk_buff *ath10k_wmi_10_2_op_gen_init(struct ath10k *ar)
 	cmd = (struct wmi_init_cmd_10_2 *)buf->data;
 
 	features = WMI_10_2_RX_BATCH_MODE;
-	if (test_bit(WMI_SERVICE_COEX_GPIO, ar->wmi.svc_map))
+	if (ar->btc_feature &&
+	    test_bit(WMI_SERVICE_COEX_GPIO, ar->wmi.svc_map))
 		features |= WMI_10_2_COEX_GPIO;
 	cmd->resource_config.feature_mask = __cpu_to_le32(features);
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
