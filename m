Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aY7PM-0004E1-TA
 for ath10k@lists.infradead.org; Tue, 23 Feb 2016 07:29:21 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH] ath10k: Fix sanity check on enabling btcoex via debugfs
Date: Tue, 23 Feb 2016 12:58:36 +0530
Message-ID: <1456212516-3989-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

First check for the device state before enabling / disabling
btcoex, also return a proper error value. Enabling / disabling
btcoex ideally does a f/w + ath10k_core_restart so the checks
that are applicable for 'simulate_fw_crash' shall be applicable
for this as well

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/debug.c |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 628b031..e3e29fb 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -2116,6 +2116,7 @@ static ssize_t ath10k_write_btcoex(struct file *file,
 	struct ath10k *ar = file->private_data;
 	char buf[32];
 	size_t buf_size;
+	int ret = 0;
 	bool val;
 
 	buf_size = min(count, (sizeof(buf) - 1));
@@ -2129,6 +2130,12 @@ static ssize_t ath10k_write_btcoex(struct file *file,
 
 	mutex_lock(&ar->conf_mutex);
 
+	if (ar->state != ATH10K_STATE_ON &&
+	    ar->state != ATH10K_STATE_RESTARTED) {
+		ret = -ENETDOWN;
+		goto exit;
+	}
+
 	if (!(test_bit(ATH10K_FLAG_BTCOEX, &ar->dev_flags) ^ val))
 		goto exit;
 
@@ -2137,17 +2144,15 @@ static ssize_t ath10k_write_btcoex(struct file *file,
 	else
 		clear_bit(ATH10K_FLAG_BTCOEX, &ar->dev_flags);
 
-	if (ar->state != ATH10K_STATE_ON)
-		goto exit;
-
 	ath10k_info(ar, "restarting firmware due to btcoex change");
 
 	queue_work(ar->workqueue, &ar->restart_work);
+	ret = count;
 
 exit:
 	mutex_unlock(&ar->conf_mutex);
 
-	return count;
+	return ret;
 }
 
 static ssize_t ath10k_read_btcoex(struct file *file, char __user *ubuf,
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
