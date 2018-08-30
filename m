Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fvCii-0006X9-R3
 for ath10k@lists.infradead.org; Thu, 30 Aug 2018 02:30:06 +0000
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH 2/3] ath10k: support to access target space below 1M for
 qca6174 and qca9377
Date: Thu, 30 Aug 2018 10:29:41 +0800
Message-Id: <1535596182-18038-3-git-send-email-cjhuang@codeaurora.org>
In-Reply-To: <1535596182-18038-1-git-send-email-cjhuang@codeaurora.org>
References: <1535596182-18038-1-git-send-email-cjhuang@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

To download firmware via diag interface, driver needs to write the target
memory space below 1M. It means the bit20 should be zero for the converted
address if the target memory space is below 1M. Otherwise, bit20 is one if
the target address is larger or equal to 1M space.

As downloading firmware via diag interface is only required for qca6174
and qca9377, a new specific function is introduced to convert the target
address to ce address: ath10k_pci_qca6174_targ_cpu_to_ce_addri().
This function supports to convert any target address to ce address.

It's tested with QCA6174 hw3.2 and
firmware-6.bin_WLAN.RM.4.4.1-00111-QCARMSWP-1. QCA9377 is also affected.

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/pci.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 7edbfe5..c82f17c 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -870,6 +870,21 @@ static u32 ath10k_pci_qca988x_targ_cpu_to_ce_addr(struct ath10k *ar, u32 addr)
 	return val;
 }
 
+/* Refactor from ath10k_pci_qca988x_targ_cpu_to_ce_addr.
+ * Support to access target space below 1M for qca6174 and qca9377.
+ * If target space is below 1M, the bit[20] of converted CE addr is 0.
+ * Otherwise bit[20] of converted CE addr is 1.
+ */
+static u32 ath10k_pci_qca6174_targ_cpu_to_ce_addr(struct ath10k *ar, u32 addr)
+{
+	u32 val = 0, region = addr & 0xfffff;
+
+	val = (ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS + CORE_CTRL_ADDRESS)
+				 & 0x7ff) << 21;
+	val |= ((addr >= 0x100000) ? 0x100000 : 0) | region;
+	return val;
+}
+
 static u32 ath10k_pci_qca99x0_targ_cpu_to_ce_addr(struct ath10k *ar, u32 addr)
 {
 	u32 val = 0, region = addr & 0xfffff;
@@ -3514,7 +3529,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 		pci_ps = true;
 		pci_soft_reset = ath10k_pci_warm_reset;
 		pci_hard_reset = ath10k_pci_qca6174_chip_reset;
-		targ_cpu_to_ce_addr = ath10k_pci_qca988x_targ_cpu_to_ce_addr;
+		targ_cpu_to_ce_addr = ath10k_pci_qca6174_targ_cpu_to_ce_addr;
 		break;
 	case QCA99X0_2_0_DEVICE_ID:
 		hw_rev = ATH10K_HW_QCA99X0;
@@ -3542,7 +3557,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 		pci_ps = true;
 		pci_soft_reset = NULL;
 		pci_hard_reset = ath10k_pci_qca6174_chip_reset;
-		targ_cpu_to_ce_addr = ath10k_pci_qca988x_targ_cpu_to_ce_addr;
+		targ_cpu_to_ce_addr = ath10k_pci_qca6174_targ_cpu_to_ce_addr;
 		break;
 	default:
 		WARN_ON(1);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
