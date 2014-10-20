Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x229.google.com ([2a00:1450:4010:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgDQ0-0004OQ-Q7
 for ath10k@lists.infradead.org; Mon, 20 Oct 2014 13:54:42 +0000
Received: by mail-lb0-f169.google.com with SMTP id 10so3938610lbg.0
 for <ath10k@lists.infradead.org>; Mon, 20 Oct 2014 06:54:18 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/9] ath10k: use ieee80211 defines for crypto param lengths
Date: Mon, 20 Oct 2014 15:40:32 +0200
Message-Id: <1413812438-14640-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1413812438-14640-1-git-send-email-michal.kazior@tieto.com>
References: <1413812438-14640-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Use the globally defined ieee80211 values instead
of re-defining them in the driver again.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 34 +++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 61ff2ac..ca466ce 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -588,41 +588,47 @@ static int ath10k_htt_rx_crypto_param_len(struct ath10k *ar,
 					  enum htt_rx_mpdu_encrypt_type type)
 {
 	switch (type) {
+	case HTT_RX_MPDU_ENCRYPT_NONE:
+		return 0;
 	case HTT_RX_MPDU_ENCRYPT_WEP40:
 	case HTT_RX_MPDU_ENCRYPT_WEP104:
-		return 4;
+		return IEEE80211_WEP_IV_LEN;
 	case HTT_RX_MPDU_ENCRYPT_TKIP_WITHOUT_MIC:
-	case HTT_RX_MPDU_ENCRYPT_WEP128: /* not tested */
 	case HTT_RX_MPDU_ENCRYPT_TKIP_WPA:
-	case HTT_RX_MPDU_ENCRYPT_WAPI: /* not tested */
+		return IEEE80211_TKIP_IV_LEN;
 	case HTT_RX_MPDU_ENCRYPT_AES_CCM_WPA2:
-		return 8;
-	case HTT_RX_MPDU_ENCRYPT_NONE:
-		return 0;
+		return IEEE80211_CCMP_HDR_LEN;
+	case HTT_RX_MPDU_ENCRYPT_WEP128:
+	case HTT_RX_MPDU_ENCRYPT_WAPI:
+		break;
 	}
 
-	ath10k_warn(ar, "unknown encryption type %d\n", type);
+	ath10k_warn(ar, "unsupported encryption type %d\n", type);
 	return 0;
 }
 
+#define MICHAEL_MIC_LEN 8
+
 static int ath10k_htt_rx_crypto_tail_len(struct ath10k *ar,
 					 enum htt_rx_mpdu_encrypt_type type)
 {
 	switch (type) {
 	case HTT_RX_MPDU_ENCRYPT_NONE:
+		return 0;
 	case HTT_RX_MPDU_ENCRYPT_WEP40:
 	case HTT_RX_MPDU_ENCRYPT_WEP104:
-	case HTT_RX_MPDU_ENCRYPT_WEP128:
-	case HTT_RX_MPDU_ENCRYPT_WAPI:
-		return 0;
+		return IEEE80211_WEP_ICV_LEN;
 	case HTT_RX_MPDU_ENCRYPT_TKIP_WITHOUT_MIC:
 	case HTT_RX_MPDU_ENCRYPT_TKIP_WPA:
-		return 4;
+		return IEEE80211_TKIP_ICV_LEN;
 	case HTT_RX_MPDU_ENCRYPT_AES_CCM_WPA2:
-		return 8;
+		return IEEE80211_CCMP_MIC_LEN;
+	case HTT_RX_MPDU_ENCRYPT_WEP128:
+	case HTT_RX_MPDU_ENCRYPT_WAPI:
+		break;
 	}
 
-	ath10k_warn(ar, "unknown encryption type %d\n", type);
+	ath10k_warn(ar, "unsupported encryption type %d\n", type);
 	return 0;
 }
 
@@ -1427,7 +1433,7 @@ static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt,
 	/* last fragment of TKIP frags has MIC */
 	if (!ieee80211_has_morefrags(hdr->frame_control) &&
 	    enctype == HTT_RX_MPDU_ENCRYPT_TKIP_WPA)
-		trim += 8;
+		trim += MICHAEL_MIC_LEN;
 
 	if (trim > msdu_head->len) {
 		ath10k_warn(ar, "htt rx fragment: trailer longer than the frame itself? drop\n");
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
