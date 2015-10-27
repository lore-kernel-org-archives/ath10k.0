Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x242.google.com ([2a00:1450:400c:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zr9XY-0001Ym-HU
 for ath10k@lists.infradead.org; Tue, 27 Oct 2015 19:04:13 +0000
Received: by wicuk10 with SMTP id uk10so29539152wic.1
 for <ath10k@lists.infradead.org>; Tue, 27 Oct 2015 12:03:50 -0700 (PDT)
From: Punit Vara <punitvara@gmail.com>
Subject: [RESEND PATCH 03/10] net: wireless: rtwifi: Remove duplicated
 arguments to |
Date: Wed, 28 Oct 2015 00:32:38 +0530
Message-Id: <1445972565-14963-3-git-send-email-punitvara@gmail.com>
In-Reply-To: <1445972565-14963-1-git-send-email-punitvara@gmail.com>
References: <1445972565-14963-1-git-send-email-punitvara@gmail.com>
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
To: kvalo@qca.qualcomm.com
Cc: netdev@vger.kernel.org, Punit Vara <punitvara@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Remove uncessary repeated arguments COMP_EFUSE, COMP_REGD, COMP_CHAN
 with OR(|)

This is patch to the debug.c file that removes following warning
reported by coccicheck:

-duplicated argument to & or |

Signed-off-by: Punit Vara <punitvara@gmail.com>
---
 drivers/net/wireless/rtlwifi/debug.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/rtlwifi/debug.c b/drivers/net/wireless/rtlwifi/debug.c
index fd25aba..b8f5540 100644
--- a/drivers/net/wireless/rtlwifi/debug.c
+++ b/drivers/net/wireless/rtlwifi/debug.c
@@ -37,9 +37,9 @@ void rtl_dbgp_flag_init(struct ieee80211_hw *hw)
 	    COMP_BEACON | COMP_RATE | COMP_RXDESC | COMP_DIG | COMP_TXAGC |
 	    COMP_POWER | COMP_POWER_TRACKING | COMP_BB_POWERSAVING | COMP_SWAS |
 	    COMP_RF | COMP_TURBO | COMP_RATR | COMP_CMD |
-	    COMP_EFUSE | COMP_QOS | COMP_MAC80211 | COMP_REGD | COMP_CHAN |
-	    COMP_EASY_CONCURRENT | COMP_EFUSE | COMP_QOS | COMP_MAC80211 |
-	    COMP_REGD | COMP_CHAN | COMP_BT_COEXIST;
+	    COMP_EFUSE | COMP_QOS | COMP_MAC80211 | COMP_CHAN |
+	    COMP_EASY_CONCURRENT | COMP_QOS | COMP_MAC80211 |
+	    COMP_REGD | COMP_BT_COEXIST;
 
 
 	for (i = 0; i < DBGP_TYPE_MAX; i++)
-- 
2.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
