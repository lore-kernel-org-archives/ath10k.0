Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcxpi-0004KW-42
 for ath10k@lists.infradead.org; Mon, 17 Jun 2019 20:02:27 +0000
Received: by mail-lj1-x243.google.com with SMTP id m23so10548440lje.12
 for <ath10k@lists.infradead.org>; Mon, 17 Jun 2019 13:02:24 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 2/2] ath10k: switch to ieee80211_tx_dequeue_ni
Date: Mon, 17 Jun 2019 22:01:40 +0200
Message-Id: <20190617200140.6189-2-erik.stromdahl@gmail.com>
In-Reply-To: <20190617200140.6189-1-erik.stromdahl@gmail.com>
References: <20190617200140.6189-1-erik.stromdahl@gmail.com>
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

Since ath10k_mac_tx_push_txq() can be called from process context, we
must explicitly disable softirqs before the call into mac80211.

By calling ieee80211_tx_dequeue_ni() instead of ieee80211_tx_dequeue()
we make sure softirqs are always disabled even in the case when
ath10k_mac_tx_push_txq() is called from process context.

Calling ieee80211_tx_dequeue_ni() with softirq's already disabled
(e.g., from softirq context) should be safe as the local_bh_disable()
and local_bh_enable() functions (called from ieee80211_tx_dequeue_ni)
are fully reentrant.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 2d503d6cdcd2..bbed9f1b1778 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4033,7 +4033,7 @@ int ath10k_mac_tx_push_txq(struct ieee80211_hw *hw,
 	if (ret)
 		return ret;
 
-	skb = ieee80211_tx_dequeue(hw, txq);
+	skb = ieee80211_tx_dequeue_ni(hw, txq);
 	if (!skb) {
 		spin_lock_bh(&ar->htt.tx_lock);
 		ath10k_htt_tx_dec_pending(htt);
-- 
2.22.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
