Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.adapt-ip.com ([173.164.178.19] helo=web.adapt-ip.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1O28-0008Jy-3n
 for ath10k@lists.infradead.org; Fri, 31 Jul 2020 05:56:45 +0000
From: Thomas Pedersen <thomas@adapt-ip.com>
Subject: [PATCH mac80211-next] ath10k: fix unhandled switch value warning
Date: Thu, 30 Jul 2020 22:56:36 -0700
Message-Id: <20200731055636.795173-1-thomas@adapt-ip.com>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Thomas Pedersen <thomas@adapt-ip.com>, sfr@canb.auug.org.au, linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Cited commit introduced the following warnings:

drivers/net/wireless/ath/ath10k/mac.c: In function 'chan_to_phymode':
drivers/net/wireless/ath/ath10k/mac.c:558:3: warning: enumeration value 'NL80211_CHAN_WIDTH_1' not handled in switch [-Wswitch]
  558 |   switch (chandef->width) {
      |   ^~~~~~
drivers/net/wireless/ath/ath10k/mac.c:558:3: warning: enumeration value 'NL80211_CHAN_WIDTH_2' not handled in switch [-Wswitch]
drivers/net/wireless/ath/ath10k/mac.c:558:3: warning: enumeration value 'NL80211_CHAN_WIDTH_4' not handled in switch [-Wswitch]
drivers/net/wireless/ath/ath10k/mac.c:558:3: warning: enumeration value 'NL80211_CHAN_WIDTH_8' not handled in switch [-Wswitch]
drivers/net/wireless/ath/ath10k/mac.c:558:3: warning: enumeration value 'NL80211_CHAN_WIDTH_16' not handled in switch [-Wswitch]
drivers/net/wireless/ath/ath10k/mac.c:581:3: warning: enumeration value 'NL80211_CHAN_WIDTH_1' not handled in switch [-Wswitch]
  581 |   switch (chandef->width) {
      |   ^~~~~~
drivers/net/wireless/ath/ath10k/mac.c:581:3: warning: enumeration value 'NL80211_CHAN_WIDTH_2' not handled in switch [-Wswitch]
drivers/net/wireless/ath/ath10k/mac.c:581:3: warning: enumeration value 'NL80211_CHAN_WIDTH_4' not handled in switch [-Wswitch]
drivers/net/wireless/ath/ath10k/mac.c:581:3: warning: enumeration value 'NL80211_CHAN_WIDTH_8' not handled in switch [-Wswitch]
drivers/net/wireless/ath/ath10k/mac.c:581:3: warning: enumeration value 'NL80211_CHAN_WIDTH_16' not handled in switch [-Wswitch]

Fix them by making the existing invalid channel width
cases the default, as the introduced channel widths
currently don't make sense in 2 or 5GHz either.

Fixes: e5cb3d34a66d ("nl80211: S1G band and channel definitions")
Signed-off-by: Thomas Pedersen <thomas@adapt-ip.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 919d15584d4a..3c0c33a9f30c 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -568,11 +568,7 @@ chan_to_phymode(const struct cfg80211_chan_def *chandef)
 		case NL80211_CHAN_WIDTH_40:
 			phymode = MODE_11NG_HT40;
 			break;
-		case NL80211_CHAN_WIDTH_5:
-		case NL80211_CHAN_WIDTH_10:
-		case NL80211_CHAN_WIDTH_80:
-		case NL80211_CHAN_WIDTH_80P80:
-		case NL80211_CHAN_WIDTH_160:
+		default:
 			phymode = MODE_UNKNOWN;
 			break;
 		}
@@ -597,8 +593,7 @@ chan_to_phymode(const struct cfg80211_chan_def *chandef)
 		case NL80211_CHAN_WIDTH_80P80:
 			phymode = MODE_11AC_VHT80_80;
 			break;
-		case NL80211_CHAN_WIDTH_5:
-		case NL80211_CHAN_WIDTH_10:
+		default:
 			phymode = MODE_UNKNOWN;
 			break;
 		}
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
