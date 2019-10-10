Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIbHF-0003J7-Uw
 for ath10k@lists.infradead.org; Thu, 10 Oct 2019 16:26:59 +0000
Received: by mail-pl1-x641.google.com with SMTP id e5so3030487pls.9
 for <ath10k@lists.infradead.org>; Thu, 10 Oct 2019 09:26:57 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] ath10k: Correct error check of dma_map_single()
Date: Thu, 10 Oct 2019 09:26:53 -0700
Message-Id: <20191010162653.141303-1-bjorn.andersson@linaro.org>
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, ath10k@lists.infradead.org, Niklas Cassel <niklas.cassel@linaro.org>

The return value of dma_map_single() should be checked for errors using
dma_mapping_error(), rather than testing for NULL. Correct this.

Fixes: 1807da49733e ("ath10k: wmi: add management tx by reference support over wmi")
Cc: stable@vger.kernel.org
Reported-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3d2c8fcba952..a01868938692 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3904,7 +3904,7 @@ void ath10k_mgmt_over_wmi_tx_work(struct work_struct *work)
 			     ar->running_fw->fw_file.fw_features)) {
 			paddr = dma_map_single(ar->dev, skb->data,
 					       skb->len, DMA_TO_DEVICE);
-			if (!paddr)
+			if (dma_mapping_error(ar->dev, paddr))
 				continue;
 			ret = ath10k_wmi_mgmt_tx_send(ar, skb, paddr);
 			if (ret) {
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
