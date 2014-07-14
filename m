Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X6ffk-0002Cn-EO
 for ath10k@lists.infradead.org; Mon, 14 Jul 2014 12:48:02 +0000
Received: by mail-wi0-f182.google.com with SMTP id d1so2461631wiv.3
 for <ath10k@lists.infradead.org>; Mon, 14 Jul 2014 05:47:34 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH] ath10k: handle attention flags correctly when A-MSDU
Date: Mon, 14 Jul 2014 14:47:21 +0200
Message-Id: <1405342041-7114-1-git-send-email-janusz.dziedzic@tieto.com>
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

In case of A-MSDU RX we should check flags for all
MSDU subframes to be sure we have correct FCS status.

Before we check attention flags only for first frame
where we didn't have correct info about FCS status in
case of A-MSDU. Next didn't mark RX_FLAG_FAILED_FCS_CRC
for skb. As a side efect we see big TP drop when TCP used.
This was easy to reproduce when AP interface was used
and added monitor interface run in promiscuous mode.

Reported-by: Denton Gentry <denton.gentry@gmail.com>
Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |   23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 6c102b1..9f704fe 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -307,7 +307,8 @@ static void ath10k_htt_rx_free_msdu_chain(struct sk_buff *skb)
 static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 				   u8 **fw_desc, int *fw_desc_len,
 				   struct sk_buff **head_msdu,
-				   struct sk_buff **tail_msdu)
+				   struct sk_buff **tail_msdu,
+				   u32 *attention)
 {
 	int msdu_len, msdu_chaining = 0;
 	struct sk_buff *msdu;
@@ -358,6 +359,11 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 			break;
 		}
 
+		*attention |= __le32_to_cpu(rx_desc->attention.flags) &
+					    (RX_ATTENTION_FLAGS_TKIP_MIC_ERR |
+					     RX_ATTENTION_FLAGS_DECRYPT_ERR |
+					     RX_ATTENTION_FLAGS_FCS_ERR |
+					     RX_ATTENTION_FLAGS_MGMT_TYPE);
 		/*
 		 * Copy the FW rx descriptor for this MSDU from the rx
 		 * indication message into the MSDU's netbuf. HL uses the
@@ -1233,13 +1239,15 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 		for (j = 0; j < mpdu_ranges[i].mpdu_count; j++) {
 			struct sk_buff *msdu_head, *msdu_tail;
 
+			attention = 0;
 			msdu_head = NULL;
 			msdu_tail = NULL;
 			ret = ath10k_htt_rx_amsdu_pop(htt,
 						      &fw_desc,
 						      &fw_desc_len,
 						      &msdu_head,
-						      &msdu_tail);
+						      &msdu_tail,
+						      &attention);
 
 			if (ret < 0) {
 				ath10k_warn("failed to pop amsdu from htt rx ring %d\n",
@@ -1251,7 +1259,6 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 			rxd = container_of((void *)msdu_head->data,
 					   struct htt_rx_desc,
 					   msdu_payload);
-			attention = __le32_to_cpu(rxd->attention.flags);
 
 			if (!ath10k_htt_rx_amsdu_allowed(htt, msdu_head,
 							 status,
@@ -1304,6 +1311,7 @@ static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt,
 	u8 *fw_desc;
 	int fw_desc_len, hdrlen, paramlen;
 	int trim;
+	u32 attention = 0;
 
 	fw_desc_len = __le16_to_cpu(frag->fw_rx_desc_bytes);
 	fw_desc = (u8 *)frag->fw_msdu_rx_desc;
@@ -1313,7 +1321,8 @@ static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt,
 
 	spin_lock_bh(&htt->rx_ring.lock);
 	ret = ath10k_htt_rx_amsdu_pop(htt, &fw_desc, &fw_desc_len,
-				      &msdu_head, &msdu_tail);
+				      &msdu_head, &msdu_tail,
+				      &attention);
 	spin_unlock_bh(&htt->rx_ring.lock);
 
 	ath10k_dbg(ATH10K_DBG_HTT_DUMP, "htt rx frag ahead\n");
@@ -1330,10 +1339,8 @@ static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt,
 
 	hdr = (struct ieee80211_hdr *)msdu_head->data;
 	rxd = (void *)msdu_head->data - sizeof(*rxd);
-	tkip_mic_err = !!(__le32_to_cpu(rxd->attention.flags) &
-				RX_ATTENTION_FLAGS_TKIP_MIC_ERR);
-	decrypt_err = !!(__le32_to_cpu(rxd->attention.flags) &
-				RX_ATTENTION_FLAGS_DECRYPT_ERR);
+	tkip_mic_err = !!(attention & RX_ATTENTION_FLAGS_TKIP_MIC_ERR);
+	decrypt_err = !!(attention & RX_ATTENTION_FLAGS_DECRYPT_ERR);
 	fmt = MS(__le32_to_cpu(rxd->msdu_start.info1),
 			RX_MSDU_START_INFO1_DECAP_FORMAT);
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
