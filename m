Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4SCC-0007fS-7S
 for ath10k@lists.infradead.org; Wed, 31 Jul 2013 08:55:49 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 5/5] ath10k: fix failpath in MSI-X setup
Date: Wed, 31 Jul 2013 10:55:15 +0200
Message-ID: <1375260915-22500-6-git-send-email-michal.kazior@tieto.com>
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

pci_disable_msi() must be called if the initial
request_irq() fails.

Also add a warning message so it's possible to
distinguish request_irq() failure and
pci_enable_msi() failure.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index c71b488..d95439b 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1990,8 +1990,13 @@ static int ath10k_pci_start_intr_msix(struct ath10k *ar, int num)
 	ret = request_irq(ar_pci->pdev->irq + MSI_ASSIGN_FW,
 			  ath10k_pci_msi_fw_handler,
 			  IRQF_SHARED, "ath10k_pci", ar);
-	if (ret)
+	if (ret) {
+		ath10k_warn("request_irq(%d) failed %d\n",
+			    ar_pci->pdev->irq + MSI_ASSIGN_FW, ret);
+
+		pci_disable_msi(ar_pci->pdev);
 		return ret;
+	}
 
 	for (i = MSI_ASSIGN_CE_INITIAL; i <= MSI_ASSIGN_CE_MAX; i++) {
 		ret = request_irq(ar_pci->pdev->irq + i,
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
