Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x229.google.com ([2a00:1450:4013:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKoqW-0003BX-Hc
 for ath10k@lists.infradead.org; Tue, 04 Mar 2014 12:53:21 +0000
Received: by mail-ea0-f169.google.com with SMTP id h14so335399eaj.14
 for <ath10k@lists.infradead.org>; Tue, 04 Mar 2014 04:52:58 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFC 11/14] ath10k: kill status from htt_rx_info
Date: Tue,  4 Mar 2014 13:52:24 +0100
Message-Id: <1393937548-7482-12-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1393937548-7482-1-git-send-email-janusz.dziedzic@tieto.com>
References: <1393937548-7482-1-git-send-email-janusz.dziedzic@tieto.com>
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

Not needed/used in htt_rx_info.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt.h    |    1 -
 drivers/net/wireless/ath/ath10k/htt_rx.c |   14 +++++---------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index d3d2f01..7ebbd8b 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1176,7 +1176,6 @@ struct htt_peer_unmap_event {
 struct htt_rx_info {
 	struct sk_buff *skb;
 	struct ieee80211_rx_status rx_status;
-	enum htt_rx_mpdu_status status;
 	enum htt_rx_mpdu_encrypt_type encrypt_type;
 };
 
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 3aa5a61..976499d 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1074,11 +1074,9 @@ static int ath10k_htt_rx_get_csum_state(struct sk_buff *skb)
 static bool ath10k_htt_rx_amsdu_allowed(struct ath10k_htt *htt,
 					struct sk_buff *head,
 					bool msdu_chaining,
-					struct htt_rx_info *info,
+					enum htt_rx_mpdu_status status,
 					bool channel_set)
 {
-	enum htt_rx_mpdu_status status = info->status;
-
 	if (!head) {
 		ath10k_warn("htt rx no data!\n");
 		return false;
@@ -1139,6 +1137,7 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 {
 	struct htt_rx_info info;
 	struct htt_rx_indication_mpdu_range *mpdu_ranges;
+	enum htt_rx_mpdu_status status;
 	struct ieee80211_hdr *hdr;
 	int num_mpdu_ranges;
 	int fw_desc_len;
@@ -1184,7 +1183,7 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 				num_mpdu_ranges));
 
 	for (i = 0; i < num_mpdu_ranges; i++) {
-		info.status = mpdu_ranges[i].mpdu_range_status;
+		status = mpdu_ranges[i].mpdu_range_status;
 
 		for (j = 0; j < mpdu_ranges[i].mpdu_count; j++) {
 			struct sk_buff *msdu_head, *msdu_tail;
@@ -1200,7 +1199,7 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 
 			if (!ath10k_htt_rx_amsdu_allowed(htt, msdu_head,
 							 !!msdu_chaining,
-							 &info,
+							 status,
 							 channel_set)) {
 				ath10k_htt_rx_free_msdu_chain(msdu_head);
 				continue;
@@ -1297,15 +1296,12 @@ static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt,
 	}
 
 	info.skb = msdu_head;
-	info.status = HTT_RX_IND_MPDU_STATUS_OK;
 	info.encrypt_type = MS(__le32_to_cpu(rxd->mpdu_start.info0),
 				RX_MPDU_START_INFO0_ENCRYPT_TYPE);
 	info.skb->ip_summed = ath10k_htt_rx_get_csum_state(info.skb);
 
-	if (tkip_mic_err) {
+	if (tkip_mic_err)
 		ath10k_warn("tkip mic error\n");
-		info.status = HTT_RX_IND_MPDU_STATUS_TKIP_MIC_ERR;
-	}
 
 	if (decrypt_err) {
 		ath10k_warn("decryption err in fragmented rx\n");
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
