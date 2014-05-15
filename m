Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22f.google.com ([2a00:1450:4013:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkvD4-0002Ow-Pj
 for ath10k@lists.infradead.org; Thu, 15 May 2014 12:56:31 +0000
Received: by mail-ee0-f47.google.com with SMTP id c13so639193eek.34
 for <ath10k@lists.infradead.org>; Thu, 15 May 2014 05:56:07 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/3] ath10k: protect src_ring state with ce_lock in tx_sg()
Date: Thu, 15 May 2014 14:48:57 +0200
Message-Id: <1400158139-13836-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1400158139-13836-1-git-send-email-michal.kazior@tieto.com>
References: <1400158139-13836-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, apenwarr@gmail.com

It was possible to read invalid state of CE ring
buffer indexes. This could lead to scatter-gather
transfer failure in mid-way and crash firmware
later by leaving garbage data on the ring.

Reported-By: Avery Pennarun <apenwarr@gmail.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 91d6076..04d8cbf 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -762,13 +762,17 @@ static int ath10k_pci_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
 	struct ath10k_pci_pipe *pci_pipe = &ar_pci->pipe_info[pipe_id];
 	struct ath10k_ce_pipe *ce_pipe = pci_pipe->ce_hdl;
 	struct ath10k_ce_ring *src_ring = ce_pipe->src_ring;
-	unsigned int nentries_mask = src_ring->nentries_mask;
-	unsigned int sw_index = src_ring->sw_index;
-	unsigned int write_index = src_ring->write_index;
+	unsigned int nentries_mask;
+	unsigned int sw_index;
+	unsigned int write_index;
 	int err, i;
 
 	spin_lock_bh(&ar_pci->ce_lock);
 
+	nentries_mask = src_ring->nentries_mask;
+	sw_index = src_ring->sw_index;
+	write_index = src_ring->write_index;
+
 	if (unlikely(CE_RING_DELTA(nentries_mask,
 				   write_index, sw_index - 1) < n_items)) {
 		err = -ENOBUFS;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
