Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1beNpl-00017E-G9
 for ath10k@lists.infradead.org; Mon, 29 Aug 2016 14:46:51 +0000
From: Benjamin Berg <benjamin@sipsolutions.net>
Subject: [PATCHv3 3/5] ath10k: Properly remove padding from the start of rx
 payload
Date: Mon, 29 Aug 2016 16:45:55 +0200
Message-Id: <20160829144557.11678-4-benjamin@sipsolutions.net>
In-Reply-To: <20160829144557.11678-1-benjamin@sipsolutions.net>
References: <20160829144557.11678-1-benjamin@sipsolutions.net>
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
Cc: Simon Wunderlich <sw@simonwunderlich.de>, Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Benjamin Berg <benjamin@sipsolutions.net>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, Michal Kazior <michal.kazior@tieto.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>

From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

In QCA99X0 (QCA99X0, QCA9984, QCA9888 and QCA4019) family chips,
hw adds padding at the begining of the rx payload to make L3
header 4-byte aligned. In the chips doing this type of padding,
the number of bytes padded will be indicated through msdu_end:info1.
Define a hw_rx_desc_ops wrapper to retrieve the number of padded
bytes and use this while doing undecap. This should fix padding
related issues with ethernt decap format with QCA99X0, QCA9984,
QCA9888 and QCA4019 hw.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
[Rename operations to hw_ops for other purposes]
Signed-off-by: Benjamin Berg <benjamin@sipsolutions.net>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 36 +++++++++++++++++++-------------
 drivers/net/wireless/ath/ath10k/hw.h     |  9 ++++++++
 2 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 78db5d6..36c4809 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1056,9 +1056,11 @@ static void ath10k_htt_rx_h_undecap_nwifi(struct ath10k *ar,
 					  const u8 first_hdr[64])
 {
 	struct ieee80211_hdr *hdr;
+	struct htt_rx_desc *rxd;
 	size_t hdr_len;
 	u8 da[ETH_ALEN];
 	u8 sa[ETH_ALEN];
+	int l3_pad_bytes;
 
 	/* Delivered decapped frame:
 	 * [nwifi 802.11 header] <-- replaced with 802.11 hdr
@@ -1072,19 +1074,12 @@ static void ath10k_htt_rx_h_undecap_nwifi(struct ath10k *ar,
 	 */
 
 	/* pull decapped header and copy SA & DA */
-	if ((ar->hw_params.hw_4addr_pad == ATH10K_HW_4ADDR_PAD_BEFORE) &&
-	    ieee80211_has_a4(((struct ieee80211_hdr *)first_hdr)->frame_control)) {
-		/* The QCA99X0 4 address mode pad 2 bytes at the
-		 * beginning of MSDU
-		 */
-		hdr = (struct ieee80211_hdr *)(msdu->data + 2);
-		/* The skb length need be extended 2 as the 2 bytes at the tail
-		 * be excluded due to the padding
-		 */
-		skb_put(msdu, 2);
-	} else {
-		hdr = (struct ieee80211_hdr *)(msdu->data);
-	}
+	rxd = (void *)msdu->data - sizeof(*rxd);
+
+	l3_pad_bytes = ath10k_rx_desc_get_l3_pad_bytes(&ar->hw_params, rxd);
+	skb_put(msdu, l3_pad_bytes);
+
+	hdr = (struct ieee80211_hdr *)(msdu->data + l3_pad_bytes);
 
 	hdr_len = ath10k_htt_rx_nwifi_hdrlen(ar, hdr);
 	ether_addr_copy(da, ieee80211_get_DA(hdr));
@@ -1151,6 +1146,8 @@ static void ath10k_htt_rx_h_undecap_eth(struct ath10k *ar,
 	void *rfc1042;
 	u8 da[ETH_ALEN];
 	u8 sa[ETH_ALEN];
+	int l3_pad_bytes;
+	struct htt_rx_desc *rxd;
 
 	/* Delivered decapped frame:
 	 * [eth header] <-- replaced with 802.11 hdr & rfc1042/llc
@@ -1161,6 +1158,11 @@ static void ath10k_htt_rx_h_undecap_eth(struct ath10k *ar,
 	if (WARN_ON_ONCE(!rfc1042))
 		return;
 
+	rxd = (void *)msdu->data - sizeof(*rxd);
+	l3_pad_bytes = ath10k_rx_desc_get_l3_pad_bytes(&ar->hw_params, rxd);
+	skb_put(msdu, l3_pad_bytes);
+	skb_pull(msdu, l3_pad_bytes);
+
 	/* pull decapped header and copy SA & DA */
 	eth = (struct ethhdr *)msdu->data;
 	ether_addr_copy(da, eth->h_dest);
@@ -1191,6 +1193,8 @@ static void ath10k_htt_rx_h_undecap_snap(struct ath10k *ar,
 {
 	struct ieee80211_hdr *hdr;
 	size_t hdr_len;
+	int l3_pad_bytes;
+	struct htt_rx_desc *rxd;
 
 	/* Delivered decapped frame:
 	 * [amsdu header] <-- replaced with 802.11 hdr
@@ -1198,7 +1202,11 @@ static void ath10k_htt_rx_h_undecap_snap(struct ath10k *ar,
 	 * [payload]
 	 */
 
-	skb_pull(msdu, sizeof(struct amsdu_subframe_hdr));
+	rxd = (void *)msdu->data - sizeof(*rxd);
+	l3_pad_bytes = ath10k_rx_desc_get_l3_pad_bytes(&ar->hw_params, rxd);
+
+	skb_put(msdu, l3_pad_bytes);
+	skb_pull(msdu, sizeof(struct amsdu_subframe_hdr) + l3_pad_bytes);
 
 	hdr = (struct ieee80211_hdr *)first_hdr;
 	hdr_len = ieee80211_hdrlen(hdr->frame_control);
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 1ef7dc6..82efbfc 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -423,6 +423,15 @@ struct ath10k_hw_ops {
 extern const struct ath10k_hw_ops qca988x_ops;
 extern const struct ath10k_hw_ops qca99x0_ops;
 
+static inline int
+ath10k_rx_desc_get_l3_pad_bytes(struct ath10k_hw_params *hw,
+				struct htt_rx_desc *rxd)
+{
+	if (hw->hw_ops->rx_desc_get_l3_pad_bytes)
+		return hw->hw_ops->rx_desc_get_l3_pad_bytes(rxd);
+	return 0;
+}
+
 /* Target specific defines for MAIN firmware */
 #define TARGET_NUM_VDEVS			8
 #define TARGET_NUM_PEER_AST			2
-- 
2.9.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
