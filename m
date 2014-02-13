Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WE1fs-0001Z3-E0
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 19:10:17 +0000
From: greearb@candelatech.com
Subject: [PATCH 2/2] ath10k:  do not ratelimit ath10k_warn messages
Date: Thu, 13 Feb 2014 11:09:22 -0800
Message-Id: <1392318562-32440-2-git-send-email-greearb@candelatech.com>
In-Reply-To: <1392318562-32440-1-git-send-email-greearb@candelatech.com>
References: <1392318562-32440-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

These are too important to miss, and if we ever do have some
that are overly verbose, could ratelimit the call to ath10k_warn
instead of doing the ratelimit inside of ath10k_warn.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/debug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 6debd28..c922e39 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -89,8 +89,7 @@ int ath10k_warn(const char *fmt, ...)
 	va_start(args, fmt);
 	vaf.va = &args;
 
-	if (net_ratelimit())
-		ret = ath10k_printk(KERN_WARNING, "%pV", &vaf);
+	ret = ath10k_printk(KERN_WARNING, "%pV", &vaf);
 
 	trace_ath10k_log_warn(&vaf);
 
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
