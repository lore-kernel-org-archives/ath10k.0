Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6xmi-00013x-HO
 for ath10k@lists.infradead.org; Thu, 10 Dec 2015 09:45:13 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 1/2] ath10k: wake up device before accessing registers
Date: Thu, 10 Dec 2015 15:14:26 +0530
Message-ID: <1449740667-25901-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

commit 1aaf8efba0ae ("ath10k: disable PCI PS for QCA988X
and QCA99X0") partially reverts pci soc powersave support added by
commit 77258d409ce4 ("ath10k: enable pci soc powersaving"). While
reverting the change, pci wake up function is called after accessing
pci registers instead of prior to access. The assumption is that chip
is woken up before accessing its registers.Though this change does not
fix any known issues, this might help to avoid unknown or low power
platform specific issues.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 202c775..473a141 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3071,9 +3071,6 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 		goto err_sleep;
 	}
 
-	ath10k_pci_ce_deinit(ar);
-	ath10k_pci_irq_disable(ar);
-
 	if (ar_pci->pci_ps == 0) {
 		ret = ath10k_pci_force_wake(ar);
 		if (ret) {
@@ -3082,6 +3079,9 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 		}
 	}
 
+	ath10k_pci_ce_deinit(ar);
+	ath10k_pci_irq_disable(ar);
+
 	ret = ath10k_pci_init_irq(ar);
 	if (ret) {
 		ath10k_err(ar, "failed to init irqs: %d\n", ret);
-- 
2.6.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
