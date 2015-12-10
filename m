Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6xn3-0001gx-3s
 for ath10k@lists.infradead.org; Thu, 10 Dec 2015 09:45:34 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 2/2] ath10k: reduce indentation by moving powersave check
 within function
Date: Thu, 10 Dec 2015 15:14:27 +0530
Message-ID: <1449740667-25901-2-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1449740667-25901-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1449740667-25901-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

For devices that does not support PCI power save, force wake up
API is used. So move powersave check inside force wakeup to reduce
one level indentation.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 473a141..c6aaad2 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -487,6 +487,9 @@ static int ath10k_pci_force_wake(struct ath10k *ar)
 	unsigned long flags;
 	int ret = 0;
 
+	if (ar_pci->pci_ps)
+		return ret;
+
 	spin_lock_irqsave(&ar_pci->ps_lock, flags);
 
 	if (!ar_pci->ps_awake) {
@@ -2480,12 +2483,10 @@ static int ath10k_pci_hif_resume(struct ath10k *ar)
 	u32 val;
 	int ret = 0;
 
-	if (ar_pci->pci_ps == 0) {
-		ret = ath10k_pci_force_wake(ar);
-		if (ret) {
-			ath10k_err(ar, "failed to wake up target: %d\n", ret);
-			return ret;
-		}
+	ret = ath10k_pci_force_wake(ar);
+	if (ret) {
+		ath10k_err(ar, "failed to wake up target: %d\n", ret);
+		return ret;
 	}
 
 	/* Suspend/Resume resets the PCI configuration space, so we have to
@@ -2592,13 +2593,10 @@ static irqreturn_t ath10k_pci_interrupt_handler(int irq, void *arg)
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	int ret;
 
-	if (ar_pci->pci_ps == 0) {
-		ret = ath10k_pci_force_wake(ar);
-		if (ret) {
-			ath10k_warn(ar, "failed to wake device up on irq: %d\n",
-				    ret);
-			return IRQ_NONE;
-		}
+	ret = ath10k_pci_force_wake(ar);
+	if (ret) {
+		ath10k_warn(ar, "failed to wake device up on irq: %d\n", ret);
+		return IRQ_NONE;
 	}
 
 	if (ar_pci->num_msi_intrs == 0) {
@@ -3071,12 +3069,10 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 		goto err_sleep;
 	}
 
-	if (ar_pci->pci_ps == 0) {
-		ret = ath10k_pci_force_wake(ar);
-		if (ret) {
-			ath10k_warn(ar, "failed to wake up device : %d\n", ret);
-			goto err_free_pipes;
-		}
+	ret = ath10k_pci_force_wake(ar);
+	if (ret) {
+		ath10k_warn(ar, "failed to wake up device : %d\n", ret);
+		goto err_free_pipes;
 	}
 
 	ath10k_pci_ce_deinit(ar);
-- 
2.6.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
