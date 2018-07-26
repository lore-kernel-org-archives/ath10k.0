Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiaag-0005Cw-Jy
 for ath10k@lists.infradead.org; Thu, 26 Jul 2018 07:21:49 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH 1/2] mac80211: Save sk_pacing_shift to ieee80211_hw
Date: Thu, 26 Jul 2018 15:21:16 +0800
Message-Id: <1532589677-16428-2-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1532589677-16428-1-git-send-email-wgong@codeaurora.org>
References: <1532589677-16428-1-git-send-email-wgong@codeaurora.org>
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
To: ath10k@lists.infradead.org, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org

Add the skb_pacing_shirt adjustment, but this change make it
configurable for other driver. If no other driver set it, then
mac8011 will use the default value.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 include/net/mac80211.h | 1 +
 net/mac80211/main.c    | 2 ++
 net/mac80211/tx.c      | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 851a5e1..f600d08 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -2279,6 +2279,7 @@ struct ieee80211_hw {
 	u8 n_cipher_schemes;
 	const struct ieee80211_cipher_scheme *cipher_schemes;
 	u8 max_nan_de_entries;
+	u8 tx_sk_pacing_shift;
 };
 
 static inline bool _ieee80211_hw_check(struct ieee80211_hw *hw,
diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index fb73451..72dce49 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -584,6 +584,8 @@ struct ieee80211_hw *ieee80211_alloc_hw_nm(size_t priv_data_len,
 	local->ops = ops;
 	local->use_chanctx = use_chanctx;
 
+	local->hw.tx_sk_pacing_shift = 8;
+
 	/* set up some defaults */
 	local->hw.queues = 1;
 	local->hw.max_rates = 1;
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 44b5dfe..a2d61b9 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -3596,7 +3596,7 @@ void __ieee80211_subif_start_xmit(struct sk_buff *skb,
 		 * second, so 8 is ~4ms of queued data. Only affects local TCP
 		 * sockets.
 		 */
-		sk_pacing_shift_update(skb->sk, 8);
+		sk_pacing_shift_update(skb->sk, sdata->local->hw.tx_sk_pacing_shift);
 
 		fast_tx = rcu_dereference(sta->fast_tx);
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
