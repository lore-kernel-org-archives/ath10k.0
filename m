Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xc9Ag-0002Dg-0Y
 for ath10k@lists.infradead.org; Thu, 09 Oct 2014 08:34:03 +0000
Received: by mail-wg0-f43.google.com with SMTP id m15so705897wgh.14
 for <ath10k@lists.infradead.org>; Thu, 09 Oct 2014 01:33:38 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/5] ath10k: re-disable interrupts after target init
Date: Thu,  9 Oct 2014 10:22:26 +0200
Message-Id: <1412842950-14098-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1412842950-14098-1-git-send-email-michal.kazior@tieto.com>
References: <1412842950-14098-1-git-send-email-michal.kazior@tieto.com>
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

If MSI isn't configured device ROM program expects
legacy interrupts to be enabled before it can
fully boot. Don't forget to disable legacy
interrupts after that.

While at it re-use the legacy irq enabling helper
instead of calling ath10k_pci_write32().

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 730bb18..6077095 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2279,14 +2279,13 @@ static int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 
 		if (ar_pci->num_msi_intrs == 0)
 			/* Fix potential race by repeating CORE_BASE writes */
-			ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS +
-					   PCIE_INTR_ENABLE_ADDRESS,
-					   PCIE_INTR_FIRMWARE_MASK |
-					   PCIE_INTR_CE_MASK_ALL);
+			ath10k_pci_enable_legacy_irq(ar);
 
 		mdelay(10);
 	} while (time_before(jiffies, timeout));
 
+	ath10k_pci_disable_and_clear_legacy_irq(ar);
+
 	if (val == 0xffffffff) {
 		ath10k_err(ar, "failed to read device register, device is gone\n");
 		return -EIO;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
