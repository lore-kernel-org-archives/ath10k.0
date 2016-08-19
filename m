Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1baYnw-0004Oz-A7
 for ath10k@lists.infradead.org; Fri, 19 Aug 2016 01:41:04 +0000
From: greearb@candelatech.com
Subject: [PATCH 1/3] ath10k:  Ensure there are no stale ar->txqs entries.
Date: Thu, 18 Aug 2016 18:26:33 -0700
Message-Id: <1471569995-10028-1-git-send-email-greearb@candelatech.com>
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

I was seeing kernel crashes due to accessing freed memory
while debugging a 9984 firmware that was crashing often.

This patch fixes the crashes.  I am not certain if there
is a better way or not.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5659ef1..916119c 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4172,8 +4172,10 @@ static void ath10k_mac_txq_init(struct ieee80211_txq *txq)
 static void ath10k_mac_txq_unref(struct ath10k *ar, struct ieee80211_txq *txq)
 {
 	struct ath10k_txq *artxq = (void *)txq->drv_priv;
+	struct ath10k_txq *tmp, *walker;
 	struct ath10k_skb_cb *cb;
 	struct sk_buff *msdu;
+	struct ieee80211_txq *txq_tmp;
 	int msdu_id;
 
 	if (!txq)
@@ -4182,6 +4184,14 @@ static void ath10k_mac_txq_unref(struct ath10k *ar, struct ieee80211_txq *txq)
 	spin_lock_bh(&ar->txqs_lock);
 	if (!list_empty(&artxq->list))
 		list_del_init(&artxq->list);
+
+	/* Remove from ar->txqs in case it still exists there. */
+	list_for_each_entry_safe(walker, tmp, &ar->txqs, list) {
+		txq_tmp = container_of((void *)walker, struct ieee80211_txq,
+				       drv_priv);
+		if (txq_tmp == txq)
+			list_del(&walker->list);
+	}
 	spin_unlock_bh(&ar->txqs_lock);
 
 	spin_lock_bh(&ar->htt.tx_lock);
-- 
2.4.11


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
