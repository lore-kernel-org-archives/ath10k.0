Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEwEP-0002iC-Uk
 for ath10k@lists.infradead.org; Fri, 12 Apr 2019 13:28:39 +0000
Subject: [PATCH 3/6] ath10k: htt: don't use txdone_fifo with SDIO
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 12 Apr 2019 16:28:34 +0300
Message-ID: <155507571386.32018.4599069777915701774.stgit@potku.adurom.net>
In-Reply-To: <155507569645.32018.15231567732563770250.stgit@potku.adurom.net>
References: <155507569645.32018.15231567732563770250.stgit@potku.adurom.net>
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

From: Alagu Sankar <alagusankar@silex-india.com>

HTT High Latency (ATH10K_DEV_TYPE_HL) does not use txdone_fifo at all, we don't
even initialise it by skipping ath10k_htt_tx_alloc_buf() in
ath10k_htt_tx_start(). Because of this using QCA6174 SDIO
ath10k_htt_rx_tx_compl_ind() will crash when it accesses unitialised
txdone_fifo. So skip txdone_fifo when using High Latency mode.

Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Co-developed-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index a20ea270d519..8d13d0c3e85e 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2277,7 +2277,9 @@ static void ath10k_htt_rx_tx_compl_ind(struct ath10k *ar,
 		 *  Note that with only one concurrent reader and one concurrent
 		 *  writer, you don't need extra locking to use these macro.
 		 */
-		if (!kfifo_put(&htt->txdone_fifo, tx_done)) {
+		if (ar->bus_param.dev_type == ATH10K_DEV_TYPE_HL) {
+			ath10k_txrx_tx_unref(htt, &tx_done);
+		} else if (!kfifo_put(&htt->txdone_fifo, tx_done)) {
 			ath10k_warn(ar, "txdone fifo overrun, msdu_id %d status %d\n",
 				    tx_done.msdu_id, tx_done.status);
 			ath10k_txrx_tx_unref(htt, &tx_done);


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
