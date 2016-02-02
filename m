Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQVB7-0004sF-G1
 for ath10k@lists.infradead.org; Tue, 02 Feb 2016 07:15:10 +0000
Received: by mail-pa0-x233.google.com with SMTP id yy13so96250306pab.3
 for <ath10k@lists.infradead.org>; Mon, 01 Feb 2016 23:14:48 -0800 (PST)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] ath10k: remove impossible code
Date: Tue,  2 Feb 2016 12:44:40 +0530
Message-Id: <1454397280-4758-1-git-send-email-sudipm.mukherjee@gmail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

From: Sudip Mukherjee <sudip@vectorindia.org>

len has been initialized with a value of 0 and buf_len with 4096. There
is no way that this condition (len > buf_len) can be true now.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---
 drivers/net/wireless/ath/ath10k/debug.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 2bdf540..8b187e0 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -2176,9 +2176,6 @@ static ssize_t ath10k_debug_fw_checksums_read(struct file *file,
 
 	mutex_lock(&ar->conf_mutex);
 
-	if (len > buf_len)
-		len = buf_len;
-
 	len += scnprintf(buf + len, buf_len - len,
 			 "firmware-N.bin\t\t%08x\n",
 			 crc32_le(0, ar->firmware->data, ar->firmware->size));
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
