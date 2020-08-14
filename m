Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6cMx-0002vy-14
 for ath10k@lists.infradead.org; Fri, 14 Aug 2020 16:15:52 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH] ath10k: move enable_pll_clk call to ath10k_core_start()
Date: Fri, 14 Aug 2020 19:15:45 +0300
Message-Id: <1597421745-4329-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

There's no reason to have call for enable_pll_clk in ath10k_bmi_start(), move
it to ath10k_core_start() instead. This way it's possible to call
ath10k_bmi_start() from sdio.c during firmware dump creation. And also the
function call is more visible when it's in core.c.

No functional changes, compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/bmi.c  | 8 --------
 drivers/net/wireless/ath/ath10k/core.c | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/bmi.c b/drivers/net/wireless/ath/ath10k/bmi.c
index 5b6db6e66f65..8b9d537c8900 100644
--- a/drivers/net/wireless/ath/ath10k/bmi.c
+++ b/drivers/net/wireless/ath/ath10k/bmi.c
@@ -12,17 +12,9 @@
 
 void ath10k_bmi_start(struct ath10k *ar)
 {
-	int ret;
-
 	ath10k_dbg(ar, ATH10K_DBG_BMI, "bmi start\n");
 
 	ar->bmi.done_sent = false;
-
-	/* Enable hardware clock to speed up firmware download */
-	if (ar->hw_params.hw_ops->enable_pll_clk) {
-		ret = ar->hw_params.hw_ops->enable_pll_clk(ar);
-		ath10k_dbg(ar, ATH10K_DBG_BMI, "bmi enable pll ret %d\n", ret);
-	}
 }
 
 int ath10k_bmi_done(struct ath10k *ar)
diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 22b6937ac225..029ae1c4d8dc 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2614,6 +2614,13 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 		      ar->running_fw->fw_file.fw_features)) {
 		ath10k_bmi_start(ar);
 
+		/* Enable hardware clock to speed up firmware download */
+		if (ar->hw_params.hw_ops->enable_pll_clk) {
+			status = ar->hw_params.hw_ops->enable_pll_clk(ar);
+			ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot enable pll ret %d\n",
+				   status);
+		}
+
 		if (ath10k_init_configure_target(ar)) {
 			status = -EINVAL;
 			goto err;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
