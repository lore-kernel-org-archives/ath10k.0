Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anSui-0003TI-Q2
 for ath10k@lists.infradead.org; Tue, 05 Apr 2016 15:29:09 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH] ath10k: Fix return value for btcoex and peer stats debugfs
Date: Tue, 5 Apr 2016 20:58:26 +0530
Message-ID: <1459870106-2694-1-git-send-email-mohammed@qca.qualcomm.com>
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

Return value is incorrect for btcoex and peer stats debugfs
'write' entries if the user provides a value that matches with
the already available debugfs entry, this results in the debugfs
entry getting stuck and the operation has to be terminated manually.
Fix this by returning the appropriate return 'count' as we do it for
other debugfs entries like pktlog etc

Fixes: cc61a1bbbc0e ("ath10k: enable debugfs provision to enable
Peer Stats feature")
Fixes: c28e6f06ff40 ("ath10k: fix sanity check on enabling btcoex via
debugfs")
Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/debug.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 76bbe17..e7d441c 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -2122,7 +2122,7 @@ static ssize_t ath10k_write_btcoex(struct file *file,
 	struct ath10k *ar = file->private_data;
 	char buf[32];
 	size_t buf_size;
-	int ret = 0;
+	int ret;
 	bool val;
 
 	buf_size = min(count, (sizeof(buf) - 1));
@@ -2142,8 +2142,10 @@ static ssize_t ath10k_write_btcoex(struct file *file,
 		goto exit;
 	}
 
-	if (!(test_bit(ATH10K_FLAG_BTCOEX, &ar->dev_flags) ^ val))
+	if (!(test_bit(ATH10K_FLAG_BTCOEX, &ar->dev_flags) ^ val)) {
+		ret = count;
 		goto exit;
+	}
 
 	if (val)
 		set_bit(ATH10K_FLAG_BTCOEX, &ar->dev_flags);
@@ -2189,7 +2191,7 @@ static ssize_t ath10k_write_peer_stats(struct file *file,
 	struct ath10k *ar = file->private_data;
 	char buf[32];
 	size_t buf_size;
-	int ret = 0;
+	int ret;
 	bool val;
 
 	buf_size = min(count, (sizeof(buf) - 1));
@@ -2209,8 +2211,10 @@ static ssize_t ath10k_write_peer_stats(struct file *file,
 		goto exit;
 	}
 
-	if (!(test_bit(ATH10K_FLAG_PEER_STATS, &ar->dev_flags) ^ val))
+	if (!(test_bit(ATH10K_FLAG_PEER_STATS, &ar->dev_flags) ^ val)) {
+		ret = count;
 		goto exit;
+	}
 
 	if (val)
 		set_bit(ATH10K_FLAG_PEER_STATS, &ar->dev_flags);
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
