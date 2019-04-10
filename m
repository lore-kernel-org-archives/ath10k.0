Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE4tE-0005Za-28
 for ath10k@lists.infradead.org; Wed, 10 Apr 2019 04:31:16 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: change swap mail box config for UTF mode of SDIO
Date: Wed, 10 Apr 2019 12:30:54 +0800
Message-Id: <1554870654-4236-1-git-send-email-wgong@codeaurora.org>
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

For SDIO chip, it does not have HTT connect step in boot phase of UTF
mode, so it does not need the swap configuration for UTF mode, otherwise
it will trigger UTF load fail. For normal mode, it is swap between HTT
and WMI, for UTF mode, it does not have HTT, so it can not swap between
HTT and WMI.

Disable swap mail box for UTF mode will let UTF mode load success.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 11 ++++++++---
 drivers/net/wireless/ath/ath10k/sdio.c |  5 +++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 835b8de..79a238c 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -629,7 +629,7 @@ static void ath10k_send_suspend_complete(struct ath10k *ar)
 	complete(&ar->target_suspend);
 }
 
-static void ath10k_init_sdio(struct ath10k *ar)
+static void ath10k_init_sdio(struct ath10k *ar, enum ath10k_firmware_mode mode)
 {
 	u32 param = 0;
 
@@ -646,7 +646,12 @@ static void ath10k_init_sdio(struct ath10k *ar)
 	 * not big enough for mac80211 / native wifi frames. disable it
 	 */
 	param &= ~HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
-	param |= HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_SET;
+
+	if (mode == ATH10K_FIRMWARE_MODE_UTF)
+		param &= ~HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_SET;
+	else
+		param |= HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_SET;
+
 	ath10k_bmi_write32(ar, hi_acs_flags, param);
 
 	/* Explicitly set fwlog prints to zero as target may turn it on
@@ -2501,7 +2506,7 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 			goto err;
 
 		if (ar->hif.bus == ATH10K_BUS_SDIO)
-			ath10k_init_sdio(ar);
+			ath10k_init_sdio(ar, mode);
 	}
 
 	ar->htc.htc_ops.target_send_suspend_complete =
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index fae56c6..bfb125b 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1637,7 +1637,12 @@ static int ath10k_sdio_hif_swap_mailbox(struct ath10k *ar)
 		ath10k_dbg(ar, ATH10K_DBG_SDIO,
 			   "sdio mailbox swap service enabled\n");
 		ar_sdio->swap_mbox = true;
+	} else {
+		ath10k_dbg(ar, ATH10K_DBG_SDIO,
+			"sdio mailbox swap service disabled\n");
+		ar_sdio->swap_mbox = false;
 	}
+
 	return 0;
 }
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
