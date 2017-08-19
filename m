Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dj4ru-0004US-SO
 for ath10k@lists.infradead.org; Sat, 19 Aug 2017 14:36:56 +0000
Received: by mail-lf0-x244.google.com with SMTP id f26so561571lfh.1
 for <ath10k@lists.infradead.org>; Sat, 19 Aug 2017 07:36:31 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH] ath10k: sdio: remove unused struct member
Date: Sat, 19 Aug 2017 16:36:22 +0200
Message-Id: <1503153382-11100-1-git-send-email-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

irq_wq in struct ath10k_sdio is a remnant from an earlier
version of the sdio patchset.

It's use was removed as a result of Kalle's review, but somehow
the struct member survived.

It is not used and can therefore safely be removed.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 4 ----
 drivers/net/wireless/ath/ath10k/sdio.h | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 48268f0..03a69e5 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1344,8 +1344,6 @@ static void ath10k_sdio_irq_handler(struct sdio_func *func)
 
 	sdio_claim_host(ar_sdio->func);
 
-	wake_up(&ar_sdio->irq_wq);
-
 	if (ret && ret != -ECANCELED)
 		ath10k_warn(ar, "failed to process pending SDIO interrupts: %d\n",
 			    ret);
@@ -2000,8 +1998,6 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 		goto err_free_bmi_buf;
 	}
 
-	init_waitqueue_head(&ar_sdio->irq_wq);
-
 	for (i = 0; i < ATH10K_SDIO_BUS_REQUEST_MAX_NUM; i++)
 		ath10k_sdio_free_bus_req(ar, &ar_sdio->bus_req[i]);
 
diff --git a/drivers/net/wireless/ath/ath10k/sdio.h b/drivers/net/wireless/ath/ath10k/sdio.h
index 3f61c67..4ff7b54 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.h
+++ b/drivers/net/wireless/ath/ath10k/sdio.h
@@ -210,8 +210,6 @@ struct ath10k_sdio {
 	/* temporary buffer for BMI requests */
 	u8 *bmi_buf;
 
-	wait_queue_head_t irq_wq;
-
 	bool is_disabled;
 
 	struct workqueue_struct *workqueue;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
