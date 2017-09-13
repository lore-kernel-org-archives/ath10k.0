Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dsCvh-0004GF-PH
 for ath10k@lists.infradead.org; Wed, 13 Sep 2017 19:02:35 +0000
Received: by mail-pf0-x241.google.com with SMTP id q76so432198pfq.5
 for <ath10k@lists.infradead.org>; Wed, 13 Sep 2017 12:02:13 -0700 (PDT)
From: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH] ath10k: make ath10k_hw_ce_regs const
Date: Thu, 14 Sep 2017 00:31:52 +0530
Message-Id: <1505329312-26432-1-git-send-email-bhumirks@gmail.com>
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
To: julia.lawall@lip6.fr, kvalo@qca.qualcomm.com, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>

Make them const as they are not modified in the file referencing
them. They are only stored in the const field 'hw_ce_reg' of an ath10k
structure. Also, make the declarations in the header const.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/net/wireless/ath/ath10k/hw.c | 4 ++--
 drivers/net/wireless/ath/ath10k/hw.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index a860691..07df7c6 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -310,7 +310,7 @@
 	.wm_high	= &wcn3990_dst_wm_high,
 };
 
-struct ath10k_hw_ce_regs wcn3990_ce_regs = {
+const struct ath10k_hw_ce_regs wcn3990_ce_regs = {
 	.sr_base_addr		= 0x00000000,
 	.sr_size_addr		= 0x00000008,
 	.dr_base_addr		= 0x0000000c,
@@ -457,7 +457,7 @@ struct ath10k_hw_ce_regs wcn3990_ce_regs = {
 	.wm_high	= &qcax_dst_wm_high,
 };
 
-struct ath10k_hw_ce_regs qcax_ce_regs = {
+const struct ath10k_hw_ce_regs qcax_ce_regs = {
 	.sr_base_addr		= 0x00000000,
 	.sr_size_addr		= 0x00000004,
 	.dr_base_addr		= 0x00000008,
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 0c089f6..f80840f 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -369,8 +369,8 @@ struct ath10k_hw_values {
 extern const struct ath10k_hw_values qca9888_values;
 extern const struct ath10k_hw_values qca4019_values;
 extern const struct ath10k_hw_values wcn3990_values;
-extern struct ath10k_hw_ce_regs wcn3990_ce_regs;
-extern struct ath10k_hw_ce_regs qcax_ce_regs;
+extern const struct ath10k_hw_ce_regs wcn3990_ce_regs;
+extern const struct ath10k_hw_ce_regs qcax_ce_regs;
 
 void ath10k_hw_fill_survey_time(struct ath10k *ar, struct survey_info *survey,
 				u32 cc, u32 rcc, u32 cc_prev, u32 rcc_prev);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
