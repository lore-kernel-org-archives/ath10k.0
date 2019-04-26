Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJuXu-0007Xi-Ko
 for ath10k@lists.infradead.org; Fri, 26 Apr 2019 06:41:20 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 1/5] ath10k: add struct for high latency PN replay protection
Date: Fri, 26 Apr 2019 09:41:07 +0300
Message-Id: <1556260871-2919-2-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1556260871-2919-1-git-send-email-kvalo@codeaurora.org>
References: <1556260871-2919-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Wen Gong <wgong@codeaurora.org>

From: Wen Gong <wgong@codeaurora.org>

Add the struct for PN replay protection and fragment packet
handler.

Also fix the bitmask of HTT_RX_DESC_HL_INFO_MCAST_BCAST to match what's currently
used by SDIO firmware. The defines are not used yet so it's safe to modify
them. Remove the conflicting HTT_RX_DESC_HL_INFO_FRAGMENT as
it's not either used in ath10k.

Tested on QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.h |  8 +++++++
 drivers/net/wireless/ath/ath10k/htt.h  | 43 ++++++++++++++++++++++++++++++----
 2 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index f22cb3f49034..02e53fb85814 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -400,6 +400,14 @@ struct ath10k_peer {
 
 	/* protected by ar->data_lock */
 	struct ieee80211_key_conf *keys[WMI_MAX_KEY_INDEX + 1];
+	union htt_rx_pn_t tids_last_pn[ATH10K_TXRX_NUM_EXT_TIDS];
+	bool tids_last_pn_valid[ATH10K_TXRX_NUM_EXT_TIDS];
+	union htt_rx_pn_t frag_tids_last_pn[ATH10K_TXRX_NUM_EXT_TIDS];
+	u32 frag_tids_seq[ATH10K_TXRX_NUM_EXT_TIDS];
+	struct {
+		enum htt_security_types sec_type;
+		int pn_len;
+	} rx_pn[ATH10K_HTT_TXRX_PEER_SECURITY_MAX];
 };
 
 struct ath10k_txq {
diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 4cee5492abc8..fb5cb9169073 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -733,6 +733,20 @@ struct htt_rx_indication_hl {
 	struct htt_rx_indication_mpdu_range mpdu_ranges[0];
 } __packed;
 
+struct htt_hl_rx_desc {
+	__le32 info;
+	__le32 pn_31_0;
+	union {
+		struct {
+			__le16 pn_47_32;
+			__le16 pn_63_48;
+		} pn16;
+		__le32 pn_63_32;
+	} u0;
+	__le32 pn_95_64;
+	__le32 pn_127_96;
+} __packed;
+
 static inline struct htt_rx_indication_mpdu_range *
 		htt_rx_ind_get_mpdu_ranges(struct htt_rx_indication *rx_ind)
 {
@@ -790,6 +804,21 @@ struct htt_rx_peer_unmap {
 	__le16 peer_id;
 } __packed;
 
+enum htt_txrx_sec_cast_type {
+	HTT_TXRX_SEC_MCAST = 0,
+	HTT_TXRX_SEC_UCAST
+};
+
+enum htt_rx_pn_check_type {
+	HTT_RX_NON_PN_CHECK = 0,
+	HTT_RX_PN_CHECK
+};
+
+enum htt_rx_tkip_demic_type {
+	HTT_RX_NON_TKIP_MIC = 0,
+	HTT_RX_TKIP_MIC
+};
+
 enum htt_security_types {
 	HTT_SECURITY_NONE,
 	HTT_SECURITY_WEP128,
@@ -803,6 +832,9 @@ enum htt_security_types {
 	HTT_NUM_SECURITY_TYPES /* keep this last! */
 };
 
+#define ATH10K_HTT_TXRX_PEER_SECURITY_MAX 2
+#define ATH10K_TXRX_NUM_EXT_TIDS 19
+
 enum htt_security_flags {
 #define HTT_SECURITY_TYPE_MASK 0x7F
 #define HTT_SECURITY_TYPE_LSB  0
@@ -1010,6 +1042,11 @@ struct htt_rx_fragment_indication {
 	u8 fw_msdu_rx_desc[0];
 } __packed;
 
+#define ATH10K_IEEE80211_EXTIV               BIT(5)
+#define ATH10K_IEEE80211_TKIP_MICLEN         8   /* trailing MIC */
+
+#define HTT_RX_FRAG_IND_INFO0_HEADER_LEN     16
+
 #define HTT_RX_FRAG_IND_INFO0_EXT_TID_MASK     0x1F
 #define HTT_RX_FRAG_IND_INFO0_EXT_TID_LSB      0
 #define HTT_RX_FRAG_IND_INFO0_FLUSH_VALID_MASK 0x20
@@ -2128,10 +2165,8 @@ struct htt_rx_desc {
 #define HTT_RX_DESC_HL_INFO_ENCRYPTED_LSB          12
 #define HTT_RX_DESC_HL_INFO_CHAN_INFO_PRESENT_MASK 0x00002000
 #define HTT_RX_DESC_HL_INFO_CHAN_INFO_PRESENT_LSB  13
-#define HTT_RX_DESC_HL_INFO_MCAST_BCAST_MASK       0x00008000
-#define HTT_RX_DESC_HL_INFO_MCAST_BCAST_LSB        15
-#define HTT_RX_DESC_HL_INFO_FRAGMENT_MASK          0x00010000
-#define HTT_RX_DESC_HL_INFO_FRAGMENT_LSB           16
+#define HTT_RX_DESC_HL_INFO_MCAST_BCAST_MASK       0x00010000
+#define HTT_RX_DESC_HL_INFO_MCAST_BCAST_LSB        16
 #define HTT_RX_DESC_HL_INFO_KEY_ID_OCT_MASK        0x01fe0000
 #define HTT_RX_DESC_HL_INFO_KEY_ID_OCT_LSB         17
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
