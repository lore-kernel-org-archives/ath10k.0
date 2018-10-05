Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway31.websitewelcome.com ([192.185.143.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8VHq-0001NZ-Eq
 for ath10k@lists.infradead.org; Fri, 05 Oct 2018 18:57:19 +0000
Received: from cm15.websitewelcome.com (cm15.websitewelcome.com [100.42.49.9])
 by gateway31.websitewelcome.com (Postfix) with ESMTP id 847DD3F6B9
 for <ath10k@lists.infradead.org>; Fri,  5 Oct 2018 13:57:06 -0500 (CDT)
Date: Fri, 5 Oct 2018 20:56:23 +0200
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] ath10k: remove unnecessary comparison of unsigned integer
 with < 0
Message-ID: <20181005185623.GA14405@embeddedor.com>
MIME-Version: 1.0
Content-Disposition: inline
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>

There is no need to compare *ps_state_enable* with < 0 because
such variable is of type u8 (8 bits, unsigned), making it
impossible to hold a negative value.

Fix this by removing such comparison.

Addresses-Coverity-ID: 1473921 ("Unsigned compared against 0")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/net/wireless/ath/ath10k/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 2c0cb67..15964b3 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -2421,7 +2421,7 @@ static ssize_t ath10k_write_ps_state_enable(struct file *file,
 	if (kstrtou8_from_user(user_buf, count, 0, &ps_state_enable))
 		return -EINVAL;
 
-	if (ps_state_enable > 1 || ps_state_enable < 0)
+	if (ps_state_enable > 1)
 		return -EINVAL;
 
 	mutex_lock(&ar->conf_mutex);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
