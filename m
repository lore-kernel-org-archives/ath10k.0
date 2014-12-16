Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0nwg-0003Ae-WC
 for ath10k@lists.infradead.org; Tue, 16 Dec 2014 08:57:31 +0000
Received: by mail-wi0-f170.google.com with SMTP id bs8so12925804wib.3
 for <ath10k@lists.infradead.org>; Tue, 16 Dec 2014 00:57:09 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH] mac80211: notify NSS changed when IBSS and HT
Date: Tue, 16 Dec 2014 09:56:05 +0100
Message-Id: <1418720165-19810-1-git-send-email-janusz.dziedzic@tieto.com>
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
 net/mac80211/ibss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/mac80211/ibss.c b/net/mac80211/ibss.c
index 509bc15..d95c2dd 100644
--- a/net/mac80211/ibss.c
+++ b/net/mac80211/ibss.c
@@ -1069,9 +1069,16 @@ static void ieee80211_rx_bss_info(struct ieee80211_sub_if_data *sdata,
 		}
 
 		if (sta && rates_updated) {
+			u8 rx_nss = sta->sta.rx_nss;
+
 			drv_sta_rc_update(local, sdata, &sta->sta,
 					  IEEE80211_RC_SUPP_RATES_CHANGED);
+			/* Force rx_nss recalculation */
+			sta->sta.rx_nss = 0;
 			rate_control_rate_init(sta);
+			if (rx_nss != sta->sta.rx_nss)
+				drv_sta_rc_update(local, sdata, &sta->sta,
+						  IEEE80211_RC_NSS_CHANGED);
 		}
 
 		rcu_read_unlock();
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
