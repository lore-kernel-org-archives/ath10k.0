Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x235.google.com ([2a00:1450:4010:c04::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPrLF-0007mA-EQ
 for ath10k@lists.infradead.org; Thu, 13 Aug 2015 12:10:43 +0000
Received: by lbbsx3 with SMTP id sx3so25792108lbb.0
 for <ath10k@lists.infradead.org>; Thu, 13 Aug 2015 05:10:19 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: split ap/ibss wep key install process
Date: Thu, 13 Aug 2015 14:10:46 +0200
Message-Id: <1439467846-8351-1-git-send-email-michal.kazior@tieto.com>
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

Apparently it's not safe to install both pairwise
and groupwise keys on AP vdevs as it can cause
traffic to stop working in some multi-vif
(WPA+WEP) cases.

Fixes: ce90b27128c2 ("ath10k: fix multiple key static wep with ibss")
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 44 +++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index acd222f3b899..eabfe68a1c48 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -247,6 +247,10 @@ static int ath10k_install_peer_wep_keys(struct ath10k_vif *arvif,
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	if (WARN_ON(arvif->vif->type != NL80211_IFTYPE_AP &&
+		    arvif->vif->type != NL80211_IFTYPE_ADHOC))
+		return -EINVAL;
+
 	spin_lock_bh(&ar->data_lock);
 	peer = ath10k_peer_find(ar, arvif->vdev_id, addr);
 	spin_unlock_bh(&ar->data_lock);
@@ -258,21 +262,34 @@ static int ath10k_install_peer_wep_keys(struct ath10k_vif *arvif,
 		if (arvif->wep_keys[i] == NULL)
 			continue;
 
-		flags = 0;
-		flags |= WMI_KEY_PAIRWISE;
+		switch (arvif->vif->type) {
+		case NL80211_IFTYPE_AP:
+			flags = WMI_KEY_PAIRWISE;
 
-		ret = ath10k_install_key(arvif, arvif->wep_keys[i], SET_KEY,
-					 addr, flags);
-		if (ret < 0)
-			return ret;
+			if (arvif->def_wep_key_idx == i)
+				flags |= WMI_KEY_TX_USAGE;
 
-		flags = 0;
-		flags |= WMI_KEY_GROUP;
+			ret = ath10k_install_key(arvif, arvif->wep_keys[i],
+						 SET_KEY, addr, flags);
+			if (ret < 0)
+				return ret;
+			break;
+		case NL80211_IFTYPE_ADHOC:
+			ret = ath10k_install_key(arvif, arvif->wep_keys[i],
+						 SET_KEY, addr,
+						 WMI_KEY_PAIRWISE);
+			if (ret < 0)
+				return ret;
 
-		ret = ath10k_install_key(arvif, arvif->wep_keys[i], SET_KEY,
-					 addr, flags);
-		if (ret < 0)
-			return ret;
+			ret = ath10k_install_key(arvif, arvif->wep_keys[i],
+						 SET_KEY, addr, WMI_KEY_GROUP);
+			if (ret < 0)
+				return ret;
+			break;
+		default:
+			WARN_ON(1);
+			return -EINVAL;
+		}
 
 		spin_lock_bh(&ar->data_lock);
 		peer->keys[i] = arvif->wep_keys[i];
@@ -287,6 +304,9 @@ static int ath10k_install_peer_wep_keys(struct ath10k_vif *arvif,
 	 *
 	 * FIXME: Revisit. Perhaps this can be done in a less hacky way.
 	 */
+	if (arvif->vif->type != NL80211_IFTYPE_ADHOC)
+		return 0;
+
 	if (arvif->def_wep_key_idx == -1)
 		return 0;
 
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
