Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwr6v-0002By-AS
 for ath10k@lists.infradead.org; Thu, 21 Feb 2019 16:22:12 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 3/4] ath10k: sdio: reset chip on power_down()
Date: Thu, 21 Feb 2019 18:21:57 +0200
Message-Id: <1550766118-31703-4-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1550766118-31703-1-git-send-email-kvalo@codeaurora.org>
References: <1550766118-31703-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Wen Gong <wgong@codeaurora.org>

From: Wen Gong <wgong@codeaurora.org>

The target device needs to be reset during power_down(), otherwise only the
first power_up() will work. And as ath10k calls power_up() during driver
initialisation the driver would be otherwise unusable.

Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00005-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index d62502f386f2..fae56c67766f 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1382,6 +1382,12 @@ static int ath10k_sdio_hif_power_up(struct ath10k *ar,
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "sdio power on\n");
 
+	ret = ath10k_sdio_config(ar);
+	if (ret) {
+		ath10k_err(ar, "failed to config sdio: %d\n", ret);
+		return ret;
+	}
+
 	sdio_claim_host(func);
 
 	ret = sdio_enable_func(func);
@@ -1419,11 +1425,19 @@ static void ath10k_sdio_hif_power_down(struct ath10k *ar)
 
 	/* Disable the card */
 	sdio_claim_host(ar_sdio->func);
+
 	ret = sdio_disable_func(ar_sdio->func);
-	sdio_release_host(ar_sdio->func);
+	if (ret) {
+		ath10k_warn(ar, "unable to disable sdio function: %d\n", ret);
+		sdio_release_host(ar_sdio->func);
+		return;
+	}
 
+	ret = mmc_hw_reset(ar_sdio->func->card->host);
 	if (ret)
-		ath10k_warn(ar, "unable to disable sdio function: %d\n", ret);
+		ath10k_warn(ar, "unable to reset sdio: %d\n", ret);
+
+	sdio_release_host(ar_sdio->func);
 
 	ar_sdio->is_disabled = true;
 }
@@ -2028,12 +2042,6 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 
 	ath10k_sdio_set_mbox_info(ar);
 
-	ret = ath10k_sdio_config(ar);
-	if (ret) {
-		ath10k_err(ar, "failed to config sdio: %d\n", ret);
-		goto err_free_wq;
-	}
-
 	bus_params.dev_type = ATH10K_DEV_TYPE_HL;
 	/* TODO: don't know yet how to get chip_id with SDIO */
 	bus_params.chip_id = 0;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
