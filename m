Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbH17-0007za-Jz
 for ath10k@lists.infradead.org; Tue, 29 Oct 2013 21:40:02 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  Fix crash due to tasklet race.
Date: Tue, 29 Oct 2013 14:38:57 -0700
Message-Id: <1383082737-20728-1-git-send-email-greearb@candelatech.com>
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
Cc: kvalo@qca.qualcomm.com, Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

The tasklet can run after the rings have been cleaned up,
so check for NULL before de-referencing the ring.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/ce.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index d243f28..dfcfda9 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -547,12 +547,18 @@ static int ath10k_ce_completed_send_next_nolock(struct ath10k_ce_pipe *ce_state,
 	struct ath10k_ce_ring *src_ring = ce_state->src_ring;
 	u32 ctrl_addr = ce_state->ctrl_addr;
 	struct ath10k *ar = ce_state->ar;
-	unsigned int nentries_mask = src_ring->nentries_mask;
-	unsigned int sw_index = src_ring->sw_index;
+	unsigned int nentries_mask;
+	unsigned int sw_index;
 	struct ce_desc *sdesc, *sbase;
 	unsigned int read_index;
 	int ret;
 
+	if (!src_ring)
+		return -EIO;
+
+	nentries_mask = src_ring->nentries_mask;
+	sw_index = src_ring->sw_index;
+
 	if (src_ring->hw_index == sw_index) {
 		/*
 		 * The SW completion index has caught up with the cached
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
