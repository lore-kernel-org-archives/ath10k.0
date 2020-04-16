Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP331-00045P-EA
 for ath10k@lists.infradead.org; Thu, 16 Apr 2020 11:51:13 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v2 4/4] ath10k: hif: make send_complete_check op optional
Date: Thu, 16 Apr 2020 14:50:59 +0300
Message-Id: <1587037859-28873-5-git-send-email-kvalo@codeaurora.org>
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

That way we don't need to have an empty function in sdio.c.

No functional changes, compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/hif.h  |  3 ++-
 drivers/net/wireless/ath/ath10k/sdio.c | 12 ------------
 drivers/net/wireless/ath/ath10k/usb.c  | 12 ------------
 3 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hif.h b/drivers/net/wireless/ath/ath10k/hif.h
index 2c5d61d98337..9e45fd9073a6 100644
--- a/drivers/net/wireless/ath/ath10k/hif.h
+++ b/drivers/net/wireless/ath/ath10k/hif.h
@@ -170,7 +170,8 @@ static inline void ath10k_hif_get_default_pipe(struct ath10k *ar,
 static inline void ath10k_hif_send_complete_check(struct ath10k *ar,
 						  u8 pipe_id, int force)
 {
-	ar->hif.ops->send_complete_check(ar, pipe_id, force);
+	if (ar->hif.ops->send_complete_check)
+		ar->hif.ops->send_complete_check(ar, pipe_id, force);
 }
 
 static inline u16 ath10k_hif_get_free_queue_number(struct ath10k *ar,
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 884e1a85e29f..e2aff2254a40 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2101,17 +2101,6 @@ static void ath10k_sdio_hif_get_default_pipe(struct ath10k *ar,
 	*dl_pipe = 0;
 }
 
-/* This op is currently only used by htc_wait_target if the HTC ready
- * message times out. It is not applicable for SDIO since there is nothing
- * we can do if the HTC ready message does not arrive in time.
- * TODO: Make this op non mandatory by introducing a NULL check in the
- * hif op wrapper.
- */
-static void ath10k_sdio_hif_send_complete_check(struct ath10k *ar,
-						u8 pipe, int force)
-{
-}
-
 static const struct ath10k_hif_ops ath10k_sdio_hif_ops = {
 	.tx_sg			= ath10k_sdio_hif_tx_sg,
 	.diag_read		= ath10k_sdio_hif_diag_read,
@@ -2123,7 +2112,6 @@ static const struct ath10k_hif_ops ath10k_sdio_hif_ops = {
 	.get_htt_tx_complete	= ath10k_sdio_get_htt_tx_complete,
 	.map_service_to_pipe	= ath10k_sdio_hif_map_service_to_pipe,
 	.get_default_pipe	= ath10k_sdio_hif_get_default_pipe,
-	.send_complete_check	= ath10k_sdio_hif_send_complete_check,
 	.power_up		= ath10k_sdio_hif_power_up,
 	.power_down		= ath10k_sdio_hif_power_down,
 #ifdef CONFIG_PM
diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index 1e0343081be9..b7daf344d012 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -693,17 +693,6 @@ static int ath10k_usb_hif_map_service_to_pipe(struct ath10k *ar, u16 svc_id,
 	return 0;
 }
 
-/* This op is currently only used by htc_wait_target if the HTC ready
- * message times out. It is not applicable for USB since there is nothing
- * we can do if the HTC ready message does not arrive in time.
- * TODO: Make this op non mandatory by introducing a NULL check in the
- * hif op wrapper.
- */
-static void ath10k_usb_hif_send_complete_check(struct ath10k *ar,
-					       u8 pipe, int force)
-{
-}
-
 static int ath10k_usb_hif_power_up(struct ath10k *ar,
 				   enum ath10k_firmware_mode fw_mode)
 {
@@ -737,7 +726,6 @@ static const struct ath10k_hif_ops ath10k_usb_hif_ops = {
 	.stop			= ath10k_usb_hif_stop,
 	.map_service_to_pipe	= ath10k_usb_hif_map_service_to_pipe,
 	.get_default_pipe	= ath10k_usb_hif_get_default_pipe,
-	.send_complete_check	= ath10k_usb_hif_send_complete_check,
 	.get_free_queue_number	= ath10k_usb_hif_get_free_queue_number,
 	.power_up		= ath10k_usb_hif_power_up,
 	.power_down		= ath10k_usb_hif_power_down,
-- 
2.7.4

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
