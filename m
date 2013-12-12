Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vr7Gb-0006Ns-Ng
 for ath10k@lists.infradead.org; Thu, 12 Dec 2013 14:29:30 +0000
Received: by mail-ee0-f47.google.com with SMTP id e51so230158eek.34
 for <ath10k@lists.infradead.org>; Thu, 12 Dec 2013 06:28:33 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/3] ath10k: zero CE config upon deinit
Date: Thu, 12 Dec 2013 15:24:21 +0100
Message-Id: <1386858261-16037-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1386858261-16037-1-git-send-email-michal.kazior@tieto.com>
References: <1386858261-16037-1-git-send-email-michal.kazior@tieto.com>
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

Make sure to reset CE configuration in the exposed
device registers. This sounds like a safe plan
since CE configurations includes DMA addresses
shared between host and the device which are made
invalid after teardown.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/ce.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index d44d618..ba82a03 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1109,11 +1109,38 @@ out:
 	return ce_state;
 }
 
+void ath10k_ce_reset_src_ring(struct ath10k *ar, int num)
+{
+	u32 ctrl_addr = ath10k_ce_base_address(num);
+
+	ath10k_ce_src_ring_base_addr_set(ar, ctrl_addr, 0);
+	ath10k_ce_src_ring_size_set(ar, ctrl_addr, 0);
+	ath10k_ce_src_ring_dmax_set(ar, ctrl_addr, 0);
+	ath10k_ce_src_ring_byte_swap_set(ar, ctrl_addr, 0);
+	ath10k_ce_src_ring_lowmark_set(ar, ctrl_addr, 0);
+	ath10k_ce_src_ring_highmark_set(ar, ctrl_addr, 0);
+
+}
+
+void ath10k_ce_reset_dest_ring(struct ath10k *ar, int num)
+{
+	u32 ctrl_addr = ath10k_ce_base_address(num);
+
+	ath10k_ce_dest_ring_base_addr_set(ar, ctrl_addr, 0);
+	ath10k_ce_dest_ring_size_set(ar, ctrl_addr, 0);
+	ath10k_ce_dest_ring_byte_swap_set(ar, ctrl_addr, 0);
+	ath10k_ce_dest_ring_lowmark_set(ar, ctrl_addr, 0);
+	ath10k_ce_dest_ring_highmark_set(ar, ctrl_addr, 0);
+}
+
 void ath10k_ce_deinit(struct ath10k_ce_pipe *ce_state)
 {
 	struct ath10k *ar = ce_state->ar;
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 
+	ath10k_ce_reset_src_ring(ar, ce_state->id);
+	ath10k_ce_reset_dest_ring(ar, ce_state->id);
+
 	if (ce_state->src_ring) {
 		kfree(ce_state->src_ring->shadow_base_unaligned);
 		pci_free_consistent(ar_pci->pdev,
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
