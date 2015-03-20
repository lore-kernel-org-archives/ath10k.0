Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x234.google.com ([2a00:1450:4010:c04::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYxQT-0000W6-KP
 for ath10k@lists.infradead.org; Fri, 20 Mar 2015 13:57:27 +0000
Received: by lbbrr9 with SMTP id rr9so11376220lbb.0
 for <ath10k@lists.infradead.org>; Fri, 20 Mar 2015 06:56:58 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 9/9] ath10k: document ofdm/5ghz rate offset with a macro
Date: Fri, 20 Mar 2015 13:54:15 +0000
Message-Id: <1426859655-11797-10-git-send-email-michal.kazior@tieto.com>
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

Don't use literal values for offsets. While at it
rename a function so it is more clear what it
checks for.

This finally takes care of the last magic
5GHz/OFDM offset.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index c39a300..bdd9baa 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -60,8 +60,11 @@ static struct ieee80211_rate ath10k_rates[] = {
 	{ .bitrate = 540, .hw_value = ATH10K_HW_RATE_OFDM_54M },
 };
 
-#define ath10k_a_rates (ath10k_rates + 4)
-#define ath10k_a_rates_size (ARRAY_SIZE(ath10k_rates) - 4)
+#define ATH10K_MAC_FIRST_OFDM_RATE_IDX 4
+
+#define ath10k_a_rates (ath10k_rates + ATH10K_MAC_FIRST_OFDM_RATE_IDX)
+#define ath10k_a_rates_size (ARRAY_SIZE(ath10k_rates) - \
+			     ATH10K_MAC_FIRST_OFDM_RATE_IDX)
 #define ath10k_g_rates (ath10k_rates + 0)
 #define ath10k_g_rates_size (ARRAY_SIZE(ath10k_rates))
 
@@ -2001,10 +2004,10 @@ static void ath10k_peer_assoc_h_qos(struct ath10k *ar,
 		   sta->addr, !!(arg->peer_flags & WMI_PEER_QOS));
 }
 
-static bool ath10k_mac_sta_has_11g_rates(struct ieee80211_sta *sta)
+static bool ath10k_mac_sta_has_ofdm_only(struct ieee80211_sta *sta)
 {
-	/* First 4 rates in ath10k_rates are CCK (11b) rates. */
-	return sta->supp_rates[IEEE80211_BAND_2GHZ] >> 4;
+	return sta->supp_rates[IEEE80211_BAND_2GHZ] >>
+	       ATH10K_MAC_FIRST_OFDM_RATE_IDX;
 }
 
 static void ath10k_peer_assoc_h_phymode(struct ath10k *ar,
@@ -2026,7 +2029,7 @@ static void ath10k_peer_assoc_h_phymode(struct ath10k *ar,
 				phymode = MODE_11NG_HT40;
 			else
 				phymode = MODE_11NG_HT20;
-		} else if (ath10k_mac_sta_has_11g_rates(sta)) {
+		} else if (ath10k_mac_sta_has_ofdm_only(sta)) {
 			phymode = MODE_11G;
 		} else {
 			phymode = MODE_11B;
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
