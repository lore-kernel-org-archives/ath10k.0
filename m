Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB8DU-0001LO-Fm
 for ath10k@lists.infradead.org; Sat, 13 Oct 2018 00:55:42 +0000
Received: by mail-pf1-x441.google.com with SMTP id f29-v6so6987076pff.5
 for <ath10k@lists.infradead.org>; Fri, 12 Oct 2018 17:55:29 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH 1/4] ath10k: snoc: remove 'wcn3990' from generic resource
 handling
Date: Fri, 12 Oct 2018 17:55:01 -0700
Message-Id: <20181013005504.46399-1-briannorris@chromium.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Govind Singh <govinds@codeaurora.org>, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, Doug Anderson <dianders@chromium.org>, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org

ath10k_wcn3990_clk_info and ath10k_wcn3990_vreg_info are not
WCN3990-specific structures. They hold generic data. So don't name them
with wcn3990 specifics.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 34 +++++++++++++-------------
 drivers/net/wireless/ath/ath10k/snoc.h |  8 +++---
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 8d3d9bca410f..c6254db17dab 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -46,14 +46,14 @@ static char *const ce_name[] = {
 	"WLAN_CE_11",
 };
 
-static struct ath10k_wcn3990_vreg_info vreg_cfg[] = {
+static struct ath10k_vreg_info vreg_cfg[] = {
 	{NULL, "vdd-0.8-cx-mx", 800000, 800000, 0, 0, false},
 	{NULL, "vdd-1.8-xo", 1800000, 1800000, 0, 0, false},
 	{NULL, "vdd-1.3-rfa", 1304000, 1304000, 0, 0, false},
 	{NULL, "vdd-3.3-ch0", 3312000, 3312000, 0, 0, false},
 };
 
-static struct ath10k_wcn3990_clk_info clk_cfg[] = {
+static struct ath10k_clk_info clk_cfg[] = {
 	{NULL, "cxo_ref_clk_pin", 0, false},
 };
 
@@ -1246,7 +1246,7 @@ static void ath10k_snoc_release_resource(struct ath10k *ar)
 }
 
 static int ath10k_get_vreg_info(struct ath10k *ar, struct device *dev,
-				struct ath10k_wcn3990_vreg_info *vreg_info)
+				struct ath10k_vreg_info *vreg_info)
 {
 	struct regulator *reg;
 	int ret = 0;
@@ -1284,7 +1284,7 @@ static int ath10k_get_vreg_info(struct ath10k *ar, struct device *dev,
 }
 
 static int ath10k_get_clk_info(struct ath10k *ar, struct device *dev,
-			       struct ath10k_wcn3990_clk_info *clk_info)
+			       struct ath10k_clk_info *clk_info)
 {
 	struct clk *handle;
 	int ret = 0;
@@ -1311,10 +1311,10 @@ static int ath10k_get_clk_info(struct ath10k *ar, struct device *dev,
 	return ret;
 }
 
-static int ath10k_wcn3990_vreg_on(struct ath10k *ar)
+static int ath10k_snoc_vreg_on(struct ath10k *ar)
 {
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
-	struct ath10k_wcn3990_vreg_info *vreg_info;
+	struct ath10k_vreg_info *vreg_info;
 	int ret = 0;
 	int i;
 
@@ -1376,10 +1376,10 @@ static int ath10k_wcn3990_vreg_on(struct ath10k *ar)
 	return ret;
 }
 
-static int ath10k_wcn3990_vreg_off(struct ath10k *ar)
+static int ath10k_snoc_vreg_off(struct ath10k *ar)
 {
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
-	struct ath10k_wcn3990_vreg_info *vreg_info;
+	struct ath10k_vreg_info *vreg_info;
 	int ret = 0;
 	int i;
 
@@ -1412,10 +1412,10 @@ static int ath10k_wcn3990_vreg_off(struct ath10k *ar)
 	return ret;
 }
 
-static int ath10k_wcn3990_clk_init(struct ath10k *ar)
+static int ath10k_snoc_clk_init(struct ath10k *ar)
 {
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
-	struct ath10k_wcn3990_clk_info *clk_info;
+	struct ath10k_clk_info *clk_info;
 	int ret = 0;
 	int i;
 
@@ -1461,10 +1461,10 @@ static int ath10k_wcn3990_clk_init(struct ath10k *ar)
 	return ret;
 }
 
-static int ath10k_wcn3990_clk_deinit(struct ath10k *ar)
+static int ath10k_snoc_clk_deinit(struct ath10k *ar)
 {
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
-	struct ath10k_wcn3990_clk_info *clk_info;
+	struct ath10k_clk_info *clk_info;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(clk_cfg); i++) {
@@ -1488,18 +1488,18 @@ static int ath10k_hw_power_on(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power on\n");
 
-	ret = ath10k_wcn3990_vreg_on(ar);
+	ret = ath10k_snoc_vreg_on(ar);
 	if (ret)
 		return ret;
 
-	ret = ath10k_wcn3990_clk_init(ar);
+	ret = ath10k_snoc_clk_init(ar);
 	if (ret)
 		goto vreg_off;
 
 	return ret;
 
 vreg_off:
-	ath10k_wcn3990_vreg_off(ar);
+	ath10k_snoc_vreg_off(ar);
 	return ret;
 }
 
@@ -1509,9 +1509,9 @@ static int ath10k_hw_power_off(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power off\n");
 
-	ath10k_wcn3990_clk_deinit(ar);
+	ath10k_snoc_clk_deinit(ar);
 
-	ret = ath10k_wcn3990_vreg_off(ar);
+	ret = ath10k_snoc_vreg_off(ar);
 
 	return ret;
 }
diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
index e1d2d6675556..4a3837b5c68d 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.h
+++ b/drivers/net/wireless/ath/ath10k/snoc.h
@@ -53,7 +53,7 @@ struct ath10k_snoc_ce_irq {
 	u32 irq_line;
 };
 
-struct ath10k_wcn3990_vreg_info {
+struct ath10k_vreg_info {
 	struct regulator *reg;
 	const char *name;
 	u32 min_v;
@@ -63,7 +63,7 @@ struct ath10k_wcn3990_vreg_info {
 	bool required;
 };
 
-struct ath10k_wcn3990_clk_info {
+struct ath10k_clk_info {
 	struct clk *handle;
 	const char *name;
 	u32 freq;
@@ -81,8 +81,8 @@ struct ath10k_snoc {
 	struct ath10k_snoc_ce_irq ce_irqs[CE_COUNT_MAX];
 	struct ath10k_ce ce;
 	struct timer_list rx_post_retry;
-	struct ath10k_wcn3990_vreg_info *vreg;
-	struct ath10k_wcn3990_clk_info *clk;
+	struct ath10k_vreg_info *vreg;
+	struct ath10k_clk_info *clk;
 	struct ath10k_qmi *qmi;
 };
 
-- 
2.19.1.331.ge82ca0e54c-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
