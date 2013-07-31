Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4SCA-0007fS-6W
 for ath10k@lists.infradead.org; Wed, 31 Jul 2013 08:55:47 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/5] ath10k: advertise more conservative intf combinations
Date: Wed, 31 Jul 2013 10:55:13 +0200
Message-ID: <1375260915-22500-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1375260915-22500-1-git-send-email-michal.kazior@tieto.com>
References: <1375260915-22500-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Apparently the available firmware has a limit of
handling 7 APs, 3 GOs or 8 STAs. This is based on
empirical tests and it is still possible some
combinations may crash the firmware.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 1ea386e..6a130c5 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3078,9 +3078,15 @@ static const struct ieee80211_iface_limit ath10k_if_limits[] = {
 	.max	= 8,
 	.types	= BIT(NL80211_IFTYPE_STATION)
 		| BIT(NL80211_IFTYPE_P2P_CLIENT)
-		| BIT(NL80211_IFTYPE_P2P_GO)
-		| BIT(NL80211_IFTYPE_AP)
-	}
+	},
+	{
+	.max	= 3,
+	.types	= BIT(NL80211_IFTYPE_P2P_GO)
+	},
+	{
+	.max	= 7,
+	.types	= BIT(NL80211_IFTYPE_AP)
+	},
 };
 
 static const struct ieee80211_iface_combination ath10k_if_comb = {
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
