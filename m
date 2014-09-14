Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh06.mail.saunalahti.fi ([62.142.5.116])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XT6L8-00048n-Lq
 for ath10k@lists.infradead.org; Sun, 14 Sep 2014 09:43:27 +0000
Subject: [PATCH 06/10] ath10k: don't use return on void functions
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Sun, 14 Sep 2014 12:50:28 +0300
Message-ID: <20140914095028.9063.64532.stgit@x230>
In-Reply-To: <20140914094728.9063.32593.stgit@x230>
References: <20140914094728.9063.32593.stgit@x230>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Fixes a checkpatch warning:

WARNING: void function return statements are not generally useful

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 1ab64631ba1b..bd87a35201d8 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -154,7 +154,6 @@ void ath10k_htt_tx_free(struct ath10k_htt *htt)
 	kfree(htt->pending_tx);
 	kfree(htt->used_msdu_ids);
 	dma_pool_destroy(htt->tx_pool);
-	return;
 }
 
 void ath10k_htt_htc_tx_complete(struct ath10k *ar, struct sk_buff *skb)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
