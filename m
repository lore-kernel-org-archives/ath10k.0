Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFJlz-0002Oq-GN
 for ath10k@lists.infradead.org; Thu, 07 Aug 2014 09:14:12 +0000
Received: by mail-wi0-f179.google.com with SMTP id f8so4583521wiw.6
 for <ath10k@lists.infradead.org>; Thu, 07 Aug 2014 02:13:49 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/5] ath10k: fix legacy irq workaround
Date: Thu,  7 Aug 2014 11:04:16 +0200
Message-Id: <1407402260-29854-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1407402260-29854-1-git-send-email-michal.kazior@tieto.com>
References: <1407402260-29854-1-git-send-email-michal.kazior@tieto.com>
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

Wrong register was being set up. This could
prevent firmware from booting in some rare cases
when using legacy interrupts.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index cfc1da2..54deea3 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2418,9 +2418,10 @@ static int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 
 		if (ar_pci->num_msi_intrs == 0)
 			/* Fix potential race by repeating CORE_BASE writes */
-			ath10k_pci_soc_write32(ar, PCIE_INTR_ENABLE_ADDRESS,
-					       PCIE_INTR_FIRMWARE_MASK |
-					       PCIE_INTR_CE_MASK_ALL);
+			ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS +
+					   PCIE_INTR_ENABLE_ADDRESS,
+					   PCIE_INTR_FIRMWARE_MASK |
+					   PCIE_INTR_CE_MASK_ALL);
 
 		mdelay(10);
 	} while (time_before(jiffies, timeout));
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
