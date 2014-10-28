Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xj3MB-0002k6-A8
 for ath10k@lists.infradead.org; Tue, 28 Oct 2014 09:46:27 +0000
Received: by mail-lb0-f176.google.com with SMTP id p9so239369lbv.21
 for <ath10k@lists.infradead.org>; Tue, 28 Oct 2014 02:46:05 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v3 1/3] ath10k: fix possible bmi crash
Date: Tue, 28 Oct 2014 10:34:36 +0100
Message-Id: <1414488878-31561-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1414488878-31561-1-git-send-email-michal.kazior@tieto.com>
References: <1414488878-31561-1-git-send-email-michal.kazior@tieto.com>
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
indication) and memset the entire CE ring data
shared between host and target when
(re)initializing.

Also make sure to check BMI xfer pointer and print
a splat instead of crashing the kernel.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

Notes:
    v3:
     * dont reset shadow desc - its used for cleanup in hif_stop()

 drivers/net/wireless/ath/ath10k/ce.c  | 7 +++++++
 drivers/net/wireless/ath/ath10k/pci.c | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 878e1ec..a156e6e 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -558,6 +558,7 @@ int ath10k_ce_revoke_recv_next(struct ath10k_ce_pipe *ce_state,
 
 		/* sanity */
 		dest_ring->per_transfer_context[sw_index] = NULL;
+		desc->nbytes = 0;
 
 		/* Update sw_index */
 		sw_index = CE_RING_IDX_INCR(nentries_mask, sw_index);
@@ -835,6 +836,9 @@ static int ath10k_ce_init_src_ring(struct ath10k *ar,
 
 	nentries = roundup_pow_of_two(attr->src_nentries);
 
+	memset(src_ring->base_addr_owner_space, 0,
+	       nentries * sizeof(struct ce_desc));
+
 	src_ring->sw_index = ath10k_ce_src_ring_read_index_get(ar, ctrl_addr);
 	src_ring->sw_index &= src_ring->nentries_mask;
 	src_ring->hw_index = src_ring->sw_index;
@@ -869,6 +873,9 @@ static int ath10k_ce_init_dest_ring(struct ath10k *ar,
 
 	nentries = roundup_pow_of_two(attr->dest_nentries);
 
+	memset(dest_ring->base_addr_owner_space, 0,
+	       nentries * sizeof(struct ce_desc));
+
 	dest_ring->sw_index = ath10k_ce_dest_ring_read_index_get(ar, ctrl_addr);
 	dest_ring->sw_index &= dest_ring->nentries_mask;
 	dest_ring->write_index =
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 63f374ed..f5e426e 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1442,6 +1442,9 @@ static void ath10k_pci_bmi_recv_data(struct ath10k_ce_pipe *ce_state)
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
