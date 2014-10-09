Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XcAMX-0000Gb-B3
 for ath10k@lists.infradead.org; Thu, 09 Oct 2014 09:50:22 +0000
Received: by mail-wg0-f52.google.com with SMTP id a1so821979wgh.35
 for <ath10k@lists.infradead.org>; Thu, 09 Oct 2014 02:49:54 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/3] ath10k: fix possible bmi crash
Date: Thu,  9 Oct 2014 11:38:45 +0200
Message-Id: <1412847527-25983-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1412847527-25983-1-git-send-email-michal.kazior@tieto.com>
References: <1412847527-25983-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

While testing other things I've found that CE
items aren't cleared properly. This could lead to
null dereferences in BMI.

To prevent that make sure CE revoking clears the
nbytes value (which is used as a buffer completion
indication) and memset the entire CE rings when
(re)initializing.

Also make sure to check BMI xfer pointer and print
a splat instead of crashing the kernel.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/ce.c  | 7 +++++++
 drivers/net/wireless/ath/ath10k/pci.c | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 4745ef2..134dea5 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -558,6 +558,7 @@ int ath10k_ce_revoke_recv_next(struct ath10k_ce_pipe *ce_state,
 
 		/* sanity */
 		dest_ring->per_transfer_context[sw_index] = NULL;
+		desc->nbytes = 0;
 
 		/* Update sw_index */
 		sw_index = CE_RING_IDX_INCR(nentries_mask, sw_index);
@@ -837,6 +838,10 @@ static int ath10k_ce_init_src_ring(struct ath10k *ar,
 
 	memset(src_ring->per_transfer_context, 0,
 	       nentries * sizeof(*src_ring->per_transfer_context));
+	memset(src_ring->base_addr_owner_space, 0,
+	       nentries * sizeof(struct ce_desc));
+	memset(src_ring->shadow_base, 0,
+	       nentries * sizeof(struct ce_desc));
 
 	src_ring->sw_index = ath10k_ce_src_ring_read_index_get(ar, ctrl_addr);
 	src_ring->sw_index &= src_ring->nentries_mask;
@@ -874,6 +879,8 @@ static int ath10k_ce_init_dest_ring(struct ath10k *ar,
 
 	memset(dest_ring->per_transfer_context, 0,
 	       nentries * sizeof(*dest_ring->per_transfer_context));
+	memset(dest_ring->base_addr_owner_space, 0,
+	       nentries * sizeof(struct ce_desc));
 
 	dest_ring->sw_index = ath10k_ce_dest_ring_read_index_get(ar, ctrl_addr);
 	dest_ring->sw_index &= dest_ring->nentries_mask;
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 6e8e098..ca2adbd 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1428,6 +1428,9 @@ static void ath10k_pci_bmi_recv_data(struct ath10k_ce_pipe *ce_state)
 					  &nbytes, &transfer_id, &flags))
 		return;
 
+	if (WARN_ON_ONCE(!xfer))
+		return;
+
 	if (!xfer->wait_for_resp) {
 		ath10k_warn(ar, "unexpected: BMI data received; ignoring\n");
 		return;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
