Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEHA4-0008NS-Nb
 for ath10k@lists.infradead.org; Tue, 27 Aug 2013 11:10:14 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 1/6] ath10k: use inline ce_state structure
Date: Tue, 27 Aug 2013 13:07:58 +0200
Message-ID: <1377601683-12072-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1377601683-12072-1-git-send-email-michal.kazior@tieto.com>
References: <1377068249-26025-1-git-send-email-michal.kazior@tieto.com>
 <1377601683-12072-1-git-send-email-michal.kazior@tieto.com>
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

Simplifies memory managament of ce_state.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/ce.c  |   37 ++++++++++++---------------------
 drivers/net/wireless/ath/ath10k/pci.h |    5 ++++-
 2 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 1a702e1..c8b7d21 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -727,7 +727,7 @@ int ath10k_ce_completed_send_next(struct ce_state *ce_state,
 void ath10k_ce_per_engine_service(struct ath10k *ar, unsigned int ce_id)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
-	struct ce_state *ce_state = ar_pci->ce_id_to_state[ce_id];
+	struct ce_state *ce_state = &ar_pci->ce_states[ce_id];
 	u32 ctrl_addr = ce_state->ctrl_addr;
 	void *transfer_context;
 	u32 buf;
@@ -846,7 +846,7 @@ void ath10k_ce_disable_interrupts(struct ath10k *ar)
 
 	ath10k_pci_wake(ar);
 	for (ce_id = 0; ce_id < ar_pci->ce_count; ce_id++) {
-		struct ce_state *ce_state = ar_pci->ce_id_to_state[ce_id];
+		struct ce_state *ce_state = &ar_pci->ce_states[ce_id];
 		u32 ctrl_addr = ce_state->ctrl_addr;
 
 		ath10k_ce_copy_complete_intr_disable(ar, ctrl_addr);
@@ -1081,27 +1081,17 @@ static struct ce_state *ath10k_ce_init_state(struct ath10k *ar,
 					     const struct ce_attr *attr)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
-	struct ce_state *ce_state = NULL;
+	struct ce_state *ce_state = &ar_pci->ce_states[ce_id];
 	u32 ctrl_addr = ath10k_ce_base_address(ce_id);
 
 	spin_lock_bh(&ar_pci->ce_lock);
 
-	if (!ar_pci->ce_id_to_state[ce_id]) {
-		ce_state = kzalloc(sizeof(*ce_state), GFP_ATOMIC);
-		if (ce_state == NULL) {
-			spin_unlock_bh(&ar_pci->ce_lock);
-			return NULL;
-		}
-
-		ar_pci->ce_id_to_state[ce_id] = ce_state;
-		ce_state->ar = ar;
-		ce_state->id = ce_id;
-		ce_state->ctrl_addr = ctrl_addr;
-		ce_state->state = CE_RUNNING;
-		/* Save attribute flags */
-		ce_state->attr_flags = attr->flags;
-		ce_state->src_sz_max = attr->src_sz_max;
-	}
+	ce_state->ar = ar;
+	ce_state->id = ce_id;
+	ce_state->ctrl_addr = ctrl_addr;
+	ce_state->state = CE_RUNNING;
+	ce_state->attr_flags = attr->flags;
+	ce_state->src_sz_max = attr->src_sz_max;
 
 	spin_unlock_bh(&ar_pci->ce_lock);
 
@@ -1159,13 +1149,9 @@ struct ce_state *ath10k_ce_init(struct ath10k *ar,
 
 void ath10k_ce_deinit(struct ce_state *ce_state)
 {
-	unsigned int ce_id = ce_state->id;
 	struct ath10k *ar = ce_state->ar;
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 
-	ce_state->state = CE_UNUSED;
-	ar_pci->ce_id_to_state[ce_id] = NULL;
-
 	if (ce_state->src_ring) {
 		kfree(ce_state->src_ring->shadow_base_unaligned);
 		pci_free_consistent(ar_pci->pdev,
@@ -1186,5 +1172,8 @@ void ath10k_ce_deinit(struct ce_state *ce_state)
 				    ce_state->dest_ring->base_addr_ce_space);
 		kfree(ce_state->dest_ring);
 	}
-	kfree(ce_state);
+
+	ce_state->state = CE_UNUSED;
+	ce_state->src_ring = NULL;
+	ce_state->dest_ring = NULL;
 }
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 153ae28..64fcef5 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -233,7 +233,10 @@ struct ath10k_pci {
 	spinlock_t ce_lock;
 
 	/* Map CE id to ce_state */
-	struct ce_state *ce_id_to_state[CE_COUNT_MAX];
+	struct ce_state ce_states[CE_COUNT_MAX];
+
+	/* makes sure that dummy reads are atomic */
+	spinlock_t hw_v1_workaround_lock;
 };
 
 static inline struct ath10k_pci *ath10k_pci_priv(struct ath10k *ar)
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
