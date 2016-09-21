Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmfEq-0006yY-Vn
 for ath10k@lists.infradead.org; Wed, 21 Sep 2016 10:58:54 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH] ath10k: fix copy engine 5 destination ring stuck
Date: Wed, 21 Sep 2016 16:28:06 +0530
Message-ID: <20160921105806.23980-1-rmanohar@qti.qualcomm.com>
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
Cc: stable@vger.kernel.org, linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, rmanohar@codeaurora.org

Firmware is running watchdog timer for tracking copy engine ring index
and write index. Whenever both indices are stuck at same location for
given duration, watchdog will be trigger to assert target. While
updating copy engine destination ring write index, driver ensures that
write index will not be same as read index by finding delta between these
two indices (CE_RING_DELTA).

HTT target to host copy engine (CE5) is special case where ring buffers
will be reused and delta check is not applied while updating write index.
In rare scenario, whenever CE5 ring is full, both indices will be referring
same location and this is causing CE ring stuck issue as explained
above. This issue is originally reported on IPQ4019 during long hour stress
testing and during veriwave max clients testsuites. The same issue is
also observed in other chips as well. Fix this by ensuring that write
index is one less than read index which means that full ring is
available for receiving data.

Cc: stable@vger.kernel.org
Tested-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/ce.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 65d8d714e917..00d3f93058db 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -433,6 +433,13 @@ void ath10k_ce_rx_update_write_idx(struct ath10k_ce_pipe *pipe, u32 nentries)
 	unsigned int nentries_mask = dest_ring->nentries_mask;
 	unsigned int write_index = dest_ring->write_index;
 	u32 ctrl_addr = pipe->ctrl_addr;
+	u32 cur_write_idx = ath10k_ce_dest_ring_write_index_get(ar, ctrl_addr);
+
+	/* Prevent CE ring stuck issue that will occur when ring is full.
+	 * Make sure that write index is 1 less than read index.
+	 */
+	if ((cur_write_idx + nentries)  == dest_ring->sw_index)
+		nentries -= 1;
 
 	write_index = CE_RING_IDX_ADD(nentries_mask, write_index, nentries);
 	ath10k_ce_dest_ring_write_index_set(ar, ctrl_addr, write_index);
-- 
2.10.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
