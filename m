Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1am6Su-0000oE-9f
 for ath10k@lists.infradead.org; Fri, 01 Apr 2016 21:18:48 +0000
From: greearb@candelatech.com
Subject: [PATCH v2 4/5] ath10k:  Clean up peer when sta goes away.
Date: Fri,  1 Apr 2016 14:12:11 -0700
Message-Id: <1459545132-11295-4-git-send-email-greearb@candelatech.com>
In-Reply-To: <1459545132-11295-1-git-send-email-greearb@candelatech.com>
References: <1459545132-11295-1-git-send-email-greearb@candelatech.com>
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
 drivers/net/wireless/ath/ath10k/mac.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5e5cc9c..020dd25 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6501,9 +6501,17 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 				continue;
 
 			if (peer->sta == sta) {
-				ath10k_warn(ar, "found sta peer %pM id: %d entry on vdev %i after it was supposedly removed\n",
-					    sta->addr, i, arvif->vdev_id);
+				ath10k_warn(ar, "found sta peer %pM (ptr %p id %d) entry on vdev %i after it was supposedly removed\n",
+					    sta->addr, peer, i, arvif->vdev_id);
 				peer->sta = NULL;
+
+				/* Clean up the peer object as well since we
+				 * must have failed to do this above.
+				 */
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
