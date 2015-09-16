Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zc0HI-0000BO-Ab
 for ath10k@lists.infradead.org; Wed, 16 Sep 2015 00:08:48 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  Fix CCK rate definitions.
Date: Tue, 15 Sep 2015 17:08:18 -0700
Message-Id: <1442362098-24859-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

The old values did NOT match what is found in 10.1.467
firmware.  I figure it is likely it is wrong for the others
as well.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/hw.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 4c5eee4..710ca32 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -202,13 +202,13 @@ enum ath10k_hw_rate_ofdm {
 };
 
 enum ath10k_hw_rate_cck {
-	ATH10K_HW_RATE_CCK_LP_11M = 0,
-	ATH10K_HW_RATE_CCK_LP_5_5M,
-	ATH10K_HW_RATE_CCK_LP_2M,
-	ATH10K_HW_RATE_CCK_LP_1M,
-	ATH10K_HW_RATE_CCK_SP_11M,
-	ATH10K_HW_RATE_CCK_SP_5_5M,
-	ATH10K_HW_RATE_CCK_SP_2M,
+	ATH10K_HW_RATE_CCK_LP_11M = 0x40,
+	ATH10K_HW_RATE_CCK_LP_5_5M = 0x41,
+	ATH10K_HW_RATE_CCK_LP_2M = 0x42,
+	ATH10K_HW_RATE_CCK_LP_1M = 0x43,
+	ATH10K_HW_RATE_CCK_SP_11M = ATH10K_HW_RATE_CCK_LP_11M | 0x4,
+	ATH10K_HW_RATE_CCK_SP_5_5M = ATH10K_HW_RATE_CCK_LP_5_5M | 0x4,
+	ATH10K_HW_RATE_CCK_SP_2M = ATH10K_HW_RATE_CCK_LP_2M | 0x4,
 };
 
 /* Target specific defines for MAIN firmware */
-- 
2.4.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
