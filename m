Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1HHn-000134-JK
 for ath10k@lists.infradead.org; Sun, 08 Oct 2017 19:30:53 +0000
Received: by mail-wm0-x244.google.com with SMTP id b189so18105192wmd.2
 for <ath10k@lists.infradead.org>; Sun, 08 Oct 2017 12:30:30 -0700 (PDT)
From: Christos Gkekas <chris.gekas@gmail.com>
Subject: [PATCH] ath10k: spectral: Simplify error checking
Date: Sun,  8 Oct 2017 20:30:26 +0100
Message-Id: <1507491026-28690-1-git-send-email-chris.gekas@gmail.com>
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

Variable val is unsigned so checking whether it is less than zero is
redundant.

Signed-off-by: Christos Gkekas <chris.gekas@gmail.com>
---
 drivers/net/wireless/ath/ath10k/spectral.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/spectral.c b/drivers/net/wireless/ath/ath10k/spectral.c
index dd9cc09..1867937 100644
--- a/drivers/net/wireless/ath/ath10k/spectral.c
+++ b/drivers/net/wireless/ath/ath10k/spectral.c
@@ -403,10 +403,7 @@ static ssize_t write_file_spectral_count(struct file *file,
 		return -EFAULT;
 
 	buf[len] = '\0';
-	if (kstrtoul(buf, 0, &val))
-		return -EINVAL;
-
-	if (val < 0 || val > 255)
+	if (kstrtoul(buf, 0, &val) || val > 255)
 		return -EINVAL;
 
 	mutex_lock(&ar->conf_mutex);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
