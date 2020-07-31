Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1ZlC-0003at-C0
 for ath10k@lists.infradead.org; Fri, 31 Jul 2020 18:28:09 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v2 3/3] ath10k: Add debugfs support to enable event history
Date: Fri, 31 Jul 2020 23:57:22 +0530
Message-Id: <1596220042-2778-4-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1596220042-2778-1-git-send-email-pillair@codeaurora.org>
References: <1596220042-2778-1-git-send-email-pillair@codeaurora.org>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Rakesh Pillai <pillair@codeaurora.org>, kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org

Add the support to enable/disable the recording of
debug events history.

The enable/disable of the history from debugfs will
not make any affect if its not enabled via module
parameter.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/debug.c | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 5d08652..6785fae 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -610,6 +610,59 @@ static const struct file_operations fops_simulate_fw_crash = {
 	.llseek = default_llseek,
 };
 
+static ssize_t ath10k_read_history_enable(struct file *file,
+					  char __user *user_buf,
+					  size_t count, loff_t *ppos)
+{
+	const char buf[] =
+		"To enable recording of certain event history, write to this file with the enable mask\n"
+		"BIT(0): Enable Reg Access history\n"
+		"	- Register write events\n"
+		"	- Register read events\n"
+		"BIT(1): Enable CE events history\n"
+		"	- ATH10K_IRQ_TRIGGER event\n"
+		"	- ATH10K_NAPI_POLL event\n"
+		"	- ATH10K_CE_SERVICE event\n"
+		"	- ATH10K_NAPI_COMPLETE event\n"
+		"	- ATH10K_NAPI_RESCHED event\n"
+		"	- ATH10K_IRQ_SUMMARY event\n"
+		"BIT(2): Enable WMI CMD history\n"
+		"	- WMI CMD event\n"
+		"	- WMI CMD TX completion event\n"
+		"BIT(3): Enable WMI events history\n"
+		"	- WMI Events event\n";
+
+	return simple_read_from_buffer(user_buf, count, ppos, buf, strlen(buf));
+}
+
+static ssize_t ath10k_write_history_enable(struct file *file,
+					   const char __user *user_buf,
+					   size_t count, loff_t *ppos)
+{
+	u32 history_enable_mask;
+	int i, ret;
+
+	ret = kstrtou32_from_user(user_buf, count, 0, &history_enable_mask);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ATH10K_HISTORY_MAX; i++)
+		if (history_enable_mask & BIT(i))
+			set_bit(i, &ath10k_history_enable_mask);
+		else
+			clear_bit(i, &ath10k_history_enable_mask);
+
+	return count;
+}
+
+static const struct file_operations fops_history_enable = {
+	.read = ath10k_read_history_enable,
+	.write = ath10k_write_history_enable,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 static ssize_t ath10k_read_chip_id(struct file *file, char __user *user_buf,
 				   size_t count, loff_t *ppos)
 {
@@ -2658,6 +2711,9 @@ int ath10k_debug_register(struct ath10k *ar)
 	debugfs_create_file("reset_htt_stats", 0200, ar->debug.debugfs_phy, ar,
 			    &fops_reset_htt_stats);
 
+	debugfs_create_file("history_enable", 0644, ar->debug.debugfs_phy, ar,
+			    &fops_history_enable);
+
 	return 0;
 }
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
