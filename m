Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7Acw-0001jr-Hr
 for ath10k@lists.infradead.org; Fri, 22 Mar 2019 03:13:53 +0000
Date: Fri, 22 Mar 2019 08:05:33 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH ath6kl] ath11k: ath11k_dp_rx_alloc_mon_status_buf can be
 static
Message-ID: <20190322000533.GA116000@lkp-hsx03>
References: <201903220804.WHevvYHk%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201903220804.WHevvYHk%lkp@intel.com>
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org


Fixes: ecee39218556 ("ath11k: initialise monitor status ring")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 dp_rx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 19771dd..8511cac 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2013,7 +2013,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
 	return num_buffs_reaped;
 }
 
-struct sk_buff *
+static struct sk_buff *
 ath11k_dp_rx_alloc_mon_status_buf(struct ath11k_base *ab,
 				  struct dp_rxdma_ring *rx_ring,
 				  int *buf_id, gfp_t gfp)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
