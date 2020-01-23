Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iulqM-0002cL-Tz
 for ath10k@lists.infradead.org; Thu, 23 Jan 2020 23:25:00 +0000
Received: by mail-pj1-x1041.google.com with SMTP id d5so175631pjz.5
 for <ath10k@lists.infradead.org>; Thu, 23 Jan 2020 15:24:58 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH] ath10k: Add newlines to printk messages
Date: Thu, 23 Jan 2020 15:24:56 -0800
Message-Id: <20200123232456.36197-1-swboyd@chromium.org>
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

Some printks in here don't have newlines at the end, meaning the log
will be sort of hard to read. Add newlines.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 7e85c4916e7f..19a4d053d1de 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -582,7 +582,7 @@ static void ath10k_snoc_process_rx_cb(struct ath10k_ce_pipe *ce_state,
 				 max_nbytes, DMA_FROM_DEVICE);
 
 		if (unlikely(max_nbytes < nbytes)) {
-			ath10k_warn(ar, "rxed more than expected (nbytes %d, max %d)",
+			ath10k_warn(ar, "rxed more than expected (nbytes %d, max %d)\n",
 				    nbytes, max_nbytes);
 			dev_kfree_skb_any(skb);
 			continue;
@@ -1201,7 +1201,7 @@ static int ath10k_snoc_request_irq(struct ath10k *ar)
 				  irqflags, ce_name[id], ar);
 		if (ret) {
 			ath10k_err(ar,
-				   "failed to register IRQ handler for CE %d: %d",
+				   "failed to register IRQ handler for CE %d: %d\n",
 				   id, ret);
 			goto err_irq;
 		}
@@ -1485,7 +1485,7 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 
 	ret = dma_set_mask_and_coherent(dev, drv_data->dma_mask);
 	if (ret) {
-		dev_err(dev, "failed to set dma mask: %d", ret);
+		dev_err(dev, "failed to set dma mask: %d\n", ret);
 		return ret;
 	}
 
-- 
Sent by a computer, using git, on the internet


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
