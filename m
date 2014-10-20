Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgC51-0001kd-SG
 for ath10k@lists.infradead.org; Mon, 20 Oct 2014 12:28:57 +0000
Received: by mail-la0-f47.google.com with SMTP id pv20so3775966lab.6
 for <ath10k@lists.infradead.org>; Mon, 20 Oct 2014 05:28:28 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 1/6] ath10k: re-disable interrupts after target init
Date: Mon, 20 Oct 2014 14:14:37 +0200
Message-Id: <1413807282-27951-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1413807282-27951-1-git-send-email-michal.kazior@tieto.com>
References: <1413807282-27951-1-git-send-email-michal.kazior@tieto.com>
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
