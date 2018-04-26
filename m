Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBg8q-00053e-IP
 for ath10k@lists.infradead.org; Thu, 26 Apr 2018 12:36:54 +0000
Received: by mail-lf0-x241.google.com with SMTP id j193-v6so7475775lfg.6
 for <ath10k@lists.infradead.org>; Thu, 26 Apr 2018 05:36:41 -0700 (PDT)
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH] ath10k: sdio: jump to correct label in error handling path
Date: Thu, 26 Apr 2018 14:35:02 +0200
Message-Id: <20180426123502.23962-1-niklas.cassel@linaro.org>
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
Cc: Niklas Cassel <niklas.cassel@linaro.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Jump to the correct label in error handling path.
At this point of execution create_singlethread_workqueue() has succeeded,
so it should be properly destroyed.

Jump label was renamed in commit ec2c64e20257 ("ath10k: sdio: fix memory
leak for probe allocations").
However, the bug was originally introduced in commit d96db25d2025
("ath10k: add initial SDIO support").

Fixes: d96db25d2025 ("ath10k: add initial SDIO support")
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 2d04c54a4153..d612ce8c9cff 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2011,7 +2011,7 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 		ret = -ENODEV;
 		ath10k_err(ar, "unsupported device id %u (0x%x)\n",
 			   dev_id_base, id->device);
-		goto err_core_destroy;
+		goto err_free_wq;
 	}
 
 	ar->id.vendor = id->vendor;
-- 
2.14.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
