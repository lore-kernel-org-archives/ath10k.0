Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPNYw-0000Yr-Ti
 for ath10k@lists.infradead.org; Tue, 29 Oct 2019 09:13:16 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V9 1/3] mac80211: move store skb ack code to its own function
Date: Tue, 29 Oct 2019 10:13:02 +0100
Message-Id: <20191029091304.7330-2-john@phrozen.org>
In-Reply-To: <20191029091304.7330-1-john@phrozen.org>
References: <20191029091304.7330-1-john@phrozen.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>

This patch moves the code handling SKBTX_WIFI_STATUS inside the TX path
into an extra function. This allows us to reuse it inside the 802.11 encap
offloading datapath.

Signed-off-by: John Crispin <john@phrozen.org>
---
 net/mac80211/tx.c | 49 ++++++++++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 235c6377a203..be3ce5e5a1c3 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -2423,6 +2423,33 @@ static int ieee80211_lookup_ra_sta(struct ieee80211_sub_if_data *sdata,
 	return 0;
 }
 
+static int ieee80211_store_ack_skb(struct ieee80211_local *local,
+				   struct sk_buff *skb,
+				   u32 *info_flags)
+{
+	struct sk_buff *ack_skb = skb_clone_sk(skb);
+	u16 info_id = 0;
+
+	if (ack_skb) {
+		unsigned long flags;
+		int id;
+
+		spin_lock_irqsave(&local->ack_status_lock, flags);
+		id = idr_alloc(&local->ack_status_frames, ack_skb,
+			       1, 0x10000, GFP_ATOMIC);
+		spin_unlock_irqrestore(&local->ack_status_lock, flags);
+
+		if (id >= 0) {
+			info_id = id;
+			*info_flags |= IEEE80211_TX_CTL_REQ_TX_STATUS;
+		} else {
+			kfree_skb(ack_skb);
+		}
+	}
+
+	return info_id;
+}
+
 /**
  * ieee80211_build_hdr - build 802.11 header in the given frame
  * @sdata: virtual interface to build the header for
@@ -2716,26 +2743,8 @@ static struct sk_buff *ieee80211_build_hdr(struct ieee80211_sub_if_data *sdata,
 	}
 
 	if (unlikely(!multicast && skb->sk &&
-		     skb_shinfo(skb)->tx_flags & SKBTX_WIFI_STATUS)) {
-		struct sk_buff *ack_skb = skb_clone_sk(skb);
-
-		if (ack_skb) {
-			unsigned long flags;
-			int id;
-
-			spin_lock_irqsave(&local->ack_status_lock, flags);
-			id = idr_alloc(&local->ack_status_frames, ack_skb,
-				       1, 0x10000, GFP_ATOMIC);
-			spin_unlock_irqrestore(&local->ack_status_lock, flags);
-
-			if (id >= 0) {
-				info_id = id;
-				info_flags |= IEEE80211_TX_CTL_REQ_TX_STATUS;
-			} else {
-				kfree_skb(ack_skb);
-			}
-		}
-	}
+		     skb_shinfo(skb)->tx_flags & SKBTX_WIFI_STATUS))
+		info_id = ieee80211_store_ack_skb(local, skb, &info_flags);
 
 	/*
 	 * If the skb is shared we need to obtain our own copy.
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
