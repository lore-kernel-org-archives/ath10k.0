Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh02.mail.saunalahti.fi ([62.142.5.108])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5ADs-0000hL-BS
 for ath10k@lists.infradead.org; Fri, 02 Aug 2013 07:56:29 +0000
Subject: [PATCH] ath10k: remove un ar_pci->cacheline_sz field
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 02 Aug 2013 10:56:01 +0300
Message-ID: <20130802075601.11114.11607.stgit@localhost6.localdomain6>
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
Cc: linux-wireless@vger.kernel.org

cacheline_sz is not used anywhere and can be removed.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |    2 --
 drivers/net/wireless/ath/ath10k/pci.h |    1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index d95439b..6f44d3a 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2361,8 +2361,6 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 
 	spin_lock_init(&ar_pci->ce_lock);
 
-	ar_pci->cacheline_sz = dma_get_cache_alignment();
-
 	ret = ath10k_pci_start_intr(ar);
 	if (ret) {
 		ath10k_err("could not start interrupt handling (%d)\n", ret);
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index d3a2e6c..bfd60a5 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -189,7 +189,6 @@ struct ath10k_pci {
 	struct device *dev;
 	struct ath10k *ar;
 	void __iomem *mem;
-	int cacheline_sz;
 
 	DECLARE_BITMAP(features, ATH10K_PCI_FEATURE_COUNT);
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
