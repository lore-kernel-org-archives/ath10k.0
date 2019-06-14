Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbjy8-0003Vo-Of
 for ath10k@lists.infradead.org; Fri, 14 Jun 2019 11:02:06 +0000
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: [PATCH] mac80211: suppress kernel warning message
Date: Fri, 14 Jun 2019 19:01:52 +0800
Message-Id: <1560510112-21613-1-git-send-email-yiboz@codeaurora.org>
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
Cc: Zhi Chen <zhichen@codeaurora.org>, Yibo Zhao <yiboz@codeaurora.org>, linux-wireless@vger.kernel.org

In multiple SSID cases, it takes time to prepare every AP interface
to be ready in initializing phase. If a sta already knows everything it
needs to join one of the APs and sends authentication to the AP which
is not fully prepared at this point of time, AP's channel context
could be NULL. As a result, warning message occurs.

Even worse, if the AP is under attack via tools such as MDK3 and massive
authentication requests are received in a very short time, console will
be hung due to kernel warning messages.

WARN_ON_ONCE() could be a better way for indicating warning messages
without duplicate messages to flood the console.

Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
Signed-off-by: Yibo Zhao <yiboz@codeaurora.org>
---
 net/mac80211/ieee80211_i.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index a8af4aa..682d0ab 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -1435,7 +1435,7 @@ struct ieee80211_local {
 	rcu_read_lock();
 	chanctx_conf = rcu_dereference(sdata->vif.chanctx_conf);
 
-	if (WARN_ON(!chanctx_conf)) {
+	if (WARN_ON_ONCE(!chanctx_conf)) {
 		rcu_read_unlock();
 		return NULL;
 	}
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
