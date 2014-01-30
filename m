Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8rxt-0006vo-Nl
 for ath10k@lists.infradead.org; Thu, 30 Jan 2014 13:47:34 +0000
Date: Thu, 30 Jan 2014 14:49:09 +0100
From: Alexander Gordeev <agordeev@redhat.com>
Subject: [PATCH v3 3/3] ath10k: Use pci_enable_msi_range()
Message-ID: <20140130134908.GC31909@dhcp-26-207.brq.redhat.com>
References: <cover.1389904166.git.agordeev@redhat.com>
 <ad5cc6d6bdf4c8f5ce4681ec27674d07fbda089e.1389904167.git.agordeev@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad5cc6d6bdf4c8f5ce4681ec27674d07fbda089e.1389904167.git.agordeev@redhat.com>
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
To: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org, Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

As result deprecation of MSI-X/MSI enablement functions
pci_enable_msix() and pci_enable_msi_block() all drivers
using these two interfaces need to be updated to use the
new pci_enable_msi_range() and pci_enable_msix_range()
interfaces.

Signed-off-by: Alexander Gordeev <agordeev@redhat.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 563ce77..ad2a6cf 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2411,8 +2411,9 @@ static int ath10k_pci_init_irq(struct ath10k *ar)
 	/* Try MSI-X */
 	if (ath10k_pci_irq_mode == ATH10K_PCI_IRQ_AUTO && msix_supported) {
 		ar_pci->num_msi_intrs = MSI_NUM_REQUEST;
-		ret = pci_enable_msi_block(ar_pci->pdev, ar_pci->num_msi_intrs);
-		if (ret == 0)
+		ret = pci_enable_msi_range(ar_pci->pdev, ar_pci->num_msi_intrs,
+							 ar_pci->num_msi_intrs);
+		if (ret > 0)
 			return 0;
 
 		/* fall-through */
-- 
1.7.7.6

-- 
Regards,
Alexander Gordeev
agordeev@redhat.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
