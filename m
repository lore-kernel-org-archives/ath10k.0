Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFfn3-0002MF-ML
 for ath10k@lists.infradead.org; Wed, 22 Jun 2016 10:53:50 +0000
From: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
Subject: [PATCH] ath10k: simplify pktlog htt event processing
Date: Wed, 22 Jun 2016 16:22:41 +0530
Message-ID: <1466592761-6659-1-git-send-email-arnagara@qti.qualcomm.com>
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
Cc: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>, arnagara@codeaurora.org, linux-wireless@vger.kernel.org

It is expected that all pktlog events for 10.4 firmware based solutions
should come through CE8 where as in case of 10.2 firmware based solutions,
it should come through one of the HTT events (HTT_T2H_MSG_TYPE_PKTLOG).

But from experiments with 10.4 based solutions, it is observed that pktlog
event for ATH_PKTLOG_TYPE_TX_MSDU_ID is coming through HTT pktlog event.
Currently, we always parse with 10.2 pktlog header which will lead to
pktlog decoding issues (payload length mismatch exceptions)

For trace points, it is required to provide only the payload size. So
fixing this by simplifying the payload size calculation without the use of
ath10k pktlog headers.

While there, remove the unused ath10k pktlog headers.

Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |  8 +++-----
 drivers/net/wireless/ath/ath10k/hw.h     | 19 -------------------
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 80e6453..b2a9c4c 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2307,12 +2307,10 @@ bool ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 		ath10k_htt_rx_delba(ar, resp);
 		break;
 	case HTT_T2H_MSG_TYPE_PKTLOG: {
-		struct ath10k_pktlog_hdr *hdr =
-			(struct ath10k_pktlog_hdr *)resp->pktlog_msg.payload;
-
 		trace_ath10k_htt_pktlog(ar, resp->pktlog_msg.payload,
-					sizeof(*hdr) +
-					__le16_to_cpu(hdr->size));
+					skb->len -
+					offsetof(struct htt_resp,
+						 pktlog_msg.payload));
 		break;
 	}
 	case HTT_T2H_MSG_TYPE_RX_FLUSH: {
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index f31d3ce..427b720 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -296,25 +296,6 @@ enum ath10k_mcast2ucast_mode {
 	ATH10K_MCAST2UCAST_ENABLED = 1,
 };
 
-struct ath10k_pktlog_hdr {
-	__le16 flags;
-	__le16 missed_cnt;
-	__le16 log_type;
-	__le16 size;
-	__le32 timestamp;
-	u8 payload[0];
-} __packed;
-
-struct ath10k_pktlog_10_4_hdr {
-	__le16 flags;
-	__le16 missed_cnt;
-	__le16 log_type;
-	__le16 size;
-	__le32 timestamp;
-	__le32 type_specific_data;
-	u8 payload[0];
-} __packed;
-
 enum ath10k_hw_rate_ofdm {
 	ATH10K_HW_RATE_OFDM_48M = 0,
 	ATH10K_HW_RATE_OFDM_24M,
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
