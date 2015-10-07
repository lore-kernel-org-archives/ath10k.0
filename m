Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zjgzn-0001b5-CW
 for ath10k@lists.infradead.org; Wed, 07 Oct 2015 05:10:32 +0000
From: <c_traja@qti.qualcomm.com>
Subject: [PATCH] Revert "mac80211: remove exposing 'mfp' to drivers"
Date: Wed, 7 Oct 2015 10:40:04 +0530
Message-ID: <1444194604-12637-1-git-send-email-c_traja@qti.qualcomm.com>
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
To: johannes@sipsolutions.net, ath10k@lists.infradead.org
Cc: Tamizh chelvam <c_traja@qti.qualcomm.com>, linux-wireless@vger.kernel.org

From: Tamizh chelvam <c_traja@qti.qualcomm.com>

This reverts commit 5c48f1201744233d4f235c7dd916d5196ed20716.

Some device drivers (ath10k) offload part of aggregation including AddBA/DelBA
negotiations to firmware. In such scenario, the PMF configuration of
the station needs to be provided to driver to enable encryption of
AddBA/DelBA action frames.

Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
---
Notes:
	> ath10k change using this mfp configuration will follow.

 include/net/mac80211.h |    2 ++
 net/mac80211/cfg.c     |    1 +
 net/mac80211/mlme.c    |    6 +++++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 4ec6fed..1bb2a2b 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -1683,6 +1683,7 @@ struct ieee80211_sta_rates {
  * @tdls: indicates whether the STA is a TDLS peer
  * @tdls_initiator: indicates the STA is an initiator of the TDLS link. Only
  *	valid if the STA is a TDLS peer in the first place.
+ * @mfp: indicates whether the STA uses management frame protection or not.
  * @txq: per-TID data TX queues (if driver uses the TXQ abstraction)
  */
 struct ieee80211_sta {
@@ -1700,6 +1701,7 @@ struct ieee80211_sta {
 	struct ieee80211_sta_rates __rcu *rates;
 	bool tdls;
 	bool tdls_initiator;
+	bool mfp;
 
 	struct ieee80211_txq *txq[IEEE80211_NUM_TIDS];
 
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 68e551e..63d03da 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1138,6 +1138,7 @@ static int sta_apply_parameters(struct ieee80211_local *local,
 	}
 
 	if (mask & BIT(NL80211_STA_FLAG_MFP)) {
+		sta->sta.mfp = !!(set & BIT(NL80211_STA_FLAG_MFP));
 		if (set & BIT(NL80211_STA_FLAG_MFP))
 			set_sta_flag(sta, WLAN_STA_MFP);
 		else
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 56ef9a8..9c450ff 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -3044,8 +3044,12 @@ static bool ieee80211_assoc_success(struct ieee80211_sub_if_data *sdata,
 
 	rate_control_rate_init(sta);
 
-	if (ifmgd->flags & IEEE80211_STA_MFP_ENABLED)
+	if (ifmgd->flags & IEEE80211_STA_MFP_ENABLED) {
 		set_sta_flag(sta, WLAN_STA_MFP);
+		sta->sta.mfp = true;
+	} else {
+		sta->sta.mfp = false;
+	}
 
 	sta->sta.wme = elems.wmm_param && local->hw.queues >= IEEE80211_NUM_ACS;
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
