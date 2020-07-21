Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxvr2-0000XM-Aa
 for ath10k@lists.infradead.org; Tue, 21 Jul 2020 17:15:01 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [RFC 4/7] ath10k: Do not exhaust budget on process tx completion
Date: Tue, 21 Jul 2020 22:44:23 +0530
Message-Id: <1595351666-28193-5-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, dianders@chromium.org, Rakesh Pillai <pillair@codeaurora.org>, kuba@kernel.org, johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org

Currently the entire NAPI budget is marked as exhausted
if any tx completion is processed.
In scenarios of bi-directional traffic, this leads to a
situation where the irqs are never enabled and the NAPI
is rescheuled again and again.

Increase the work done quota by the number of tx completions
which are processed in the NAPI context.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index cac05e7..a4a6618 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -4077,21 +4077,18 @@ int ath10k_htt_txrx_compl_task(struct ath10k *ar, int budget)
 	/* Deliver received data after processing data from hardware */
 	quota = ath10k_htt_rx_deliver_msdu(ar, quota, budget);
 
-	/* From NAPI documentation:
-	 *  The napi poll() function may also process TX completions, in which
-	 *  case if it processes the entire TX ring then it should count that
-	 *  work as the rest of the budget.
-	 */
-	if ((quota < budget) && !kfifo_is_empty(&htt->txdone_fifo))
-		quota = budget;
-
 	/* kfifo_get: called only within txrx_tasklet so it's neatly serialized.
 	 * From kfifo_get() documentation:
 	 *  Note that with only one concurrent reader and one concurrent writer,
 	 *  you don't need extra locking to use these macro.
 	 */
-	while (kfifo_get(&htt->txdone_fifo, &tx_done))
+	while (kfifo_get(&htt->txdone_fifo, &tx_done)) {
 		ath10k_txrx_tx_unref(htt, &tx_done);
+		quota++;
+	}
+
+	if (quota > budget)
+		resched_napi = true;
 
 	ath10k_mac_tx_push_pending(ar);
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
