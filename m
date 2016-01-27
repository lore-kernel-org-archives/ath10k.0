Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOMrn-0004G6-IG
 for ath10k@lists.infradead.org; Wed, 27 Jan 2016 09:58:25 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH 07/12] ath10k: add clock ctrl related functions in ahb
Date: Wed, 27 Jan 2016 15:24:28 +0530
Message-ID: <1453888473-2879-8-git-send-email-rmani@qti.qualcomm.com>
In-Reply-To: <1453888473-2879-1-git-send-email-rmani@qti.qualcomm.com>
References: <1453888473-2879-1-git-send-email-rmani@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>

pre qca4019 chipsets has/uses internal clock generator for
the operation. But, qca4019 uses external clocks supplied from
outside of target (ie, outside of wifi core). Three different clocks
(cmd clock, ref clock, rtc clock) comes into picture in qca4019.
All those clocks needs to configured with help of global clock
controller (gcc) to make qca4019 functioning.

Add functions for clock init/deinit, clock enable/disable in ahb.
This is just a preparation, functions added in this patch will be
used in later patches.

Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/ahb.c | 123 ++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/ahb.h |   4 ++
 2 files changed, 127 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index eab4b47..11185c0 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -15,6 +15,7 @@
  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 #include <linux/module.h>
+#include <linux/clk.h>
 #include "core.h"
 #include "debug.h"
 #include "pci.h"
@@ -84,6 +85,128 @@ static int ath10k_ahb_get_num_banks(struct ath10k *ar)
 	return 1;
 }
 
+static int ath10k_ahb_clock_init(struct ath10k *ar)
+{
+	struct ath10k_ahb *ar_ahb = ath10k_ahb_priv(ar);
+	struct device *dev;
+	int ret;
+
+	dev = &ar_ahb->pdev->dev;
+
+	ar_ahb->cmd_clk = clk_get(dev, "wifi_wcss_cmd");
+	if (IS_ERR_OR_NULL(ar_ahb->cmd_clk)) {
+		ath10k_err(ar, "failed to get cmd clk: %ld\n",
+			   PTR_ERR(ar_ahb->cmd_clk));
+		ret = ar_ahb->cmd_clk ? PTR_ERR(ar_ahb->cmd_clk) : -ENODEV;
+		goto out;
+	}
+
+	ar_ahb->ref_clk = clk_get(dev, "wifi_wcss_ref");
+	if (IS_ERR_OR_NULL(ar_ahb->ref_clk)) {
+		ath10k_err(ar, "failed to get ref clk: %ld\n",
+			   PTR_ERR(ar_ahb->ref_clk));
+		ret = ar_ahb->ref_clk ? PTR_ERR(ar_ahb->ref_clk) : -ENODEV;
+		goto err_cmd_clk_put;
+	}
+
+	ar_ahb->rtc_clk = clk_get(dev, "wifi_wcss_rtc");
+	if (IS_ERR_OR_NULL(ar_ahb->rtc_clk)) {
+		ath10k_err(ar, "failed to get rtc clk: %ld\n",
+			   PTR_ERR(ar_ahb->rtc_clk));
+		ret = ar_ahb->rtc_clk ? PTR_ERR(ar_ahb->rtc_clk) : -ENODEV;
+		goto err_ref_clk_put;
+	}
+
+	return 0;
+
+err_ref_clk_put:
+	clk_put(ar_ahb->ref_clk);
+
+err_cmd_clk_put:
+	clk_put(ar_ahb->cmd_clk);
+
+out:
+	return ret;
+}
+
+static void ath10k_ahb_clock_deinit(struct ath10k *ar)
+{
+	struct ath10k_ahb *ar_ahb = ath10k_ahb_priv(ar);
+
+	if (!IS_ERR_OR_NULL(ar_ahb->cmd_clk))
+		clk_put(ar_ahb->cmd_clk);
+
+	if (!IS_ERR_OR_NULL(ar_ahb->ref_clk))
+		clk_put(ar_ahb->ref_clk);
+
+	if (!IS_ERR_OR_NULL(ar_ahb->rtc_clk))
+		clk_put(ar_ahb->rtc_clk);
+
+	ar_ahb->cmd_clk = NULL;
+	ar_ahb->ref_clk = NULL;
+	ar_ahb->rtc_clk = NULL;
+}
+
+static int ath10k_ahb_clock_enable(struct ath10k *ar)
+{
+	struct ath10k_ahb *ar_ahb = ath10k_ahb_priv(ar);
+	struct device *dev;
+	int ret;
+
+	dev = &ar_ahb->pdev->dev;
+
+	if (IS_ERR_OR_NULL(ar_ahb->cmd_clk) ||
+	    IS_ERR_OR_NULL(ar_ahb->ref_clk) ||
+	    IS_ERR_OR_NULL(ar_ahb->rtc_clk)) {
+		ath10k_err(ar, "clock(s) is/are not initialized\n");
+		ret = -EIO;
+		goto out;
+	}
+
+	ret = clk_prepare_enable(ar_ahb->cmd_clk);
+	if (ret) {
+		ath10k_err(ar, "failed to enable cmd clk: %d\n", ret);
+		goto out;
+	}
+
+	ret = clk_prepare_enable(ar_ahb->ref_clk);
+	if (ret) {
+		ath10k_err(ar, "failed to enable ref clk: %d\n", ret);
+		goto err_cmd_clk_disable;
+	}
+
+	ret = clk_prepare_enable(ar_ahb->rtc_clk);
+	if (ret) {
+		ath10k_err(ar, "failed to enable rtc clk: %d\n", ret);
+		goto err_ref_clk_disable;
+	}
+
+	return 0;
+
+err_ref_clk_disable:
+	clk_disable_unprepare(ar_ahb->ref_clk);
+
+err_cmd_clk_disable:
+	clk_disable_unprepare(ar_ahb->cmd_clk);
+
+out:
+	return ret;
+}
+
+static void ath10k_ahb_clock_disable(struct ath10k *ar)
+{
+	struct ath10k_ahb *ar_ahb = ath10k_ahb_priv(ar);
+
+	if (!IS_ERR_OR_NULL(ar_ahb->cmd_clk))
+		clk_disable_unprepare(ar_ahb->cmd_clk);
+
+	if (!IS_ERR_OR_NULL(ar_ahb->ref_clk))
+		clk_disable_unprepare(ar_ahb->ref_clk);
+
+	if (!IS_ERR_OR_NULL(ar_ahb->rtc_clk))
+		clk_disable_unprepare(ar_ahb->rtc_clk);
+}
+
 static int ath10k_ahb_probe(struct platform_device *pdev)
 {
 	return 0;
diff --git a/drivers/net/wireless/ath/ath10k/ahb.h b/drivers/net/wireless/ath/ath10k/ahb.h
index 77d15af..753b433 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.h
+++ b/drivers/net/wireless/ath/ath10k/ahb.h
@@ -25,6 +25,10 @@ struct ath10k_ahb {
 	void __iomem *mem;
 	void __iomem *gcc_mem;
 	void __iomem *tcsr_mem;
+
+	struct clk *cmd_clk;
+	struct clk *ref_clk;
+	struct clk *rtc_clk;
 };
 
 #ifdef CONFIG_ATH10K_AHB
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
