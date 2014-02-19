Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22e.google.com ([2a00:1450:4013:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG1kr-0006OI-4g
 for ath10k@lists.infradead.org; Wed, 19 Feb 2014 07:39:42 +0000
Received: by mail-ea0-f174.google.com with SMTP id z10so141340ead.5
 for <ath10k@lists.infradead.org>; Tue, 18 Feb 2014 23:39:12 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix sta_rc_update for non-ap iftype
Date: Wed, 19 Feb 2014 08:33:07 +0100
Message-Id: <1392795187-2870-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <CA+BoTQmNdn3ELFRyiMwRE=nq5XukvSy2m7BNoqXnoz95JuDYOw@mail.gmail.com>
References: <CA+BoTQmNdn3ELFRyiMwRE=nq5XukvSy2m7BNoqXnoz95JuDYOw@mail.gmail.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

The arsta structure wasn't initialized for
non-ap interfaces. This should fix related
warnings/crashes.

Reported-By: Ben Greear <greearb@candelatech.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
Ben, does this fix the lockdep splat for you?


 drivers/net/wireless/ath/ath10k/mac.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 94a70a9..9cb3eae 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3207,6 +3207,13 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 	int max_num_peers;
 	int ret = 0;
 
+	if (old_state == IEEE80211_STA_NOTEXIST &&
+	    new_state == IEEE80211_STA_NONE) {
+		memset(arsta, 0, sizeof(*arsta));
+		arsta->arvif = arvif;
+		INIT_WORK(&arsta->update_wk, ath10k_sta_rc_update_wk);
+	}
+
 	/* cancel must be done outside the mutex to avoid deadlock */
 	if ((old_state == IEEE80211_STA_NONE &&
 	     new_state == IEEE80211_STA_NOTEXIST))
@@ -3236,10 +3243,6 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 			   "mac vdev %d peer create %pM (new sta) num_peers %d\n",
 			   arvif->vdev_id, sta->addr, ar->num_peers);
 
-		memset(arsta, 0, sizeof(*arsta));
-		arsta->arvif = arvif;
-		INIT_WORK(&arsta->update_wk, ath10k_sta_rc_update_wk);
-
 		ret = ath10k_peer_create(ar, arvif->vdev_id, sta->addr);
 		if (ret)
 			ath10k_warn("Failed to add peer %pM for vdev %d when adding a new sta: %i\n",
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
