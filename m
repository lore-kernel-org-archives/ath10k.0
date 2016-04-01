Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1am6NJ-0000lj-W5
 for ath10k@lists.infradead.org; Fri, 01 Apr 2016 21:13:02 +0000
From: greearb@candelatech.com
Subject: [PATCH v2 2/5] ath10k:  Ensure peer_map references are cleaned up.
Date: Fri,  1 Apr 2016 14:12:09 -0700
Message-Id: <1459545132-11295-2-git-send-email-greearb@candelatech.com>
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

While debugging OS crashes due to firmware crashes, I enabled
kasan, and it noticed that peer objects were being used-after-freed.

Looks like there are two places we could be leaving stale references
in the peer-map, so clean that up.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8783119..5e5cc9c 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -794,6 +794,7 @@ static void ath10k_peer_cleanup(struct ath10k *ar, u32 vdev_id)
 {
 	struct ath10k_peer *peer, *tmp;
 	int peer_id;
+	int i;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
@@ -812,6 +813,17 @@ static void ath10k_peer_cleanup(struct ath10k *ar, u32 vdev_id)
 			ar->peer_map[peer_id] = NULL;
 		}
 
+		/* Double check that peer is properly un-referenced from
+		 * the peer_map
+		 */
+		for (i = 0; i < ARRAY_SIZE(ar->peer_map); i++) {
+			if (ar->peer_map[i] == peer) {
+				ath10k_warn(ar, "removing stale peer_map entry for %pM (ptr %p idx %d)\n",
+					    peer->addr, peer, i);
+				ar->peer_map[i] = NULL;
+			}
+		}
+
 		list_del(&peer->list);
 		kfree(peer);
 		ar->num_peers--;
@@ -840,6 +852,7 @@ void ath10k_dump_peer_info(struct ath10k *ar)
 static void ath10k_peer_cleanup_all(struct ath10k *ar)
 {
 	struct ath10k_peer *peer, *tmp;
+	int i;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
@@ -850,6 +863,10 @@ static void ath10k_peer_cleanup_all(struct ath10k *ar)
 		list_del(&peer->list);
 		kfree(peer);
 	}
+
+	for (i = 0; i < ARRAY_SIZE(ar->peer_map); i++)
+		ar->peer_map[i] = NULL;
+
 	spin_unlock_bh(&ar->data_lock);
 
 	ar->num_peers = 0;
-- 
2.4.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
