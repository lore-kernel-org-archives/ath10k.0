Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOSNT-000745-7C
 for ath10k@lists.infradead.org; Tue, 24 Sep 2013 13:10:08 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 4/5] ath10k: fix Native Wifi decap mode RX
Date: Tue, 24 Sep 2013 15:09:17 +0200
Message-ID: <1380028158-861-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1380028158-861-1-git-send-email-michal.kazior@tieto.com>
References: <1380028158-861-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

NWifi decap mode always reports 802.11 Data
Frames, even when QoS Data Frames are actually
received.

This made mac80211 not report frame priority
properly (since there was no QoS Control field).

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |   32 +++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index f8620b0..c119057 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -618,7 +618,7 @@ static void ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
 	enum rx_msdu_decap_format fmt;
 	enum htt_rx_mpdu_encrypt_type enctype;
 	struct ieee80211_hdr *hdr;
-	u8 hdr_buf[64];
+	u8 hdr_buf[64], addr[ETH_ALEN], *qos;
 	unsigned int hdr_len;
 
 	rxd = (void *)skb->data - sizeof(*rxd);
@@ -671,7 +671,25 @@ static void ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
 			skb_trim(skb, skb->len - FCS_LEN);
 			break;
 		case RX_MSDU_DECAP_NATIVE_WIFI:
-			/* nothing to do */
+			/* pull decapped header and copy DA */
+			hdr = (struct ieee80211_hdr *)skb->data;
+			hdr_len = ieee80211_hdrlen(hdr->frame_control);
+			memcpy(addr, ieee80211_get_DA(hdr), ETH_ALEN);
+			skb_pull(skb, hdr_len);
+
+			/* push original 802.11 header */
+			hdr = (struct ieee80211_hdr *)hdr_buf;
+			hdr_len = ieee80211_hdrlen(hdr->frame_control);
+			memcpy(skb_push(skb, hdr_len), hdr, hdr_len);
+
+			/* original A-MSDU header has the bit set but we're
+			 * not including A-MSDU subframe header */
+			hdr = (struct ieee80211_hdr *)skb->data;
+			qos = ieee80211_get_qos_ctl(hdr);
+			qos[0] &= ~IEEE80211_QOS_CTL_A_MSDU_PRESENT;
+
+			/* original 802.11 header has a different DA */
+			memcpy(ieee80211_get_DA(hdr), addr, ETH_ALEN);
 			break;
 		case RX_MSDU_DECAP_ETHERNET2_DIX:
 			/* strip ethernet header and insert decapped 802.11
@@ -736,7 +754,15 @@ static void ath10k_htt_rx_msdu(struct ath10k_htt *htt, struct htt_rx_info *info)
 		skb_trim(skb, skb->len - FCS_LEN);
 		break;
 	case RX_MSDU_DECAP_NATIVE_WIFI:
-		/* nothing to do here */
+		/* Pull decapped header */
+		hdr = (struct ieee80211_hdr *)skb->data;
+		hdr_len = ieee80211_hdrlen(hdr->frame_control);
+		skb_pull(skb, hdr_len);
+
+		/* Push original header */
+		hdr = (struct ieee80211_hdr *)rxd->rx_hdr_status;
+		hdr_len = ieee80211_hdrlen(hdr->frame_control);
+		memcpy(skb_push(skb, hdr_len), hdr, hdr_len);
 		break;
 	case RX_MSDU_DECAP_ETHERNET2_DIX:
 		/* strip ethernet header and insert decapped 802.11 header and
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
