Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x231.google.com ([2a00:1450:4013:c00::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WICDV-0006Bc-Hh
 for ath10k@lists.infradead.org; Tue, 25 Feb 2014 07:14:14 +0000
Received: by mail-ee0-f49.google.com with SMTP id b57so532336eek.36
 for <ath10k@lists.infradead.org>; Mon, 24 Feb 2014 23:13:51 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH] ath10k: improve rx path when play with attention flags
Date: Tue, 25 Feb 2014 08:13:34 +0100
Message-Id: <1393312414-9404-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org

Currently when we check attention flags we do __le32_to_cpu()
four times for each packet. This could have performance
impact for BIG endian platforms. This patch improve this
little bit.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |   71 +++++-------------------------
 1 file changed, 11 insertions(+), 60 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 316433f..97e4cd5 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -810,62 +810,6 @@ static void ath10k_htt_rx_msdu(struct ath10k_htt *htt, struct htt_rx_info *info)
 	ath10k_process_rx(htt->ar, info);
 }
 
-static bool ath10k_htt_rx_has_decrypt_err(struct sk_buff *skb)
-{
-	struct htt_rx_desc *rxd;
-	u32 flags;
-
-	rxd = (void *)skb->data - sizeof(*rxd);
-	flags = __le32_to_cpu(rxd->attention.flags);
-
-	if (flags & RX_ATTENTION_FLAGS_DECRYPT_ERR)
-		return true;
-
-	return false;
-}
-
-static bool ath10k_htt_rx_has_fcs_err(struct sk_buff *skb)
-{
-	struct htt_rx_desc *rxd;
-	u32 flags;
-
-	rxd = (void *)skb->data - sizeof(*rxd);
-	flags = __le32_to_cpu(rxd->attention.flags);
-
-	if (flags & RX_ATTENTION_FLAGS_FCS_ERR)
-		return true;
-
-	return false;
-}
-
-static bool ath10k_htt_rx_has_mic_err(struct sk_buff *skb)
-{
-	struct htt_rx_desc *rxd;
-	u32 flags;
-
-	rxd = (void *)skb->data - sizeof(*rxd);
-	flags = __le32_to_cpu(rxd->attention.flags);
-
-	if (flags & RX_ATTENTION_FLAGS_TKIP_MIC_ERR)
-		return true;
-
-	return false;
-}
-
-static bool ath10k_htt_rx_is_mgmt(struct sk_buff *skb)
-{
-	struct htt_rx_desc *rxd;
-	u32 flags;
-
-	rxd = (void *)skb->data - sizeof(*rxd);
-	flags = __le32_to_cpu(rxd->attention.flags);
-
-	if (flags & RX_ATTENTION_FLAGS_MGMT_TYPE)
-		return true;
-
-	return false;
-}
-
 static int ath10k_htt_rx_get_csum_state(struct sk_buff *skb)
 {
 	struct htt_rx_desc *rxd;
@@ -929,6 +873,9 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 			struct sk_buff *msdu_head, *msdu_tail;
 			enum htt_rx_mpdu_status status;
 			int msdu_chaining;
+			struct htt_rx_desc *rxd;
+			u32 att_flags;
+
 
 			msdu_head = NULL;
 			msdu_tail = NULL;
@@ -950,7 +897,11 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 				continue;
 			}
 
-			if (ath10k_htt_rx_has_decrypt_err(msdu_head)) {
+			rxd = (void *)msdu_head->data - sizeof(*rxd);
+			att_flags = __le32_to_cpu(rxd->attention.flags);
+
+
+			if (att_flags & RX_ATTENTION_FLAGS_DECRYPT_ERR) {
 				ath10k_htt_rx_free_msdu_chain(msdu_head);
 				continue;
 			}
@@ -959,7 +910,7 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 
 			/* Skip mgmt frames while we handle this in WMI */
 			if (status == HTT_RX_IND_MPDU_STATUS_MGMT_CTRL ||
-			    ath10k_htt_rx_is_mgmt(msdu_head)) {
+			    att_flags & RX_ATTENTION_FLAGS_MGMT_TYPE) {
 				ath10k_htt_rx_free_msdu_chain(msdu_head);
 				continue;
 			}
@@ -989,8 +940,8 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 			}
 
 			info.skb     = msdu_head;
-			info.fcs_err = ath10k_htt_rx_has_fcs_err(msdu_head);
-			info.mic_err = ath10k_htt_rx_has_mic_err(msdu_head);
+			info.fcs_err = !!(att_flags & RX_ATTENTION_FLAGS_FCS_ERR);
+			info.mic_err = !!(att_flags & RX_ATTENTION_FLAGS_TKIP_MIC_ERR);
 			info.signal  = ATH10K_DEFAULT_NOISE_FLOOR;
 			info.signal += rx->ppdu.combined_rssi;
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
