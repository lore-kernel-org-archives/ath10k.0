Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4SC6-0007fS-Ky
 for ath10k@lists.infradead.org; Wed, 31 Jul 2013 08:55:45 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/5] ath10k: prevent using invalid ringbuffer indexes
Date: Wed, 31 Jul 2013 10:55:11 +0200
Message-ID: <1375260915-22500-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1375260915-22500-1-git-send-email-michal.kazior@tieto.com>
References: <1375260915-22500-1-git-send-email-michal.kazior@tieto.com>
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

If the device is removed and hotplug fails
ioread32() will return 0xFFFFFFFF. In that case
reading ringbuffer during device bringup led to
out-of-bounds addressing of a ringbuffer array
that in turn led to a paging failure.

This could be reproduced by the following:
 * boot without acpi/prevent hotplug from working
 * insert and manually detect (pci rescan) the device
 * remove the device physically
 * load ath10k driver
 * kernel crashed

Ringbuffer index reading is now protected by using
an appropriate mask to prevent addressing an
invalid array index.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/ce.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index b407929..f8b969f 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -637,6 +637,7 @@ static int ath10k_ce_completed_send_next_nolock(struct ce_state *ce_state,
 		ath10k_pci_wake(ar);
 		src_ring->hw_index =
 			ath10k_ce_src_ring_read_index_get(ar, ctrl_addr);
+		src_ring->hw_index &= nentries_mask;
 		ath10k_pci_sleep(ar);
 	}
 	read_index = src_ring->hw_index;
@@ -950,10 +951,12 @@ static int ath10k_ce_init_src_ring(struct ath10k *ar,
 
 	ath10k_pci_wake(ar);
 	src_ring->sw_index = ath10k_ce_src_ring_read_index_get(ar, ctrl_addr);
+	src_ring->sw_index &= src_ring->nentries_mask;
 	src_ring->hw_index = src_ring->sw_index;
 
 	src_ring->write_index =
 		ath10k_ce_src_ring_write_index_get(ar, ctrl_addr);
+	src_ring->write_index &= src_ring->nentries_mask;
 	ath10k_pci_sleep(ar);
 
 	src_ring->per_transfer_context = (void **)ptr;
@@ -1035,8 +1038,10 @@ static int ath10k_ce_init_dest_ring(struct ath10k *ar,
 
 	ath10k_pci_wake(ar);
 	dest_ring->sw_index = ath10k_ce_dest_ring_read_index_get(ar, ctrl_addr);
+	dest_ring->sw_index &= dest_ring->nentries_mask;
 	dest_ring->write_index =
 		ath10k_ce_dest_ring_write_index_get(ar, ctrl_addr);
+	dest_ring->write_index &= dest_ring->nentries_mask;
 	ath10k_pci_sleep(ar);
 
 	dest_ring->per_transfer_context = (void **)ptr;
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
