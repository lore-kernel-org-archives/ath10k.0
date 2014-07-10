Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5Co7-0001kR-6D
 for ath10k@lists.infradead.org; Thu, 10 Jul 2014 11:46:36 +0000
Received: by mail-wi0-f181.google.com with SMTP id bs8so196407wib.2
 for <ath10k@lists.infradead.org>; Thu, 10 Jul 2014 04:46:07 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFT/RFC 1/5] ath10k: amsdu rx, buid one big frame
Date: Thu, 10 Jul 2014 13:45:10 +0200
Message-Id: <1404992714-15690-2-git-send-email-janusz.dziedzic@tieto.com>
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

Temporary patch, to check if will solve ampdu reordering issue.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |   71 +++++++++++++++++++++---------
 1 file changed, 50 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 57d5a97..2a0526b 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -874,12 +874,15 @@ static void ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
 {
 	struct htt_rx_desc *rxd;
 	struct sk_buff *skb = skb_in;
-	struct sk_buff *first;
+	struct sk_buff *first, *frame = NULL, *tmp;
 	enum rx_msdu_decap_format fmt;
 	enum htt_rx_mpdu_encrypt_type enctype;
 	struct ieee80211_hdr *hdr;
-	u8 hdr_buf[64], addr[ETH_ALEN], *qos;
+	u8 hdr_buf[64], addr[ETH_ALEN];
 	unsigned int hdr_len;
+	struct amsdu_subframe_hdr subframe_hdr;
+	unsigned int size = 0;
+	u8 padding;
 
 	rxd = (void *)skb->data - sizeof(*rxd);
 	enctype = MS(__le32_to_cpu(rxd->mpdu_start.info0),
@@ -890,6 +893,21 @@ static void ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
 	memcpy(hdr_buf, hdr, hdr_len);
 	hdr = (struct ieee80211_hdr *)hdr_buf;
 
+	/* Check size we will need */
+	tmp = skb_in;
+	while (tmp) {
+		size = size + tmp->len;
+		tmp = tmp->next;
+	}
+
+	frame = dev_alloc_skb(size + skb_headroom(skb_in));
+	if (!frame) {
+		dev_kfree_skb_any(skb_in);
+		return;
+	}
+
+	skb_reserve(frame, skb_headroom(skb_in));
+
 	first = skb;
 	while (skb) {
 		void *decap_hdr;
@@ -922,19 +940,28 @@ static void ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
 			memcpy(addr, ieee80211_get_DA(hdr), ETH_ALEN);
 			skb_pull(skb, hdr_len);
 
-			/* push original 802.11 header */
-			hdr = (struct ieee80211_hdr *)hdr_buf;
-			hdr_len = ieee80211_hdrlen(hdr->frame_control);
-			memcpy(skb_push(skb, hdr_len), hdr, hdr_len);
+			/* cfg80211 expect this padding */
+			padding = (4 - (skb->len + sizeof(subframe_hdr))) & 0x3;
+			skb_put(skb, padding);
 
-			/* original A-MSDU header has the bit set but we're
-			 * not including A-MSDU subframe header */
-			hdr = (struct ieee80211_hdr *)skb->data;
-			qos = ieee80211_get_qos_ctl(hdr);
-			qos[0] &= ~IEEE80211_QOS_CTL_A_MSDU_PRESENT;
+			/* build amsdu subframe header */
+			memcpy(&subframe_hdr.dst, addr, ETH_ALEN);
+			memcpy(&subframe_hdr.src, ieee80211_get_SA(hdr), ETH_ALEN);
+			subframe_hdr.len = __cpu_to_be16(skb->len) ;
 
-			/* original 802.11 header has a different DA */
-			memcpy(ieee80211_get_DA(hdr), addr, ETH_ALEN);
+			/* push back amsdu hdr */
+			memcpy(skb_push(skb, sizeof(subframe_hdr)), &subframe_hdr,
+			       sizeof(subframe_hdr));
+
+			if (skb == first) {
+				/* push back orginal 80211 header */
+				hdr = (struct ieee80211_hdr *)hdr_buf;
+				hdr_len = ieee80211_hdrlen(hdr->frame_control);
+				memcpy(skb_push(skb, hdr_len), hdr, hdr_len);
+
+				/* original 802.11 header has a different DA */
+				memcpy(ieee80211_get_DA(hdr), addr, ETH_ALEN);
+			}
 			break;
 		case RX_MSDU_DECAP_ETHERNET2_DIX:
 			/* strip ethernet header and insert decapped 802.11
@@ -956,19 +983,21 @@ static void ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
 		}
 
 		skb_in = skb;
-		ath10k_htt_rx_h_protected(htt, rx_status, skb_in, enctype, fmt,
-					  false);
+
+		if (skb_in == first)
+			ath10k_htt_rx_h_protected(htt, rx_status, skb_in,
+						  enctype, fmt, false);
+
+		memcpy(skb_put(frame, skb_in->len), skb_in->data, skb_in->len);
+
 		skb = skb->next;
 		skb_in->next = NULL;
 
-		if (skb)
-			rx_status->flag |= RX_FLAG_AMSDU_MORE;
-		else
-			rx_status->flag &= ~RX_FLAG_AMSDU_MORE;
-
-		ath10k_process_rx(htt->ar, rx_status, skb_in);
+		/* We don't need this skb anymore */
+		dev_kfree_skb(skb_in);
 	}
 
+	ath10k_process_rx(htt->ar, rx_status, frame);
 	/* FIXME: It might be nice to re-assemble the A-MSDU when there's a
 	 * monitor interface active for sniffing purposes. */
 }
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
