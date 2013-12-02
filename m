Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22d.google.com ([2a00:1450:4013:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VnRCb-0001DE-1i
 for ath10k@lists.infradead.org; Mon, 02 Dec 2013 10:58:09 +0000
Received: by mail-ea0-f173.google.com with SMTP id g15so8786927eak.4
 for <ath10k@lists.infradead.org>; Mon, 02 Dec 2013 02:57:43 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFC] mac80211: fix rx_nss calculation for drivers with hw rc
Date: Mon,  2 Dec 2013 11:54:07 +0100
Message-Id: <1385981647-4147-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1385739434.8656.0.camel@jlt4.sipsolutions.net>
References: <1385739434.8656.0.camel@jlt4.sipsolutions.net>
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
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Drivers with hardware rate control were given
sta->rx_nss set to 0. This was because rx_nss
calculation procedure was protected by hw/sw rate
control check.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
Hi Johannes,

I've re-checked the issue I've mentioned with the patch 'ath10k: use nss
provided by mac80211'.

Apparently drivers with HW rate control are only affected by this bug
and this patch is what I came up with as a quick fix. Any comments?


 net/mac80211/rate.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/rate.h b/net/mac80211/rate.h
index 5dedc56..32cdbd2 100644
--- a/net/mac80211/rate.h
+++ b/net/mac80211/rate.h
@@ -54,6 +54,8 @@ static inline void rate_control_rate_init(struct sta_info *sta)
 	struct ieee80211_supported_band *sband;
 	struct ieee80211_chanctx_conf *chanctx_conf;
 
+	ieee80211_sta_set_rx_nss(sta);
+
 	if (!ref)
 		return;
 
@@ -67,8 +69,6 @@ static inline void rate_control_rate_init(struct sta_info *sta)
 
 	sband = local->hw.wiphy->bands[chanctx_conf->def.chan->band];
 
-	ieee80211_sta_set_rx_nss(sta);
-
 	ref->ops->rate_init(ref->priv, sband, &chanctx_conf->def, ista,
 			    priv_sta);
 	rcu_read_unlock();
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
