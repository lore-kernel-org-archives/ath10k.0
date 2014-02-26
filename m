Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22e.google.com ([2a00:1450:4013:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIcqf-0003Yt-VG
 for ath10k@lists.infradead.org; Wed, 26 Feb 2014 11:40:26 +0000
Received: by mail-ea0-f174.google.com with SMTP id h14so833257eaj.33
 for <ath10k@lists.infradead.org>; Wed, 26 Feb 2014 03:40:03 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 2/8] ath10k: remove is_aborted from skb_cb
Date: Wed, 26 Feb 2014 12:34:19 +0100
Message-Id: <1393414465-3666-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1393414465-3666-1-git-send-email-michal.kazior@tieto.com>
References: <1392629563-31046-1-git-send-email-michal.kazior@tieto.com>
 <1393414465-3666-1-git-send-email-michal.kazior@tieto.com>
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

The flag wasn't used anymore. No need to keep it.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.h |  1 -
 drivers/net/wireless/ath/ath10k/pci.c  | 20 --------------------
 2 files changed, 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 082fa77..7cf022d 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -62,7 +62,6 @@ struct ath10k;
 
 struct ath10k_skb_cb {
 	dma_addr_t paddr;
-	bool is_aborted;
 	u8 vdev_id;
 
 	struct {
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 34f0910..d973975 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -63,7 +63,6 @@ static int ath10k_pci_post_rx(struct ath10k *ar);
 static int ath10k_pci_post_rx_pipe(struct ath10k_pci_pipe *pipe_info,
 					     int num);
 static void ath10k_pci_rx_pipe_cleanup(struct ath10k_pci_pipe *pipe_info);
-static void ath10k_pci_stop_ce(struct ath10k *ar);
 static int ath10k_pci_cold_reset(struct ath10k *ar);
 static int ath10k_pci_warm_reset(struct ath10k *ar);
 static int ath10k_pci_wait_for_target_init(struct ath10k *ar);
@@ -993,22 +992,6 @@ static void ath10k_pci_kill_tasklet(struct ath10k *ar)
 		tasklet_kill(&ar_pci->pipe_info[i].intr);
 }
 
-static void ath10k_pci_stop_ce(struct ath10k *ar)
-{
-	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
-	struct ath10k_pci_compl *compl;
-	struct sk_buff *skb;
-
-	/* Mark pending completions as aborted, so that upper layers free up
-	 * their associated resources */
-	spin_lock_bh(&ar_pci->compl_lock);
-	list_for_each_entry(compl, &ar_pci->compl_process, list) {
-		skb = compl->skb;
-		ATH10K_SKB_CB(skb)->is_aborted = true;
-	}
-	spin_unlock_bh(&ar_pci->compl_lock);
-}
-
 static void ath10k_pci_cleanup_ce(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
@@ -1339,7 +1322,6 @@ err_stop:
 	ath10k_ce_disable_interrupts(ar);
 	ath10k_pci_free_irq(ar);
 	ath10k_pci_kill_tasklet(ar);
-	ath10k_pci_stop_ce(ar);
 	ath10k_pci_process_ce(ar);
 err_free_compl:
 	ath10k_pci_cleanup_ce(ar);
@@ -1424,7 +1406,6 @@ static void ath10k_pci_tx_pipe_cleanup(struct ath10k_pci_pipe *pipe_info)
 			continue;
 		}
 
-		ATH10K_SKB_CB(netbuf)->is_aborted = true;
 		ar_pci->msg_callbacks_current.tx_completion(ar,
 							    netbuf,
 							    id);
@@ -1482,7 +1463,6 @@ static void ath10k_pci_hif_stop(struct ath10k *ar)
 
 	ath10k_pci_free_irq(ar);
 	ath10k_pci_kill_tasklet(ar);
-	ath10k_pci_stop_ce(ar);
 
 	ret = ath10k_pci_request_early_irq(ar);
 	if (ret)
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
