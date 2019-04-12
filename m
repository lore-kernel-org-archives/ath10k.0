Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEwEH-0002c7-6T
 for ath10k@lists.infradead.org; Fri, 12 Apr 2019 13:28:32 +0000
Subject: [PATCH 2/6] ath10k: don't disable interrupts in ath10k_sdio_remove()
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 12 Apr 2019 16:28:25 +0300
Message-ID: <155507570518.32018.13698324211799701564.stgit@potku.adurom.net>
In-Reply-To: <155507569645.32018.15231567732563770250.stgit@potku.adurom.net>
References: <155507569645.32018.15231567732563770250.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

From: Wen Gong <wgong@codeaurora.org>

Disabling interrupts this early meant WMI communication was not working anymore
when the SDIO device was removed. But we call ath10k_core_unregister() that
will eventually call ath10k_sdio_hif_stop(), which disables the interrupts. So
there's actually no need to disable interrupts here.

Also remove cancel_work_sync() as it's also called in ath10k_sdio_hif_stop().

Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/sdio.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index fae56c67766f..d573d24624c0 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2073,8 +2073,6 @@ static void ath10k_sdio_remove(struct sdio_func *func)
 		   "sdio removed func %d vendor 0x%x device 0x%x\n",
 		   func->num, func->vendor, func->device);
 
-	(void)ath10k_sdio_hif_disable_intrs(ar);
-	cancel_work_sync(&ar_sdio->wr_async_work);
 	ath10k_core_unregister(ar);
 	ath10k_core_destroy(ar);
 }


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
