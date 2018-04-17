Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8Mr7-0002YT-WA
 for ath10k@lists.infradead.org; Tue, 17 Apr 2018 09:24:55 +0000
From: pillair@codeaurora.org
Subject: [PATCH v2] ath10k: Enable hw checksum for wcn3990
Date: Tue, 17 Apr 2018 14:54:26 +0530
Message-Id: <1523957066-12585-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org

From: Rakesh Pillai <pillair@codeaurora.org>

By default ath10k driver enables the support for HW_CHECKSUM
(NETIF_F_HW_CSUM). Since the TCP/UDP checksum calculation is not enabled
in the wcn3990 firmware the checksum is incorrect in the TCP/UDP packets
and all patckets are dropped. But due note that wcn3990 support in
ath10k is still incomplete so this isn't a critical fix (yet).

Enable hw checksum calculations in wcn3990 hardware by
setting the proper flags in msdu descriptor tso flags.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt.h    | 13 +++++++++++++
 drivers/net/wireless/ath/ath10k/htt_tx.c |  7 +++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 8cc2a8b..11f52df 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -127,6 +127,19 @@ struct htt_msdu_ext_desc_64 {
 				 | HTT_MSDU_EXT_DESC_FLAG_TCP_IPV4_CSUM_ENABLE \
 				 | HTT_MSDU_EXT_DESC_FLAG_TCP_IPV6_CSUM_ENABLE)
 
+#define HTT_MSDU_EXT_DESC_FLAG_IPV4_CSUM_ENABLE_64		BIT(16)
+#define HTT_MSDU_EXT_DESC_FLAG_UDP_IPV4_CSUM_ENABLE_64		BIT(17)
+#define HTT_MSDU_EXT_DESC_FLAG_UDP_IPV6_CSUM_ENABLE_64		BIT(18)
+#define HTT_MSDU_EXT_DESC_FLAG_TCP_IPV4_CSUM_ENABLE_64		BIT(19)
+#define HTT_MSDU_EXT_DESC_FLAG_TCP_IPV6_CSUM_ENABLE_64		BIT(20)
+#define HTT_MSDU_EXT_DESC_FLAG_PARTIAL_CSUM_ENABLE_64		BIT(21)
+
+#define HTT_MSDU_CHECKSUM_ENABLE_64  (HTT_MSDU_EXT_DESC_FLAG_IPV4_CSUM_ENABLE_64 \
+				     | HTT_MSDU_EXT_DESC_FLAG_UDP_IPV4_CSUM_ENABLE_64 \
+				     | HTT_MSDU_EXT_DESC_FLAG_UDP_IPV6_CSUM_ENABLE_64 \
+				     | HTT_MSDU_EXT_DESC_FLAG_TCP_IPV4_CSUM_ENABLE_64 \
+				     | HTT_MSDU_EXT_DESC_FLAG_TCP_IPV6_CSUM_ENABLE_64)
+
 enum htt_data_tx_desc_flags0 {
 	HTT_DATA_TX_DESC_FLAGS0_MAC_HDR_PRESENT = 1 << 0,
 	HTT_DATA_TX_DESC_FLAGS0_NO_AGGR         = 1 << 1,
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index d334b7b..ad49d06 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1475,8 +1475,11 @@ static int ath10k_htt_tx_64(struct ath10k_htt *htt,
 	    !test_bit(ATH10K_FLAG_RAW_MODE, &ar->dev_flags)) {
 		flags1 |= HTT_DATA_TX_DESC_FLAGS1_CKSUM_L3_OFFLOAD;
 		flags1 |= HTT_DATA_TX_DESC_FLAGS1_CKSUM_L4_OFFLOAD;
-		if (ar->hw_params.continuous_frag_desc)
-			ext_desc->flags |= HTT_MSDU_CHECKSUM_ENABLE;
+		if (ar->hw_params.continuous_frag_desc) {
+			memset(ext_desc->tso_flag, 0, sizeof(ext_desc->tso_flag));
+			ext_desc->tso_flag[3] |=
+				__cpu_to_le32(HTT_MSDU_CHECKSUM_ENABLE_64);
+		}
 	}
 
 	/* Prevent firmware from sending up tx inspection requests. There's
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
