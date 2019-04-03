Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway33.websitewelcome.com ([192.185.146.97])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBjZ8-0003tK-6R
 for ath10k@lists.infradead.org; Wed, 03 Apr 2019 17:20:47 +0000
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id 5C8FD567C0C
 for <ath10k@lists.infradead.org>; Wed,  3 Apr 2019 12:20:31 -0500 (CDT)
Date: Wed, 3 Apr 2019 12:20:29 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] ath10k: Use struct_size() helper
Message-ID: <20190403172029.GA302@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes, in particular in the
context in which this code is being used.

So, change the following form:

sizeof(*rx) + (sizeof(struct htt_rx_indication_mpdu_range) * num_mpdu_ranges)

 to :

struct_size(rx, mpdu_ranges, num_mpdu_ranges)

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index a20ea270d519..9652cf323927 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2193,9 +2193,7 @@ static void ath10k_htt_rx_proc_rx_ind_ll(struct ath10k_htt *htt,
 	mpdu_ranges = htt_rx_ind_get_mpdu_ranges(rx);
 
 	ath10k_dbg_dump(ar, ATH10K_DBG_HTT_DUMP, NULL, "htt rx ind: ",
-			rx, sizeof(*rx) +
-			(sizeof(struct htt_rx_indication_mpdu_range) *
-				num_mpdu_ranges));
+			rx, struct_size(rx, mpdu_ranges, num_mpdu_ranges));
 
 	for (i = 0; i < num_mpdu_ranges; i++)
 		mpdu_count += mpdu_ranges[i].mpdu_count;
-- 
2.21.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
