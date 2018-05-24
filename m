Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway22.websitewelcome.com ([192.185.46.131])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLzD8-0000qO-8q
 for ath10k@lists.infradead.org; Thu, 24 May 2018 22:59:56 +0000
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id 835ADB571
 for <ath10k@lists.infradead.org>; Thu, 24 May 2018 17:59:30 -0500 (CDT)
Date: Thu, 24 May 2018 17:59:28 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] ath10k: htt_tx: mark expected switch fall-throughs
Message-ID: <20180524225928.GA19570@embeddedor.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Notice that in this particular case, I replaced "pass through" with
a proper "fall through" comment, which is what GCC is expecting
to find.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 5d8b97a..89157c5 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1202,7 +1202,7 @@ static int ath10k_htt_tx_32(struct ath10k_htt *htt,
 	case ATH10K_HW_TXRX_RAW:
 	case ATH10K_HW_TXRX_NATIVE_WIFI:
 		flags0 |= HTT_DATA_TX_DESC_FLAGS0_MAC_HDR_PRESENT;
-		/* pass through */
+		/* fall through */
 	case ATH10K_HW_TXRX_ETHERNET:
 		if (ar->hw_params.continuous_frag_desc) {
 			ext_desc_t = htt->frag_desc.vaddr_desc_32;
@@ -1404,7 +1404,7 @@ static int ath10k_htt_tx_64(struct ath10k_htt *htt,
 	case ATH10K_HW_TXRX_RAW:
 	case ATH10K_HW_TXRX_NATIVE_WIFI:
 		flags0 |= HTT_DATA_TX_DESC_FLAGS0_MAC_HDR_PRESENT;
-		/* pass through */
+		/* fall through */
 	case ATH10K_HW_TXRX_ETHERNET:
 		if (ar->hw_params.continuous_frag_desc) {
 			ext_desc_t = htt->frag_desc.vaddr_desc_64;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
