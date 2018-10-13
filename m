Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB8DV-0001LQ-8M
 for ath10k@lists.infradead.org; Sat, 13 Oct 2018 00:55:42 +0000
Received: by mail-pl1-x642.google.com with SMTP id f8-v6so6668573plb.2
 for <ath10k@lists.infradead.org>; Fri, 12 Oct 2018 17:55:30 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH 2/4] ath10k: snoc: fix unabalanced regulator error handling
Date: Fri, 12 Oct 2018 17:55:02 -0700
Message-Id: <20181013005504.46399-2-briannorris@chromium.org>
In-Reply-To: <20181013005504.46399-1-briannorris@chromium.org>
References: <20181013005504.46399-1-briannorris@chromium.org>
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

If a regulator fails to set its voltage, we end up with an unbalanced
call to regulator_disable(), because the error path starts with the
current regulator (which was never enabled).

Factor out the "on" function to perform (and unwind if failed) a single
regulator at a time, and then main loop (ath10k_snoc_vreg_on()) can just
worry about unwinding the regulators that were already enabled.

It also helps to factor out the "off" function, to avoid repeating some
code here.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 129 ++++++++++++++-----------
 1 file changed, 75 insertions(+), 54 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index c6254db17dab..b63ae8b006b4 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1311,6 +1311,76 @@ static int ath10k_get_clk_info(struct ath10k *ar, struct device *dev,
 	return ret;
 }
 
+static int __ath10k_snoc_vreg_on(struct ath10k *ar,
+				 struct ath10k_vreg_info *vreg_info)
+{
+	int ret;
+
+	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc regulator %s being enabled\n",
+		   vreg_info->name);
+
+	ret = regulator_set_voltage(vreg_info->reg, vreg_info->min_v,
+				    vreg_info->max_v);
+	if (ret) {
+		ath10k_err(ar,
+			   "failed to set regulator %s voltage-min: %d voltage-max: %d\n",
+			   vreg_info->name, vreg_info->min_v, vreg_info->max_v);
+		return ret;
+	}
+
+	if (vreg_info->load_ua) {
+		ret = regulator_set_load(vreg_info->reg, vreg_info->load_ua);
+		if (ret < 0) {
+			ath10k_err(ar, "failed to set regulator %s load: %d\n",
+				   vreg_info->name, vreg_info->load_ua);
+			goto err_set_load;
+		}
+	}
+
+	ret = regulator_enable(vreg_info->reg);
+	if (ret) {
+		ath10k_err(ar, "failed to enable regulator %s\n",
+			   vreg_info->name);
+		goto err_enable;
+	}
+
+	if (vreg_info->settle_delay)
+		udelay(vreg_info->settle_delay);
+
+	return 0;
+
+err_enable:
+	regulator_set_load(vreg_info->reg, 0);
+err_set_load:
+	regulator_set_voltage(vreg_info->reg, 0, vreg_info->max_v);
+
+	return ret;
+}
+
+static int __ath10k_snoc_vreg_off(struct ath10k *ar,
+				  struct ath10k_vreg_info *vreg_info)
+{
+	int ret;
+
+	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc regulator %s being disabled\n",
+		   vreg_info->name);
+
+	ret = regulator_disable(vreg_info->reg);
+	if (ret)
+		ath10k_err(ar, "failed to disable regulator %s\n",
+			   vreg_info->name);
+
+	ret = regulator_set_load(vreg_info->reg, 0);
+	if (ret < 0)
+		ath10k_err(ar, "failed to set load %s\n", vreg_info->name);
+
+	ret = regulator_set_voltage(vreg_info->reg, 0, vreg_info->max_v);
+	if (ret)
+		ath10k_err(ar, "failed to set voltage %s\n", vreg_info->name);
+
+	return ret;
+}
+
 static int ath10k_snoc_vreg_on(struct ath10k *ar)
 {
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
@@ -1324,53 +1394,21 @@ static int ath10k_snoc_vreg_on(struct ath10k *ar)
 		if (!vreg_info->reg)
 			continue;
 
-		ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc regulator %s being enabled\n",
-			   vreg_info->name);
-
-		ret = regulator_set_voltage(vreg_info->reg, vreg_info->min_v,
-					    vreg_info->max_v);
-		if (ret) {
-			ath10k_err(ar,
-				   "failed to set regulator %s voltage-min: %d voltage-max: %d\n",
-				   vreg_info->name, vreg_info->min_v, vreg_info->max_v);
-			goto err_reg_config;
-		}
-
-		if (vreg_info->load_ua) {
-			ret = regulator_set_load(vreg_info->reg,
-						 vreg_info->load_ua);
-			if (ret < 0) {
-				ath10k_err(ar,
-					   "failed to set regulator %s load: %d\n",
-					   vreg_info->name,
-					   vreg_info->load_ua);
-				goto err_reg_config;
-			}
-		}
-
-		ret = regulator_enable(vreg_info->reg);
-		if (ret) {
-			ath10k_err(ar, "failed to enable regulator %s\n",
-				   vreg_info->name);
+		ret = __ath10k_snoc_vreg_on(ar, vreg_info);
+		if (ret)
 			goto err_reg_config;
-		}
-
-		if (vreg_info->settle_delay)
-			udelay(vreg_info->settle_delay);
 	}
 
 	return 0;
 
 err_reg_config:
-	for (; i >= 0; i--) {
+	for (i = i - 1; i >= 0; i--) {
 		vreg_info = &ar_snoc->vreg[i];
 
 		if (!vreg_info->reg)
 			continue;
 
-		regulator_disable(vreg_info->reg);
-		regulator_set_load(vreg_info->reg, 0);
-		regulator_set_voltage(vreg_info->reg, 0, vreg_info->max_v);
+		__ath10k_snoc_vreg_off(ar, vreg_info);
 	}
 
 	return ret;
@@ -1389,24 +1427,7 @@ static int ath10k_snoc_vreg_off(struct ath10k *ar)
 		if (!vreg_info->reg)
 			continue;
 
-		ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc regulator %s being disabled\n",
-			   vreg_info->name);
-
-		ret = regulator_disable(vreg_info->reg);
-		if (ret)
-			ath10k_err(ar, "failed to disable regulator %s\n",
-				   vreg_info->name);
-
-		ret = regulator_set_load(vreg_info->reg, 0);
-		if (ret < 0)
-			ath10k_err(ar, "failed to set load %s\n",
-				   vreg_info->name);
-
-		ret = regulator_set_voltage(vreg_info->reg, 0,
-					    vreg_info->max_v);
-		if (ret)
-			ath10k_err(ar, "failed to set voltage %s\n",
-				   vreg_info->name);
+		ret = __ath10k_snoc_vreg_off(ar, vreg_info);
 	}
 
 	return ret;
-- 
2.19.1.331.ge82ca0e54c-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
