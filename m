Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5Co7-0001kT-6O
 for ath10k@lists.infradead.org; Thu, 10 Jul 2014 11:46:36 +0000
Received: by mail-wg0-f49.google.com with SMTP id a1so5547646wgh.32
 for <ath10k@lists.infradead.org>; Thu, 10 Jul 2014 04:46:09 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFT/RFC 3/5] cfg80211: allow RX amsdu to be reported as a list
Date: Thu, 10 Jul 2014 13:45:12 +0200
Message-Id: <1404992714-15690-4-git-send-email-janusz.dziedzic@tieto.com>
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

ath10k hw report amsdu frames as a separate frames.
mac80211 before this patch expect one big frame
with msdu subframes included. Next split this big
frame into smaller ethernet frames and report to
the stack.
To skip this not needed memcpy, allow driver to report
amsdu as a list of frames using skb->next.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 net/wireless/util.c |   44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/net/wireless/util.c b/net/wireless/util.c
index 728f1c0..72e9ae7 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -617,6 +617,50 @@ void ieee80211_amsdu_to_8023s(struct sk_buff *skb, struct sk_buff_head *list,
 		eth = (struct ethhdr *) skb->data;
 	}
 
+	if (skb->next) {
+		/* Seems we already get list of msdu frames */
+		do {
+			__be16 len;
+			eth = (struct ethhdr *) skb->data;
+
+			frame = skb;
+
+			memcpy(dst, eth->h_dest, ETH_ALEN);
+			memcpy(src, eth->h_source, ETH_ALEN);
+			len = eth->h_proto;
+
+			skb_pull(skb, sizeof(struct ethhdr));
+
+			skb_reset_network_header(frame);
+			frame->dev = skb->dev;
+			frame->priority = skb->priority;
+
+			payload = frame->data;
+			ethertype = (payload[6] << 8) | payload[7];
+
+			if (likely((ether_addr_equal(payload, rfc1042_header) &&
+				    ethertype != ETH_P_AARP && ethertype != ETH_P_IPX) ||
+				   ether_addr_equal(payload, bridge_tunnel_header))) {
+				/* remove RFC1042 or Bridge-Tunnel
+				 * encapsulation and replace EtherType */
+				skb_pull(frame, 6);
+				memcpy(skb_push(frame, ETH_ALEN), src, ETH_ALEN);
+				memcpy(skb_push(frame, ETH_ALEN), dst, ETH_ALEN);
+			} else {
+				memcpy(skb_push(frame, sizeof(__be16)), &len,
+					sizeof(__be16));
+				memcpy(skb_push(frame, ETH_ALEN), src, ETH_ALEN);
+				memcpy(skb_push(frame, ETH_ALEN), dst, ETH_ALEN);
+			}
+
+			skb = skb->next;
+			frame->next = NULL;
+			__skb_queue_tail(list, frame);
+		} while (skb);
+
+		return;
+	}
+
 	while (skb != frame) {
 		u8 padding;
 		__be16 len = eth->h_proto;
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
