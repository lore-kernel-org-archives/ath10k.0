Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaaQJ-0000Hu-Gd
 for ath10k@lists.infradead.org; Thu, 17 Apr 2014 00:43:27 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  Hold tx-lock while detaching htt.
Date: Wed, 16 Apr 2014 17:42:37 -0700
Message-Id: <1397695357-14028-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

And check for null pool in the tx path (which would
indicate we are detaching).

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 22a4542..0698d6f 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -143,10 +143,19 @@ static void ath10k_htt_tx_cleanup_pending(struct ath10k_htt *htt)
 
 void ath10k_htt_tx_detach(struct ath10k_htt *htt)
 {
+	struct dma_pool *tx_pool_tmp;
+
 	ath10k_htt_tx_cleanup_pending(htt);
+
+	spin_lock_bh(&htt->tx_lock);
 	kfree(htt->pending_tx);
 	kfree(htt->used_msdu_ids);
-	dma_pool_destroy(htt->tx_pool);
+	tx_pool_tmp = htt->tx_pool;
+	htt->tx_pool = NULL;
+	spin_unlock_bh(&htt->tx_lock);
+
+	dma_pool_destroy(tx_pool_tmp);
+
 	return;
 }
 
@@ -403,6 +412,13 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 		goto err;
 
 	spin_lock_bh(&htt->tx_lock);
+
+	/* Check if we are detached... */
+	if (! htt->tx_pool) {
+		spin_unlock_bh(&htt->tx_lock);
+		goto err_tx_dec;
+	}
+
 	res = ath10k_htt_tx_alloc_msdu_id(htt);
 	if (res < 0) {
 		spin_unlock_bh(&htt->tx_lock);
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
