Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Worrf-0004J6-CF
 for ath10k@lists.infradead.org; Mon, 26 May 2014 10:10:44 +0000
Received: by mail-wi0-f173.google.com with SMTP id bs8so3979480wib.12
 for <ath10k@lists.infradead.org>; Mon, 26 May 2014 03:10:21 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 2/2] ath10k: abort incomplete scatter-gather pci tx properly
Date: Mon, 26 May 2014 12:02:59 +0200
Message-Id: <1401098579-31842-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1401098579-31842-1-git-send-email-michal.kazior@tieto.com>
References: <1400158139-13836-1-git-send-email-michal.kazior@tieto.com>
 <1401098579-31842-1-git-send-email-michal.kazior@tieto.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, apenwarr@gmail.com

This prevents leaving incomplete scatter-gather
transfer on CE rings which can lead firmware to
crash.

Reported-By: Avery Pennarun <apenwarr@gmail.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---

Notes:
    v2:
     * send_revert(): s/WARN_ON/WARN_ON_ONCE/ [Kalle]
     * commit subject: s/revert/abort/, s/$/properly/ [Kalle]

 drivers/net/wireless/ath/ath10k/ce.c  | 27 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/ce.h  |  2 ++
 drivers/net/wireless/ath/ath10k/pci.c | 17 +++++++++++------
 3 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 1e4cad8..d185dc0 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -329,6 +329,33 @@ exit:
 	return ret;
 }
 
+void __ath10k_ce_send_revert(struct ath10k_ce_pipe *pipe)
+{
+	struct ath10k *ar = pipe->ar;
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+	struct ath10k_ce_ring *src_ring = pipe->src_ring;
+	u32 ctrl_addr = pipe->ctrl_addr;
+
+	lockdep_assert_held(&ar_pci->ce_lock);
+
+	/*
+	 * This function must be called only if there is an incomplete
+	 * scatter-gather transfer (before index register is updated)
+	 * that needs to be cleaned up.
+	 */
+	if (WARN_ON_ONCE(src_ring->write_index == src_ring->sw_index))
+		return;
+
+	if (WARN_ON_ONCE(src_ring->write_index ==
+			 ath10k_ce_src_ring_write_index_get(ar, ctrl_addr)))
+		return;
+
+	src_ring->write_index--;
+	src_ring->write_index &= src_ring->nentries_mask;
+
+	src_ring->per_transfer_context[src_ring->write_index] = NULL;
+}
+
 int ath10k_ce_send(struct ath10k_ce_pipe *ce_state,
 		   void *per_transfer_context,
 		   u32 buffer,
diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index fd0bc35..7a5a36f 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -160,6 +160,8 @@ int ath10k_ce_send_nolock(struct ath10k_ce_pipe *ce_state,
 			  unsigned int transfer_id,
 			  unsigned int flags);
 
+void __ath10k_ce_send_revert(struct ath10k_ce_pipe *pipe);
+
 void ath10k_ce_send_cb_register(struct ath10k_ce_pipe *ce_state,
 				void (*send_cb)(struct ath10k_ce_pipe *),
 				int disable_interrupts);
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index b1eb915..d0004d5 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -765,7 +765,7 @@ static int ath10k_pci_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
 	unsigned int nentries_mask;
 	unsigned int sw_index;
 	unsigned int write_index;
-	int err, i;
+	int err, i = 0;
 
 	spin_lock_bh(&ar_pci->ce_lock);
 
@@ -776,7 +776,7 @@ static int ath10k_pci_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
 	if (unlikely(CE_RING_DELTA(nentries_mask,
 				   write_index, sw_index - 1) < n_items)) {
 		err = -ENOBUFS;
-		goto unlock;
+		goto err;
 	}
 
 	for (i = 0; i < n_items - 1; i++) {
@@ -793,7 +793,7 @@ static int ath10k_pci_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
 					    items[i].transfer_id,
 					    CE_SEND_FLAG_GATHER);
 		if (err)
-			goto unlock;
+			goto err;
 	}
 
 	/* `i` is equal to `n_items -1` after for() */
@@ -811,10 +811,15 @@ static int ath10k_pci_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
 				    items[i].transfer_id,
 				    0);
 	if (err)
-		goto unlock;
+		goto err;
+
+	spin_unlock_bh(&ar_pci->ce_lock);
+	return 0;
+
+err:
+	for (; i > 0; i--)
+		__ath10k_ce_send_revert(ce_pipe);
 
-	err = 0;
-unlock:
 	spin_unlock_bh(&ar_pci->ce_lock);
 	return err;
 }
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
