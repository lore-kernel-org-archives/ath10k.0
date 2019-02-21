Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwr6r-0002Af-VS
 for ath10k@lists.infradead.org; Thu, 21 Feb 2019 16:22:07 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 1/4] ath10k: sdio: set hi_acs_flags
Date: Thu, 21 Feb 2019 18:21:55 +0200
Message-Id: <1550766118-31703-2-git-send-email-kvalo@codeaurora.org>
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

The SDIO firmware does not allow transmitting packets with the
reduced tx completion HI_ACS option. SDIO firmware uses 1544 as
alternate credit size, which is not big enough for the maximum sized
mac80211 frames. Disable both these HI_ACS flags for SDIO.

Co-developed-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index ac2cf3f1c7b4..0c62a61b5eac 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -637,10 +637,16 @@ static void ath10k_init_sdio(struct ath10k *ar)
 	ath10k_bmi_write32(ar, hi_mbox_isr_yield_limit, 99);
 	ath10k_bmi_read32(ar, hi_acs_flags, &param);
 
-	param |= (HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_SET |
-		  HI_ACS_FLAGS_SDIO_REDUCE_TX_COMPL_SET |
-		  HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE);
+	/* Data transfer is not initiated, when reduced Tx completion
+	 * is used for SDIO. disable it until fixed
+	 */
+	param &= ~HI_ACS_FLAGS_SDIO_REDUCE_TX_COMPL_SET;
 
+	/* Alternate credit size of 1544 as used by SDIO firmware is
+	 * not big enough for mac80211 / native wifi frames. disable it
+	 */
+	param &= ~HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
+	param |= HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_SET;
 	ath10k_bmi_write32(ar, hi_acs_flags, param);
 }
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
