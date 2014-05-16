Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dedo.coelho.fi ([2a01:4f8:d16:bc5::2])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlIcP-0003i5-NZ
 for ath10k@lists.infradead.org; Fri, 16 May 2014 13:56:14 +0000
From: Luca Coelho <luca@coelho.fi>
Date: Fri, 16 May 2014 16:55:34 +0300
Message-Id: <1400248534-16763-1-git-send-email-luca@coelho.fi>
Subject: [PATCH] ath9k/ath10k: remove unnecessary channel_switch_beacon
 callbacks
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
To: ath10k@lists.infradead.org, ath9k-devel@venema.h4ckr.net
Cc: linux-wireless@vger.kernel.org, michal.kazior@tieto.com

From: Luciano Coelho <luciano.coelho@intel.com>

The channel_switch_beacon callback is optional, so it doesn't have to
be defined if it's not going to do anything useful with it.  Both
ath9k and ath10k define the callback and just returns.  This commit
removes them.

Cc: Michal Kazior <michal.kazior@tieto.com>
Signed-off-by: Luciano Coelho <luciano.coelho@intel.com>
---

I'm plannnig to remove the channel_switch_beacon callback (actually,
replace it with a more generic one that can be used for STA and other
iftypes too) and ath9k/ath10k are the only (non) users of it. ;)

 drivers/net/wireless/ath/ath10k/mac.c | 9 ---------
 drivers/net/wireless/ath/ath9k/main.c | 9 ---------
 2 files changed, 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index d1df993..a1c4e5e 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4035,14 +4035,6 @@ static int ath10k_set_bitrate_mask(struct ieee80211_hw *hw,
 					   fixed_nss, force_sgi);
 }
 
-static void ath10k_channel_switch_beacon(struct ieee80211_hw *hw,
-					 struct ieee80211_vif *vif,
-					 struct cfg80211_chan_def *chandef)
-{
-	/* there's no need to do anything here. vif->csa_active is enough */
-	return;
-}
-
 static void ath10k_sta_rc_update(struct ieee80211_hw *hw,
 				 struct ieee80211_vif *vif,
 				 struct ieee80211_sta *sta,
@@ -4158,7 +4150,6 @@ static const struct ieee80211_ops ath10k_ops = {
 	.restart_complete		= ath10k_restart_complete,
 	.get_survey			= ath10k_get_survey,
 	.set_bitrate_mask		= ath10k_set_bitrate_mask,
-	.channel_switch_beacon		= ath10k_channel_switch_beacon,
 	.sta_rc_update			= ath10k_sta_rc_update,
 	.get_tsf			= ath10k_get_tsf,
 #ifdef CONFIG_PM
diff --git a/drivers/net/wireless/ath/ath9k/main.c b/drivers/net/wireless/ath/ath9k/main.c
index 49265c6..8dc9c77 100644
--- a/drivers/net/wireless/ath/ath9k/main.c
+++ b/drivers/net/wireless/ath/ath9k/main.c
@@ -2085,14 +2085,6 @@ static void ath9k_sw_scan_complete(struct ieee80211_hw *hw)
 	clear_bit(ATH_OP_SCANNING, &common->op_flags);
 }
 
-static void ath9k_channel_switch_beacon(struct ieee80211_hw *hw,
-					struct ieee80211_vif *vif,
-					struct cfg80211_chan_def *chandef)
-{
-	/* depend on vif->csa_active only */
-	return;
-}
-
 struct ieee80211_ops ath9k_ops = {
 	.tx 		    = ath9k_tx,
 	.start 		    = ath9k_start,
@@ -2140,5 +2132,4 @@ struct ieee80211_ops ath9k_ops = {
 #endif
 	.sw_scan_start	    = ath9k_sw_scan_start,
 	.sw_scan_complete   = ath9k_sw_scan_complete,
-	.channel_switch_beacon     = ath9k_channel_switch_beacon,
 };
-- 
2.0.0.rc0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
