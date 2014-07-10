Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22a.google.com ([2a00:1450:400c:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5Co7-0001kU-FN
 for ath10k@lists.infradead.org; Thu, 10 Jul 2014 11:46:36 +0000
Received: by mail-we0-f170.google.com with SMTP id w61so8883648wes.1
 for <ath10k@lists.infradead.org>; Thu, 10 Jul 2014 04:46:10 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFT/RFC 4/5] ath10k: report amsdu as a skb list
Date: Thu, 10 Jul 2014 13:45:13 +0200
Message-Id: <1404992714-15690-5-git-send-email-janusz.dziedzic@tieto.com>
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

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |   48 +++++++++++-------------------
 1 file changed, 18 insertions(+), 30 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 2a0526b..702653e 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -874,15 +874,14 @@ static void ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
 {
 	struct htt_rx_desc *rxd;
 	struct sk_buff *skb = skb_in;
-	struct sk_buff *first, *frame = NULL, *tmp;
+	struct sk_buff *first;
 	enum rx_msdu_decap_format fmt;
 	enum htt_rx_mpdu_encrypt_type enctype;
 	struct ieee80211_hdr *hdr;
 	u8 hdr_buf[64], addr[ETH_ALEN];
 	unsigned int hdr_len;
 	struct amsdu_subframe_hdr subframe_hdr;
-	unsigned int size = 0;
-	u8 padding;
+	struct ieee80211_rx_status *status;
 
 	rxd = (void *)skb->data - sizeof(*rxd);
 	enctype = MS(__le32_to_cpu(rxd->mpdu_start.info0),
@@ -893,21 +892,6 @@ static void ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
 	memcpy(hdr_buf, hdr, hdr_len);
 	hdr = (struct ieee80211_hdr *)hdr_buf;
 
-	/* Check size we will need */
-	tmp = skb_in;
-	while (tmp) {
-		size = size + tmp->len;
-		tmp = tmp->next;
-	}
-
-	frame = dev_alloc_skb(size + skb_headroom(skb_in));
-	if (!frame) {
-		dev_kfree_skb_any(skb_in);
-		return;
-	}
-
-	skb_reserve(frame, skb_headroom(skb_in));
-
 	first = skb;
 	while (skb) {
 		void *decap_hdr;
@@ -940,10 +924,6 @@ static void ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
 			memcpy(addr, ieee80211_get_DA(hdr), ETH_ALEN);
 			skb_pull(skb, hdr_len);
 
-			/* cfg80211 expect this padding */
-			padding = (4 - (skb->len + sizeof(subframe_hdr))) & 0x3;
-			skb_put(skb, padding);
-
 			/* build amsdu subframe header */
 			memcpy(&subframe_hdr.dst, addr, ETH_ALEN);
 			memcpy(&subframe_hdr.src, ieee80211_get_SA(hdr), ETH_ALEN);
@@ -984,20 +964,26 @@ static void ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
 
 		skb_in = skb;
 
-		if (skb_in == first)
-			ath10k_htt_rx_h_protected(htt, rx_status, skb_in,
+		if (skb == first) {
+			ath10k_htt_rx_h_protected(htt, rx_status, skb,
 						  enctype, fmt, false);
+			if (skb->next)
+				rx_status->flag |= RX_FLAG_AMSDU_LIST;
+			else
+				rx_status->flag &= ~RX_FLAG_AMSDU_LIST;
+		}
 
-		memcpy(skb_put(frame, skb_in->len), skb_in->data, skb_in->len);
+		/* Setup AMSDU flag in skb->next ... subframes */
+		status = IEEE80211_SKB_RXCB(skb);
+		memset(status, 0, sizeof(*status));
 
-		skb = skb->next;
-		skb_in->next = NULL;
+		if (skb->next)
+			status->flag |= RX_FLAG_AMSDU_LIST;
 
-		/* We don't need this skb anymore */
-		dev_kfree_skb(skb_in);
+		skb = skb->next;
 	}
 
-	ath10k_process_rx(htt->ar, rx_status, frame);
+	ath10k_process_rx(htt->ar, rx_status, first);
 	/* FIXME: It might be nice to re-assemble the A-MSDU when there's a
 	 * monitor interface active for sniffing purposes. */
 }
@@ -1307,6 +1293,8 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 			else
 				rx_status->flag &= ~RX_FLAG_MMIC_ERROR;
 
+			rx_status->flag &= ~RX_FLAG_AMSDU_LIST;
+
 			hdr = ath10k_htt_rx_skb_get_hdr(msdu_head);
 
 			if (ath10k_htt_rx_hdr_is_amsdu(hdr))
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
