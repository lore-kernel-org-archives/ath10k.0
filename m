Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bksqD-0003KF-N2
 for ath10k@lists.infradead.org; Fri, 16 Sep 2016 13:06:10 +0000
Received: by mail-pf0-x242.google.com with SMTP id q2so972815pfj.0
 for <ath10k@lists.infradead.org>; Fri, 16 Sep 2016 06:05:45 -0700 (PDT)
From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] ath10k: fix error return code in ahb
Date: Fri, 16 Sep 2016 13:05:35 +0000
Message-Id: <1474031135-6963-1-git-send-email-weiyj.lk@gmail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, Raja Mani <rmani@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, ath10k@lists.infradead.org

From: Wei Yongjun <weiyongjun1@huawei.com>

Fix to return a negative error code from the error handling case
instead of 0, as done elsewhere in function ath10k_ahb_probe() or
ath10k_ahb_resource_init().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wireless/ath/ath10k/ahb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index b99ad5d..6dc1c60 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -572,6 +572,7 @@ static int ath10k_ahb_resource_init(struct ath10k *ar)
 	ar_ahb->irq = platform_get_irq_byname(pdev, "legacy");
 	if (ar_ahb->irq < 0) {
 		ath10k_err(ar, "failed to get irq number: %d\n", ar_ahb->irq);
+		ret = ar_ahb->irq;
 		goto err_clock_deinit;
 	}
 
@@ -850,6 +851,7 @@ static int ath10k_ahb_probe(struct platform_device *pdev)
 	chip_id = ath10k_ahb_soc_read32(ar, SOC_CHIP_ID_ADDRESS);
 	if (chip_id == 0xffffffff) {
 		ath10k_err(ar, "failed to get chip id\n");
+		ret = -ENODEV;
 		goto err_halt_device;
 	}


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
