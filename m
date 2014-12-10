Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XygdH-0007vw-Rw
 for ath10k@lists.infradead.org; Wed, 10 Dec 2014 12:44:44 +0000
Received: by mail-wi0-f174.google.com with SMTP id h11so11093129wiw.1
 for <ath10k@lists.infradead.org>; Wed, 10 Dec 2014 04:44:20 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/5] ath10k: improve 11b coex
Date: Wed, 10 Dec 2014 13:31:50 +0100
Message-Id: <1418214714-29689-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1418214714-29689-1-git-send-email-michal.kazior@tieto.com>
References: <1418214714-29689-1-git-send-email-michal.kazior@tieto.com>
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

Some firmware revisions need peer phymode to be
specified as MODE_11B when associating as station
to a 11b AP. Otherwise they can starve other
stations.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index fe61201..950322d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1416,6 +1416,12 @@ static void ath10k_peer_assoc_h_qos(struct ath10k *ar,
 	}
 }
 
+static bool ath10k_mac_sta_has_11g_rates(struct ieee80211_sta *sta)
+{
+	/* First 4 rates in ath10k_rates are CCK (11b) rates. */
+	return sta->supp_rates[IEEE80211_BAND_2GHZ] >> 4;
+}
+
 static void ath10k_peer_assoc_h_phymode(struct ath10k *ar,
 					struct ieee80211_vif *vif,
 					struct ieee80211_sta *sta,
@@ -1430,8 +1436,10 @@ static void ath10k_peer_assoc_h_phymode(struct ath10k *ar,
 				phymode = MODE_11NG_HT40;
 			else
 				phymode = MODE_11NG_HT20;
-		} else {
+		} else if (ath10k_mac_sta_has_11g_rates(sta)) {
 			phymode = MODE_11G;
+		} else {
+			phymode = MODE_11B;
 		}
 
 		break;
@@ -4724,6 +4732,9 @@ static const struct ieee80211_channel ath10k_5ghz_channels[] = {
 	CHAN5G(165, 5825, 0),
 };
 
+/* Note: Be careful if you re-order these. There is code which depends on this
+ * ordering.
+ */
 static struct ieee80211_rate ath10k_rates[] = {
 	/* CCK */
 	RATETAB_ENT(10,  0x82, 0),
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
