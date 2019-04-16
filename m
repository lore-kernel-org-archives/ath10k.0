Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGISq-00081B-4O
 for ath10k@lists.infradead.org; Tue, 16 Apr 2019 07:25:09 +0000
From: Bhagavathi Perumal S <bperumal@codeaurora.org>
Subject: [PATCH] mac80211: Fix kernel panic due to use of txq after free
Date: Tue, 16 Apr 2019 12:54:40 +0530
Message-Id: <1555399480-30537-1-git-send-email-bperumal@codeaurora.org>
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
To: johannes@sipsolutions.net, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Bhagavathi Perumal S <bperumal@codeaurora.org>

The txq of vif is added to active_txqs list for ATF TXQ scheduling
in the function ieee80211_queue_skb(), but it was not properly removed
before freeing the txq object. It was causing use after free of the txq
objects from the active_txqs list, result was kernel panic
due to invalid memory access.

Fix kernel invalid memory access by properly removing txq object
from active_txqs list before free the object.

Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
---
 net/mac80211/iface.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index 94459b2..410685d 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -1907,6 +1907,9 @@ void ieee80211_if_remove(struct ieee80211_sub_if_data *sdata)
 	list_del_rcu(&sdata->list);
 	mutex_unlock(&sdata->local->iflist_mtx);
 
+	if (sdata->vif.txq)
+		ieee80211_txq_purge(sdata->local, to_txq_info(sdata->vif.txq));
+
 	synchronize_rcu();
 
 	if (sdata->dev) {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
