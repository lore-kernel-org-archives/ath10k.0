Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x229.google.com ([2607:f8b0:400d:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aTY75-00027S-R5
 for ath10k@lists.infradead.org; Wed, 10 Feb 2016 16:59:38 +0000
Received: by mail-qg0-x229.google.com with SMTP id b67so18156963qgb.1
 for <ath10k@lists.infradead.org>; Wed, 10 Feb 2016 08:59:14 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH] ath10k: fix erroneous return value
Date: Wed, 10 Feb 2016 11:58:55 -0500
Message-Id: <1455123535-26751-1-git-send-email-a.s.protopopov@gmail.com>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Anton Protopopov <a.s.protopopov@gmail.com>

The ath10k_pci_hif_exchange_bmi_msg() function may return the positive
value EIO instead of -EIO in case of error.

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index ee925c6..526acde 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1756,7 +1756,7 @@ static int ath10k_pci_hif_exchange_bmi_msg(struct ath10k *ar,
 					    DMA_FROM_DEVICE);
 		ret = dma_mapping_error(ar->dev, resp_paddr);
 		if (ret) {
-			ret = EIO;
+			ret = -EIO;
 			goto err_req;
 		}
 
-- 
2.6.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
