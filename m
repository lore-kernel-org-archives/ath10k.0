Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAksi-0005oE-K3
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 19:42:33 +0000
From: greearb@candelatech.com
Subject: [PATCH 6/8] ath10k:  fix spelling in htt code comment.
Date: Mon, 12 Jan 2015 11:41:47 -0800
Message-Id: <1421091709-19891-6-git-send-email-greearb@candelatech.com>
In-Reply-To: <1421091709-19891-1-git-send-email-greearb@candelatech.com>
References: <1421091709-19891-1-git-send-email-greearb@candelatech.com>
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

Fix spelling error.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index fdd665c..a3ca25c 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -130,7 +130,7 @@ static void ath10k_htt_rx_msdu_buff_replenish(struct ath10k_htt *htt)
 	 * automatically balances load wrt to CPU power.
 	 *
 	 * This probably comes at a cost of lower maximum throughput but
-	 * improves the avarage and stability. */
+	 * improves the average and stability. */
 	spin_lock_bh(&htt->rx_ring.lock);
 	num_deficit = htt->rx_ring.fill_level - htt->rx_ring.fill_cnt;
 	num_to_fill = min(ATH10K_HTT_MAX_NUM_REFILL, num_deficit);
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
