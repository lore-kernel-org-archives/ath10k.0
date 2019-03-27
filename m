Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9D3U-0002qH-01
 for ath10k@lists.infradead.org; Wed, 27 Mar 2019 18:13:51 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 110/192] ath10k: fix shadow register
 implementation for WCN3990
Date: Wed, 27 Mar 2019 14:09:02 -0400
Message-Id: <20190327181025.13507-110-sashal@kernel.org>
In-Reply-To: <20190327181025.13507-1-sashal@kernel.org>
References: <20190327181025.13507-1-sashal@kernel.org>
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
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Rakesh Pillai <pillair@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>

From: Rakesh Pillai <pillair@codeaurora.org>

[ Upstream commit 1863008369ae0407508033b4b00f98b985adeb15 ]

WCN3990 supports shadow registers write operation support
for copy engine for regular operation in powersave mode.

Since WCN3990 is a 64-bit target, the shadow register
implementation needs to be done in the copy engine handlers
for 64-bit target. Currently the shadow register implementation
is present in the 32-bit target handlers of copy engine.

Fix the shadow register copy engine write operation
implementation for 64-bit target(WCN3990).

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1

Fixes: b7ba83f7c414 ("ath10k: add support for shadow register for WNC3990")
Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/ce.c | 26 +++++++++++++-------------
 drivers/net/wireless/ath/ath10k/ce.h |  2 +-
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 18c709c484e7..f761d651c16e 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -500,14 +500,8 @@ static int _ath10k_ce_send_nolock(struct ath10k_ce_pipe *ce_state,
 	write_index = CE_RING_IDX_INCR(nentries_mask, write_index);
 
 	/* WORKAROUND */
-	if (!(flags & CE_SEND_FLAG_GATHER)) {
-		if (ar->hw_params.shadow_reg_support)
-			ath10k_ce_shadow_src_ring_write_index_set(ar, ce_state,
-								  write_index);
-		else
-			ath10k_ce_src_ring_write_index_set(ar, ctrl_addr,
-							   write_index);
-	}
+	if (!(flags & CE_SEND_FLAG_GATHER))
+		ath10k_ce_src_ring_write_index_set(ar, ctrl_addr, write_index);
 
 	src_ring->write_index = write_index;
 exit:
@@ -581,8 +575,14 @@ static int _ath10k_ce_send_nolock_64(struct ath10k_ce_pipe *ce_state,
 	/* Update Source Ring Write Index */
 	write_index = CE_RING_IDX_INCR(nentries_mask, write_index);
 
-	if (!(flags & CE_SEND_FLAG_GATHER))
-		ath10k_ce_src_ring_write_index_set(ar, ctrl_addr, write_index);
+	if (!(flags & CE_SEND_FLAG_GATHER)) {
+		if (ar->hw_params.shadow_reg_support)
+			ath10k_ce_shadow_src_ring_write_index_set(ar, ce_state,
+								  write_index);
+		else
+			ath10k_ce_src_ring_write_index_set(ar, ctrl_addr,
+							   write_index);
+	}
 
 	src_ring->write_index = write_index;
 exit:
@@ -1394,12 +1394,12 @@ static int ath10k_ce_alloc_shadow_base(struct ath10k *ar,
 				       u32 nentries)
 {
 	src_ring->shadow_base_unaligned = kcalloc(nentries,
-						  sizeof(struct ce_desc),
+						  sizeof(struct ce_desc_64),
 						  GFP_KERNEL);
 	if (!src_ring->shadow_base_unaligned)
 		return -ENOMEM;
 
-	src_ring->shadow_base = (struct ce_desc *)
+	src_ring->shadow_base = (struct ce_desc_64 *)
 			PTR_ALIGN(src_ring->shadow_base_unaligned,
 				  CE_DESC_RING_ALIGN);
 	return 0;
@@ -1453,7 +1453,7 @@ ath10k_ce_alloc_src_ring(struct ath10k *ar, unsigned int ce_id,
 		ret = ath10k_ce_alloc_shadow_base(ar, src_ring, nentries);
 		if (ret) {
 			dma_free_coherent(ar->dev,
-					  (nentries * sizeof(struct ce_desc) +
+					  (nentries * sizeof(struct ce_desc_64) +
 					   CE_DESC_RING_ALIGN),
 					  src_ring->base_addr_owner_space_unaligned,
 					  base_addr);
diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index b8fb5382dede..8088f7a66426 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -118,7 +118,7 @@ struct ath10k_ce_ring {
 	u32 base_addr_ce_space;
 
 	char *shadow_base_unaligned;
-	struct ce_desc *shadow_base;
+	struct ce_desc_64 *shadow_base;
 
 	/* keep last */
 	void *per_transfer_context[0];
-- 
2.19.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
