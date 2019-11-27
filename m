Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZo4v-0005Jy-Tf
 for ath10k@lists.infradead.org; Wed, 27 Nov 2019 03:33:25 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: change log level for mpdu status of sdio chip
Date: Wed, 27 Nov 2019 03:33:13 +0000
Message-ID: <0101016eaaeb8952-5f5470e8-6cf3-4017-b658-b9866b4985ef-000000@us-west-2.amazonses.com>
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

Change log level from warn to dbg level of mpdu status
of sdio chip.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 4490ffb53d24..283ffac56b1a 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2203,8 +2203,8 @@ static bool ath10k_htt_rx_proc_rx_ind_hl(struct ath10k_htt *htt,
 	    HTT_RX_IND_MPDU_STATUS_OK &&
 	    mpdu_ranges->mpdu_range_status !=
 	    HTT_RX_IND_MPDU_STATUS_TKIP_MIC_ERR) {
-		ath10k_warn(ar, "MPDU range status: %d\n",
-			    mpdu_ranges->mpdu_range_status);
+		ath10k_dbg(ar, ATH10K_DBG_HTT, "htt mpdu_range_status %d\n",
+			   mpdu_ranges->mpdu_range_status);
 		goto err;
 	}
 
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
