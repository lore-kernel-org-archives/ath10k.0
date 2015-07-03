Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAuH7-0001i7-FC
 for ath10k@lists.infradead.org; Fri, 03 Jul 2015 06:16:38 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH] ath10k: Delay device access after cold reset
Date: Fri, 3 Jul 2015 11:45:42 +0530
Message-ID: <1435904142-30295-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

It is observed that during cold reset pcie access right
after a write operation to SOC_GLOBAL_RESET_ADDRESS causes
Data Bus Error and system hard lockup. The reason
for bus error is that pcie needs some time to get
back to stable state for any transaction during cold reset. Add
delay of 20 msecs after write of SOC_GLOBAL_RESET_ADDRESS
to fix this issue.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 1b4634a..130746b 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2761,7 +2761,6 @@ static int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 
 static int ath10k_pci_cold_reset(struct ath10k *ar)
 {
-	int i;
 	u32 val;
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot cold reset\n");
@@ -2777,23 +2776,18 @@ static int ath10k_pci_cold_reset(struct ath10k *ar)
 	val |= 1;
 	ath10k_pci_reg_write32(ar, SOC_GLOBAL_RESET_ADDRESS, val);
 
-	for (i = 0; i < ATH_PCI_RESET_WAIT_MAX; i++) {
-		if (ath10k_pci_reg_read32(ar, RTC_STATE_ADDRESS) &
-					  RTC_STATE_COLD_RESET_MASK)
-			break;
-		msleep(1);
-	}
+	/* After writing into SOC_GLOBAL_RESET to put device into
+	 * reset and pulling out of reset pcie may not be stable
+	 * for any immediate pcie register access and cause bus error,
+	 * add delay before any pcie access request to fix this issue.
+	 */
+	msleep(20);
 
 	/* Pull Target, including PCIe, out of RESET. */
 	val &= ~1;
 	ath10k_pci_reg_write32(ar, SOC_GLOBAL_RESET_ADDRESS, val);
 
-	for (i = 0; i < ATH_PCI_RESET_WAIT_MAX; i++) {
-		if (!(ath10k_pci_reg_read32(ar, RTC_STATE_ADDRESS) &
-					    RTC_STATE_COLD_RESET_MASK))
-			break;
-		msleep(1);
-	}
+	msleep(20);
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot cold reset complete\n");
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
