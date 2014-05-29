Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22a.google.com ([2a00:1450:400c:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wpx5u-0001Wx-6w
 for ath10k@lists.infradead.org; Thu, 29 May 2014 09:57:55 +0000
Received: by mail-we0-f170.google.com with SMTP id u57so120964wes.29
 for <ath10k@lists.infradead.org>; Thu, 29 May 2014 02:57:30 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: remove unnecessary htt rx corruption check
Date: Thu, 29 May 2014 11:50:08 +0200
Message-Id: <1401357008-16259-1-git-send-email-michal.kazior@tieto.com>
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

While fixing a bug reported by Avery I went ahead
and added a warning suspecting there might be
something more to the bug. This ended up with
people reporting they see warnings during heavy
traffic. This bought me some time and helped me
understand the problem better - apparently fw/hw
can report a chained msdus as follows: 1 msdu, 1
chained, 1 msdu (0 length).

The patch removes the extra check but leaves the
other change that fixed the original skb_push
panic bug (msdu_chaining was overwritten in an
unfortunate way which made the above example to
be treated as non-chained case).

Reported-by: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Reported-by: Tim Harvey <tharvey@gateworks.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 6c102b1..eebc860 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -312,7 +312,6 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 	int msdu_len, msdu_chaining = 0;
 	struct sk_buff *msdu;
 	struct htt_rx_desc *rx_desc;
-	bool corrupted = false;
 
 	lockdep_assert_held(&htt->rx_ring.lock);
 
@@ -439,9 +438,6 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 		last_msdu = __le32_to_cpu(rx_desc->msdu_end.info0) &
 				RX_MSDU_END_INFO0_LAST_MSDU;
 
-		if (msdu_chaining && !last_msdu)
-			corrupted = true;
-
 		if (last_msdu) {
 			msdu->next = NULL;
 			break;
@@ -457,20 +453,6 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 		msdu_chaining = -1;
 
 	/*
-	 * Apparently FW sometimes reports weird chained MSDU sequences with
-	 * more than one rx descriptor. This seems like a bug but needs more
-	 * analyzing. For the time being fix it by dropping such sequences to
-	 * avoid blowing up the host system.
-	 */
-	if (corrupted) {
-		ath10k_warn("failed to pop chained msdus, dropping\n");
-		ath10k_htt_rx_free_msdu_chain(*head_msdu);
-		*head_msdu = NULL;
-		*tail_msdu = NULL;
-		msdu_chaining = -EINVAL;
-	}
-
-	/*
 	 * Don't refill the ring yet.
 	 *
 	 * First, the elements popped here are still in use - it is not
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
