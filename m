Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1beHkS-00045H-9A
 for ath10k@lists.infradead.org; Mon, 29 Aug 2016 08:16:53 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH] ath10k: fix throughput regression in multi client mode
Date: Mon, 29 Aug 2016 13:46:13 +0530
Message-ID: <20160829081613.1474-1-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, rmanohar@codeaurora.org

commit 7a0adc83f34d ("ath10k: improve tx scheduling") is causing
severe throughput drop in multi client mode. This issue is originally
reported in veriwave setup with 50 clients with TCP downlink traffic.
While increasing number of clients, the average throughput drops
gradually. With 50 clients, the combined peak throughput is decreased
to 98 Mbps whereas reverting given commit restored it to 550 Mbps.

Processing txqs for every tx completion is causing overhead. Ideally for
management frame tx completion, pending txqs processing can be avoided.
The change partly reverts the commit "ath10k: improve tx scheduling".
Processing pending txqs after all skbs tx completion will yeild enough
room to burst tx frames.

Fixes: 7a0adc83f34d ("ath10k: improve tx scheduling")
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 2 ++
 drivers/net/wireless/ath/ath10k/txrx.c   | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index d3f8baf532d4..2d62921bcd4e 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2445,6 +2445,8 @@ int ath10k_htt_txrx_compl_task(struct ath10k *ar, int budget)
 	while (kfifo_get(&htt->txdone_fifo, &tx_done))
 		ath10k_txrx_tx_unref(htt, &tx_done);
 
+	ath10k_mac_tx_push_pending(ar);
+
 	spin_lock_irqsave(&htt->tx_fetch_ind_q.lock, flags);
 	skb_queue_splice_init(&htt->tx_fetch_ind_q, &tx_ind_q);
 	spin_unlock_irqrestore(&htt->tx_fetch_ind_q.lock, flags);
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 98f3bb47414c..5d645f989ce2 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -125,8 +125,6 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 	ieee80211_tx_status(htt->ar->hw, msdu);
 	/* we do not own the msdu anymore */
 
-	ath10k_mac_tx_push_pending(ar);
-
 	return 0;
 }
 
-- 
2.9.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
