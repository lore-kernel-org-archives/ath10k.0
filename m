Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x233.google.com ([2a00:1450:4010:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKo2S-0006PL-RC
 for ath10k@lists.infradead.org; Fri, 22 Aug 2014 12:33:53 +0000
Received: by mail-lb0-f179.google.com with SMTP id v6so9156033lbi.24
 for <ath10k@lists.infradead.org>; Fri, 22 Aug 2014 05:33:30 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 5/6] ath10k: make sure to really disable irqs
Date: Fri, 22 Aug 2014 14:23:33 +0200
Message-Id: <1408710214-24894-6-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1408710214-24894-1-git-send-email-michal.kazior@tieto.com>
References: <1408710214-24894-1-git-send-email-michal.kazior@tieto.com>
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

This fixes two corner cases.

One is a race between disabling copy engine
interrupts and unhandled pending interrupts on the
host. This could end up with a runaway tasklet and
consequently memory leak of a few copy engine
rx buffers.

The other one is an unexpected (and non-maskable
via device CSR) MSI fw indication interrupt during
teardown. This could trigger the same problem as
the first corner case.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 43 ++++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index c764dd7..6224952 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1121,6 +1121,40 @@ static int ath10k_pci_post_rx(struct ath10k *ar)
 	return 0;
 }
 
+static void ath10k_pci_irq_disable(struct ath10k *ar)
+{
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+	int i;
+
+	ath10k_ce_disable_interrupts(ar);
+
+	/* Regardless how many interrupts were assigned for MSI the first one
+	 * is always used for firmware indications (crashes). There's no way to
+	 * mask the irq in the device so call disable_irq(). Legacy (shared)
+	 * interrupts can be masked on the device though.
+	 */
+	if (ar_pci->num_msi_intrs > 0)
+		disable_irq(ar_pci->pdev->irq);
+	else
+		ath10k_pci_disable_and_clear_legacy_irq(ar);
+
+	for (i = 0; i < max(1, ar_pci->num_msi_intrs); i++)
+		synchronize_irq(ar_pci->pdev->irq + i);
+}
+
+static void ath10k_pci_irq_enable(struct ath10k *ar)
+{
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+
+	ath10k_ce_enable_interrupts(ar);
+
+	/* See comment in ath10k_pci_irq_disable() */
+	if (ar_pci->num_msi_intrs > 0)
+		enable_irq(ar_pci->pdev->irq);
+	else
+		ath10k_pci_enable_legacy_irq(ar);
+}
+
 static int ath10k_pci_hif_start(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
@@ -1138,7 +1172,7 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
 		goto err_early_irq;
 	}
 
-	ath10k_ce_enable_interrupts(ar);
+	ath10k_pci_irq_enable(ar);
 
 	/* Post buffers once to start things off. */
 	ret = ath10k_pci_post_rx(ar);
@@ -1152,7 +1186,7 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
 	return 0;
 
 err_stop:
-	ath10k_ce_disable_interrupts(ar);
+	ath10k_pci_irq_disable(ar);
 	ath10k_pci_free_irq(ar);
 	ath10k_pci_kill_tasklet(ar);
 err_early_irq:
@@ -1275,10 +1309,7 @@ static void ath10k_pci_hif_stop(struct ath10k *ar)
 	if (WARN_ON(!ar_pci->started))
 		return;
 
-	ret = ath10k_ce_disable_interrupts(ar);
-	if (ret)
-		ath10k_warn("failed to disable CE interrupts: %d\n", ret);
-
+	ath10k_pci_irq_disable(ar);
 	ath10k_pci_free_irq(ar);
 	ath10k_pci_kill_tasklet(ar);
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
