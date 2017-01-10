Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQyjZ-00015C-10
 for ath10k@lists.infradead.org; Tue, 10 Jan 2017 15:53:14 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH] ath10k: Fix Tx legacy rate reporting
Date: Tue, 10 Jan 2017 21:23:23 +0530
Message-ID: <1484063603-13652-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Tx legacy rate is reported 10 fold, as below

iw dev wlan#N station dump | grep "tx bitrate"
        tx bitrate:     240.0 MBit/s

This is because by mistake we muliply by the hardware reported
rate twice by 10, fix this.

Fixes: cec17c382140 ("ath10k: add per peer htt tx stats support for 10.4")
Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index cb86530..ae10fe1 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2247,7 +2247,7 @@ static inline bool is_valid_legacy_rate(u8 rate)
 		rate *= 10;
 		if (rate == 60 && txrate.flags == WMI_RATE_PREAMBLE_CCK)
 			rate = rate - 5;
-		arsta->txrate.legacy = rate * 10;
+		arsta->txrate.legacy = rate;
 	} else if (txrate.flags == WMI_RATE_PREAMBLE_HT) {
 		arsta->txrate.flags = RATE_INFO_FLAGS_MCS;
 		arsta->txrate.mcs = txrate.mcs;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
