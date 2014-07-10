Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5Co5-0001kS-KU
 for ath10k@lists.infradead.org; Thu, 10 Jul 2014 11:46:35 +0000
Received: by mail-wi0-f177.google.com with SMTP id ho1so4353719wib.16
 for <ath10k@lists.infradead.org>; Thu, 10 Jul 2014 04:46:08 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFT/RFC 2/5] mac80211: add option to handle amsdu as a list of skb
Date: Thu, 10 Jul 2014 13:45:11 +0200
Message-Id: <1404992714-15690-3-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1404992714-15690-1-git-send-email-janusz.dziedzic@tieto.com>
References: <1404992714-15690-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, denton.gentry@gmail.com

Initial version.
Allow to report amsdu frames as a skb list.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 include/net/mac80211.h     |    4 +++
 net/mac80211/ieee80211_i.h |    1 +
 net/mac80211/main.c        |    2 +-
 net/mac80211/rx.c          |   70 +++++++++++++++++++++++++++++++++++++++++---
 4 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index e7362f0..9ec8ad1 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -873,6 +873,9 @@ ieee80211_tx_info_clear_status(struct ieee80211_tx_info *info)
  *	subframes share the same sequence number. Reported subframes can be
  *	either regular MSDU or singly A-MSDUs. Subframes must not be
  *	interleaved with other frames.
+ * @RX_FLAG_AMSDU_LIST: Some drivers report A-MSDU subframes as a skb list,
+ * 	with skb->next set. In such case we have one skb that will describe
+ *	mpdu frame. All, but last MSDU from A-MSDU should have this flag set.
  */
 enum mac80211_rx_flags {
 	RX_FLAG_MMIC_ERROR		= BIT(0),
@@ -902,6 +905,7 @@ enum mac80211_rx_flags {
 	RX_FLAG_10MHZ			= BIT(28),
 	RX_FLAG_5MHZ			= BIT(29),
 	RX_FLAG_AMSDU_MORE		= BIT(30),
+	RX_FLAG_AMSDU_LIST		= BIT(31),
 };
 
 #define RX_FLAG_STBC_SHIFT		26
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index ae35bf1..3dd3133 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -1862,6 +1862,7 @@ int ieee80211_tdls_mgmt(struct wiphy *wiphy, struct net_device *dev,
 int ieee80211_tdls_oper(struct wiphy *wiphy, struct net_device *dev,
 			const u8 *peer, enum nl80211_tdls_operation oper);
 
+struct sk_buff * ieee80211_dequeue_mpdu(struct sk_buff_head *frames);
 
 #ifdef CONFIG_MAC80211_NOINLINE
 #define debug_noinline noinline
diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index d17c26d..6ac1af4 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -222,7 +222,7 @@ static void ieee80211_tasklet_handler(unsigned long data)
 	struct ieee80211_local *local = (struct ieee80211_local *) data;
 	struct sk_buff *skb;
 
-	while ((skb = skb_dequeue(&local->skb_queue)) ||
+	while ((skb = ieee80211_dequeue_mpdu(&local->skb_queue)) ||
 	       (skb = skb_dequeue(&local->skb_queue_unreliable))) {
 		switch (skb->pkt_type) {
 		case IEEE80211_RX_MSG:
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 394e201..9034a65 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -683,6 +683,68 @@ static ieee80211_rx_result ieee80211_rx_mesh_check(struct ieee80211_rx_data *rx)
 	return RX_CONTINUE;
 }
 
+static void __ieee80211_queue_mpdu(struct sk_buff_head *frames,
+				   struct sk_buff *skb)
+{
+	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
+	struct sk_buff *next = skb->next;
+
+	__skb_queue_tail(frames, skb);
+
+	if (status->flag & RX_FLAG_AMSDU_LIST) {
+		/* Check if amsdu list and queue frames */
+		while (next) {
+			skb = next;
+			next = next->next;
+			__skb_queue_tail(frames, skb);
+		}
+	}
+}
+
+static void ieee80211_queue_mpdu(struct sk_buff_head *frames,
+				 struct sk_buff *skb)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&frames->lock, flags);
+	__ieee80211_queue_mpdu(frames, skb);
+	spin_unlock_irqrestore(&frames->lock, flags);
+}
+
+static struct sk_buff * __ieee80211_dequeue_mpdu(struct sk_buff_head *frames)
+{
+	struct sk_buff *first, *next;
+
+	first = __skb_dequeue(frames);
+
+	if (!first)
+		goto out;
+
+	next = first;
+	if (IEEE80211_SKB_RXCB(next)->flag & RX_FLAG_AMSDU_LIST) {
+		do {
+			/* Dequeue frames when amsdu list */
+			next->next = __skb_dequeue(frames);
+			next = next->next;
+		} while (next && IEEE80211_SKB_RXCB(next)->flag & RX_FLAG_AMSDU_LIST);
+	}
+
+out:
+	return first;
+}
+
+struct sk_buff * ieee80211_dequeue_mpdu(struct sk_buff_head *frames)
+{
+	struct sk_buff *mpdu;
+	unsigned long flags;
+
+	spin_lock_irqsave(&frames->lock, flags);
+	mpdu = __ieee80211_dequeue_mpdu(frames);
+	spin_unlock_irqrestore(&frames->lock, flags);
+
+	return mpdu;
+}
+
 static void ieee80211_release_reorder_frame(struct ieee80211_sub_if_data *sdata,
 					    struct tid_ampdu_rx *tid_agg_rx,
 					    int index,
@@ -701,7 +763,7 @@ static void ieee80211_release_reorder_frame(struct ieee80211_sub_if_data *sdata,
 	tid_agg_rx->reorder_buf[index] = NULL;
 	status = IEEE80211_SKB_RXCB(skb);
 	status->rx_flags |= IEEE80211_RX_DEFERRED_RELEASE;
-	__skb_queue_tail(frames, skb);
+	__ieee80211_queue_mpdu(frames, skb);
 
 no_frame:
 	tid_agg_rx->head_seq_num = ieee80211_sn_inc(tid_agg_rx->head_seq_num);
@@ -951,7 +1013,7 @@ static void ieee80211_rx_reorder_ampdu(struct ieee80211_rx_data *rx,
 		return;
 
  dont_reorder:
-	__skb_queue_tail(frames, skb);
+	__ieee80211_queue_mpdu(frames, skb);
 }
 
 static ieee80211_rx_result debug_noinline
@@ -2950,7 +3012,7 @@ static void ieee80211_rx_handlers(struct ieee80211_rx_data *rx,
 
 	spin_lock_bh(&rx->local->rx_path_lock);
 
-	while ((skb = __skb_dequeue(frames))) {
+	while ((skb = __ieee80211_dequeue_mpdu(frames))) {
 		/*
 		 * all the other fields are valid across frames
 		 * that belong to an aMPDU since they are on the
@@ -3426,7 +3488,7 @@ void ieee80211_rx_irqsafe(struct ieee80211_hw *hw, struct sk_buff *skb)
 	BUILD_BUG_ON(sizeof(struct ieee80211_rx_status) > sizeof(skb->cb));
 
 	skb->pkt_type = IEEE80211_RX_MSG;
-	skb_queue_tail(&local->skb_queue, skb);
+	ieee80211_queue_mpdu(&local->skb_queue, skb);
 	tasklet_schedule(&local->tasklet);
 }
 EXPORT_SYMBOL(ieee80211_rx_irqsafe);
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
