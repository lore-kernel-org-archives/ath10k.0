Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2Ddo-00075I-80
 for ath10k@lists.infradead.org; Fri, 08 Mar 2019 11:26:17 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] ath10k: Fix channel info parsing for non tlv target
Date: Fri,  8 Mar 2019 16:56:06 +0530
Message-Id: <1552044366-9186-1-git-send-email-pillair@codeaurora.org>
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

The tlv targets such as WCN3990 send more data in
the chan info event, which is not sent by the non tlv
targets. There is a minimum size check in the wmi event for
non-tlv targets and hence we cannot update the common
channel info structure.

If the common channel info structure is updated, the
size check for chan info event for non-tlv targets
will fail and return -EPROTO and we see the below
error messages

   ath10k_pci 0000:01:00.0: failed to parse chan info event: -71

Add tlv specific channel info structure and restore the
original size of the common channel info structure to
mitigate this issue.

Tested HW: WCN3990
	   QCA9887
Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
	   10.2.4-1.0-00037

Fixes: 13104929d2ec ("ath10k: fill the channel survey results for WCN3990 correctly")
Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  2 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 16 ++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h     |  8 --------
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 582fb11..a826acb 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -810,7 +810,7 @@ static int ath10k_wmi_tlv_op_pull_ch_info_ev(struct ath10k *ar,
 					     struct wmi_ch_info_ev_arg *arg)
 {
 	const void **tb;
-	const struct wmi_chan_info_event *ev;
+	const struct wmi_tlv_chan_info_event *ev;
 	int ret;
 
 	tb = ath10k_wmi_tlv_parse_alloc(ar, skb->data, skb->len, GFP_ATOMIC);
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index 65e6aa5..4bdd655 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1607,6 +1607,22 @@ struct chan_info_params {
 
 #define WMI_TLV_FLAG_MGMT_BUNDLE_TX_COMPL	BIT(9)
 
+struct wmi_tlv_chan_info_event {
+	__le32 err_code;
+	__le32 freq;
+	__le32 cmd_flags;
+	__le32 noise_floor;
+	__le32 rx_clear_count;
+	__le32 cycle_count;
+	__le32 chan_tx_pwr_range;
+	__le32 chan_tx_pwr_tp;
+	__le32 rx_frame_count;
+	__le32 my_bss_rx_cycle_count;
+	__le32 rx_11b_mode_data_duration;
+	__le32 tx_frame_cnt;
+	__le32 mac_clk_mhz;
+} __packed;
+
 struct wmi_tlv_mgmt_tx_compl_ev {
 	__le32 desc_id;
 	__le32 status;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index e1c40bb..d188a2c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -6523,14 +6523,6 @@ struct wmi_chan_info_event {
 	__le32 noise_floor;
 	__le32 rx_clear_count;
 	__le32 cycle_count;
-	__le32 chan_tx_pwr_range;
-	__le32 chan_tx_pwr_tp;
-	__le32 rx_frame_count;
-	__le32 my_bss_rx_cycle_count;
-	__le32 rx_11b_mode_data_duration;
-	__le32 tx_frame_cnt;
-	__le32 mac_clk_mhz;
-
 } __packed;
 
 struct wmi_10_4_chan_info_event {
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
