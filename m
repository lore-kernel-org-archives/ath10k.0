Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgDQ3-0004U0-7g
 for ath10k@lists.infradead.org; Mon, 20 Oct 2014 13:54:44 +0000
Received: by mail-lb0-f171.google.com with SMTP id z12so3921005lbi.2
 for <ath10k@lists.infradead.org>; Mon, 20 Oct 2014 06:54:20 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 5/9] ath10k: deduplicate htt rx dma unmapping
Date: Mon, 20 Oct 2014 15:40:34 +0200
Message-Id: <1413812438-14640-6-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1413812438-14640-1-git-send-email-michal.kazior@tieto.com>
References: <1413812438-14640-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Treat non-chained and chained popping the same
way. Also this makes netbuf pop fully symmetrical
to (re)filling.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index a7d29c8..41a2803 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -291,6 +291,15 @@ static inline struct sk_buff *ath10k_htt_rx_netbuf_pop(struct ath10k_htt *htt)
 	htt->rx_ring.sw_rd_idx.msdu_payld = idx;
 	htt->rx_ring.fill_cnt--;
 
+	dma_unmap_single(htt->ar->dev,
+			 ATH10K_SKB_CB(msdu)->paddr,
+			 msdu->len + skb_tailroom(msdu),
+			 DMA_FROM_DEVICE);
+	ath10k_dbg_dump(ar, ATH10K_DBG_HTT_DUMP, NULL, "htt rx netbuf pop: ",
+			msdu->data, msdu->len + skb_tailroom(msdu));
+	trace_ath10k_htt_rx_pop_msdu(ar, msdu->data, msdu->len +
+				     skb_tailroom(msdu));
+
 	return msdu;
 }
 
@@ -329,16 +338,6 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 	while (msdu) {
 		int last_msdu, msdu_len_invalid, msdu_chained;
 
-		dma_unmap_single(htt->ar->dev,
-				 ATH10K_SKB_CB(msdu)->paddr,
-				 msdu->len + skb_tailroom(msdu),
-				 DMA_FROM_DEVICE);
-
-		ath10k_dbg_dump(ar, ATH10K_DBG_HTT_DUMP, NULL, "htt rx pop: ",
-				msdu->data, msdu->len + skb_tailroom(msdu));
-		trace_ath10k_htt_rx_pop_msdu(ar, msdu->data, msdu->len +
-					     skb_tailroom(msdu));
-
 		rx_desc = (struct htt_rx_desc *)msdu->data;
 
 		/* FIXME: we must report msdu payload since this is what caller
@@ -429,17 +428,6 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 		while (msdu_chained--) {
 			struct sk_buff *next = ath10k_htt_rx_netbuf_pop(htt);
 
-			dma_unmap_single(htt->ar->dev,
-					 ATH10K_SKB_CB(next)->paddr,
-					 next->len + skb_tailroom(next),
-					 DMA_FROM_DEVICE);
-
-			ath10k_dbg_dump(ar, ATH10K_DBG_HTT_DUMP, NULL,
-					"htt rx chained: ", next->data,
-					next->len + skb_tailroom(next));
-			trace_ath10k_htt_rx_pop_msdu(ar, msdu->data, msdu->len +
-						     skb_tailroom(msdu));
-
 			skb_trim(next, 0);
 			skb_put(next, min(msdu_len, HTT_RX_BUF_SIZE));
 			msdu_len -= next->len;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
