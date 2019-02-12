Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtRQn-00007r-S4
 for ath10k@lists.infradead.org; Tue, 12 Feb 2019 06:20:41 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] ath10k: Fix descriptor size in ce tx completion for WCN3990
Date: Tue, 12 Feb 2019 11:50:23 +0530
Message-Id: <1549952423-25096-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org

When the driver receives the tx completion of the
descriptor over ce, it clears the nbytes configured
for that particular descriptor. WCN3990 uses ce
descriptors with 64-bit address.

Currently during handling the tx completion of the
descriptors, the nbytes are accessed from the descriptors
using ce_desc for 32-bit targets. This will lead to clearing
of memory at incorrect offset if DMA MASK is set to greater
than 32 bits.

Attach different ce tx copy completed handler for targets
using address above 32-bit address.

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/ce.c | 64 +++++++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/ce.h |  2 ++
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 8b4a910..0c6d0ae 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1077,7 +1077,7 @@ EXPORT_SYMBOL(ath10k_ce_revoke_recv_next);
  * Guts of ath10k_ce_completed_send_next.
  * The caller takes responsibility for any necessary locking.
  */
-int ath10k_ce_completed_send_next_nolock(struct ath10k_ce_pipe *ce_state,
+static int _ath10k_ce_completed_send_next_nolock(struct ath10k_ce_pipe *ce_state,
 					 void **per_transfer_contextp)
 {
 	struct ath10k_ce_ring *src_ring = ce_state->src_ring;
@@ -1129,6 +1129,66 @@ int ath10k_ce_completed_send_next_nolock(struct ath10k_ce_pipe *ce_state,
 
 	return 0;
 }
+
+static int _ath10k_ce_completed_send_next_nolock_64(struct ath10k_ce_pipe *ce_state,
+					 void **per_transfer_contextp)
+{
+	struct ath10k_ce_ring *src_ring = ce_state->src_ring;
+	u32 ctrl_addr = ce_state->ctrl_addr;
+	struct ath10k *ar = ce_state->ar;
+	unsigned int nentries_mask = src_ring->nentries_mask;
+	unsigned int sw_index = src_ring->sw_index;
+	unsigned int read_index;
+	struct ce_desc_64 *desc;
+
+	if (src_ring->hw_index == sw_index) {
+		/*
+		 * The SW completion index has caught up with the cached
+		 * version of the HW completion index.
+		 * Update the cached HW completion index to see whether
+		 * the SW has really caught up to the HW, or if the cached
+		 * value of the HW index has become stale.
+		 */
+
+		read_index = ath10k_ce_src_ring_read_index_get(ar, ctrl_addr);
+		if (read_index == 0xffffffff)
+			return -ENODEV;
+
+		read_index &= nentries_mask;
+		src_ring->hw_index = read_index;
+	}
+
+	if (ar->hw_params.rri_on_ddr)
+		read_index = ath10k_ce_src_ring_read_index_get(ar, ctrl_addr);
+	else
+		read_index = src_ring->hw_index;
+
+	if (read_index == sw_index)
+		return -EIO;
+
+	if (per_transfer_contextp)
+		*per_transfer_contextp =
+			src_ring->per_transfer_context[sw_index];
+
+	/* sanity */
+	src_ring->per_transfer_context[sw_index] = NULL;
+	desc = CE_SRC_RING_TO_DESC_64(src_ring->base_addr_owner_space,
+				   sw_index);
+	desc->nbytes = 0;
+
+	/* Update sw_index */
+	sw_index = CE_RING_IDX_INCR(nentries_mask, sw_index);
+	src_ring->sw_index = sw_index;
+
+	return 0;
+}
+
+int ath10k_ce_completed_send_next_nolock(struct ath10k_ce_pipe *ce_state,
+					 void **per_transfer_contextp)
+{
+	return ce_state->ops->ce_completed_send_next_nolock(ce_state,
+							    per_transfer_contextp);
+}
 EXPORT_SYMBOL(ath10k_ce_completed_send_next_nolock);
 
 static void ath10k_ce_extract_desc_data(struct ath10k *ar,
@@ -1849,6 +1909,7 @@ static const struct ath10k_ce_ops ce_ops = {
 	.ce_send_nolock = _ath10k_ce_send_nolock,
 	.ce_set_src_ring_base_addr_hi = NULL,
 	.ce_set_dest_ring_base_addr_hi = NULL,
+	.ce_completed_send_next_nolock = _ath10k_ce_completed_send_next_nolock,
 };
 
 static const struct ath10k_ce_ops ce_64_ops = {
@@ -1863,6 +1924,7 @@ static const struct ath10k_ce_ops ce_64_ops = {
 	.ce_send_nolock = _ath10k_ce_send_nolock_64,
 	.ce_set_src_ring_base_addr_hi = ath10k_ce_set_src_ring_base_addr_hi,
 	.ce_set_dest_ring_base_addr_hi = ath10k_ce_set_dest_ring_base_addr_hi,
+	.ce_completed_send_next_nolock = _ath10k_ce_completed_send_next_nolock_64,
 };
 
 static void ath10k_ce_set_ops(struct ath10k *ar,
diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index c44a52e..dffb8a0 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -340,6 +340,8 @@ struct ath10k_ce_ops {
 	void (*ce_set_dest_ring_base_addr_hi)(struct ath10k *ar,
 					      u32 ce_ctrl_addr,
 					      u64 addr);
+	int (*ce_completed_send_next_nolock)(struct ath10k_ce_pipe *ce_state,
+					     void **per_transfer_contextp);
 };
 
 static inline u32 ath10k_ce_base_address(struct ath10k *ar, unsigned int ce_id)
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
