Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmBjv-0003eR-Mk
 for ath10k@lists.infradead.org; Tue, 20 Sep 2016 03:29:00 +0000
Received: by mail-io0-x244.google.com with SMTP id y139so472558ioy.1
 for <ath10k@lists.infradead.org>; Mon, 19 Sep 2016 20:28:39 -0700 (PDT)
From: Nikolay Martynov <mar.kolya@gmail.com>
Subject: [PATCH] ath10k: fix debug cal data file
Date: Mon, 19 Sep 2016 23:26:24 -0400
Message-Id: <1474341984-19220-1-git-send-email-mar.kolya@gmail.com>
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
To: kvalo@qca.qualcomm.com
Cc: Nikolay Martynov <mar.kolya@gmail.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

It got broken by 0b8e3c4ca29fe2c0efd3d41a76e34a657b9f17a4

Signed-off-by: Nikolay Martynov <mar.kolya@gmail.com>
---
 drivers/net/wireless/ath/ath10k/debug.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 8f0fd41..7e82947 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -109,6 +109,11 @@ struct ath10k_dump_file_data {
 	u8 data[0];
 } __packed;
 
+struct ath10k_debug_cal_data {
+	u32 len;
+	u8 buf[0];
+};
+
 void ath10k_info(struct ath10k *ar, const char *fmt, ...)
 {
 	struct va_format vaf = {
@@ -1453,7 +1458,8 @@ static const struct file_operations fops_fw_dbglog = {
 static int ath10k_debug_cal_data_open(struct inode *inode, struct file *file)
 {
 	struct ath10k *ar = inode->i_private;
-	void *buf;
+	struct ath10k_debug_cal_data *data;
+	u32 len;
 	u32 hi_addr;
 	__le32 addr;
 	int ret;
@@ -1466,12 +1472,15 @@ static int ath10k_debug_cal_data_open(struct inode *inode, struct file *file)
 		goto err;
 	}
 
-	buf = vmalloc(ar->hw_params.cal_data_len);
-	if (!buf) {
+	len = ar->hw_params.cal_data_len;
+	data = vmalloc(sizeof(struct ath10k_debug_cal_data) + len);
+	if (!data) {
 		ret = -ENOMEM;
 		goto err;
 	}
 
+	data->len = len;
+
 	hi_addr = host_interest_item_address(HI_ITEM(hi_board_data));
 
 	ret = ath10k_hif_diag_read(ar, hi_addr, &addr, sizeof(addr));
@@ -1480,21 +1489,20 @@ static int ath10k_debug_cal_data_open(struct inode *inode, struct file *file)
 		goto err_vfree;
 	}
 
-	ret = ath10k_hif_diag_read(ar, le32_to_cpu(addr), buf,
-				   ar->hw_params.cal_data_len);
+	ret = ath10k_hif_diag_read(ar, le32_to_cpu(addr), data->buf, len);
 	if (ret) {
 		ath10k_warn(ar, "failed to read calibration data: %d\n", ret);
 		goto err_vfree;
 	}
 
-	file->private_data = buf;
+	file->private_data = data;
 
 	mutex_unlock(&ar->conf_mutex);
 
 	return 0;
 
 err_vfree:
-	vfree(buf);
+	vfree(data);
 
 err:
 	mutex_unlock(&ar->conf_mutex);
@@ -1506,11 +1514,10 @@ static ssize_t ath10k_debug_cal_data_read(struct file *file,
 					  char __user *user_buf,
 					  size_t count, loff_t *ppos)
 {
-	struct ath10k *ar = file->private_data;
-	void *buf = file->private_data;
+	struct ath10k_debug_cal_data *data = file->private_data;
 
 	return simple_read_from_buffer(user_buf, count, ppos,
-				       buf, ar->hw_params.cal_data_len);
+				       data->buf, data->len);
 }
 
 static int ath10k_debug_cal_data_release(struct inode *inode,
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
