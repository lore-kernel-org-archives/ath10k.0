Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTYY7-0001pr-6L
 for ath10k@lists.infradead.org; Thu, 14 Jun 2018 20:08:52 +0000
From: greearb@candelatech.com
Subject: [PATCH v2] ath10k: Protect ath10k_htt_rx_ring_free with rx_ring.lock
Date: Thu, 14 Jun 2018 13:08:15 -0700
Message-Id: <1529006895-5105-1-git-send-email-greearb@candelatech.com>
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
To: linux-wireless@vger.kernel.org
Cc: Ben Greear <greearb@candelatech.com>, kvalo@codeaurora.org, ath10k@lists.infradead.org

From: Ben Greear <greearb@candelatech.com>

While debugging driver crashes related to a buggy firmware
crashing under load, I noticed that ath10k_htt_rx_ring_free
could be called without being under lock.  I'm not sure if this
is the root cause of the crash or not, but it seems prudent to
protect it.

Originally tested on 4.16+ kernel with ath10k-ct 10.4 firmware
running on 9984 NIC.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---

v2:  Update description to specify how it was tested.
     Generate patch against linux-ath tree (original patch applied with offset)

 drivers/net/wireless/ath/ath10k/htt_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index bd23f69..ccd03f8 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -268,11 +268,12 @@ int ath10k_htt_rx_ring_refill(struct ath10k *ar)
 	spin_lock_bh(&htt->rx_ring.lock);
 	ret = ath10k_htt_rx_ring_fill_n(htt, (htt->rx_ring.fill_level -
 					      htt->rx_ring.fill_cnt));
-	spin_unlock_bh(&htt->rx_ring.lock);
 
 	if (ret)
 		ath10k_htt_rx_ring_free(htt);
 
+	spin_unlock_bh(&htt->rx_ring.lock);
+
 	return ret;
 }
 
@@ -284,7 +285,9 @@ void ath10k_htt_rx_free(struct ath10k_htt *htt)
 	skb_queue_purge(&htt->rx_in_ord_compl_q);
 	skb_queue_purge(&htt->tx_fetch_ind_q);
 
+	spin_lock_bh(&htt->rx_ring.lock);
 	ath10k_htt_rx_ring_free(htt);
+	spin_unlock_bh(&htt->rx_ring.lock);
 
 	dma_free_coherent(htt->ar->dev,
 			  ath10k_htt_get_rx_ring_size(htt),
-- 
2.4.11


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
