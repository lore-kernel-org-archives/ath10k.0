Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgDQ1-0004Rn-Oj
 for ath10k@lists.infradead.org; Mon, 20 Oct 2014 13:54:42 +0000
Received: by mail-la0-f54.google.com with SMTP id gm9so3997645lab.13
 for <ath10k@lists.infradead.org>; Mon, 20 Oct 2014 06:54:19 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 4/9] ath10k: fix rx buffer tracing
Date: Mon, 20 Oct 2014 15:40:33 +0200
Message-Id: <1413812438-14640-5-git-send-email-michal.kazior@tieto.com>
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

Tracing function was called before buffers were
unmapped from DMA.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index ca466ce..a7d29c8 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -291,9 +291,6 @@ static inline struct sk_buff *ath10k_htt_rx_netbuf_pop(struct ath10k_htt *htt)
 	htt->rx_ring.sw_rd_idx.msdu_payld = idx;
 	htt->rx_ring.fill_cnt--;
 
-	trace_ath10k_htt_rx_pop_msdu(ar, msdu->data, msdu->len +
-				     skb_tailroom(msdu));
-
 	return msdu;
 }
 
@@ -339,6 +336,8 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 
 		ath10k_dbg_dump(ar, ATH10K_DBG_HTT_DUMP, NULL, "htt rx pop: ",
 				msdu->data, msdu->len + skb_tailroom(msdu));
+		trace_ath10k_htt_rx_pop_msdu(ar, msdu->data, msdu->len +
+					     skb_tailroom(msdu));
 
 		rx_desc = (struct htt_rx_desc *)msdu->data;
 
@@ -438,6 +437,8 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 			ath10k_dbg_dump(ar, ATH10K_DBG_HTT_DUMP, NULL,
 					"htt rx chained: ", next->data,
 					next->len + skb_tailroom(next));
+			trace_ath10k_htt_rx_pop_msdu(ar, msdu->data, msdu->len +
+						     skb_tailroom(msdu));
 
 			skb_trim(next, 0);
 			skb_put(next, min(msdu_len, HTT_RX_BUF_SIZE));
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
