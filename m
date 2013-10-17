Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh06.mail.saunalahti.fi ([62.142.5.116])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWj4T-0004se-2z
 for ath10k@lists.infradead.org; Thu, 17 Oct 2013 08:36:42 +0000
Subject: [PATCH] ath10k: add error handling to ath10k_pci_wait()
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 17 Oct 2013 11:36:15 +0300
Message-ID: <20131017083615.31028.25088.stgit@localhost6.localdomain6>
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

ath10k_pci_wait() didn't notify any errors to callers, it
just printed a warning so add proper error handling.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |   28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 1e9cfcc9..92759cd 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -525,15 +525,19 @@ static bool ath10k_pci_target_is_awake(struct ath10k *ar)
 	return (RTC_STATE_V_GET(val) == RTC_STATE_V_ON);
 }
 
-static void ath10k_pci_wait(struct ath10k *ar)
+static int ath10k_pci_wait(struct ath10k *ar)
 {
 	int n = 100;
 
 	while (n-- && !ath10k_pci_target_is_awake(ar))
 		msleep(10);
 
-	if (n < 0)
+	if (n < 0) {
 		ath10k_warn("Unable to wakeup target\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
 }
 
 int ath10k_do_pci_wake(struct ath10k *ar)
@@ -2227,7 +2231,13 @@ static int ath10k_pci_start_intr_legacy(struct ath10k *ar)
 		  ar_pci->mem + PCIE_LOCAL_BASE_ADDRESS +
 		  PCIE_SOC_WAKE_ADDRESS);
 
-	ath10k_pci_wait(ar);
+	ret = ath10k_pci_wait(ar);
+	if (ret) {
+		ath10k_warn("Failed to enable legacy interrupt, target did not wake up: %d\n",
+			    ret);
+		free_irq(ar_pci->pdev->irq, ar);
+		return ret;
+	}
 
 	/*
 	 * A potential race occurs here: The CORE_BASE write
@@ -2290,6 +2300,10 @@ static int ath10k_pci_start_intr(struct ath10k *ar)
 	}
 
 	ret = ath10k_pci_start_intr_legacy(ar);
+	if (ret) {
+		ath10k_warn("Failed to start legacy interrupts: %d\n", ret);
+		return ret;
+	}
 
 exit:
 	ar_pci->num_msi_intrs = num;
@@ -2315,13 +2329,19 @@ static int ath10k_pci_reset_target(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	int wait_limit = 300; /* 3 sec */
+	int ret;
 
 	/* Wait for Target to finish initialization before we proceed. */
 	iowrite32(PCIE_SOC_WAKE_V_MASK,
 		  ar_pci->mem + PCIE_LOCAL_BASE_ADDRESS +
 		  PCIE_SOC_WAKE_ADDRESS);
 
-	ath10k_pci_wait(ar);
+	ret = ath10k_pci_wait(ar);
+	if (ret) {
+		ath10k_warn("Failed to reset target, target did not wake up: %d\n",
+			    ret);
+		return ret;
+	}
 
 	while (wait_limit-- &&
 	       !(ioread32(ar_pci->mem + FW_INDICATOR_ADDRESS) &


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
