Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mta-p5.oit.umn.edu ([134.84.196.205])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4fFS-00052m-JT
 for ath10k@lists.infradead.org; Fri, 15 Mar 2019 05:19:16 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 5D7FDA7F
 for <ath10k@lists.infradead.org>; Fri, 15 Mar 2019 05:19:10 +0000 (UTC)
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bbzKvr13ka82 for <ath10k@lists.infradead.org>;
 Fri, 15 Mar 2019 00:19:10 -0500 (CDT)
Received: from mail-it1-f199.google.com (mail-it1-f199.google.com
 [209.85.166.199])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 251FED30
 for <ath10k@lists.infradead.org>; Fri, 15 Mar 2019 00:19:10 -0500 (CDT)
Received: by mail-it1-f199.google.com with SMTP id j127so6764420itj.7
 for <ath10k@lists.infradead.org>; Thu, 14 Mar 2019 22:19:10 -0700 (PDT)
From: Kangjie Lu <kjlu@umn.edu>
Subject: [PATCH] net: ath: fix missing checks for bmi reads and writes
Date: Fri, 15 Mar 2019 00:19:03 -0500
Message-Id: <20190315051903.10664-1-kjlu@umn.edu>
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
To: kjlu@umn.edu
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, pakki001@umn.edu, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

ath10k_bmi_write32 and ath10k_bmi_read32 can fail. The fix
checks their statuses to avoid potential undefined behaviors.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
---
 drivers/net/wireless/ath/ath10k/core.c | 40 ++++++++++++++++++++------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 835b8de92d55..1bb586f0040e 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -629,13 +629,20 @@ static void ath10k_send_suspend_complete(struct ath10k *ar)
 	complete(&ar->target_suspend);
 }
 
-static void ath10k_init_sdio(struct ath10k *ar)
+static int ath10k_init_sdio(struct ath10k *ar)
 {
+	int ret;
 	u32 param = 0;
 
-	ath10k_bmi_write32(ar, hi_mbox_io_block_sz, 256);
-	ath10k_bmi_write32(ar, hi_mbox_isr_yield_limit, 99);
-	ath10k_bmi_read32(ar, hi_acs_flags, &param);
+	ret = ath10k_bmi_write32(ar, hi_mbox_io_block_sz, 256);
+	if (ret)
+		return ret;
+	ret = ath10k_bmi_write32(ar, hi_mbox_isr_yield_limit, 99);
+	if (ret)
+		return ret;
+	ret = ath10k_bmi_read32(ar, hi_acs_flags, &param);
+	if (ret)
+		return ret;
 
 	/* Data transfer is not initiated, when reduced Tx completion
 	 * is used for SDIO. disable it until fixed
@@ -647,14 +654,22 @@ static void ath10k_init_sdio(struct ath10k *ar)
 	 */
 	param &= ~HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
 	param |= HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_SET;
-	ath10k_bmi_write32(ar, hi_acs_flags, param);
+	ret = ath10k_bmi_write32(ar, hi_acs_flags, param);
+	if (ret)
+		return ret;
 
 	/* Explicitly set fwlog prints to zero as target may turn it on
 	 * based on scratch registers.
 	 */
-	ath10k_bmi_read32(ar, hi_option_flag, &param);
+	ret = ath10k_bmi_read32(ar, hi_option_flag, &param);
+	if (ret)
+		return ret;
 	param |= HI_OPTION_DISABLE_DBGLOG;
-	ath10k_bmi_write32(ar, hi_option_flag, param);
+	ret = ath10k_bmi_write32(ar, hi_option_flag, param);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 static int ath10k_init_configure_target(struct ath10k *ar)
@@ -2500,8 +2515,15 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 		if (status)
 			goto err;
 
-		if (ar->hif.bus == ATH10K_BUS_SDIO)
-			ath10k_init_sdio(ar);
+		if (ar->hif.bus == ATH10K_BUS_SDIO) {
+			status = ath10k_init_sdio(ar);
+			if (status) {
+				ath10k_err(ar,
+					   "could not init HTC (%d)\n",
+					   status);
+				goto err;
+			}
+		}
 	}
 
 	ar->htc.htc_ops.target_send_suspend_complete =
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
