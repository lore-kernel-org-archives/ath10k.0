Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knNZx-0002oB-EJ
 for ath10k@lists.infradead.org; Thu, 10 Dec 2020 15:10:05 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] ath10k: Remove voltage regulator votes during wifi disable
Date: Thu, 10 Dec 2020 20:39:35 +0530
Message-Id: <1607612975-5756-1-git-send-email-pillair@codeaurora.org>
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
Cc: kuabhs@chromium.org, youghand@codeaurora.org, briannorris@chromium.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, Rakesh Pillai <pillair@codeaurora.org>

When the wlan is disabled, i.e when all the interfaces are
deleted, voltage regulator votes are not removed. This leads
to more power consumption even when wlan is disabled.

Move the adding/removing of voltage regulator votes as part
of hif power on/off in SNOC targets, so that these voltage
regulator votes are there only when wlan is enabled.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 97 +++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 48 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index fd41f25..a5443fb 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1003,6 +1003,39 @@ static int ath10k_snoc_wlan_enable(struct ath10k *ar,
 				       NULL);
 }
 
+static int ath10k_hw_power_on(struct ath10k *ar)
+{
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
+	int ret;
+
+	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power on\n");
+
+	ret = regulator_bulk_enable(ar_snoc->num_vregs, ar_snoc->vregs);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(ar_snoc->num_clks, ar_snoc->clks);
+	if (ret)
+		goto vreg_off;
+
+	return ret;
+
+vreg_off:
+	regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
+	return ret;
+}
+
+static int ath10k_hw_power_off(struct ath10k *ar)
+{
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
+
+	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power off\n");
+
+	clk_bulk_disable_unprepare(ar_snoc->num_clks, ar_snoc->clks);
+
+	return regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
+}
+
 static void ath10k_snoc_wlan_disable(struct ath10k *ar)
 {
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
@@ -1024,6 +1057,7 @@ static void ath10k_snoc_hif_power_down(struct ath10k *ar)
 
 	ath10k_snoc_wlan_disable(ar);
 	ath10k_ce_free_rri(ar);
+	ath10k_hw_power_off(ar);
 }
 
 static int ath10k_snoc_hif_power_up(struct ath10k *ar,
@@ -1034,10 +1068,16 @@ static int ath10k_snoc_hif_power_up(struct ath10k *ar,
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "%s:WCN3990 driver state = %d\n",
 		   __func__, ar->state);
 
+	ret = ath10k_hw_power_on(ar);
+	if (ret) {
+		ath10k_err(ar, "failed to power on device: %d\n", ret);
+		return ret;
+	}
+
 	ret = ath10k_snoc_wlan_enable(ar, fw_mode);
 	if (ret) {
 		ath10k_err(ar, "failed to enable wcn3990: %d\n", ret);
-		return ret;
+		goto err_hw_power_off;
 	}
 
 	ath10k_ce_alloc_rri(ar);
@@ -1045,14 +1085,18 @@ static int ath10k_snoc_hif_power_up(struct ath10k *ar,
 	ret = ath10k_snoc_init_pipes(ar);
 	if (ret) {
 		ath10k_err(ar, "failed to initialize CE: %d\n", ret);
-		goto err_wlan_enable;
+		goto err_free_rri;
 	}
 
 	return 0;
 
-err_wlan_enable:
+err_free_rri:
+	ath10k_ce_free_rri(ar);
 	ath10k_snoc_wlan_disable(ar);
 
+err_hw_power_off:
+	ath10k_hw_power_off(ar);
+
 	return ret;
 }
 
@@ -1369,39 +1413,6 @@ static void ath10k_snoc_release_resource(struct ath10k *ar)
 		ath10k_ce_free_pipe(ar, i);
 }
 
-static int ath10k_hw_power_on(struct ath10k *ar)
-{
-	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
-	int ret;
-
-	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power on\n");
-
-	ret = regulator_bulk_enable(ar_snoc->num_vregs, ar_snoc->vregs);
-	if (ret)
-		return ret;
-
-	ret = clk_bulk_prepare_enable(ar_snoc->num_clks, ar_snoc->clks);
-	if (ret)
-		goto vreg_off;
-
-	return ret;
-
-vreg_off:
-	regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
-	return ret;
-}
-
-static int ath10k_hw_power_off(struct ath10k *ar)
-{
-	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
-
-	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power off\n");
-
-	clk_bulk_disable_unprepare(ar_snoc->num_clks, ar_snoc->clks);
-
-	return regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
-}
-
 static void ath10k_msa_dump_memory(struct ath10k *ar,
 				   struct ath10k_fw_crash_data *crash_data)
 {
@@ -1711,22 +1722,16 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_free_irq;
 
-	ret = ath10k_hw_power_on(ar);
-	if (ret) {
-		ath10k_err(ar, "failed to power on device: %d\n", ret);
-		goto err_free_irq;
-	}
-
 	ret = ath10k_setup_msa_resources(ar, msa_size);
 	if (ret) {
 		ath10k_warn(ar, "failed to setup msa resources: %d\n", ret);
-		goto err_power_off;
+		goto err_free_irq;
 	}
 
 	ret = ath10k_fw_init(ar);
 	if (ret) {
 		ath10k_err(ar, "failed to initialize firmware: %d\n", ret);
-		goto err_power_off;
+		goto err_free_irq;
 	}
 
 	ret = ath10k_qmi_init(ar, msa_size);
@@ -1742,9 +1747,6 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 err_fw_deinit:
 	ath10k_fw_deinit(ar);
 
-err_power_off:
-	ath10k_hw_power_off(ar);
-
 err_free_irq:
 	ath10k_snoc_free_irq(ar);
 
@@ -1772,7 +1774,6 @@ static int ath10k_snoc_remove(struct platform_device *pdev)
 	set_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags);
 
 	ath10k_core_unregister(ar);
-	ath10k_hw_power_off(ar);
 	ath10k_fw_deinit(ar);
 	ath10k_snoc_free_irq(ar);
 	ath10k_snoc_release_resource(ar);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
