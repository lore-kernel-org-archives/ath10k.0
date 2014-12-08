Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xy1wM-0008Tk-9r
 for ath10k@lists.infradead.org; Mon, 08 Dec 2014 17:17:42 +0000
Subject: [HACK PATCH 1/4] mac80211: rx
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 8 Dec 2014 19:17:04 +0200
Message-ID: <20141208171703.1001.72668.stgit@potku.adurom.net>
In-Reply-To: <20141208170804.1001.1804.stgit@potku.adurom.net>
References: <20141208170804.1001.1804.stgit@potku.adurom.net>
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
To: ath10k@lists.infradead.org

From: Michal Kazior <michal.kazior@tieto.com>

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 net/mac80211/rx.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 49c23bdf08bb..1ff1b998e336 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3520,6 +3520,16 @@ void ieee80211_rx(struct ieee80211_hw *hw, struct sk_buff *skb)
 	if (WARN_ON(!local->started))
 		goto drop;
 
+#ifdef CONFIG_ATH10K_802_3_FORMAT
+	if (likely(skb->dev != NULL)) {
+		skb->dev = container_of(skb->dev, struct ieee80211_sub_if_data, vif)->dev;
+		skb->protocol = eth_type_trans(skb, skb->dev);
+		memset(skb->cb, 0, sizeof(skb->cb));
+		netif_receive_skb(skb);
+		return;
+	}
+#endif
+
 	if (likely(!(status->flag & RX_FLAG_FAILED_PLCP_CRC))) {
 		/*
 		 * Validate the rate, unless a PLCP error means that


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
