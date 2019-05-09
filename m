Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOhxH-0006Ik-SX
 for ath10k@lists.infradead.org; Thu, 09 May 2019 12:15:21 +0000
Received: by mail-qt1-x844.google.com with SMTP id r3so2124619qtp.10
 for <ath10k@lists.infradead.org>; Thu, 09 May 2019 05:15:18 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ath10k: Change the warning message string
Date: Thu,  9 May 2019 09:15:00 -0300
Message-Id: <20190509121500.4730-1-festevam@gmail.com>
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
To: kvalo@codeaurora.org
Cc: andreyknvl@google.com, Fabio Estevam <festevam@gmail.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, gregkh@linuxfoundation.org

The "WARNING" string confuses syzbot, which thinks it found
a crash [1].

Change the string to avoid such problem.

[1] https://lkml.org/lkml/2019/5/9/243

Reported-by: syzbot+c1b25598aa60dcd47e78@syzkaller.appspotmail.com
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/net/wireless/ath/ath10k/usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index 970cf69ac35f..a3ecf7d77949 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -1016,7 +1016,7 @@ static int ath10k_usb_probe(struct usb_interface *interface,
 	}
 
 	/* TODO: remove this once USB support is fully implemented */
-	ath10k_warn(ar, "WARNING: ath10k USB support is incomplete, don't expect anything to work!\n");
+	ath10k_warn(ar, "Warning: ath10k USB support is incomplete, don't expect anything to work!\n");
 
 	return 0;
 
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
