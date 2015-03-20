Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x234.google.com ([2a00:1450:4010:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYxQK-0006cl-KP
 for ath10k@lists.infradead.org; Fri, 20 Mar 2015 13:57:17 +0000
Received: by lagg8 with SMTP id g8so87676098lag.1
 for <ath10k@lists.infradead.org>; Fri, 20 Mar 2015 06:56:53 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 5/9] ath10k: use hw rate definitions for fixed rate
Date: Fri, 20 Mar 2015 13:54:11 +0000
Message-Id: <1426859655-11797-6-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1426859655-11797-1-git-send-email-michal.kazior@tieto.com>
References: <1426859655-11797-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Using raw values is discouraged. Having
defines/enums is preferred.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index f4e76e7..72fbdc2 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4972,20 +4972,18 @@ exit:
 
 /* Helper table for legacy fixed_rate/bitrate_mask */
 static const u8 cck_ofdm_rate[] = {
-	/* CCK */
-	3, /* 1Mbps */
-	2, /* 2Mbps */
-	1, /* 5.5Mbps */
-	0, /* 11Mbps */
-	/* OFDM */
-	3, /* 6Mbps */
-	7, /* 9Mbps */
-	2, /* 12Mbps */
-	6, /* 18Mbps */
-	1, /* 24Mbps */
-	5, /* 36Mbps */
-	0, /* 48Mbps */
-	4, /* 54Mbps */
+	ATH10K_HW_RATE_CCK_LP_1M,
+	ATH10K_HW_RATE_CCK_LP_2M,
+	ATH10K_HW_RATE_CCK_LP_5_5M,
+	ATH10K_HW_RATE_CCK_LP_11M,
+	ATH10K_HW_RATE_OFDM_6M,
+	ATH10K_HW_RATE_OFDM_9M,
+	ATH10K_HW_RATE_OFDM_12M,
+	ATH10K_HW_RATE_OFDM_18M,
+	ATH10K_HW_RATE_OFDM_24M,
+	ATH10K_HW_RATE_OFDM_36M,
+	ATH10K_HW_RATE_OFDM_48M,
+	ATH10K_HW_RATE_OFDM_54M,
 };
 
 /* Check if only one bit set */
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
