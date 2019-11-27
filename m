Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZqQz-0005cF-E7
 for ath10k@lists.infradead.org; Wed, 27 Nov 2019 06:04:18 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: enable wow feature for sdio chip
Date: Wed, 27 Nov 2019 06:04:14 +0000
Message-ID: <0101016eab75cdd3-92ce3745-4eea-4fcb-b829-d9d30d9713cb-000000@us-west-2.amazonses.com>
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
Cc: linux-wireless@vger.kernel.org

sdio does not support wow, this patch is to enable it. When system enter
sleep state, if wowlan is enabled, then sdio chip will keep power if
platform support keep power, after resume, it will not need to re-load
firmware again.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00029.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 60849ab8088f..bd94dbb23741 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1889,7 +1889,7 @@ static void ath10k_sdio_hif_stop(struct ath10k *ar)
 
 static int ath10k_sdio_hif_suspend(struct ath10k *ar)
 {
-	return -EOPNOTSUPP;
+	return 0;
 }
 
 static int ath10k_sdio_hif_resume(struct ath10k *ar)
@@ -2040,7 +2040,26 @@ static const struct ath10k_hif_ops ath10k_sdio_hif_ops = {
  */
 static int ath10k_sdio_pm_suspend(struct device *device)
 {
-	return 0;
+	struct sdio_func *func = dev_to_sdio_func(device);
+	struct ath10k_sdio *ar_sdio = sdio_get_drvdata(func);
+	struct ath10k *ar = ar_sdio->ar;
+	mmc_pm_flag_t pm_flag, pm_caps;
+	int ret;
+
+	if (!device_may_wakeup(ar->dev))
+		return 0;
+
+	pm_flag = MMC_PM_KEEP_POWER;
+
+	ret = sdio_set_host_pm_flags(func, pm_flag);
+	if (ret) {
+		pm_caps = sdio_get_host_pm_caps(func);
+		ath10k_warn(ar, "failed to set sdio host pm flags (0x%x, 0x%x): %d\n",
+			    pm_flag, pm_caps, ret);
+		return ret;
+	}
+
+	return ret;
 }
 
 static int ath10k_sdio_pm_resume(struct device *device)
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
