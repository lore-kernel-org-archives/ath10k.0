Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh07.mail.saunalahti.fi ([62.142.5.117])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1aHn-0002Od-T6
 for ath10k@lists.infradead.org; Wed, 25 Nov 2015 13:39:05 +0000
Subject: [PATCH 6/6] ath10k: implement fw_checksums debugfs file
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 25 Nov 2015 15:38:41 +0200
Message-ID: <20151125133841.25507.53375.stgit@potku.adurom.net>
In-Reply-To: <20151125133654.25507.10863.stgit@potku.adurom.net>
References: <20151125133654.25507.10863.stgit@potku.adurom.net>
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

When debugging firmware problems it's useful to check checksums of each
component. Add a debugfs interface to retrieve crc32 checksums:

# cat /sys/kernel/debug/ieee80211/phy0/ath10k/fw_checksums
firmware-N.bin          cc3fb466
athwlan                 c0089f21
otp                     f3efeb4f
codeswap                00000000
board-N.bin             bebc7c08
board                   bebc7c08

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/debug.c |   56 +++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 79d9426426da..04dfd5e8e6ae 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -2161,6 +2161,59 @@ static const struct file_operations fops_btcoex = {
 	.open = simple_open
 };
 
+static ssize_t ath10k_debug_fw_checksums_read(struct file *file,
+					      char __user *user_buf,
+					      size_t count, loff_t *ppos)
+{
+	struct ath10k *ar = file->private_data;
+	unsigned int len = 0, buf_len = 4096;
+	ssize_t ret_cnt;
+	char *buf;
+
+	buf = kzalloc(buf_len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	mutex_lock(&ar->conf_mutex);
+
+	if (len > buf_len)
+		len = buf_len;
+
+	len += scnprintf(buf + len, buf_len - len,
+			 "firmware-N.bin\t\t%08x\n",
+			 crc32_le(0, ar->firmware->data, ar->firmware->size));
+	len += scnprintf(buf + len, buf_len - len,
+			 "athwlan\t\t\t%08x\n",
+			 crc32_le(0, ar->firmware_data, ar->firmware_len));
+	len += scnprintf(buf + len, buf_len - len,
+			 "otp\t\t\t%08x\n",
+			 crc32_le(0, ar->otp_data, ar->otp_len));
+	len += scnprintf(buf + len, buf_len - len,
+			 "codeswap\t\t%08x\n",
+			 crc32_le(0, ar->swap.firmware_codeswap_data,
+				  ar->swap.firmware_codeswap_len));
+	len += scnprintf(buf + len, buf_len - len,
+			 "board-N.bin\t\t%08x\n",
+			 crc32_le(0, ar->board->data, ar->board->size));
+	len += scnprintf(buf + len, buf_len - len,
+			 "board\t\t\t%08x\n",
+			 crc32_le(0, ar->board_data, ar->board_len));
+
+	ret_cnt = simple_read_from_buffer(user_buf, count, ppos, buf, len);
+
+	mutex_unlock(&ar->conf_mutex);
+
+	kfree(buf);
+	return ret_cnt;
+}
+
+static const struct file_operations fops_fw_checksums = {
+	.read = ath10k_debug_fw_checksums_read,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 int ath10k_debug_create(struct ath10k *ar)
 {
 	ar->debug.fw_crash_data = vzalloc(sizeof(*ar->debug.fw_crash_data));
@@ -2274,6 +2327,9 @@ int ath10k_debug_register(struct ath10k *ar)
 		debugfs_create_file("btcoex", S_IRUGO | S_IWUSR,
 				    ar->debug.debugfs_phy, ar, &fops_btcoex);
 
+	debugfs_create_file("fw_checksums", S_IRUSR,
+			    ar->debug.debugfs_phy, ar, &fops_fw_checksums);
+
 	return 0;
 }
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
