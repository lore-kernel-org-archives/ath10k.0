Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e7wR3-0001Zx-4u
 for ath10k@lists.infradead.org; Fri, 27 Oct 2017 04:39:59 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH] ath10k: Fix data rx for CCMP-256,
 GCMP and GCMP-256 in raw mode
Date: Fri, 27 Oct 2017 10:09:14 +0530
Message-ID: <1509079154-22759-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

Make sure 16-byte mic is removed from the rx data packet
tail when CCMP-256, GCMP and GCMP-256 ciphers are used
in raw decap mode. This fixed rx traffic failures in those
ciphers in raw mode. Split the helper returning crypto
tail length into two, one to get the ICV length and other
to get the mic lengh for the cipher to make it clean.

Fixes: 2ea9f12cefe4 ("ath10k: add new cipher suite support")
Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---

This patch depends on https://patchwork.kernel.org/patch/10028621/

 drivers/net/wireless/ath/ath10k/htt_rx.c | 51 ++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 5beb6ee0f091..656385f80929 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -566,18 +566,16 @@ static int ath10k_htt_rx_crypto_param_len(struct ath10k *ar,
 
 #define MICHAEL_MIC_LEN 8
 
-static int ath10k_htt_rx_crypto_tail_len(struct ath10k *ar,
-					 enum htt_rx_mpdu_encrypt_type type)
+static int ath10k_htt_rx_crypto_mic_len(struct ath10k *ar,
+					enum htt_rx_mpdu_encrypt_type type)
 {
 	switch (type) {
 	case HTT_RX_MPDU_ENCRYPT_NONE:
-		return 0;
 	case HTT_RX_MPDU_ENCRYPT_WEP40:
 	case HTT_RX_MPDU_ENCRYPT_WEP104:
-		return IEEE80211_WEP_ICV_LEN;
 	case HTT_RX_MPDU_ENCRYPT_TKIP_WITHOUT_MIC:
 	case HTT_RX_MPDU_ENCRYPT_TKIP_WPA:
-		return IEEE80211_TKIP_ICV_LEN;
+		return 0;
 	case HTT_RX_MPDU_ENCRYPT_AES_CCM_WPA2:
 		return IEEE80211_CCMP_MIC_LEN;
 	case HTT_RX_MPDU_ENCRYPT_AES_CCM256_WPA2:
@@ -594,6 +592,31 @@ static int ath10k_htt_rx_crypto_tail_len(struct ath10k *ar,
 	return 0;
 }
 
+static int ath10k_htt_rx_crypto_icv_len(struct ath10k *ar,
+					enum htt_rx_mpdu_encrypt_type type)
+{
+	switch (type) {
+	case HTT_RX_MPDU_ENCRYPT_NONE:
+	case HTT_RX_MPDU_ENCRYPT_AES_CCM_WPA2:
+	case HTT_RX_MPDU_ENCRYPT_AES_CCM256_WPA2:
+	case HTT_RX_MPDU_ENCRYPT_AES_GCMP_WPA2:
+	case HTT_RX_MPDU_ENCRYPT_AES_GCMP256_WPA2:
+		return 0;
+	case HTT_RX_MPDU_ENCRYPT_WEP40:
+	case HTT_RX_MPDU_ENCRYPT_WEP104:
+		return IEEE80211_WEP_ICV_LEN;
+	case HTT_RX_MPDU_ENCRYPT_TKIP_WITHOUT_MIC:
+	case HTT_RX_MPDU_ENCRYPT_TKIP_WPA:
+		return IEEE80211_TKIP_ICV_LEN;
+	case HTT_RX_MPDU_ENCRYPT_WEP128:
+	case HTT_RX_MPDU_ENCRYPT_WAPI:
+		break;
+	}
+
+	ath10k_warn(ar, "unsupported encryption type %d\n", type);
+	return 0;
+}
+
 struct amsdu_subframe_hdr {
 	u8 dst[ETH_ALEN];
 	u8 src[ETH_ALEN];
@@ -1063,25 +1086,27 @@ static void ath10k_htt_rx_h_undecap_raw(struct ath10k *ar,
 	/* Tail */
 	if (status->flag & RX_FLAG_IV_STRIPPED) {
 		skb_trim(msdu, msdu->len -
-			 ath10k_htt_rx_crypto_tail_len(ar, enctype));
+			 ath10k_htt_rx_crypto_mic_len(ar, enctype));
+
+		skb_trim(msdu, msdu->len -
+			 ath10k_htt_rx_crypto_icv_len(ar, enctype));
 	} else {
 		/* MIC */
-		if ((status->flag & RX_FLAG_MIC_STRIPPED) &&
-		    enctype == HTT_RX_MPDU_ENCRYPT_AES_CCM_WPA2)
-			skb_trim(msdu, msdu->len - 8);
+		if (status->flag & RX_FLAG_MIC_STRIPPED)
+			skb_trim(msdu, msdu->len -
+				 ath10k_htt_rx_crypto_mic_len(ar, enctype));
 
 		/* ICV */
-		if (status->flag & RX_FLAG_ICV_STRIPPED &&
-		    enctype != HTT_RX_MPDU_ENCRYPT_AES_CCM_WPA2)
+		if (status->flag & RX_FLAG_ICV_STRIPPED)
 			skb_trim(msdu, msdu->len -
-				 ath10k_htt_rx_crypto_tail_len(ar, enctype));
+				 ath10k_htt_rx_crypto_icv_len(ar, enctype));
 	}
 
 	/* MMIC */
 	if ((status->flag & RX_FLAG_MMIC_STRIPPED) &&
 	    !ieee80211_has_morefrags(hdr->frame_control) &&
 	    enctype == HTT_RX_MPDU_ENCRYPT_TKIP_WPA)
-		skb_trim(msdu, msdu->len - 8);
+		skb_trim(msdu, msdu->len - MICHAEL_MIC_LEN);
 
 	/* Head */
 	if (status->flag & RX_FLAG_IV_STRIPPED) {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
