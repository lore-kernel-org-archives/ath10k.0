Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtwDn-0001RD-TC
 for ath10k@lists.infradead.org; Thu, 27 Nov 2014 10:22:49 +0000
Received: by mail-wi0-f180.google.com with SMTP id n3so7806885wiv.1
 for <ath10k@lists.infradead.org>; Thu, 27 Nov 2014 02:22:25 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/3] ath10k: prevent pci tx/rx starvation
Date: Thu, 27 Nov 2014 11:09:38 +0100
Message-Id: <1417082978-1701-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1417082978-1701-1-git-send-email-michal.kazior@tieto.com>
References: <1417082978-1701-1-git-send-email-michal.kazior@tieto.com>
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

In theory it was possible to starve the system if
a tx/rx handler could implicitly trigger more
tx/rx pci events.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 95e9066..7abb836 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -823,20 +823,24 @@ static void ath10k_pci_ce_send_done(struct ath10k_ce_pipe *ce_state)
 	struct ath10k *ar = ce_state->ar;
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	struct ath10k_hif_cb *cb = &ar_pci->msg_callbacks_current;
-	void *transfer_context;
+	struct sk_buff_head list;
+	struct sk_buff *skb;
 	u32 ce_data;
 	unsigned int nbytes;
 	unsigned int transfer_id;
 
-	while (ath10k_ce_completed_send_next(ce_state, &transfer_context,
-					     &ce_data, &nbytes,
-					     &transfer_id) == 0) {
+	__skb_queue_head_init(&list);
+	while (ath10k_ce_completed_send_next(ce_state, (void **)&skb, &ce_data,
+					     &nbytes, &transfer_id) == 0) {
 		/* no need to call tx completion for NULL pointers */
-		if (transfer_context == NULL)
+		if (skb == NULL)
 			continue;
 
-		cb->tx_completion(ar, transfer_context);
+		__skb_queue_tail(&list, skb);
 	}
+
+	while ((skb = __skb_dequeue(&list)))
+		cb->tx_completion(ar, skb);
 }
 
 /* Called by lower (CE) layer when data is received from the Target. */
@@ -847,12 +851,14 @@ static void ath10k_pci_ce_recv_data(struct ath10k_ce_pipe *ce_state)
 	struct ath10k_pci_pipe *pipe_info =  &ar_pci->pipe_info[ce_state->id];
 	struct ath10k_hif_cb *cb = &ar_pci->msg_callbacks_current;
 	struct sk_buff *skb;
+	struct sk_buff_head list;
 	void *transfer_context;
 	u32 ce_data;
 	unsigned int nbytes, max_nbytes;
 	unsigned int transfer_id;
 	unsigned int flags;
 
+	__skb_queue_head_init(&list);
 	while (ath10k_ce_completed_recv_next(ce_state, &transfer_context,
 					     &ce_data, &nbytes, &transfer_id,
 					     &flags) == 0) {
@@ -869,7 +875,10 @@ static void ath10k_pci_ce_recv_data(struct ath10k_ce_pipe *ce_state)
 		}
 
 		skb_put(skb, nbytes);
+		__skb_queue_tail(&list, skb);
+	}
 
+	while ((skb = __skb_dequeue(&list))) {
 		ath10k_dbg(ar, ATH10K_DBG_PCI, "pci rx ce pipe %d len %d\n",
 			   ce_state->id, skb->len);
 		ath10k_dbg_dump(ar, ATH10K_DBG_PCI_DUMP, NULL, "pci rx: ",
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
