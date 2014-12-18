Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1fac-0005to-F5
 for ath10k@lists.infradead.org; Thu, 18 Dec 2014 18:14:18 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH] ath10k: set phymode to 11b when NO_OFDM flag set
Date: Thu, 18 Dec 2014 10:13:00 -0800
Message-ID: <1418926380-22206-1-git-send-email-poh@qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org

phymode should use 11b only if NO_OFDM flags is set.
Hence check up channel flag for NO_OFDM and set to
11b.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 42f6a4d..c68beac 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -269,7 +269,10 @@ chan_to_phymode(const struct cfg80211_chan_def *chandef)
 	case IEEE80211_BAND_2GHZ:
 		switch (chandef->width) {
 		case NL80211_CHAN_WIDTH_20_NOHT:
-			phymode = MODE_11G;
+			if (chandef->chan->flags & IEEE80211_CHAN_NO_OFDM)
+				phymode = MODE_11B;
+			else
+				phymode = MODE_11G;
 			break;
 		case NL80211_CHAN_WIDTH_20:
 			phymode = MODE_11NG_HT20;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
