Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1AUu-0000nv-H4
 for ath10k@lists.infradead.org; Wed, 17 Dec 2014 09:02:21 +0000
Received: by mail-wi0-f181.google.com with SMTP id r20so15245035wiv.2
 for <ath10k@lists.infradead.org>; Wed, 17 Dec 2014 01:01:58 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH v2] mac80211: notify NSS changed when IBSS and HT
Date: Wed, 17 Dec 2014 10:00:52 +0100
Message-Id: <1418806852-558-1-git-send-email-janusz.dziedzic@tieto.com>
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
To: linux-wireless@vger.kernel.org
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, johannes@sipsolutions.net, ath10k@lists.infradead.org

When using IBSS in HT mode, we always get NSS=1
in rc_update callback. Force NSS recalculation when
rates updated and notify driver that NSS changed.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 net/mac80211/ibss.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/ibss.c b/net/mac80211/ibss.c
index 509bc15..b606b53 100644
--- a/net/mac80211/ibss.c
+++ b/net/mac80211/ibss.c
@@ -1069,9 +1069,16 @@ static void ieee80211_rx_bss_info(struct ieee80211_sub_if_data *sdata,
 		}
 
 		if (sta && rates_updated) {
-			drv_sta_rc_update(local, sdata, &sta->sta,
-					  IEEE80211_RC_SUPP_RATES_CHANGED);
+			u32 changed = IEEE80211_RC_SUPP_RATES_CHANGED;
+			u8 rx_nss = sta->sta.rx_nss;
+
+			/* Force rx_nss recalculation */
+			sta->sta.rx_nss = 0;
 			rate_control_rate_init(sta);
+			if (sta->sta.rx_nss != rx_nss)
+				changed |= IEEE80211_RC_NSS_CHANGED;
+
+			drv_sta_rc_update(local, sdata, &sta->sta, changed);
 		}
 
 		rcu_read_unlock();
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
