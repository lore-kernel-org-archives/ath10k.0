Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goS7L-0003Wj-9E
 for ath10k@lists.infradead.org; Tue, 29 Jan 2019 12:03:52 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: Change swap mail box check after htc ready
Date: Tue, 29 Jan 2019 20:03:12 +0800
Message-Id: <1548763392-3378-1-git-send-email-wgong@codeaurora.org>
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

The swap box flag of firmware is not set before htc ready, then it
will not set swap box flag in ath10k driver, and it will let swap
box setting not same between firmware and ath10k driver, then it
will trigger firmware assert failure.

Check the flag and set swap box after htc ready will fix the firmware
assert failure.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00005-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c |  6 ++++++
 drivers/net/wireless/ath/ath10k/hif.h  |  9 ++++++++
 drivers/net/wireless/ath/ath10k/sdio.c | 38 ++++++++++++++++++++--------------
 3 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 22cbe9a..55fa521 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2534,6 +2534,12 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 		goto err_hif_stop;
 	}
 
+	status = ath10k_hif_swap_mailbox(ar);
+	if (status) {
+		ath10k_err(ar, "failed to swap mailbox: %d\n", status);
+		goto err_hif_stop;
+	}
+
 	if (mode == ATH10K_FIRMWARE_MODE_NORMAL) {
 		status = ath10k_htt_connect(&ar->htt);
 		if (status) {
diff --git a/drivers/net/wireless/ath/ath10k/hif.h b/drivers/net/wireless/ath/ath10k/hif.h
index 1a59ea0..5f7f1e0 100644
--- a/drivers/net/wireless/ath/ath10k/hif.h
+++ b/drivers/net/wireless/ath/ath10k/hif.h
@@ -59,6 +59,8 @@ struct ath10k_hif_ops {
 	 */
 	void (*stop)(struct ath10k *ar);
 
+	int (*swap_mailbox)(struct ath10k *ar);
+
 	int (*map_service_to_pipe)(struct ath10k *ar, u16 service_id,
 				   u8 *ul_pipe, u8 *dl_pipe);
 
@@ -139,6 +141,13 @@ static inline void ath10k_hif_stop(struct ath10k *ar)
 	return ar->hif.ops->stop(ar);
 }
 
+static inline int ath10k_hif_swap_mailbox(struct ath10k *ar)
+{
+	if (ar->hif.ops->swap_mailbox)
+		return ar->hif.ops->swap_mailbox(ar);
+	return 0;
+}
+
 static inline int ath10k_hif_map_service_to_pipe(struct ath10k *ar,
 						 u16 service_id,
 						 u8 *ul_pipe, u8 *dl_pipe)
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 983ecfe..334a147 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1615,12 +1615,33 @@ static int ath10k_sdio_hif_diag_write_mem(struct ath10k *ar, u32 address,
 	return 0;
 }
 
+static int ath10k_sdio_hif_swap_mailbox(struct ath10k *ar)
+{
+	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
+	u32 addr, val;
+	int ret = 0;
+
+	addr = host_interest_item_address(HI_ITEM(hi_acs_flags));
+
+	ret = ath10k_sdio_hif_diag_read32(ar, addr, &val);
+	if (ret) {
+		ath10k_warn(ar, "unable to read hi_acs_flags : %d\n", ret);
+		return ret;
+	}
+
+	if (val & HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_FW_ACK) {
+		ath10k_dbg(ar, ATH10K_DBG_SDIO,
+			   "sdio mailbox swap service enabled\n");
+		ar_sdio->swap_mbox = true;
+	}
+	return 0;
+}
+
 /* HIF start/stop */
 
 static int ath10k_sdio_hif_start(struct ath10k *ar)
 {
 	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
-	u32 addr, val;
 	int ret;
 
 	/* Sleep 20 ms before HIF interrupts are disabled.
@@ -1654,20 +1675,6 @@ static int ath10k_sdio_hif_start(struct ath10k *ar)
 	if (ret)
 		ath10k_warn(ar, "failed to enable sdio interrupts: %d\n", ret);
 
-	addr = host_interest_item_address(HI_ITEM(hi_acs_flags));
-
-	ret = ath10k_sdio_hif_diag_read32(ar, addr, &val);
-	if (ret) {
-		ath10k_warn(ar, "unable to read hi_acs_flags address: %d\n", ret);
-		return ret;
-	}
-
-	if (val & HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_FW_ACK) {
-		ath10k_dbg(ar, ATH10K_DBG_SDIO,
-			   "sdio mailbox swap service enabled\n");
-		ar_sdio->swap_mbox = true;
-	}
-
 	/* Enable sleep and then disable it again */
 	ret = ath10k_sdio_hif_set_mbox_sleep(ar, true);
 	if (ret)
@@ -1898,6 +1905,7 @@ static void ath10k_sdio_hif_send_complete_check(struct ath10k *ar,
 	.exchange_bmi_msg	= ath10k_sdio_bmi_exchange_msg,
 	.start			= ath10k_sdio_hif_start,
 	.stop			= ath10k_sdio_hif_stop,
+	.swap_mailbox		= ath10k_sdio_hif_swap_mailbox,
 	.map_service_to_pipe	= ath10k_sdio_hif_map_service_to_pipe,
 	.get_default_pipe	= ath10k_sdio_hif_get_default_pipe,
 	.send_complete_check	= ath10k_sdio_hif_send_complete_check,
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
