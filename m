Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x231.google.com ([2a00:1450:4013:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wi1ZR-0007Gs-Nx
 for ath10k@lists.infradead.org; Wed, 07 May 2014 13:07:38 +0000
Received: by mail-ee0-f49.google.com with SMTP id e53so722114eek.36
 for <ath10k@lists.infradead.org>; Wed, 07 May 2014 06:07:13 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: fix handling of wierd MSDU chaining cases
Date: Wed,  7 May 2014 14:33:26 +0200
Message-Id: <1399466006-5556-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1399466006-5556-1-git-send-email-michal.kazior@tieto.com>
References: <1399466006-5556-1-git-send-email-michal.kazior@tieto.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, apenwarr@gmail.com

Apparently firmware can sometimes report a
sequence with the first rx descriptor saying it's
not the last MSDU. In that case msdu_chaining
value could be overwritten saying it's not a
chained MSDU. This in turn led to skb_push panic
as the frame could be treated as an A-MSDU instead
of a chained MSDU.

Reported-By: Avery Pennarun <apenwarr@gmail.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index db6c8af..ac6a5fe 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -312,6 +312,7 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 	int msdu_len, msdu_chaining = 0;
 	struct sk_buff *msdu;
 	struct htt_rx_desc *rx_desc;
+	bool corrupted = false;
 
 	lockdep_assert_held(&htt->rx_ring.lock);
 
@@ -405,7 +406,6 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 		msdu_len = MS(__le32_to_cpu(rx_desc->msdu_start.info0),
 			      RX_MSDU_START_INFO0_MSDU_LENGTH);
 		msdu_chained = rx_desc->frag_info.ring2_more_count;
-		msdu_chaining = msdu_chained;
 
 		if (msdu_len_invalid)
 			msdu_len = 0;
@@ -433,11 +433,15 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 
 			msdu->next = next;
 			msdu = next;
+			msdu_chaining = 1;
 		}
 
 		last_msdu = __le32_to_cpu(rx_desc->msdu_end.info0) &
 				RX_MSDU_END_INFO0_LAST_MSDU;
 
+		if (msdu_chaining && !last_msdu)
+			corrupted = true;
+
 		if (last_msdu) {
 			msdu->next = NULL;
 			break;
@@ -453,6 +457,20 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 		msdu_chaining = -1;
 
 	/*
+	 * Apparently FW sometimes reports weird chained MSDU sequences with
+	 * more than one rx descriptor. This seems like a bug but needs more
+	 * analyzing. For the time being fix it by dropping such sequences to
+	 * avoid blowing up the host system.
+	 */
+	if (corrupted) {
+		ath10k_warn("failed to pop chained msdus, dropping\n");
+		ath10k_htt_rx_free_msdu_chain(*head_msdu);
+		*head_msdu = NULL;
+		*tail_msdu = NULL;
+		msdu_chaining = -EINVAL;
+	}
+
+	/*
 	 * Don't refill the ring yet.
 	 *
 	 * First, the elements popped here are still in use - it is not
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
