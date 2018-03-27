Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0vGI-0002ZU-QV
 for ath10k@lists.infradead.org; Tue, 27 Mar 2018 20:32:08 +0000
Received: by mail-lf0-x242.google.com with SMTP id o102-v6so272314lfg.8
 for <ath10k@lists.infradead.org>; Tue, 27 Mar 2018 13:31:56 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH] ath10k: sdio: fix memory leak for probe allocations
Date: Tue, 27 Mar 2018 22:31:44 +0200
Message-Id: <20180327203144.8998-1-marcus.folkesson@gmail.com>
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, linux-wireless@vger.kernel.org

These allocations are not freed upon release.
When on it; go for managed resources instead.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 07e183f8e57a..005934b8522c 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1967,7 +1967,7 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 	ar_sdio = ath10k_sdio_priv(ar);
 
 	ar_sdio->irq_data.irq_proc_reg =
-		kzalloc(sizeof(struct ath10k_sdio_irq_proc_regs),
+		devm_kzalloc(ar->dev, sizeof(struct ath10k_sdio_irq_proc_regs),
 			GFP_KERNEL);
 	if (!ar_sdio->irq_data.irq_proc_reg) {
 		ret = -ENOMEM;
@@ -1975,17 +1975,17 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 	}
 
 	ar_sdio->irq_data.irq_en_reg =
-		kzalloc(sizeof(struct ath10k_sdio_irq_enable_regs),
+		devm_kzalloc(ar->dev, sizeof(struct ath10k_sdio_irq_enable_regs),
 			GFP_KERNEL);
 	if (!ar_sdio->irq_data.irq_en_reg) {
 		ret = -ENOMEM;
-		goto err_free_proc_reg;
+		goto err_core_destroy;
 	}
 
-	ar_sdio->bmi_buf = kzalloc(BMI_MAX_CMDBUF_SIZE, GFP_KERNEL);
+	ar_sdio->bmi_buf = devm_kzalloc(ar->dev, BMI_MAX_CMDBUF_SIZE, GFP_KERNEL);
 	if (!ar_sdio->bmi_buf) {
 		ret = -ENOMEM;
-		goto err_free_en_reg;
+		goto err_core_destroy;
 	}
 
 	ar_sdio->func = func;
@@ -2005,7 +2005,7 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 	ar_sdio->workqueue = create_singlethread_workqueue("ath10k_sdio_wq");
 	if (!ar_sdio->workqueue) {
 		ret = -ENOMEM;
-		goto err_free_bmi_buf;
+		goto err_core_destroy;
 	}
 
 	for (i = 0; i < ATH10K_SDIO_BUS_REQUEST_MAX_NUM; i++)
@@ -2021,7 +2021,7 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 		ret = -ENODEV;
 		ath10k_err(ar, "unsupported device id %u (0x%x)\n",
 			   dev_id_base, id->device);
-		goto err_free_bmi_buf;
+		goto err_core_destroy;
 	}
 
 	ar->id.vendor = id->vendor;
@@ -2050,12 +2050,6 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 
 err_free_wq:
 	destroy_workqueue(ar_sdio->workqueue);
-err_free_bmi_buf:
-	kfree(ar_sdio->bmi_buf);
-err_free_en_reg:
-	kfree(ar_sdio->irq_data.irq_en_reg);
-err_free_proc_reg:
-	kfree(ar_sdio->irq_data.irq_proc_reg);
 err_core_destroy:
 	ath10k_core_destroy(ar);
 
-- 
2.16.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
