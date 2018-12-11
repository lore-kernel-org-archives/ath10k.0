Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWYQ9-0002ji-BQ
 for ath10k@lists.infradead.org; Tue, 11 Dec 2018 03:09:18 +0000
From: zhichen@codeaurora.org
Subject: [PATCH v1 1/2] ath10k: fix peer stats null pointer dereference
Date: Tue, 11 Dec 2018 11:08:24 +0800
Message-Id: <1544497705-21593-1-git-send-email-zhichen@codeaurora.org>
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
Cc: Zhi Chen <zhichen@codeaurora.org>, linux-wireless@vger.kernel.org

From: Zhi Chen <zhichen@codeaurora.org>

There was a race condition in SMP that an ath10k_peer was created but its
member sta was null. Following are procedures of ath10k_peer creation and
member sta access in peer statistics path.

    1. Peer creation:
        ath10k_peer_create()
            =>ath10k_wmi_peer_create()
                =>ath10k_wait_for_peer_created()
                ...

        # another kernel path, RX from firmware
        ath10k_htt_t2h_msg_handler()
        =>ath10k_peer_map_event()
                =>wake_up()
                # ar->peer_map[id] = peer //add peer to map

        #wake up original path from waiting
                ...
                # peer->sta = sta //sta assignment

    2.  RX path of statistics
        ath10k_htt_t2h_msg_handler()
            =>ath10k_update_per_peer_tx_stats()
                =>ath10k_htt_fetch_peer_stats()
                # peer->sta //sta accessing

Any access of peer->sta after peer was added to peer_map but before sta was
assigned could cause a null pointer issue. And because these two steps are
asynchronous, no proper lock can protect them. So both peer and sta need to
be checked before access.

Tested: QCA9984 with firmware ver 10.4-3.9.0.1-00005
Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/debugfs_sta.c | 2 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
index 0f3fd65..4778a45 100644
--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -71,7 +71,7 @@ void ath10k_sta_update_rx_tid_stats_ampdu(struct ath10k *ar, u16 peer_id, u8 tid
 	spin_lock_bh(&ar->data_lock);
 
 	peer = ath10k_peer_find_by_id(ar, peer_id);
-	if (!peer)
+	if (!peer || !peer->sta)
 		goto out;
 
 	arsta = (struct ath10k_sta *)peer->sta->drv_priv;
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 984b045..a1552f0 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2847,7 +2847,7 @@ static void ath10k_htt_fetch_peer_stats(struct ath10k *ar,
 	rcu_read_lock();
 	spin_lock_bh(&ar->data_lock);
 	peer = ath10k_peer_find_by_id(ar, peer_id);
-	if (!peer) {
+	if (!peer || !peer->sta) {
 		ath10k_warn(ar, "Invalid peer id %d peer stats buffer\n",
 			    peer_id);
 		goto out;
@@ -2900,7 +2900,7 @@ static void ath10k_fetch_10_2_tx_stats(struct ath10k *ar, u8 *data)
 	rcu_read_lock();
 	spin_lock_bh(&ar->data_lock);
 	peer = ath10k_peer_find_by_id(ar, peer_id);
-	if (!peer) {
+	if (!peer || !peer->sta) {
 		ath10k_warn(ar, "Invalid peer id %d in peer stats buffer\n",
 			    peer_id);
 		goto out;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
