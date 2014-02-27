Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x229.google.com ([2a00:1450:4013:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIvLV-0003FP-E9
 for ath10k@lists.infradead.org; Thu, 27 Feb 2014 07:25:32 +0000
Received: by mail-ea0-f169.google.com with SMTP id d10so1572877eaj.0
 for <ath10k@lists.infradead.org>; Wed, 26 Feb 2014 23:25:07 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v3 8/8] ath10k: minimize coherent dma accesses
Date: Thu, 27 Feb 2014 08:19:47 +0100
Message-Id: <1393485587-16879-9-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1393485587-16879-1-git-send-email-michal.kazior@tieto.com>
References: <1392629563-31046-1-git-send-email-michal.kazior@tieto.com>
 <1393485587-16879-1-git-send-email-michal.kazior@tieto.com>
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

It doesn't make much sense to calculate the ring
size fill count because it already is memoized in
a separate variable.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
v2:
 * fix unbalanced locking

 drivers/net/wireless/ath/ath10k/htt_rx.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 1cb88bf..2fe47d8 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -225,12 +225,6 @@ static void ath10k_htt_rx_ring_refill_retry(unsigned long arg)
 	ath10k_htt_rx_msdu_buff_replenish(htt);
 }
 
-static unsigned ath10k_htt_rx_ring_elems(struct ath10k_htt *htt)
-{
-	return (__le32_to_cpu(*htt->rx_ring.alloc_idx.vaddr) -
-		htt->rx_ring.sw_rd_idx.msdu_payld) & htt->rx_ring.size_mask;
-}
-
 void ath10k_htt_rx_detach(struct ath10k_htt *htt)
 {
 	int sw_rd_idx = htt->rx_ring.sw_rd_idx.msdu_payld;
@@ -276,8 +270,10 @@ static inline struct sk_buff *ath10k_htt_rx_netbuf_pop(struct ath10k_htt *htt)
 
 	lockdep_assert_held(&htt->rx_ring.lock);
 
-	if (ath10k_htt_rx_ring_elems(htt) == 0)
-		ath10k_warn("htt rx ring is empty!\n");
+	if (htt->rx_ring.fill_cnt == 0) {
+		ath10k_warn("tried to pop sk_buff from an empty rx ring\n");
+		return NULL;
+	}
 
 	idx = htt->rx_ring.sw_rd_idx.msdu_payld;
 	msdu = htt->rx_ring.netbufs_ring[idx];
@@ -312,9 +308,6 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 
 	lockdep_assert_held(&htt->rx_ring.lock);
 
-	if (ath10k_htt_rx_ring_elems(htt) == 0)
-		ath10k_warn("htt rx ring is empty!\n");
-
 	if (htt->rx_confused) {
 		ath10k_warn("htt is confused. refusing rx\n");
 		return 0;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
