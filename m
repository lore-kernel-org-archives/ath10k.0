Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6b8N-00057J-Mi
 for ath10k@lists.infradead.org; Thu, 12 Apr 2018 12:15:25 +0000
From: mpubbise@qti.qualcomm.com
Subject: [PATCH] ath10k: correct target assert problem due to CE5 stuck
Date: Thu, 12 Apr 2018 17:44:59 +0530
Message-Id: <1523535299-29282-1-git-send-email-mpubbise@qti.qualcomm.com>
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
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>, linux-wireless@vger.kernel.org

From: Manikanta Pubbisetty <mpubbise@codeaurora.org>

Correct a minor bug in the commit 0628467f97b5 ("ath10k: fix
copy engine 5 destination ring stuck") which introduced a change to fix
firmware assert that happens when ring indices of copy engine 5 are stuck
for a specific duration, problem with this fix is that it did not use
ring arithmatic. As a result,firmware asserts did not go away entirely
athough the frequency of occurrence has reduced. Using ring arithmatic
to fix the issue.

Tested on QCA9984(fw version-10.4-3.4-00082).

Fixes: 0628467f97b5 ("ath10k: fix copy engine 5 destination ring stuck)
Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/ce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index b9def7b..6efa69e 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -615,7 +615,7 @@ void ath10k_ce_rx_update_write_idx(struct ath10k_ce_pipe *pipe, u32 nentries)
 	/* Prevent CE ring stuck issue that will occur when ring is full.
 	 * Make sure that write index is 1 less than read index.
 	 */
-	if ((cur_write_idx + nentries)  == dest_ring->sw_index)
+	if (((cur_write_idx + nentries) & nentries_mask) == dest_ring->sw_index)
 		nentries -= 1;
 
 	write_index = CE_RING_IDX_ADD(nentries_mask, write_index, nentries);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
