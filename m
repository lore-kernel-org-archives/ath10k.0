Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guZK9-0000hB-A9
 for ath10k@lists.infradead.org; Fri, 15 Feb 2019 08:58:22 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] mac80211: Restore vif beacon interval if start ap fails
Date: Fri, 15 Feb 2019 14:16:02 +0530
Message-Id: <1550220362-5573-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org

The starting of AP interface can fail due to invalid
beacon interval, which does not match the minimum gcd
requirement set by the wifi driver. In such case, the
beacon interval of that interface gets updated with
that invalid beacon interval.

The next time that interface is brought up in AP mode,
an interface combination check is performed and the
beacon interval is taken from the previously set value.

In a case where an invalid beacon interval, i.e. a beacon
interval value which does not satisfy the minimum gcd criteria
set by the driver, is set, all the subsequent trials to
bring that interface in AP mode will fail, even if the
subsequent trials have a valid beacon interval.

To avoid this, in case of a failure in bringing up an
interface in AP mode due to interface combination error,
the interface beacon interval which is stored in bss
conf, needs to be restored with the last working value
of beacon interval.

Tested on ath10k using WCN3990.

Fixes: 0c317a02ca98 ("cfg80211: support virtual interfaces with different beacon intervals")
Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 net/mac80211/cfg.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index d65aa01..09dd1c2 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -941,6 +941,7 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
 		      BSS_CHANGED_P2P_PS |
 		      BSS_CHANGED_TXPOWER;
 	int err;
+	int prev_beacon_int;
 
 	old = sdata_dereference(sdata->u.ap.beacon, sdata);
 	if (old)
@@ -963,6 +964,7 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
 
 	sdata->needed_rx_chains = sdata->local->rx_chains;
 
+	prev_beacon_int = sdata->vif.bss_conf.beacon_int;
 	sdata->vif.bss_conf.beacon_int = params->beacon_interval;
 
 	if (params->he_cap)
@@ -974,8 +976,10 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
 	if (!err)
 		ieee80211_vif_copy_chanctx_to_vlans(sdata, false);
 	mutex_unlock(&local->mtx);
-	if (err)
+	if (err) {
+		sdata->vif.bss_conf.beacon_int = prev_beacon_int;
 		return err;
+	}
 
 	/*
 	 * Apply control port protocol, this allows us to
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
