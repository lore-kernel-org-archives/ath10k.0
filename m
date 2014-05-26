Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22b.google.com ([2a00:1450:400c:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Worrd-0004Is-Sq
 for ath10k@lists.infradead.org; Mon, 26 May 2014 10:10:42 +0000
Received: by mail-we0-f171.google.com with SMTP id w62so7720551wes.2
 for <ath10k@lists.infradead.org>; Mon, 26 May 2014 03:10:19 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 1/2] ath10k: protect src_ring state with ce_lock in tx_sg()
Date: Mon, 26 May 2014 12:02:58 +0200
Message-Id: <1401098579-31842-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1401098579-31842-1-git-send-email-michal.kazior@tieto.com>
References: <1400158139-13836-1-git-send-email-michal.kazior@tieto.com>
 <1401098579-31842-1-git-send-email-michal.kazior@tieto.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, apenwarr@gmail.com

It was possible to read invalid state of CE ring
buffer indexes. This could lead to scatter-gather
transfer failure in mid-way and crash firmware
later by leaving garbage data on the ring.

Reported-By: Avery Pennarun <apenwarr@gmail.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 71ab110..b1eb915 100644
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
