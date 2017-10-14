Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e3Iwu-00039N-VZ
 for ath10k@lists.infradead.org; Sat, 14 Oct 2017 09:41:42 +0000
Received: by mail-wm0-x242.google.com with SMTP id t69so25298148wmt.2
 for <ath10k@lists.infradead.org>; Sat, 14 Oct 2017 02:41:19 -0700 (PDT)
From: Christos Gkekas <chris.gekas@gmail.com>
Subject: [PATCH] ath10k: spectral: Remove redundant check
Date: Sat, 14 Oct 2017 10:41:15 +0100
Message-Id: <1507974075-6987-1-git-send-email-chris.gekas@gmail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Christos Gkekas <chris.gekas@gmail.com>

Variable val is unsigned, so checking whether it is less than zero is
redundant.

Signed-off-by: Christos Gkekas <chris.gekas@gmail.com>
---
 drivers/net/wireless/ath/ath10k/spectral.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/spectral.c b/drivers/net/wireless/ath/ath10k/spectral.c
index dd9cc09..2048b1e 100644
--- a/drivers/net/wireless/ath/ath10k/spectral.c
+++ b/drivers/net/wireless/ath/ath10k/spectral.c
@@ -406,7 +406,7 @@ static ssize_t write_file_spectral_count(struct file *file,
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
-	if (val < 0 || val > 255)
+	if (val > 255)
 		return -EINVAL;
 
 	mutex_lock(&ar->conf_mutex);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
