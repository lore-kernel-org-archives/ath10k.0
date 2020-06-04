Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgu9F-0005Xp-6W
 for ath10k@lists.infradead.org; Thu, 04 Jun 2020 17:59:26 +0000
Received: by mail-pg1-x544.google.com with SMTP id r10so3804804pgv.8
 for <ath10k@lists.infradead.org>; Thu, 04 Jun 2020 10:59:24 -0700 (PDT)
From: Evan Green <evgreen@chromium.org>
Subject: [PATCH] ath10k: Acquire tx_lock in tx error paths
Date: Thu,  4 Jun 2020 10:59:11 -0700
Message-Id: <20200604105901.1.I5b8b0c7ee0d3e51a73248975a9da61401b8f3900@changeid>
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
Cc: Govind Singh <govinds@qti.qualcomm.com>, kuabhs@google.com.org, sujitka@chromium.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>, ath10k@lists.infradead.org, Michal Kazior <michal.kazior@tieto.com>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

ath10k_htt_tx_free_msdu_id() has a lockdep assertion that htt->tx_lock
is held. Acquire the lock in a couple of error paths when calling that
function to ensure this condition is met.

Fixes: 6421969f248fd ("ath10k: refactor tx pending management")
Fixes: e62ee5c381c59 ("ath10k: Add support for htt_data_tx_desc_64
descriptor")
Signed-off-by: Evan Green <evgreen@chromium.org>
---

 drivers/net/wireless/ath/ath10k/htt_tx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index e9d12ea708b62..e8c00af2cce1d 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1545,7 +1545,9 @@ static int ath10k_htt_tx_32(struct ath10k_htt *htt,
 err_unmap_msdu:
 	dma_unmap_single(dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 err_free_msdu_id:
+	spin_lock_bh(&htt->tx_lock);
 	ath10k_htt_tx_free_msdu_id(htt, msdu_id);
+	spin_unlock_bh(&htt->tx_lock);
 err:
 	return res;
 }
@@ -1752,7 +1754,9 @@ static int ath10k_htt_tx_64(struct ath10k_htt *htt,
 err_unmap_msdu:
 	dma_unmap_single(dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 err_free_msdu_id:
+	spin_lock_bh(&htt->tx_lock);
 	ath10k_htt_tx_free_msdu_id(htt, msdu_id);
+	spin_unlock_bh(&htt->tx_lock);
 err:
 	return res;
 }
-- 
2.24.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
