Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcxpg-0004KV-Kf
 for ath10k@lists.infradead.org; Mon, 17 Jun 2019 20:02:25 +0000
Received: by mail-lf1-x141.google.com with SMTP id y17so7515476lfe.0
 for <ath10k@lists.infradead.org>; Mon, 17 Jun 2019 13:02:23 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 1/2] mac80211: add tx dequeue function for process context
Date: Mon, 17 Jun 2019 22:01:39 +0200
Message-Id: <20190617200140.6189-1-erik.stromdahl@gmail.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: johannes@sipsolutions.net, kvalo@codeaurora.org, davem@davemloft.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

Since ieee80211_tx_dequeue() must not be called with softirqs enabled
(i.e. from process context without proper disable of bottom halves),
we add a wrapper that disables bottom halves before calling
ieee80211_tx_dequeue()

The new function is named ieee80211_tx_dequeue_ni() just as all other
from-process-context versions found in mac80211.

The documentation of ieee80211_tx_dequeue() is also updated so it
mentions that the function should not be called from process context.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 include/net/mac80211.h | 26 ++++++++++++++++++++++++++
 net/mac80211/tx.c      |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 72080d9d617e..c47990d8db79 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -6251,10 +6251,36 @@ void ieee80211_unreserve_tid(struct ieee80211_sta *sta, u8 tid);
  * but for the duration of the frame handling.
  * However, also note that while in the wake_tx_queue() method,
  * rcu_read_lock() is already held.
+ *
+ * softirqs must also be disabled when this function is called.
+ * In process context, use ieee80211_tx_dequeue_ni() instead.
  */
 struct sk_buff *ieee80211_tx_dequeue(struct ieee80211_hw *hw,
 				     struct ieee80211_txq *txq);
 
+/**
+ * ieee80211_tx_dequeue_ni - dequeue a packet from a software tx queue
+ * (in process context)
+ *
+ * Like ieee80211_tx_dequeue() but can be called in process context
+ * (internally disables bottom halves).
+ *
+ * @hw: pointer as obtained from ieee80211_alloc_hw()
+ * @txq: pointer obtained from station or virtual interface, or from
+ *	ieee80211_next_txq()
+ */
+static inline struct sk_buff *ieee80211_tx_dequeue_ni(struct ieee80211_hw *hw,
+						      struct ieee80211_txq *txq)
+{
+	struct sk_buff *skb;
+
+	local_bh_disable();
+	skb = ieee80211_tx_dequeue(hw, txq);
+	local_bh_enable();
+
+	return skb;
+}
+
 /**
  * ieee80211_next_txq - get next tx queue to pull packets from
  *
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index dd220b977025..4bd0066ea7cd 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -3550,6 +3550,8 @@ struct sk_buff *ieee80211_tx_dequeue(struct ieee80211_hw *hw,
 	ieee80211_tx_result r;
 	struct ieee80211_vif *vif = txq->vif;
 
+	WARN_ON_ONCE(softirq_count() == 0);
+
 begin:
 	spin_lock_bh(&fq->lock);
 
-- 
2.22.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
