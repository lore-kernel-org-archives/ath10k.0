Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1allZE-00018q-BD
 for ath10k@lists.infradead.org; Thu, 31 Mar 2016 22:59:56 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  Clean up peer when sta goes away.
Date: Thu, 31 Mar 2016 15:59:11 -0700
Message-Id: <1459465151-24874-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

If WMI and/or firmware has issues removing the peer object,
then we still need to clean up the peer object in the driver.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 07b155d..3ec973e 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6500,9 +6500,15 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 				continue;
 
 			if (peer->sta == sta) {
-				ath10k_warn(ar, "found sta peer %pM id: %d entry on vdev %i after it was supposedly removed\n",
-					    sta->addr, i, arvif->vdev_id);
+				ath10k_warn(ar, "found sta peer %p %pM id: %d entry on vdev %i after it was supposedly removed\n",
+					    peer, sta->addr, i, arvif->vdev_id);
 				peer->sta = NULL;
+
+				/* Clean up the peer object as well since we must have failed to do this above. */
+				list_del(&peer->list);
+				ar->peer_map[i] = NULL;
+				kfree(peer);
+				ar->num_peers--;
 			}
 		}
 		spin_unlock_bh(&ar->data_lock);
-- 
2.4.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
