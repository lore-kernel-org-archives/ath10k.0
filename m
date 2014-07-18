Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X87fu-0002hx-3B
 for ath10k@lists.infradead.org; Fri, 18 Jul 2014 12:54:10 +0000
Received: by mail-wi0-f178.google.com with SMTP id hi2so780300wib.17
 for <ath10k@lists.infradead.org>; Fri, 18 Jul 2014 05:53:45 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: prevent endless pci rx loop
Date: Fri, 18 Jul 2014 14:45:01 +0200
Message-Id: <1405687501-25917-1-git-send-email-michal.kazior@tieto.com>
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

It was possible to enter an endless loop while
processing a single pci copy engine pipe. This
could effectively render ath10k incapable of
responding to any requests.

An example case when this could happen is when
firmware generates a lot of events, e.g. spectral
scan phyerr via WMI.

Reported-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
Janusz was testing spectral scan when he found
ath10k would sometimes stop responding while
flooding dmesg with phyerr prints.

There's another bug he found related to scan code
but we still need to test some stuff before I can
post the fix.

 drivers/net/wireless/ath/ath10k/pci.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 06840d1..0ffff20 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -726,18 +726,12 @@ static void ath10k_pci_ce_recv_data(struct ath10k_ce_pipe *ce_state)
 	unsigned int nbytes, max_nbytes;
 	unsigned int transfer_id;
 	unsigned int flags;
-	int err;
+	int err, num_replenish = 0;
 
 	while (ath10k_ce_completed_recv_next(ce_state, &transfer_context,
 					     &ce_data, &nbytes, &transfer_id,
 					     &flags) == 0) {
-		err = ath10k_pci_post_rx_pipe(pipe_info, 1);
-		if (unlikely(err)) {
-			/* FIXME: retry */
-			ath10k_warn("failed to replenish CE rx ring %d: %d\n",
-				    pipe_info->pipe_num, err);
-		}
-
+		num_replenish++;
 		skb = transfer_context;
 		max_nbytes = skb->len + skb_tailroom(skb);
 		dma_unmap_single(ar->dev, ATH10K_SKB_CB(skb)->paddr,
@@ -753,6 +747,13 @@ static void ath10k_pci_ce_recv_data(struct ath10k_ce_pipe *ce_state)
 		skb_put(skb, nbytes);
 		cb->rx_completion(ar, skb, pipe_info->pipe_num);
 	}
+
+	err = ath10k_pci_post_rx_pipe(pipe_info, num_replenish);
+	if (unlikely(err)) {
+		/* FIXME: retry */
+		ath10k_warn("failed to replenish CE rx ring %d (%d bufs): %d\n",
+			    pipe_info->pipe_num, num_replenish, err);
+	}
 }
 
 static int ath10k_pci_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
