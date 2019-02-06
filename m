Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grM6J-0006iz-LR
 for ath10k@lists.infradead.org; Wed, 06 Feb 2019 12:14:49 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v3 1/3] ath10k: Enable bus layer suspend/resume for WCN3990
Date: Wed,  6 Feb 2019 17:44:31 +0530
Message-Id: <20190206121433.11606-2-govinds@codeaurora.org>
In-Reply-To: <20190206121433.11606-1-govinds@codeaurora.org>
References: <20190206121433.11606-1-govinds@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

Register snoc bus layer suspend/resume PM ops and configure
the wakeup source(CE2) for the device.

Testing:
    Tested on WCN3990 HW.
    Tested FW: WLAN.HL.2.0-01192-QCAHLSWMTPLZ-1.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 45 ++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index dad7e1ce79c0..60e0f46cfdd9 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -30,6 +30,7 @@
 
 #define ATH10K_SNOC_RX_POST_RETRY_MS 50
 #define CE_POLL_PIPE 4
+#define ATH10K_SNOC_WAKE_IRQ 2
 
 static char *const ce_name[] = {
 	"WLAN_CE_0",
@@ -1041,6 +1042,46 @@ static int ath10k_snoc_hif_power_up(struct ath10k *ar)
 	return ret;
 }
 
+#ifdef CONFIG_PM
+static int ath10k_snoc_hif_suspend(struct ath10k *ar)
+{
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
+	int ret;
+
+	if (!device_may_wakeup(ar->dev))
+		return -EPERM;
+
+	ret = enable_irq_wake(ar_snoc->ce_irqs[ATH10K_SNOC_WAKE_IRQ].irq_line);
+	if (ret) {
+		ath10k_err(ar, "failed to enable wakeup irq :%d\n", ret);
+		return ret;
+	}
+
+	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc device suspended\n");
+
+	return ret;
+}
+
+static int ath10k_snoc_hif_resume(struct ath10k *ar)
+{
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
+	int ret;
+
+	if (!device_may_wakeup(ar->dev))
+		return -EPERM;
+
+	ret = disable_irq_wake(ar_snoc->ce_irqs[ATH10K_SNOC_WAKE_IRQ].irq_line);
+	if (ret) {
+		ath10k_err(ar, "failed to disable wakeup irq: %d\n", ret);
+		return ret;
+	}
+
+	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc device resumed\n");
+
+	return ret;
+}
+#endif
+
 static const struct ath10k_hif_ops ath10k_snoc_hif_ops = {
 	.read32		= ath10k_snoc_read32,
 	.write32	= ath10k_snoc_write32,
@@ -1054,6 +1095,10 @@ static const struct ath10k_hif_ops ath10k_snoc_hif_ops = {
 	.send_complete_check	= ath10k_snoc_hif_send_complete_check,
 	.get_free_queue_number	= ath10k_snoc_hif_get_free_queue_number,
 	.get_target_info	= ath10k_snoc_hif_get_target_info,
+#ifdef CONFIG_PM
+	.suspend                = ath10k_snoc_hif_suspend,
+	.resume                 = ath10k_snoc_hif_resume,
+#endif
 };
 
 static const struct ath10k_bus_ops ath10k_snoc_bus_ops = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
