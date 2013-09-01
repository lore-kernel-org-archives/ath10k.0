Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh07.mail.saunalahti.fi ([62.142.5.117])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VG1gC-0007gP-UM
 for ath10k@lists.infradead.org; Sun, 01 Sep 2013 07:02:48 +0000
Subject: [PATCH v2 7/7] ath10k: simplify ath10k_ce_init() wake up handling
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Sun, 01 Sep 2013 10:02:15 +0300
Message-ID: <20130901070215.14695.22473.stgit@localhost6.localdomain6>
In-Reply-To: <20130901070020.14695.16694.stgit@localhost6.localdomain6>
References: <20130901070020.14695.16694.stgit@localhost6.localdomain6>
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
Cc: linux-wireless@vger.kernel.org

ath10k_ce_init() and the functions it calls wakeup
the chip multiple times. Simplify that to call
ath10k_pci_wake() only once. This also makes it
easier to add error handling when wakeup fails.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/ce.c |   14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 19f23a2..afe5df4 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -946,7 +946,6 @@ static int ath10k_ce_init_src_ring(struct ath10k *ar,
 	src_ring->nentries = nentries;
 	src_ring->nentries_mask = nentries - 1;
 
-	ath10k_pci_wake(ar);
 	src_ring->sw_index = ath10k_ce_src_ring_read_index_get(ar, ctrl_addr);
 	src_ring->sw_index &= src_ring->nentries_mask;
 	src_ring->hw_index = src_ring->sw_index;
@@ -954,7 +953,6 @@ static int ath10k_ce_init_src_ring(struct ath10k *ar,
 	src_ring->write_index =
 		ath10k_ce_src_ring_write_index_get(ar, ctrl_addr);
 	src_ring->write_index &= src_ring->nentries_mask;
-	ath10k_pci_sleep(ar);
 
 	src_ring->per_transfer_context = (void **)ptr;
 
@@ -1004,7 +1002,6 @@ static int ath10k_ce_init_src_ring(struct ath10k *ar,
 			src_ring->shadow_base_unaligned,
 			CE_DESC_RING_ALIGN);
 
-	ath10k_pci_wake(ar);
 	ath10k_ce_src_ring_base_addr_set(ar, ctrl_addr,
 					 src_ring->base_addr_ce_space);
 	ath10k_ce_src_ring_size_set(ar, ctrl_addr, nentries);
@@ -1012,7 +1009,6 @@ static int ath10k_ce_init_src_ring(struct ath10k *ar,
 	ath10k_ce_src_ring_byte_swap_set(ar, ctrl_addr, 0);
 	ath10k_ce_src_ring_lowmark_set(ar, ctrl_addr, 0);
 	ath10k_ce_src_ring_highmark_set(ar, ctrl_addr, nentries);
-	ath10k_pci_sleep(ar);
 
 	return 0;
 }
@@ -1049,13 +1045,11 @@ static int ath10k_ce_init_dest_ring(struct ath10k *ar,
 	dest_ring->nentries = nentries;
 	dest_ring->nentries_mask = nentries - 1;
 
-	ath10k_pci_wake(ar);
 	dest_ring->sw_index = ath10k_ce_dest_ring_read_index_get(ar, ctrl_addr);
 	dest_ring->sw_index &= dest_ring->nentries_mask;
 	dest_ring->write_index =
 		ath10k_ce_dest_ring_write_index_get(ar, ctrl_addr);
 	dest_ring->write_index &= dest_ring->nentries_mask;
-	ath10k_pci_sleep(ar);
 
 	dest_ring->per_transfer_context = (void **)ptr;
 
@@ -1090,14 +1084,12 @@ static int ath10k_ce_init_dest_ring(struct ath10k *ar,
 			dest_ring->base_addr_ce_space_unaligned,
 			CE_DESC_RING_ALIGN);
 
-	ath10k_pci_wake(ar);
 	ath10k_ce_dest_ring_base_addr_set(ar, ctrl_addr,
 					  dest_ring->base_addr_ce_space);
 	ath10k_ce_dest_ring_size_set(ar, ctrl_addr, nentries);
 	ath10k_ce_dest_ring_byte_swap_set(ar, ctrl_addr, 0);
 	ath10k_ce_dest_ring_lowmark_set(ar, ctrl_addr, 0);
 	ath10k_ce_dest_ring_highmark_set(ar, ctrl_addr, nentries);
-	ath10k_pci_sleep(ar);
 
 	return 0;
 }
@@ -1138,6 +1130,10 @@ struct ath10k_ce_pipe *ath10k_ce_init(struct ath10k *ar,
 	u32 ctrl_addr = ath10k_ce_base_address(ce_id);
 	int ret;
 
+	ret = ath10k_pci_wake(ar);
+	if (ret)
+		return NULL;
+
 	ce_state = ath10k_ce_init_state(ar, ce_id, attr);
 	if (!ce_state) {
 		ath10k_err("Failed to initialize CE state for ID: %d\n", ce_id);
@@ -1165,8 +1161,8 @@ struct ath10k_ce_pipe *ath10k_ce_init(struct ath10k *ar,
 	}
 
 	/* Enable CE error interrupts */
-	ath10k_pci_wake(ar);
 	ath10k_ce_error_intr_enable(ar, ctrl_addr);
+
 	ath10k_pci_sleep(ar);
 
 	return ce_state;


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
