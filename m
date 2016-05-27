Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6J25-00050h-26
 for ath10k@lists.infradead.org; Fri, 27 May 2016 14:46:37 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 1/5] ath10k: fix operating irq mode for ahb device
Date: Fri, 27 May 2016 20:15:55 +0530
Message-ID: <20160527144559.4053-1-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, rmanohar@codeaurora.org

Earlier when operating irq mode is legacy, interrupts are disabled
and re-enabled based on num_msi_intrs. commit cfe9011a05a8 ("ath10k:
remove MSI range support") replaced num_msi_intrs by oper_irq_mode.
Since oper_irq_mode is not initialized for ahb devices (i.e qca4019),
device boot up is failed during probe.

Fixes: cfe9011a05a8 ("ath10k: remove MSI range support")
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/ahb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index bd62bc19e758..37ff36fca7bc 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -476,6 +476,7 @@ static irqreturn_t ath10k_ahb_interrupt_handler(int irq, void *arg)
 
 static int ath10k_ahb_request_irq_legacy(struct ath10k *ar)
 {
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	struct ath10k_ahb *ar_ahb = ath10k_ahb_priv(ar);
 	int ret;
 
@@ -487,6 +488,7 @@ static int ath10k_ahb_request_irq_legacy(struct ath10k *ar)
 			    ar_ahb->irq, ret);
 		return ret;
 	}
+	ar_pci->oper_irq_mode = ATH10K_PCI_IRQ_LEGACY;
 
 	return 0;
 }
-- 
2.8.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
