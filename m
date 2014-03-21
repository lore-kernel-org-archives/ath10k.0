Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x233.google.com ([2a00:1450:4013:c00::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQvp6-00066P-VF
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 09:33:11 +0000
Received: by mail-ee0-f51.google.com with SMTP id c13so1587937eek.10
 for <ath10k@lists.infradead.org>; Fri, 21 Mar 2014 02:32:49 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH 7/8] ath10k: improve way we play with attention flags
Date: Fri, 21 Mar 2014 10:32:20 +0100
Message-Id: <1395394341-3958-8-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1395394341-3958-1-git-send-email-janusz.dziedzic@tieto.com>
References: <1395394341-3958-1-git-send-email-janusz.dziedzic@tieto.com>
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

Remove almost the same code, and do only once
__le32_to_cpu() conversion.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |   94 ++++++------------------------
 1 file changed, 19 insertions(+), 75 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 64abc2a..bc40f11 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -800,7 +800,7 @@ static void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
 	memcpy(status, &info->rx_status, sizeof(*status));
 
 	ath10k_dbg(ATH10K_DBG_DATA,
-		   "rx skb %p len %u %s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i\n",
+		   "rx skb %p len %u %s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %imic-err %i\n",
 		   info->skb,
 		   info->skb->len,
 		   status->flag == 0 ? "legacy" : "",
@@ -813,7 +813,8 @@ static void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
 		   status->vht_nss,
 		   status->freq,
 		   status->band, status->flag,
-		   !!(status->flag & RX_FLAG_FAILED_FCS_CRC));
+		   !!(status->flag & RX_FLAG_FAILED_FCS_CRC),
+		   !!(status->flag & RX_FLAG_MMIC_ERROR));
 	ath10k_dbg_dump(ATH10K_DBG_HTT_DUMP, NULL, "rx skb: ",
 			info->skb->data, info->skb->len);
 
@@ -1000,62 +1001,6 @@ static void ath10k_htt_rx_msdu(struct ath10k_htt *htt, struct htt_rx_info *info)
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
@@ -1141,7 +1086,8 @@ static int ath10k_unchain_msdu(struct sk_buff *msdu_head)
 static bool ath10k_htt_rx_amsdu_allowed(struct ath10k_htt *htt,
 					struct sk_buff *head,
 					enum htt_rx_mpdu_status status,
-					bool channel_set)
+					bool channel_set,
+					u32 attention)
 {
 	if (head->len == 0) {
 		ath10k_dbg(ATH10K_DBG_HTT,
@@ -1149,7 +1095,7 @@ static bool ath10k_htt_rx_amsdu_allowed(struct ath10k_htt *htt,
 		return false;
 	}
 
-	if (ath10k_htt_rx_has_decrypt_err(head)) {
+	if (attention & RX_ATTENTION_FLAGS_DECRYPT_ERR) {
 		ath10k_dbg(ATH10K_DBG_HTT,
 			   "htt rx dropping due to decrypt-err\n");
 		return false;
@@ -1162,7 +1108,7 @@ static bool ath10k_htt_rx_amsdu_allowed(struct ath10k_htt *htt,
 
 	/* Skip mgmt frames while we handle this in WMI */
 	if (status == HTT_RX_IND_MPDU_STATUS_MGMT_CTRL ||
-	    ath10k_htt_rx_is_mgmt(head)) {
+	    attention & RX_ATTENTION_FLAGS_MGMT_TYPE) {
 		ath10k_dbg(ATH10K_DBG_HTT, "htt rx mgmt ctrl\n");
 		return false;
 	}
@@ -1191,12 +1137,14 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 {
 	struct htt_rx_info info;
 	struct htt_rx_indication_mpdu_range *mpdu_ranges;
+	struct htt_rx_desc *rxd;
 	enum htt_rx_mpdu_status status;
 	struct ieee80211_hdr *hdr;
 	int num_mpdu_ranges;
+	u32 attention;
 	int fw_desc_len;
 	u8 *fw_desc;
-	bool channel_set, fcs_err, mic_err;
+	bool channel_set;
 	int i, j;
 	int ret;
 
@@ -1258,9 +1206,15 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 				continue;
 			}
 
+			rxd = container_of((void *) msdu_head->data,
+					   struct htt_rx_desc,
+					   msdu_payload);
+			attention = __le32_to_cpu(rxd->attention.flags);
+
 			if (!ath10k_htt_rx_amsdu_allowed(htt, msdu_head,
 							 status,
-							 channel_set)) {
+							 channel_set,
+							 attention)) {
 				ath10k_htt_rx_free_msdu_chain(msdu_head);
 				continue;
 			}
@@ -1273,26 +1227,16 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 
 			info.skb     = msdu_head;
 
-			fcs_err = ath10k_htt_rx_has_fcs_err(msdu_head);
-			if (fcs_err)
+			if (attention & RX_ATTENTION_FLAGS_FCS_ERR)
 				info.rx_status.flag |= RX_FLAG_FAILED_FCS_CRC;
 			else
 				info.rx_status.flag &= ~RX_FLAG_FAILED_FCS_CRC;
 
-			mic_err = ath10k_htt_rx_has_mic_err(msdu_head);
-			if (mic_err)
+			if (attention & RX_ATTENTION_FLAGS_TKIP_MIC_ERR)
 				info.rx_status.flag |= RX_FLAG_MMIC_ERROR;
 			else
 				info.rx_status.flag &= ~RX_FLAG_MMIC_ERROR;
 
-			if (fcs_err)
-				ath10k_dbg(ATH10K_DBG_HTT,
-					   "htt rx has FCS err\n");
-
-			if (mic_err)
-				ath10k_dbg(ATH10K_DBG_HTT,
-					   "htt rx has MIC err\n");
-
 			hdr = ath10k_htt_rx_skb_get_hdr(msdu_head);
 
 			if (ath10k_htt_rx_hdr_is_amsdu(hdr))
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
