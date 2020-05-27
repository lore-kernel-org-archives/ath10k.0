Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdzN9-0008TV-De
 for ath10k@lists.infradead.org; Wed, 27 May 2020 16:57:45 +0000
Received: by mail-pj1-x1044.google.com with SMTP id k2so723977pjs.2
 for <ath10k@lists.infradead.org>; Wed, 27 May 2020 09:57:42 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH] Revert "ath: add support for special 0x0 regulatory domain"
Date: Wed, 27 May 2020 09:57:18 -0700
Message-Id: <20200527165718.129307-1-briannorris@chromium.org>
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
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Wen Gong <wgong@codeaurora.org>

This reverts commit 2dc016599cfa9672a147528ca26d70c3654a5423.

Users are reporting regressions in regulatory domain detection and
channel availability.

The problem this was trying to resolve was fixed in firmware anyway:

    QCA6174 hw3.0: sdio-4.4.1: add firmware.bin_WLAN.RMH.4.4.1-00042
    https://github.com/kvalo/ath10k-firmware/commit/4d382787f0efa77dba40394e0bc604f8eff82552

Link: https://bbs.archlinux.org/viewtopic.php?id=254535
Link: http://lists.infradead.org/pipermail/ath10k/2020-April/014871.html
Link: http://lists.infradead.org/pipermail/ath10k/2020-May/015152.html
Fixes: 2dc016599cfa ("ath: add support for special 0x0 regulatory domain")
Cc: <stable@vger.kernel.org>
Cc: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/regd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/regd.c b/drivers/net/wireless/ath/regd.c
index bee9110b91f3..20f4f8ea9f89 100644
--- a/drivers/net/wireless/ath/regd.c
+++ b/drivers/net/wireless/ath/regd.c
@@ -666,14 +666,14 @@ ath_regd_init_wiphy(struct ath_regulatory *reg,
 
 /*
  * Some users have reported their EEPROM programmed with
- * 0x8000 or 0x0 set, this is not a supported regulatory
- * domain but since we have more than one user with it we
- * need a solution for them. We default to 0x64, which is
- * the default Atheros world regulatory domain.
+ * 0x8000 set, this is not a supported regulatory domain
+ * but since we have more than one user with it we need
+ * a solution for them. We default to 0x64, which is the
+ * default Atheros world regulatory domain.
  */
 static void ath_regd_sanitize(struct ath_regulatory *reg)
 {
-	if (reg->current_rd != COUNTRY_ERD_FLAG && reg->current_rd != 0)
+	if (reg->current_rd != COUNTRY_ERD_FLAG)
 		return;
 	printk(KERN_DEBUG "ath: EEPROM regdomain sanitized\n");
 	reg->current_rd = 0x64;
-- 
2.27.0.rc0.183.gde8f92d652-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
