Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zs5zK-0007rE-Kd
 for ath10k@lists.infradead.org; Fri, 30 Oct 2015 09:28:47 +0000
From: Vivek Natarajan <nataraja@qti.qualcomm.com>
Subject: [PATCH v2] ath10k: Add support for pktlog in QCA99X0
Date: Fri, 30 Oct 2015 14:57:58 +0530
Message-ID: <1446197278-6164-1-git-send-email-nataraja@qti.qualcomm.com>
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
To: kvalo@qca.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

This patch adds pktlog support for 10.4 fw versions.

Signed-off-by: Vivek Natarajan <nataraja@qti.qualcomm.com>
---
v2: Move pktlog_completion_handler to htt_rx.c

 drivers/net/wireless/ath/ath10k/htt.h    |  2 ++
 drivers/net/wireless/ath/ath10k/htt_rx.c | 12 ++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h     | 10 ++++++++++
 drivers/net/wireless/ath/ath10k/pci.c    | 11 +++++++++++
 4 files changed, 35 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 2bad50e..74ccfb29 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1598,5 +1598,7 @@ int ath10k_htt_tx_alloc_msdu_id(struct ath10k_htt *htt, struct sk_buff *skb);
 void ath10k_htt_tx_free_msdu_id(struct ath10k_htt *htt, u16 msdu_id);
 int ath10k_htt_mgmt_tx(struct ath10k_htt *htt, struct sk_buff *);
 int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *);
+void ath10k_htt_rx_pktlog_completion_handler(struct ath10k *ar,
+					     struct sk_buff *skb);
 
 #endif
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 6060dda..d1dc1ba 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2127,6 +2127,18 @@ void ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 }
 EXPORT_SYMBOL(ath10k_htt_t2h_msg_handler);
 
+void ath10k_htt_rx_pktlog_completion_handler(struct ath10k *ar,
+					     struct sk_buff *skb)
+{
+	struct ath10k_pktlog_10_4_hdr *hdr =
+		(struct ath10k_pktlog_10_4_hdr *)skb->data;
+
+	trace_ath10k_htt_pktlog(ar, hdr->payload,
+				sizeof(*hdr) + __le16_to_cpu(hdr->size));
+	dev_kfree_skb_any(skb);
+}
+EXPORT_SYMBOL(ath10k_htt_rx_pktlog_completion_handler);
+
 static void ath10k_htt_txrx_compl_task(unsigned long ptr)
 {
 	struct ath10k_htt *htt = (struct ath10k_htt *)ptr;
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 2d87737..2fd5dc1 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -261,6 +261,16 @@ struct ath10k_pktlog_hdr {
 	u8 payload[0];
 } __packed;
 
+struct ath10k_pktlog_10_4_hdr {
+	__le16 flags;
+	__le16 missed_cnt;
+	__le16 log_type;
+	__le16 size;
+	__le32 timestamp;
+	__le32 type_specific_data;
+	u8 payload[0];
+} __packed;
+
 enum ath10k_hw_rate_ofdm {
 	ATH10K_HW_RATE_OFDM_48M = 0,
 	ATH10K_HW_RATE_OFDM_24M,
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 5c05b0c..5fed194 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -108,6 +108,7 @@ static void ath10k_pci_htc_tx_cb(struct ath10k_ce_pipe *ce_state);
 static void ath10k_pci_htc_rx_cb(struct ath10k_ce_pipe *ce_state);
 static void ath10k_pci_htt_tx_cb(struct ath10k_ce_pipe *ce_state);
 static void ath10k_pci_htt_rx_cb(struct ath10k_ce_pipe *ce_state);
+static void ath10k_pci_pktlog_rx_cb(struct ath10k_ce_pipe *ce_state);
 
 static const struct ce_attr host_ce_config_wlan[] = {
 	/* CE0: host->target HTC control and raw streams */
@@ -186,6 +187,7 @@ static const struct ce_attr host_ce_config_wlan[] = {
 		.src_nentries = 0,
 		.src_sz_max = 2048,
 		.dest_nentries = 128,
+		.recv_cb = ath10k_pci_pktlog_rx_cb,
 	},
 
 	/* CE9 target autonomous qcache memcpy */
@@ -1230,6 +1232,15 @@ static void ath10k_pci_htc_rx_cb(struct ath10k_ce_pipe *ce_state)
 	ath10k_pci_process_rx_cb(ce_state, ath10k_htc_rx_completion_handler);
 }
 
+/* Called by lower (CE) layer when data is received from the Target.
+ * Only 10.4 firmware uses separate CE to transfer pktlog data.
+ */
+static void ath10k_pci_pktlog_rx_cb(struct ath10k_ce_pipe *ce_state)
+{
+	ath10k_pci_process_rx_cb(ce_state,
+				 ath10k_htt_rx_pktlog_completion_handler);
+}
+
 /* Called by lower (CE) layer when a send to HTT Target completes. */
 static void ath10k_pci_htt_tx_cb(struct ath10k_ce_pipe *ce_state)
 {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
