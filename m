Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V97Zo-0006D7-Hq
 for ath10k@lists.infradead.org; Tue, 13 Aug 2013 05:55:29 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 3/4] ath10k: clean up PCI completion states
Date: Tue, 13 Aug 2013 07:54:56 +0200
Message-ID: <1376373297-32369-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1376373297-32369-1-git-send-email-michal.kazior@tieto.com>
References: <1375949650-9699-1-git-send-email-michal.kazior@tieto.com>
 <1376373297-32369-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Improve code readability by using enum and a
switch-case.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
v2;
 * fix line over 80 chars

 drivers/net/wireless/ath/ath10k/pci.c |   22 ++++++++++++++++------
 drivers/net/wireless/ath/ath10k/pci.h |   13 +++++++------
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 98edb31..630ba59 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -540,7 +540,7 @@ static void ath10k_pci_ce_send_done(struct ce_state *ce_state,
 		if (!compl)
 			break;
 
-		compl->send_or_recv = HIF_CE_COMPLETE_SEND;
+		compl->state = ATH10K_PCI_COMPL_SEND;
 		compl->ce_state = ce_state;
 		compl->pipe_info = pipe_info;
 		compl->transfer_context = transfer_context;
@@ -590,7 +590,7 @@ static void ath10k_pci_ce_recv_data(struct ce_state *ce_state,
 		if (!compl)
 			break;
 
-		compl->send_or_recv = HIF_CE_COMPLETE_RECV;
+		compl->state = ATH10K_PCI_COMPL_RECV;
 		compl->ce_state = ce_state;
 		compl->pipe_info = pipe_info;
 		compl->transfer_context = transfer_context;
@@ -812,7 +812,7 @@ static int ath10k_pci_start_ce(struct ath10k *ar)
 				return -ENOMEM;
 			}
 
-			compl->send_or_recv = HIF_CE_COMPLETE_FREE;
+			compl->state = ATH10K_PCI_COMPL_FREE;
 			list_add_tail(&compl->list, &pipe_info->compl_free);
 		}
 	}
@@ -911,12 +911,14 @@ static void ath10k_pci_process_ce(struct ath10k *ar)
 		list_del(&compl->list);
 		spin_unlock_bh(&ar_pci->compl_lock);
 
-		if (compl->send_or_recv == HIF_CE_COMPLETE_SEND) {
+		switch (compl->state) {
+		case ATH10K_PCI_COMPL_SEND:
 			cb->tx_completion(ar,
 					  compl->transfer_context,
 					  compl->transfer_id);
 			send_done = 1;
-		} else {
+			break;
+		case ATH10K_PCI_COMPL_RECV:
 			ret = ath10k_pci_post_rx_pipe(compl->pipe_info, 1);
 			if (ret) {
 				ath10k_warn("Unable to post recv buffer for pipe: %d\n",
@@ -943,9 +945,17 @@ static void ath10k_pci_process_ce(struct ath10k *ar)
 					    nbytes,
 					    skb->len + skb_tailroom(skb));
 			}
+			break;
+		case ATH10K_PCI_COMPL_FREE:
+			ath10k_warn("free completion cannot be processed\n");
+			break;
+		default:
+			ath10k_warn("invalid completion state (%d)\n",
+				    compl->state);
+			break;
 		}
 
-		compl->send_or_recv = HIF_CE_COMPLETE_FREE;
+		compl->state = ATH10K_PCI_COMPL_FREE;
 
 		/*
 		 * Add completion back to the pipe's free list.
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 871bb33..3093733 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -43,9 +43,15 @@ struct bmi_xfer {
 	u32 resp_len;
 };
 
+enum ath10k_pci_compl_state {
+	ATH10K_PCI_COMPL_FREE = 0,
+	ATH10K_PCI_COMPL_SEND,
+	ATH10K_PCI_COMPL_RECV,
+};
+
 struct ath10k_pci_compl {
 	struct list_head list;
-	int send_or_recv;
+	enum ath10k_pci_compl_state state;
 	struct ce_state *ce_state;
 	struct hif_ce_pipe_info *pipe_info;
 	void *transfer_context;
@@ -54,11 +60,6 @@ struct ath10k_pci_compl {
 	unsigned int flags;
 };
 
-/* compl_state.send_or_recv */
-#define HIF_CE_COMPLETE_FREE 0
-#define HIF_CE_COMPLETE_SEND 1
-#define HIF_CE_COMPLETE_RECV 2
-
 /*
  * PCI-specific Target state
  *
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
