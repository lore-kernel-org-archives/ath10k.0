Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1astcS-0007M4-1g
 for ath10k@lists.infradead.org; Wed, 20 Apr 2016 15:00:44 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH 2/4] ath10k: Clean up growing hw checks during safe and full
 reset
Date: Wed, 20 Apr 2016 20:29:14 +0530
Message-ID: <1461164356-9158-3-git-send-email-vthiagar@qti.qualcomm.com>
In-Reply-To: <1461164356-9158-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1461164356-9158-1-git-send-email-vthiagar@qti.qualcomm.com>
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

Store pci chip secific reset funtions in struct ath10k_pci
as callbacks during early ath10k_pci_probe() and use the
callback to perform chip specific resets. This patch essentially
adds two callback in ath10k_pci, one for doing soft reset and
the other for hard reset. By using callbacks we can get rid of
those hw revision checks in ath10k_pci_safe_chip_reset() and
ath10k_pci_chip_reset(). As such this patch does not fix
any issue.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 44 ++++++++++++++++++++++-------------
 drivers/net/wireless/ath/ath10k/pci.h |  6 +++++
 2 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index cdd8a30..6614fd7 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2293,16 +2293,20 @@ static int ath10k_pci_warm_reset(struct ath10k *ar)
 	return 0;
 }
 
+static int ath10k_pci_qca99x0_soft_chip_reset(struct ath10k *ar)
+{
+	ath10k_pci_irq_disable(ar);
+	return ath10k_pci_qca99x0_chip_reset(ar);
+}
+
 static int ath10k_pci_safe_chip_reset(struct ath10k *ar)
 {
-	if (QCA_REV_988X(ar) || QCA_REV_6174(ar)) {
-		return ath10k_pci_warm_reset(ar);
-	} else if (QCA_REV_99X0(ar)) {
-		ath10k_pci_irq_disable(ar);
-		return ath10k_pci_qca99x0_chip_reset(ar);
-	} else {
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+
+	if (!ar_pci->pci_soft_reset)
 		return -ENOTSUPP;
-	}
+
+	return ar_pci->pci_soft_reset(ar);
 }
 
 static int ath10k_pci_qca988x_chip_reset(struct ath10k *ar)
@@ -2437,16 +2441,12 @@ static int ath10k_pci_qca99x0_chip_reset(struct ath10k *ar)
 
 static int ath10k_pci_chip_reset(struct ath10k *ar)
 {
-	if (QCA_REV_988X(ar))
-		return ath10k_pci_qca988x_chip_reset(ar);
-	else if (QCA_REV_6174(ar))
-		return ath10k_pci_qca6174_chip_reset(ar);
-	else if (QCA_REV_9377(ar))
-		return ath10k_pci_qca6174_chip_reset(ar);
-	else if (QCA_REV_99X0(ar))
-		return ath10k_pci_qca99x0_chip_reset(ar);
-	else
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+
+	if (WARN_ON(!ar_pci->pci_hard_reset))
 		return -ENOTSUPP;
+
+	return ar_pci->pci_hard_reset(ar);
 }
 
 static int ath10k_pci_hif_power_up(struct ath10k *ar)
@@ -2976,24 +2976,34 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	enum ath10k_hw_rev hw_rev;
 	u32 chip_id;
 	bool pci_ps;
+	int (*pci_soft_reset)(struct ath10k *ar);
+	int (*pci_hard_reset)(struct ath10k *ar);
 
 	switch (pci_dev->device) {
 	case QCA988X_2_0_DEVICE_ID:
 		hw_rev = ATH10K_HW_QCA988X;
 		pci_ps = false;
+		pci_soft_reset = ath10k_pci_warm_reset;
+		pci_hard_reset = ath10k_pci_qca988x_chip_reset;
 		break;
 	case QCA6164_2_1_DEVICE_ID:
 	case QCA6174_2_1_DEVICE_ID:
 		hw_rev = ATH10K_HW_QCA6174;
 		pci_ps = true;
+		pci_soft_reset = ath10k_pci_warm_reset;
+		pci_hard_reset = ath10k_pci_qca6174_chip_reset;
 		break;
 	case QCA99X0_2_0_DEVICE_ID:
 		hw_rev = ATH10K_HW_QCA99X0;
 		pci_ps = false;
+		pci_soft_reset = ath10k_pci_qca99x0_soft_chip_reset;
+		pci_hard_reset = ath10k_pci_qca99x0_chip_reset;
 		break;
 	case QCA9377_1_0_DEVICE_ID:
 		hw_rev = ATH10K_HW_QCA9377;
 		pci_ps = true;
+		pci_soft_reset = NULL;
+		pci_hard_reset = ath10k_pci_qca6174_chip_reset;
 		break;
 	default:
 		WARN_ON(1);
@@ -3018,6 +3028,8 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	ar->dev_id = pci_dev->device;
 	ar_pci->pci_ps = pci_ps;
 	ar_pci->bus_ops = &ath10k_pci_bus_ops;
+	ar_pci->pci_soft_reset = pci_soft_reset;
+	ar_pci->pci_hard_reset = pci_hard_reset;
 
 	ar->id.vendor = pdev->vendor;
 	ar->id.device = pdev->device;
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 959dc32..6eca1df 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -234,6 +234,12 @@ struct ath10k_pci {
 
 	const struct ath10k_bus_ops *bus_ops;
 
+	/* Chip specific pci reset routine used to do a safe reset */
+	int (*pci_soft_reset)(struct ath10k *ar);
+
+	/* Chip specific pci full reset function */
+	int (*pci_hard_reset)(struct ath10k *ar);
+
 	/* Keep this entry in the last, memory for struct ath10k_ahb is
 	 * allocated (ahb support enabled case) in the continuation of
 	 * this struct.
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
