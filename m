Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMlGp-00025c-KV
 for ath10k@lists.infradead.org; Wed, 14 Nov 2018 02:51:13 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: support PCIe enter L1 state
Date: Wed, 14 Nov 2018 10:50:48 +0800
Message-Id: <1542163848-837-1-git-send-email-wgong@codeaurora.org>
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

QCA6174A/QCA9377 PCIe chips support PCIe L1 and L1SS, and indicate the
L1/L1SS capabilities in PCI configuration space. Currently ath10k driver
write target PCIe config flags to disallow HW enter into L1, this leads
some HW modules are still powered up even when both system PCIe RC and
QCA6174A/QCA9377 endpoint decides to enter into L1 or L1SS.

This cause ~12 mA power drain of bottom power consumption for all scenarios.
Fix this issue by removing the drive code to write PCIe config flags.

Tested with QCA6174 PCI with firmware
WLAN.RM.4.4.1-00109-QCARMSWPZ-1, but this will also affect QCA9377 PCI.
It's not a regression with new firmware releases.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/pci.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index af2cf55..549da7a 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2301,7 +2301,6 @@ int ath10k_pci_init_config(struct ath10k *ar)
 	u32 pcie_state_targ_addr = 0;
 	u32 pipe_cfg_targ_addr = 0;
 	u32 svc_to_pipe_map = 0;
-	u32 pcie_config_flags = 0;
 	u32 ealloc_value;
 	u32 ealloc_targ_addr;
 	u32 flag2_value;
@@ -2374,26 +2373,6 @@ int ath10k_pci_init_config(struct ath10k *ar)
 		return ret;
 	}
 
-	ret = ath10k_pci_diag_read32(ar, (pcie_state_targ_addr +
-					  offsetof(struct pcie_state,
-						   config_flags)),
-				     &pcie_config_flags);
-	if (ret != 0) {
-		ath10k_err(ar, "Failed to get pcie config_flags: %d\n", ret);
-		return ret;
-	}
-
-	pcie_config_flags &= ~PCIE_CONFIG_FLAG_ENABLE_L1;
-
-	ret = ath10k_pci_diag_write32(ar, (pcie_state_targ_addr +
-					   offsetof(struct pcie_state,
-						    config_flags)),
-				      pcie_config_flags);
-	if (ret != 0) {
-		ath10k_err(ar, "Failed to write pcie config_flags: %d\n", ret);
-		return ret;
-	}
-
 	/* configure early allocation */
 	ealloc_targ_addr = host_interest_item_address(HI_ITEM(hi_early_alloc));
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
