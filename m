Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEHA4-0008NT-40
 for ath10k@lists.infradead.org; Tue, 27 Aug 2013 11:10:13 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 2/6] ath10k: remove ce_op_state
Date: Tue, 27 Aug 2013 13:07:59 +0200
Message-ID: <1377601683-12072-3-git-send-email-michal.kazior@tieto.com>
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

It was only written to and never read back. No use
to keep it around.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/ce.c |    2 --
 drivers/net/wireless/ath/ath10k/ce.h |    8 --------
 2 files changed, 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index c8b7d21..c391f46 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1089,7 +1089,6 @@ static struct ce_state *ath10k_ce_init_state(struct ath10k *ar,
 	ce_state->ar = ar;
 	ce_state->id = ce_id;
 	ce_state->ctrl_addr = ctrl_addr;
-	ce_state->state = CE_RUNNING;
 	ce_state->attr_flags = attr->flags;
 	ce_state->src_sz_max = attr->src_sz_max;
 
@@ -1173,7 +1172,6 @@ void ath10k_ce_deinit(struct ce_state *ce_state)
 		kfree(ce_state->dest_ring);
 	}
 
-	ce_state->state = CE_UNUSED;
 	ce_state->src_ring = NULL;
 	ce_state->dest_ring = NULL;
 }
diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index c17f07c..6f6bca0 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -39,13 +39,6 @@
 struct ce_state;
 
 
-/* Copy Engine operational state */
-enum ce_op_state {
-	CE_UNUSED,
-	CE_PAUSED,
-	CE_RUNNING,
-};
-
 #define CE_DESC_FLAGS_GATHER         (1 << 0)
 #define CE_DESC_FLAGS_BYTE_SWAP      (1 << 1)
 #define CE_DESC_FLAGS_META_DATA_MASK 0xFFFC
@@ -124,7 +117,6 @@ struct ce_state {
 	unsigned int attr_flags;
 
 	u32 ctrl_addr;
-	enum ce_op_state state;
 
 	void (*send_cb) (struct ce_state *ce_state,
 			 void *per_transfer_send_context,
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
