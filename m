Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dzgJJ-0002xE-Ms
 for ath10k@lists.infradead.org; Wed, 04 Oct 2017 09:49:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 08/11] ath10k_sdio: common read write
Date: Wed, 4 Oct 2017 09:49:18 +0000
Message-ID: <87wp4bw8de.fsf@kamboji.qca.qualcomm.com>
References: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
 <1506793068-27445-9-git-send-email-alagusankar@silex-india.com>
In-Reply-To: <1506793068-27445-9-git-send-email-alagusankar@silex-india.com>
 (silexcommon@gmail.com's message of "Sat, 30 Sep 2017 23:07:45 +0530")
Content-Language: en-US
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
To: "silexcommon@gmail.com" <silexcommon@gmail.com>
Cc: Alagu Sankar <alagusankar@silex-india.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

silexcommon@gmail.com writes:

> From: Alagu Sankar <alagusankar@silex-india.com>
>
> convert different read write functions in sdio hif to bring it under a
> single read-write path. This helps in having a common dma bounce buffer
> implementation. Also helps in address modification that is required
> specific to change in certain mbox addresses of sdio_write.
>
> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>

This didn't compile for me:

drivers/net/wireless/ath/ath10k/sdio.c:320:12: error: conflicting types for 'ath10k_sdio_read'
drivers/net/wireless/ath/ath10k/sdio.c:39:12: note: previous declaration of 'ath10k_sdio_read' was here
drivers/net/wireless/ath/ath10k/sdio.c:365:12: error: conflicting types for 'ath10k_sdio_write'
drivers/net/wireless/ath/ath10k/sdio.c:41:12: note: previous declaration of 'ath10k_sdio_write' was here
drivers/net/wireless/ath/ath10k/sdio.c:39:12: warning: 'ath10k_sdio_read' used but never defined
drivers/net/wireless/ath/ath10k/sdio.c:41:12: warning: 'ath10k_sdio_write' used but never defined

gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609

I fixed it like below in the pending branch. But I'll review more
carefully later, I have quite a lot of patches pending right now.

--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -37,9 +37,9 @@
 #define ATH10K_SDIO_DMA_BUF_SIZE       (32 * 1024)
 
 static int ath10k_sdio_read(struct ath10k *ar, u32 addr, void *buf,
-                           u32 len, bool incr);
+                           size_t len, bool incr);
 static int ath10k_sdio_write(struct ath10k *ar, u32 addr, const void *buf,
-                            u32 len, bool incr);
+                            size_t len, bool incr);
 
 /* inlined helper functions */

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
