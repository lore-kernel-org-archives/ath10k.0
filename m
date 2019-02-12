Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtXMA-00016M-Ar
 for ath10k@lists.infradead.org; Tue, 12 Feb 2019 12:40:14 +0000
From: Abhishek Ambure <aambure@codeaurora.org>
Subject: [PATCH v2 2/2] ath10k: Add support for ack rssi value of data tx
 packets
Date: Tue, 12 Feb 2019 18:09:51 +0530
Message-Id: <1549975191-20912-3-git-send-email-aambure@codeaurora.org>
In-Reply-To: <1549975191-20912-1-git-send-email-aambure@codeaurora.org>
References: <1549975191-20912-1-git-send-email-aambure@codeaurora.org>
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
Cc: Abhishek Ambure <aambure@codeaurora.org>, linux-wireless@vger.kernel.org

In WCN3990, WMI_TLV_SERVICE_TX_DATA_MGMT_ACK_RSSI service Indicates that
the firmware has the capability to send the RSSI value of the ACK for all
data and management packets transmitted.

If WMI_RSRC_CFG_FLAG_TX_ACK_RSSI is set in host capability then firmware
sends RSSI value in "data" tx completion event. Host extracts ack rssi
values of data packets from their tx completion event.

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0-01617-QCAHLSWMTPLZ-1

