Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihvn0-00047K-Js
 for ath10k@lists.infradead.org; Thu, 19 Dec 2019 13:24:27 +0000
Received: by mail-ed1-x543.google.com with SMTP id f8so4869743edv.2
 for <ath10k@lists.infradead.org>; Thu, 19 Dec 2019 05:24:25 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 2/2] ath10k: pci: Fix comment on ath10k_pci_dump_memory_sram
Date: Thu, 19 Dec 2019 13:15:39 +0000
Message-Id: <20191219131539.1003793-3-bryan.odonoghue@linaro.org>
In-Reply-To: <20191219131539.1003793-1-bryan.odonoghue@linaro.org>
References: <20191219131539.1003793-1-bryan.odonoghue@linaro.org>
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
To: kvalo@codeaurora.org, akolli@codeaurora.org, ath10k@lists.infradead.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-wireless@vger.kernel.org

The description of ath10k_pci_dump_memory_sram() is inaccurate, an error
can never be returned, it is always the length. Update the comment to
reflect.

Fixes: 219cc084c6706 ("ath10k: add memory dump support QCA9984")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/net/wireless/ath/ath10k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 4822a65f6f3c..ded7a220a4aa 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1578,7 +1578,7 @@ static int ath10k_pci_set_ram_config(struct ath10k *ar, u32 config)
 	return 0;
 }
 
-/* if an error happened returns < 0, otherwise the length */
+/* Always returns the length */
 static int ath10k_pci_dump_memory_sram(struct ath10k *ar,
 				       const struct ath10k_mem_region *region,
 				       u8 *buf)
-- 
2.24.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
