Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iulv5-00048j-TO
 for ath10k@lists.infradead.org; Thu, 23 Jan 2020 23:29:53 +0000
Received: by mail-pf1-x441.google.com with SMTP id x6so150591pfo.10
 for <ath10k@lists.infradead.org>; Thu, 23 Jan 2020 15:29:45 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH] ath10k: Use device_get_match_data() to simplify code
Date: Thu, 23 Jan 2020 15:29:44 -0800
Message-Id: <20200123232944.39247-1-swboyd@chromium.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Use device_get_match_data() here to simplify the code a bit.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 19a4d053d1de..88900f0399f5 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1466,7 +1466,6 @@ MODULE_DEVICE_TABLE(of, ath10k_snoc_dt_match);
 static int ath10k_snoc_probe(struct platform_device *pdev)
 {
 	const struct ath10k_snoc_drv_priv *drv_data;
-	const struct of_device_id *of_id;
 	struct ath10k_snoc *ar_snoc;
 	struct device *dev;
 	struct ath10k *ar;
@@ -1474,14 +1473,13 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 	int ret;
 	u32 i;
 
-	of_id = of_match_device(ath10k_snoc_dt_match, &pdev->dev);
-	if (!of_id) {
+	dev = &pdev->dev;
+	drv_data = device_get_match_data(dev);
+	if (!drv_data) {
 		dev_err(&pdev->dev, "failed to find matching device tree id\n");
 		return -EINVAL;
 	}
 
-	drv_data = of_id->data;
-	dev = &pdev->dev;
 
 	ret = dma_set_mask_and_coherent(dev, drv_data->dma_mask);
 	if (ret) {
-- 
Sent by a computer, using git, on the internet


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
