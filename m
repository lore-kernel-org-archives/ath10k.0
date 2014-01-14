Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2xeH-00025E-Ct
 for ath10k@lists.infradead.org; Tue, 14 Jan 2014 06:38:54 +0000
Received: by mail-pa0-f47.google.com with SMTP id kp14so2500199pab.34
 for <ath10k@lists.infradead.org>; Mon, 13 Jan 2014 22:38:29 -0800 (PST)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH] ath10k: use VHT phymodes for 20/40MHz channels
Date: Tue, 14 Jan 2014 12:08:17 +0530
Message-Id: <1389681497-18267-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

chandef does not provide 11n / 11ac split. Use the highest
phymodes for 20/40MHz channels, firmware can operate on.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 7aa6c4d..e0b1a2a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -256,10 +256,10 @@ chan_to_phymode(const struct cfg80211_chan_def *chandef)
 			phymode = MODE_11A;
 			break;
 		case NL80211_CHAN_WIDTH_20:
-			phymode = MODE_11NA_HT20;
+			phymode = MODE_11AC_VHT20;
 			break;
 		case NL80211_CHAN_WIDTH_40:
-			phymode = MODE_11NA_HT40;
+			phymode = MODE_11AC_VHT40;
 			break;
 		case NL80211_CHAN_WIDTH_80:
 			phymode = MODE_11AC_VHT80;
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
