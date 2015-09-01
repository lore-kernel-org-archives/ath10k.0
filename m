Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWezY-00057g-5G
 for ath10k@lists.infradead.org; Tue, 01 Sep 2015 06:24:24 +0000
From: <c_traja@qti.qualcomm.com>
Subject: [PATCH] ath10k: Disable PCI power save for QCA99X0
Date: Tue, 1 Sep 2015 11:53:32 +0530
Message-ID: <1441088612-9517-1-git-send-email-c_traja@qti.qualcomm.com>
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
Cc: Tamizh chelvam <c_traja@qti.qualcomm.com>, linux-wireless@vger.kernel.org

From: Tamizh chelvam <c_traja@qti.qualcomm.com>

Frequent failures in waking up the target is observed during
interface (mostly observed with AP and Monitor mode) bring up
on x86, this failures lead to firmware crash. Disabling PCI
power save fixes this issue. Disabling ASPM also does not help,
as a work around disable PCI power save for QCA99X0.

The following kernel log is seen when this issue happens

kworker/dying (667) used greatest stack depth: 12208 bytes left
ath10k_pci 0000:07:00.0: failed to wake target for read32 at 0x00040050: -110
ath10k_pci 0000:07:00.0: failed to wake target for read32 at 0x0004a02c: -110
ath10k_pci 0000:07:00.0: failed to wake target for write32 of 0xfffffffe at 0x0004a02c: -110
ath10k_pci 0000:07:00.0: failed to wake target for read32 at 0x0004a034: -110
ath10k_pci 0000:07:00.0: failed to wake target for write32 of 0xfffff81f at 0x0004a034: -110
ath10k_pci 0000:07:00.0: failed to wake target for read32 at 0x0004a02c: -110
ath10k_pci 0000:07:00.0: failed to wake target for write32 of 0xffffffe1 at 0x0004a02c: -110
ath10k_pci 0000:07:00.0: failed to wake target for read32 at 0x0004a42c: -110
ath10k_pci 0000:07:00.0: failed to wake target for write32 of 0xfffffffe at 0x0004a42c: -110
ath10k_pci 0000:07:00.0: failed to wake target for read32 at 0x0004a434: -110
ath10k_pci 0000:07:00.0: firmware crashed! (uuid 40b345f1-db3d-4b97-bc54-6572994e02d5)

Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 1046ab6..1ab4ee7 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1640,6 +1640,10 @@ static void ath10k_pci_hif_stop(struct ath10k *ar)
 	ath10k_pci_safe_chip_reset(ar);
 
 	ath10k_pci_irq_disable(ar);
+
+	if (QCA_REV_99X0(ar))
+		ath10k_pci_sleep(ar);
+
 	ath10k_pci_irq_sync(ar);
 	ath10k_pci_flush(ar);
 
@@ -2315,6 +2319,14 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot hif power up\n");
 
+	if (QCA_REV_99X0(ar)) {
+		ret = ath10k_pci_wake(ar);
+		if (ret) {
+			ath10k_warn(ar, "failed to wake target for qca99x0: %d\n", ret);
+			return ret;
+		}
+	}
+
 	pcie_capability_read_word(ar_pci->pdev, PCI_EXP_LNKCTL,
 				  &ar_pci->link_ctl);
 	pcie_capability_write_word(ar_pci->pdev, PCI_EXP_LNKCTL,
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
