Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhFeU-0001Fx-HA
 for ath10k@lists.infradead.org; Tue, 06 Sep 2016 12:38:59 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] ath10k: use devm_clk_get() instead of clk_get()
Date: Tue,  6 Sep 2016 21:39:56 +0900
Message-Id: <1473165598-28683-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1473165598-28683-1-git-send-email-yamada.masahiro@socionext.com>
References: <1473165598-28683-1-git-send-email-yamada.masahiro@socionext.com>
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
To: linux-wireless@vger.kernel.org
Cc: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Kalle Valo <kvalo@qca.qualcomm.com>, Johannes Berg <johannes@sipsolutions.net>

Use the managed variant of clk_get() to simplify the failure path
and the .remove callback.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/net/wireless/ath/ath10k/ahb.c | 34 ++++++----------------------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index acec16b..8a55c0c 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -91,59 +91,37 @@ static int ath10k_ahb_clock_init(struct ath10k *ar)
 {
 	struct ath10k_ahb *ar_ahb = ath10k_ahb_priv(ar);
 	struct device *dev;
-	int ret;
 
 	dev = &ar_ahb->pdev->dev;
 
-	ar_ahb->cmd_clk = clk_get(dev, "wifi_wcss_cmd");
+	ar_ahb->cmd_clk = devm_clk_get(dev, "wifi_wcss_cmd");
 	if (IS_ERR_OR_NULL(ar_ahb->cmd_clk)) {
 		ath10k_err(ar, "failed to get cmd clk: %ld\n",
 			   PTR_ERR(ar_ahb->cmd_clk));
-		ret = ar_ahb->cmd_clk ? PTR_ERR(ar_ahb->cmd_clk) : -ENODEV;
-		goto out;
+		return ar_ahb->cmd_clk ? PTR_ERR(ar_ahb->cmd_clk) : -ENODEV;
 	}
 
-	ar_ahb->ref_clk = clk_get(dev, "wifi_wcss_ref");
+	ar_ahb->ref_clk = devm_clk_get(dev, "wifi_wcss_ref");
 	if (IS_ERR_OR_NULL(ar_ahb->ref_clk)) {
 		ath10k_err(ar, "failed to get ref clk: %ld\n",
 			   PTR_ERR(ar_ahb->ref_clk));
-		ret = ar_ahb->ref_clk ? PTR_ERR(ar_ahb->ref_clk) : -ENODEV;
-		goto err_cmd_clk_put;
+		return ar_ahb->ref_clk ? PTR_ERR(ar_ahb->ref_clk) : -ENODEV;
 	}
 
-	ar_ahb->rtc_clk = clk_get(dev, "wifi_wcss_rtc");
+	ar_ahb->rtc_clk = devm_clk_get(dev, "wifi_wcss_rtc");
 	if (IS_ERR_OR_NULL(ar_ahb->rtc_clk)) {
 		ath10k_err(ar, "failed to get rtc clk: %ld\n",
 			   PTR_ERR(ar_ahb->rtc_clk));
-		ret = ar_ahb->rtc_clk ? PTR_ERR(ar_ahb->rtc_clk) : -ENODEV;
-		goto err_ref_clk_put;
+		return ar_ahb->rtc_clk ? PTR_ERR(ar_ahb->rtc_clk) : -ENODEV;
 	}
 
 	return 0;
-
-err_ref_clk_put:
-	clk_put(ar_ahb->ref_clk);
-
-err_cmd_clk_put:
-	clk_put(ar_ahb->cmd_clk);
-
-out:
-	return ret;
 }
 
 static void ath10k_ahb_clock_deinit(struct ath10k *ar)
 {
 	struct ath10k_ahb *ar_ahb = ath10k_ahb_priv(ar);
 
-	if (!IS_ERR_OR_NULL(ar_ahb->cmd_clk))
-		clk_put(ar_ahb->cmd_clk);
-
-	if (!IS_ERR_OR_NULL(ar_ahb->ref_clk))
-		clk_put(ar_ahb->ref_clk);
-
-	if (!IS_ERR_OR_NULL(ar_ahb->rtc_clk))
-		clk_put(ar_ahb->rtc_clk);
-
 	ar_ahb->cmd_clk = NULL;
 	ar_ahb->ref_clk = NULL;
 	ar_ahb->rtc_clk = NULL;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
