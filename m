Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwr6t-0002Aw-0F
 for ath10k@lists.infradead.org; Thu, 21 Feb 2019 16:22:08 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 2/4] ath10k: sdio: disable fwlog prints
Date: Thu, 21 Feb 2019 18:21:56 +0200
Message-Id: <1550766118-31703-3-git-send-email-kvalo@codeaurora.org>
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
Cc: Alagu Sankar <alagusankar@silex-india.com>, linux-wireless@vger.kernel.org, Wen Gong <wgong@codeaurora.org>

From: Alagu Sankar <alagusankar@silex-india.com>

The SDIO firmware may turn it on based on scratch registers so disable the
firmware log to avoid that.

Co-developed-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 0c62a61b5eac..7ccd6741c5b0 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -648,6 +648,13 @@ static void ath10k_init_sdio(struct ath10k *ar)
 	param &= ~HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
 	param |= HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_SET;
 	ath10k_bmi_write32(ar, hi_acs_flags, param);
+
+	/* Explicitly set fwlog prints to zero as target may turn it on
+	 * based on scratch registers.
+	 */
+	ath10k_bmi_read32(ar, hi_option_flag, &param);
+	param |= HI_OPTION_DISABLE_DBGLOG;
+	ath10k_bmi_write32(ar, hi_option_flag, param);
 }
 
 static int ath10k_init_configure_target(struct ath10k *ar)
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
