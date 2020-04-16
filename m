Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP330-00045K-VD
 for ath10k@lists.infradead.org; Thu, 16 Apr 2020 11:51:12 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v2 1/4] ath10k: rename ath10k_hif_swap_mailbox() to
 ath10k_hif_start_post()
Date: Thu, 16 Apr 2020 14:50:56 +0300
Message-Id: <1587037859-28873-2-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1587037859-28873-1-git-send-email-kvalo@codeaurora.org>
References: <1587037859-28873-1-git-send-email-kvalo@codeaurora.org>
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

Convert ath10k_hif_swap_mailbox() to a more generic op so that bus drivers can
do more than just swap the mailbox, for example set power save settings like in
the following sdio patch.

No functional changes, compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 2 +-
 drivers/net/wireless/ath/ath10k/hif.h  | 8 ++++----
 drivers/net/wireless/ath/ath10k/sdio.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 52472bbcee1f..5926281c7e05 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2714,7 +2714,7 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 		goto err_hif_stop;
 	}
 
-	status = ath10k_hif_swap_mailbox(ar);
+	status = ath10k_hif_start_post(ar);
 	if (status) {
 		ath10k_err(ar, "failed to swap mailbox: %d\n", status);
 		goto err_hif_stop;
diff --git a/drivers/net/wireless/ath/ath10k/hif.h b/drivers/net/wireless/ath/ath10k/hif.h
index 0dd8973d0acf..2c5d61d98337 100644
--- a/drivers/net/wireless/ath/ath10k/hif.h
+++ b/drivers/net/wireless/ath/ath10k/hif.h
@@ -54,7 +54,7 @@ struct ath10k_hif_ops {
 	 */
 	void (*stop)(struct ath10k *ar);
 
-	int (*swap_mailbox)(struct ath10k *ar);
+	int (*start_post)(struct ath10k *ar);
 
 	int (*get_htt_tx_complete)(struct ath10k *ar);
 
@@ -139,10 +139,10 @@ static inline void ath10k_hif_stop(struct ath10k *ar)
 	return ar->hif.ops->stop(ar);
 }
 
-static inline int ath10k_hif_swap_mailbox(struct ath10k *ar)
+static inline int ath10k_hif_start_post(struct ath10k *ar)
 {
-	if (ar->hif.ops->swap_mailbox)
-		return ar->hif.ops->swap_mailbox(ar);
+	if (ar->hif.ops->start_post)
+		return ar->hif.ops->start_post(ar);
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 943db9f401d8..184b3545324e 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1725,7 +1725,7 @@ static int ath10k_sdio_hif_diag_write_mem(struct ath10k *ar, u32 address,
 	return 0;
 }
 
-static int ath10k_sdio_hif_swap_mailbox(struct ath10k *ar)
+static int ath10k_sdio_hif_start_post(struct ath10k *ar)
 {
 	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
 	u32 addr, val;
@@ -2047,7 +2047,7 @@ static const struct ath10k_hif_ops ath10k_sdio_hif_ops = {
 	.exchange_bmi_msg	= ath10k_sdio_bmi_exchange_msg,
 	.start			= ath10k_sdio_hif_start,
 	.stop			= ath10k_sdio_hif_stop,
-	.swap_mailbox		= ath10k_sdio_hif_swap_mailbox,
+	.start_post		= ath10k_sdio_hif_start_post,
 	.get_htt_tx_complete	= ath10k_sdio_get_htt_tx_complete,
 	.map_service_to_pipe	= ath10k_sdio_hif_map_service_to_pipe,
 	.get_default_pipe	= ath10k_sdio_hif_get_default_pipe,
-- 
2.7.4

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
