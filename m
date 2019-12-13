Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m228-5.mailgun.net ([159.135.228.5])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iffEP-0002Xj-Lm
 for ath10k@lists.infradead.org; Fri, 13 Dec 2019 07:19:23 +0000
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: [PATCH 2/4] mac80211: fix issue in loop scenario
Date: Fri, 13 Dec 2019 15:19:51 +0800
Message-Id: <1576221593-1086-3-git-send-email-yiboz@codeaurora.org>
In-Reply-To: <1576221593-1086-1-git-send-email-yiboz@codeaurora.org>
References: <1576221593-1086-1-git-send-email-yiboz@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: Yibo Zhao <yiboz@codeaurora.org>, ath10k@lists.infradead.org

In a loop txqs dequeue scenario, if the first txq in the rbtree gets
removed from rbtree immediately in the ieee80211_return_txq(), the
loop will break soon in the ieee80211_next_txq() due to schedule_pos
not leading to the second txq in the rbtree. Thus update schedule_pos
to previous node once the node of schedule_pos is either removed from
rbtree or move to other location in rbtree due to airtime update.

Signed-off-by: Yibo Zhao <yiboz@codeaurora.org>
---
 net/mac80211/ieee80211_i.h |  2 ++
 net/mac80211/tx.c          | 14 +++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index a4556f9..ed85400 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -847,6 +847,7 @@ struct txq_info {
 	struct codel_stats cstats;
 	struct sk_buff_head frags;
 	struct rb_node schedule_order;
+	u16 schedule_round;
 	unsigned long flags;
 
 	/* keep last! */
@@ -1144,6 +1145,7 @@ struct ieee80211_local {
 	struct rb_node *schedule_pos[IEEE80211_NUM_ACS];
 	u64 airtime_v_t[IEEE80211_NUM_ACS];
 	u64 airtime_weight_sum[IEEE80211_NUM_ACS];
+	u16 schedule_round[IEEE80211_NUM_ACS];
 
 	u16 airtime_flags;
 
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index d00baaa..c1444e7 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -3644,6 +3644,7 @@ struct ieee80211_txq *ieee80211_next_txq(struct ieee80211_hw *hw, u8 ac)
 
 	lockdep_assert_held(&local->active_txq_lock[ac]);
 
+begin:
 	if (!node) {
 		node = rb_first_cached(&local->active_txqs[ac]);
 		first = true;
@@ -3668,7 +3669,10 @@ struct ieee80211_txq *ieee80211_next_txq(struct ieee80211_hw *hw, u8 ac)
 		}
 	}
 
+	if (txqi->schedule_round == local->schedule_round[ac])
+		goto begin;
 
+	txqi->schedule_round = local->schedule_round[ac];
 	local->schedule_pos[ac] = node;
 	return &txqi->txq;
 }
@@ -3752,6 +3756,9 @@ void ieee80211_resort_txq(struct ieee80211_hw *hw,
 	u8 ac = txq->ac;
 
 	if (!RB_EMPTY_NODE(&txqi->schedule_order)) {
+		if (local->schedule_pos[ac] == &txqi->schedule_order)
+			local->schedule_pos[ac] = rb_prev(&txqi->schedule_order);
+
 		rb_erase_cached(&txqi->schedule_order,
 				&local->active_txqs[ac]);
 		RB_CLEAR_NODE(&txqi->schedule_order);
@@ -3771,6 +3778,9 @@ static void __ieee80211_unschedule_txq(struct ieee80211_hw *hw,
 	if (RB_EMPTY_NODE(&txqi->schedule_order))
 		return;
 
+	if (local->schedule_pos[ac] == &txqi->schedule_order)
+		local->schedule_pos[ac] = rb_prev(&txqi->schedule_order);
+
 	if (txq->sta) {
 		struct sta_info *sta = container_of(txq->sta,
 						    struct sta_info, sta);
@@ -3803,7 +3813,7 @@ void ieee80211_return_txq(struct ieee80211_hw *hw,
 	lockdep_assert_held(&local->active_txq_lock[txq->ac]);
 
 	if (!RB_EMPTY_NODE(&txqi->schedule_order) &&
-	    (skb_queue_empty(&txqi->frags) && !txqi->tin.backlog_packets))
+	    !txq_has_queue(&txqi->txq))
 		__ieee80211_unschedule_txq(hw, txq);
 }
 EXPORT_SYMBOL(ieee80211_return_txq);
@@ -3832,6 +3842,8 @@ void ieee80211_txq_schedule_start(struct ieee80211_hw *hw, u8 ac)
 	struct ieee80211_local *local = hw_to_local(hw);
 
 	spin_lock_bh(&local->active_txq_lock[ac]);
+	local->schedule_round[ac]++;
+
 }
 EXPORT_SYMBOL(ieee80211_txq_schedule_start);
 
-- 
1.9.1

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