Signed-off-by: Abhishek Ambure <aambure@codeaurora.org>
V2: Tested HW & Tested FW added
---
 drivers/net/wireless/ath/ath10k/htt.h    | 86 ++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/htt_rx.c | 12 +++--
 drivers/net/wireless/ath/ath10k/hw.c     | 32 +++++++++++-
 drivers/net/wireless/ath/ath10k/hw.h     | 22 ++++++++
 4 files changed, 146 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 9ae9466..860fb6f 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -582,6 +582,10 @@ struct htt_mgmt_tx_completion {
 
 #define HTT_TX_CMPL_FLAG_DATA_RSSI BIT(0)
 
+#define HTT_TX_DATA_RSSI_ENABLE_WCN3990 BIT(3)
+#define HTT_TX_DATA_APPEND_RETRIES BIT(0)
+#define HTT_TX_DATA_APPEND_TIMESTAMP BIT(1)
+
 struct htt_rx_indication_hdr {
 	u8 info0; /* %HTT_RX_INDICATION_INFO0_ */
 	__le16 peer_id;
@@ -835,6 +839,88 @@ enum htt_data_tx_flags {
 
 #define HTT_TX_COMPL_INV_MSDU_ID 0xFFFF
 
+struct htt_append_retries {
+	__le16 msdu_id;
+	u8 tx_retries;
+	u8 flag;
+} __packed;
+
+struct htt_data_tx_completion_ext {
+	struct htt_append_retries a_retries;
+	__le32 t_stamp;
+	__le16 msdus_rssi[0];
+} __packed;
+
+/**
+ * @brief target -> host TX completion indication message definition
+ *
+ * @details
+ * The following diagram shows the format of the TX completion indication sent
+ * from the target to the host
+ *
+ *          |31 28|27|26|25|24|23        16| 15 |14 11|10   8|7          0|
+ *          |-------------------------------------------------------------|
+ * header:  |rsvd |A2|TP|A1|A0|     num    | t_i| tid |status|  msg_type  |
+ *          |-------------------------------------------------------------|
+ * payload: |            MSDU1 ID          |         MSDU0 ID             |
+ *          |-------------------------------------------------------------|
+ *          :            MSDU3 ID          :         MSDU2 ID             :
+ *          |-------------------------------------------------------------|
+ *          |          struct htt_tx_compl_ind_append_retries             |
+ *          |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -|
+ *          |          struct htt_tx_compl_ind_append_tx_tstamp           |
+ *          |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -|
+ *          |           MSDU1 ACK RSSI     |        MSDU0 ACK RSSI        |
+ *          |-------------------------------------------------------------|
+ *          :           MSDU3 ACK RSSI     :        MSDU2 ACK RSSI        :
+ *          |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -|
+ *    -msg_type
+ *     Bits 7:0
+ *     Purpose: identifies this as HTT TX completion indication
+ *    -status
+ *     Bits 10:8
+ *     Purpose: the TX completion status of payload fragmentations descriptors
+ *     Value: could be HTT_TX_COMPL_IND_STAT_OK or HTT_TX_COMPL_IND_STAT_DISCARD
+ *    -tid
+ *     Bits 14:11
+ *     Purpose: the tid associated with those fragmentation descriptors. It is
+ *     valid or not, depending on the tid_invalid bit.
+ *     Value: 0 to 15
+ *    -tid_invalid
+ *     Bits 15:15
+ *     Purpose: this bit indicates whether the tid field is valid or not
+ *     Value: 0 indicates valid, 1 indicates invalid
+ *    -num
+ *     Bits 23:16
+ *     Purpose: the number of payload in this indication
+ *     Value: 1 to 255
+ *    -A0 = append
+ *     Bits 24:24
+ *     Purpose: append the struct htt_tx_compl_ind_append_retries which contains
+ *            the number of tx retries for one MSDU at the end of this message
+ *     Value: 0 indicates no appending, 1 indicates appending
+ *    -A1 = append1
+ *     Bits 25:25
+ *     Purpose: Append the struct htt_tx_compl_ind_append_tx_tstamp which
+ *            contains the timestamp info for each TX msdu id in payload.
+ *     Value: 0 indicates no appending, 1 indicates appending
+ *    -TP = MSDU tx power presence
+ *     Bits 26:26
+ *     Purpose: Indicate whether the TX_COMPL_IND includes a tx power report
+ *            for each MSDU referenced by the TX_COMPL_IND message.
+ *            The order of the per-MSDU tx power reports matches the order
+ *            of the MSDU IDs.
+ *     Value: 0 indicates not appending, 1 indicates appending
+ *    -A2 = append2
+ *     Bits 27:27
+ *     Purpose: Indicate whether data ACK RSSI is appended for each MSDU in
+ *            TX_COMP_IND message.  The order of the per-MSDU ACK RSSI report
+ *            matches the order of the MSDU IDs.
+ *            The ACK RSSI values are valid when status is COMPLETE_OK (and
+ *            this append2 bit is set).
+ *     Value: 0 indicates not appending, 1 indicates appending
+ */
+
 struct htt_data_tx_completion {
 	union {
 		u8 flags;
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index d6d696a..1380772 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1810,7 +1810,7 @@ static void ath10k_htt_rx_tx_compl_ind(struct ath10k *ar,
 	__le16 msdu_id, *msdus;
 	bool rssi_enabled = false;
 	u8 msdu_count = 0;
-	int i;
+	int i, htt_pad = 0;
 
 	switch (status) {
 	case HTT_DATA_TX_STATUS_NO_ACK:
@@ -1834,9 +1834,11 @@ static void ath10k_htt_rx_tx_compl_ind(struct ath10k *ar,
 		   resp->data_tx_completion.num_msdus);
 
 	msdu_count = resp->data_tx_completion.num_msdus;
+	rssi_enabled = ath10k_is_rssi_enable(&ar->hw_params, resp);
 
-	if (resp->data_tx_completion.flags2 & HTT_TX_CMPL_FLAG_DATA_RSSI)
-		rssi_enabled = true;
+	if (rssi_enabled)
+		htt_pad = ath10k_tx_data_rssi_get_pad_bytes(&ar->hw_params,
+							    resp);
 
 	for (i = 0; i < msdu_count; i++) {
 		msdus = resp->data_tx_completion.msdus;
@@ -1849,10 +1851,10 @@ static void ath10k_htt_rx_tx_compl_ind(struct ath10k *ar,
 			 * last msdu id with 0xffff
 			 */
 			if (msdu_count & 0x01) {
-				msdu_id = msdus[msdu_count +  i + 1];
+				msdu_id = msdus[msdu_count +  i + 1 + htt_pad];
 				tx_done.ack_rssi = __le16_to_cpu(msdu_id);
 			} else {
-				msdu_id = msdus[msdu_count +  i];
+				msdu_id = msdus[msdu_count +  i + htt_pad];
 				tx_done.ack_rssi = __le16_to_cpu(msdu_id);
 			}
 		}
diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index 6243fbf..6714913 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -1106,6 +1106,32 @@ int ath10k_hw_diag_fast_download(struct ath10k *ar,
 	return ret;
 }
 
+static int ath10k_htt_tx_rssi_enable(struct htt_resp *resp)
+{
+	return (resp->data_tx_completion.flags2 & HTT_TX_CMPL_FLAG_DATA_RSSI);
+}
+
+static int ath10k_htt_tx_rssi_enable_wcn3990(struct htt_resp *resp)
+{
+	return (resp->data_tx_completion.flags2 &
+		HTT_TX_DATA_RSSI_ENABLE_WCN3990);
+}
+
+static int ath10k_get_htt_tx_data_rssi_pad(struct htt_resp *resp)
+{
+	struct htt_data_tx_completion_ext extd;
+	int pad_bytes = 0;
+
+	if (resp->data_tx_completion.flags2 & HTT_TX_DATA_APPEND_RETRIES)
+		pad_bytes += sizeof(extd.a_retries) /
+			     sizeof(extd.msdus_rssi[0]);
+
+	if (resp->data_tx_completion.flags2 & HTT_TX_DATA_APPEND_TIMESTAMP)
+		pad_bytes += sizeof(extd.t_stamp) / sizeof(extd.msdus_rssi[0]);
+
+	return pad_bytes;
+}
+
 const struct ath10k_hw_ops qca988x_ops = {
 	.set_coverage_class = ath10k_hw_qca988x_set_coverage_class,
 };
@@ -1130,6 +1156,10 @@ static bool ath10k_qca99x0_rx_desc_msdu_limit_error(struct htt_rx_desc *rxd)
 const struct ath10k_hw_ops qca6174_ops = {
 	.set_coverage_class = ath10k_hw_qca988x_set_coverage_class,
 	.enable_pll_clk = ath10k_hw_qca6174_enable_pll_clock,
+	.is_rssi_enable = ath10k_htt_tx_rssi_enable,
 };
 
-const struct ath10k_hw_ops wcn3990_ops = {};
+const struct ath10k_hw_ops wcn3990_ops = {
+	.tx_data_rssi_pad_bytes = ath10k_get_htt_tx_data_rssi_pad,
+	.is_rssi_enable = ath10k_htt_tx_rssi_enable_wcn3990,
+};
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 2733b54..567f1b8 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -607,6 +607,8 @@ struct ath10k_hw_params {
 };
 
 struct htt_rx_desc;
+struct htt_resp;
+struct htt_data_tx_completion_ext;
 
 /* Defines needed for Rx descriptor abstraction */
 struct ath10k_hw_ops {
@@ -614,6 +616,8 @@ struct ath10k_hw_ops {
 	void (*set_coverage_class)(struct ath10k *ar, s16 value);
 	int (*enable_pll_clk)(struct ath10k *ar);
 	bool (*rx_desc_get_msdu_limit_error)(struct htt_rx_desc *rxd);
+	int (*tx_data_rssi_pad_bytes)(struct htt_resp *htt);
+	int (*is_rssi_enable)(struct htt_resp *resp);
 };
 
 extern const struct ath10k_hw_ops qca988x_ops;
@@ -641,6 +645,24 @@ struct ath10k_hw_ops {
 	return false;
 }
 
+static inline int
+ath10k_tx_data_rssi_get_pad_bytes(struct ath10k_hw_params *hw,
+				  struct htt_resp *htt)
+{
+	if (hw->hw_ops->tx_data_rssi_pad_bytes)
+		return hw->hw_ops->tx_data_rssi_pad_bytes(htt);
+	return 0;
+}
+
+static inline int
+ath10k_is_rssi_enable(struct ath10k_hw_params *hw,
+		      struct htt_resp *resp)
+{
+	if (hw->hw_ops->is_rssi_enable)
+		return hw->hw_ops->is_rssi_enable(resp);
+	return 0;
+}
+
 /* Target specific defines for MAIN firmware */
 #define TARGET_NUM_VDEVS			8
 #define TARGET_NUM_PEER_AST			2
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
