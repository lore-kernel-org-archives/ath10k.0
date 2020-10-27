Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXOFd-0004Rj-AA
 for ath10k@lists.infradead.org; Tue, 27 Oct 2020 12:39:01 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 1/2] ath10k: remove repeated words in comments
Date: Tue, 27 Oct 2020 14:38:07 +0200
Message-Id: <1603802288-21158-1-git-send-email-kvalo@codeaurora.org>
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

Found by latest checkpatch.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c    | 2 +-
 drivers/net/wireless/ath/ath10k/debug.c   | 2 +-
 drivers/net/wireless/ath/ath10k/mac.c     | 2 +-
 drivers/net/wireless/ath/ath10k/rx_desc.h | 2 +-
 drivers/net/wireless/ath/ath10k/sdio.c    | 2 +-
 drivers/net/wireless/ath/ath10k/wmi.h     | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index d73ad60b571c..419b06b974c5 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2636,7 +2636,7 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 		if (status)
 			goto err;
 
-		/* Some of of qca988x solutions are having global reset issue
+		/* Some of qca988x solutions are having global reset issue
 		 * during target initialization. Bypassing PLL setting before
 		 * downloading firmware and letting the SoC run on REF_CLK is
 		 * fixing the problem. Corresponding firmware change is also
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index e8250a665433..b72cd81fdc79 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1764,7 +1764,7 @@ static ssize_t ath10k_write_simulate_radar(struct file *file,
 	struct ath10k *ar = file->private_data;
 	struct ath10k_vif *arvif;
 
-	/* Just check for for the first vif alone, as all the vifs will be
+	/* Just check for the first vif alone, as all the vifs will be
 	 * sharing the same channel and if the channel is disabled, all the
 	 * vifs will share the same 'is_started' state.
 	 */
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 2e3eb5bbe49c..c857cf46832d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5457,7 +5457,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	/* Some firmware revisions don't wait for beacon tx completion before
 	 * sending another SWBA event. This could lead to hardware using old
 	 * (freed) beacon data in some cases, e.g. tx credit starvation
-	 * combined with missed TBTT. This is very very rare.
+	 * combined with missed TBTT. This is very rare.
 	 *
 	 * On non-IOMMU-enabled hosts this could be a possible security issue
 	 * because hw could beacon some random data on the air.  On
diff --git a/drivers/net/wireless/ath/ath10k/rx_desc.h b/drivers/net/wireless/ath/ath10k/rx_desc.h
index dec1582005b9..f2b6bf8f0d60 100644
--- a/drivers/net/wireless/ath/ath10k/rx_desc.h
+++ b/drivers/net/wireless/ath/ath10k/rx_desc.h
@@ -68,7 +68,7 @@ struct rx_attention {
  *		first_msdu is set.
  *
  * peer_idx_invalid
- *		Indicates no matching entries within the the max search
+ *		Indicates no matching entries within the max search
  *		count.  Only set when first_msdu is set.
  *
  * peer_idx_timeout
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 81ddaafb6721..59043ec44ca3 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1248,7 +1248,7 @@ static int ath10k_sdio_bmi_exchange_msg(struct ath10k *ar,
 	 *        Wait for first 4 bytes to be in FIFO
 	 *        If CONSERVATIVE_BMI_READ is enabled, also wait for
 	 *        a BMI command credit, which indicates that the ENTIRE
-	 *        response is available in the the FIFO
+	 *        response is available in the FIFO
 	 *
 	 *  CASE 3: length > 128
 	 *        Wait for the first 4 bytes to be in FIFO
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 4898e19b0af6..11300b1320a9 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -3832,7 +3832,7 @@ enum wmi_pdev_param {
 	WMI_PDEV_PARAM_BEACON_TX_MODE,
 	/*
 	 * Resource manager off chan mode .
-	 * 0: turn off off chan mode. 1: turn on offchan mode
+	 * 0: turn off offchan mode. 1: turn on offchan mode
 	 */
 	WMI_PDEV_PARAM_RESMGR_OFFCHAN_MODE,
 	/*
@@ -3936,7 +3936,7 @@ enum wmi_10x_pdev_param {
 	WMI_10X_PDEV_PARAM_BEACON_TX_MODE,
 	/*
 	 * Resource manager off chan mode .
-	 * 0: turn off off chan mode. 1: turn on offchan mode
+	 * 0: turn off offchan mode. 1: turn on offchan mode
 	 */
 	WMI_10X_PDEV_PARAM_RESMGR_OFFCHAN_MODE,
 	/*
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
