Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x236.google.com ([2a00:1450:400c:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvLRF-0004fG-RH
 for ath10k@lists.infradead.org; Mon, 01 Dec 2014 07:30:31 +0000
Received: by mail-wg0-f54.google.com with SMTP id l2so13366693wgh.27
 for <ath10k@lists.infradead.org>; Sun, 30 Nov 2014 23:30:06 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 1/3] ath10k: create a chip revision whielist
Date: Mon,  1 Dec 2014 08:17:44 +0100
Message-Id: <1417418266-21974-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1416838646-18801-1-git-send-email-michal.kazior@tieto.com>
References: <1416838646-18801-1-git-send-email-michal.kazior@tieto.com>
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

This will make it easier to extend and maintain
list of supported hardware.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

Notes:
    v2:
     * create a separate chip_id whitelist array
       instead of using hw_params as discussed [Kalle]

 drivers/net/wireless/ath/ath10k/core.c | 37 ----------------------------------
 drivers/net/wireless/ath/ath10k/core.h |  1 -
 drivers/net/wireless/ath/ath10k/pci.c  | 31 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/pci.h  |  5 +++++
 4 files changed, 36 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 7762061..ece8ab4 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1068,34 +1068,6 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 	return 0;
 }
 
-static int ath10k_core_check_chip_id(struct ath10k *ar)
-{
-	u32 hw_revision = MS(ar->chip_id, SOC_CHIP_ID_REV);
-
-	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot chip_id 0x%08x hw_revision 0x%x\n",
-		   ar->chip_id, hw_revision);
-
-	/* Check that we are not using hw1.0 (some of them have same pci id
-	 * as hw2.0) before doing anything else as ath10k crashes horribly
-	 * due to missing hw1.0 workarounds. */
-	switch (hw_revision) {
-	case QCA988X_HW_1_0_CHIP_ID_REV:
-		ath10k_err(ar, "ERROR: qca988x hw1.0 is not supported\n");
-		return -EOPNOTSUPP;
-
-	case QCA988X_HW_2_0_CHIP_ID_REV:
-		/* known hardware revision, continue normally */
-		return 0;
-
-	default:
-		ath10k_warn(ar, "Warning: hardware revision unknown (0x%x), expect problems\n",
-			    ar->chip_id);
-		return 0;
-	}
-
-	return 0;
-}
-
 static void ath10k_core_register_work(struct work_struct *work)
 {
 	struct ath10k *ar = container_of(work, struct ath10k, register_work);
@@ -1143,16 +1115,7 @@ err:
 
 int ath10k_core_register(struct ath10k *ar, u32 chip_id)
 {
-	int status;
-
 	ar->chip_id = chip_id;
-
-	status = ath10k_core_check_chip_id(ar);
-	if (status) {
-		ath10k_err(ar, "Unsupported chip id 0x%08x\n", ar->chip_id);
-		return status;
-	}
-
 	queue_work(ar->workqueue, &ar->register_work);
 
 	return 0;
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 4a29498..88e6c74 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -479,7 +479,6 @@ struct ath10k {
 		u32 id;
 		const char *name;
 		u32 patch_load_addr;
-
 		struct ath10k_hw_params_fw {
 			const char *dir;
 			const char *fw;
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 0816098..e55292f 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -64,6 +64,14 @@ static const struct pci_device_id ath10k_pci_id_table[] = {
 	{0}
 };
 
+static const struct ath10k_pci_supp_chip ath10k_pci_supp_chips[] = {
+	/* QCA988X pre 2.0 chips are not supported because they need some nasty
+	 * hacks. ath10k doesn't have them and these devices crash horribly
+	 * because of that.
+	 */
+	{ QCA988X_2_0_DEVICE_ID, QCA988X_HW_2_0_CHIP_ID_REV },
+};
+
 static void ath10k_pci_buffer_cleanup(struct ath10k *ar);
 static int ath10k_pci_cold_reset(struct ath10k *ar);
 static int ath10k_pci_warm_reset(struct ath10k *ar);
@@ -2467,6 +2475,23 @@ static void ath10k_pci_release(struct ath10k *ar)
 	pci_disable_device(pdev);
 }
 
+static bool ath10k_pci_chip_is_supported(u32 dev_id, u32 chip_id)
+{
+	const struct ath10k_pci_supp_chip *supp_chip;
+	int i;
+	u32 rev_id = MS(chip_id, SOC_CHIP_ID_REV);
+
+	for (i = 0; i < ARRAY_SIZE(ath10k_pci_supp_chips); i++) {
+		supp_chip = &ath10k_pci_supp_chips[i];
+
+		if (supp_chip->dev_id == dev_id &&
+		    supp_chip->rev_id == rev_id)
+			return true;
+	}
+
+	return false;
+}
+
 static int ath10k_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *pci_dev)
 {
@@ -2512,6 +2537,12 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 		goto err_sleep;
 	}
 
+	if (!ath10k_pci_chip_is_supported(pdev->device, chip_id)) {
+		ath10k_err(ar, "device %04x with chip_id %08x isn't supported\n",
+			   pdev->device, chip_id);
+		goto err_sleep;
+	}
+
 	ret = ath10k_pci_alloc_pipes(ar);
 	if (ret) {
 		ath10k_err(ar, "failed to allocate copy engine pipes: %d\n",
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index cf36511..ce4a1ef 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -152,6 +152,11 @@ struct ath10k_pci_pipe {
 	struct tasklet_struct intr;
 };
 
+struct ath10k_pci_supp_chip {
+	u32 dev_id;
+	u32 rev_id;
+};
+
 struct ath10k_pci {
 	struct pci_dev *pdev;
 	struct device *dev;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
