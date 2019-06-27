Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgZQl-0007bU-0v
 for ath10k@lists.infradead.org; Thu, 27 Jun 2019 18:47:36 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 1/2] ath10k: remove unnecessary 'out of memory' message
Date: Thu, 27 Jun 2019 21:47:29 +0300
Message-Id: <1561661250-30528-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

Fixes checkpatch warning:

drivers/net/wireless/ath/ath10k/swap.c:110: Possible unnecessary 'out of memory' message

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/swap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/swap.c b/drivers/net/wireless/ath/ath10k/swap.c
index 4dddeee684b4..7198a386f2fb 100644
--- a/drivers/net/wireless/ath/ath10k/swap.c
+++ b/drivers/net/wireless/ath/ath10k/swap.c
@@ -106,10 +106,8 @@ ath10k_swap_code_seg_alloc(struct ath10k *ar, size_t swap_bin_len)
 
 	virt_addr = dma_alloc_coherent(ar->dev, swap_bin_len, &paddr,
 				       GFP_KERNEL);
-	if (!virt_addr) {
-		ath10k_err(ar, "failed to allocate dma coherent memory\n");
+	if (!virt_addr)
 		return NULL;
-	}
 
 	seg_info->seg_hw_info.bus_addr[0] = __cpu_to_le32(paddr);
 	seg_info->seg_hw_info.size = __cpu_to_le32(swap_bin_len);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
