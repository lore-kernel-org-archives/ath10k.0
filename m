Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9dHv-0001P7-6l
 for ath10k@lists.infradead.org; Fri, 09 Jan 2015 17:23:55 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH RESEND] ath10k: Fix potential Rx ring corruption
Date: Fri, 9 Jan 2015 22:49:46 +0530
Message-ID: <1420823986-29503-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

When replenishing Rx buffers driver updates the address of the
buffer and the index of rx buffer in rx ring to the firmware.
Change in order by CPU can cause rx ring corruption. Add memory
barrier before updating rx buffer index to guarantee the order.

This could fix some instances of rx ring corruption due to done
bit in rx attention flag not set.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 9c782a4..baa1c44 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -97,6 +97,11 @@ static int __ath10k_htt_rx_ring_fill_n(struct ath10k_htt *htt, int num)
 	}
 
 fail:
+	/*
+	 * Make sure the rx buffer is updated before available buffer
+	 * index to avoid any potential rx ring corruption.
+	 */
+	mb();
 	*htt->rx_ring.alloc_idx.vaddr = __cpu_to_le32(idx);
 	return ret;
 }
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
