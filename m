Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQWn0-0004lg-6d
 for ath10k@lists.infradead.org; Wed, 25 Feb 2015 07:53:51 +0000
Received: by lbiw7 with SMTP id w7so2067611lbi.9
 for <ath10k@lists.infradead.org>; Tue, 24 Feb 2015 23:53:28 -0800 (PST)
From: Marek Puzyniak <marek.puzyniak@tieto.com>
Subject: [PATCH v2 3/4] mac80211: initialize rate control earlier for tdls
 station
Date: Wed, 25 Feb 2015 08:55:10 +0100
Message-Id: <1424850911-21017-4-git-send-email-marek.puzyniak@tieto.com>
In-Reply-To: <1424850911-21017-1-git-send-email-marek.puzyniak@tieto.com>
References: <1424850911-21017-1-git-send-email-marek.puzyniak@tieto.com>
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
To: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>

Currently when TDLS station in driver goes from assoc
to authorized state it can not use rate control parameters
because rate control is not initialized yet. Some drivers
require parameters already initialized by rate control when
entering authorized state. It can be done by initializing
rate control after station transition to authorized state
but before notifying driver about that.

Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
---
 net/mac80211/cfg.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index dd4ff36..ae24ed3 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -983,12 +983,21 @@ static int sta_apply_auth_flags(struct ieee80211_local *local,
 	}
 
 	if (mask & BIT(NL80211_STA_FLAG_AUTHORIZED)) {
-		if (set & BIT(NL80211_STA_FLAG_AUTHORIZED))
+		if (set & BIT(NL80211_STA_FLAG_AUTHORIZED)) {
+			/*
+			 * When peer becomes authorized, init rate control as
+			 * well. Some drivers require rate control initialized
+			 * before drv_sta_state() is called.
+			 */
+			if (test_sta_flag(sta, WLAN_STA_TDLS_PEER))
+				rate_control_rate_init(sta);
+
 			ret = sta_info_move_state(sta, IEEE80211_STA_AUTHORIZED);
-		else if (test_sta_flag(sta, WLAN_STA_AUTHORIZED))
+		} else if (test_sta_flag(sta, WLAN_STA_AUTHORIZED)) {
 			ret = sta_info_move_state(sta, IEEE80211_STA_ASSOC);
-		else
+		} else {
 			ret = 0;
+		}
 		if (ret)
 			return ret;
 	}
@@ -1377,11 +1386,6 @@ static int ieee80211_change_station(struct wiphy *wiphy,
 	if (err)
 		goto out_err;
 
-	/* When peer becomes authorized, init rate control as well */
-	if (test_sta_flag(sta, WLAN_STA_TDLS_PEER) &&
-	    test_sta_flag(sta, WLAN_STA_AUTHORIZED))
-		rate_control_rate_init(sta);
-
 	mutex_unlock(&local->sta_mtx);
 
 	if ((sdata->vif.type == NL80211_IFTYPE_AP ||
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
