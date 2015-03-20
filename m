Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYxQH-0006cF-A9
 for ath10k@lists.infradead.org; Fri, 20 Mar 2015 13:57:14 +0000
Received: by labjg1 with SMTP id jg1so87650065lab.2
 for <ath10k@lists.infradead.org>; Fri, 20 Mar 2015 06:56:51 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/9] ath10k: drop RATETAB_ENT macro
Date: Fri, 20 Mar 2015 13:54:09 +0000
Message-Id: <1426859655-11797-4-git-send-email-michal.kazior@tieto.com>
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

It was superfluous and confusing. It's better to
define the structure explicitly.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5721196..f4e76e7 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -34,27 +34,22 @@
 /* Rates */
 /*********/
 
-#define RATETAB_ENT(_rate, _rateid, _flags) { \
-	.bitrate		= (_rate), \
-	.flags			= (_flags), \
-	.hw_value		= (_rateid), \
-}
-
 static struct ieee80211_rate ath10k_rates[] = {
 	/* CCK */
-	RATETAB_ENT(10,  0, 0),
-	RATETAB_ENT(20,  0, 0),
-	RATETAB_ENT(55,  0, 0),
-	RATETAB_ENT(110, 0, 0),
+	{ .bitrate = 10 },
+	{ .bitrate = 20 },
+	{ .bitrate = 55 },
+	{ .bitrate = 110 },
+
 	/* OFDM */
-	RATETAB_ENT(60,  0, 0),
-	RATETAB_ENT(90,  0, 0),
-	RATETAB_ENT(120, 0, 0),
-	RATETAB_ENT(180, 0, 0),
-	RATETAB_ENT(240, 0, 0),
-	RATETAB_ENT(360, 0, 0),
-	RATETAB_ENT(480, 0, 0),
-	RATETAB_ENT(540, 0, 0),
+	{ .bitrate = 60 },
+	{ .bitrate = 90 },
+	{ .bitrate = 120 },
+	{ .bitrate = 180 },
+	{ .bitrate = 240 },
+	{ .bitrate = 360 },
+	{ .bitrate = 480 },
+	{ .bitrate = 540 },
 };
 
 #define ath10k_a_rates (ath10k_rates + 4)
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
