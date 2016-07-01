Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIwIl-0004H5-Tf
 for ath10k@lists.infradead.org; Fri, 01 Jul 2016 11:08:04 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH] ath10k: Fix possible wrong rx_busy time reporting in QCA4019
Date: Fri, 1 Jul 2016 16:37:25 +0530
Message-ID: <1467371245-5426-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

As hw cycle counters in QCA4019 wraparound independantly in QCA4019
it is possible cycle counter and rx clear counter would wraparound
at the same time. Current logic assumes only one of the counters
would wraparound at anytime. Fix this by moving 'else' part to
another 'if'.

Fixes: 8e100354a98 ("ath10k: fix cycle counter wraparound handling for QCA4019")
Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/hw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index bd86e7a..7462627 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -198,7 +198,8 @@ void ath10k_hw_fill_survey_time(struct ath10k *ar, struct survey_info *survey,
 		case ATH10K_HW_CC_WRAP_SHIFTED_EACH:
 			if (cc < cc_prev)
 				cc_fix = 0x7fffffff;
-			else
+
+			if (rcc < rcc_prev)
 				rcc_fix = 0x7fffffff;
 			break;
 		case ATH10K_HW_CC_WRAP_DISABLED:
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
