Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYIuh-0005Sa-NF
 for ath10k@lists.infradead.org; Tue, 23 Feb 2016 19:46:28 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH v2] ath10k: set MAC timestamp in management Rx frame
Date: Tue, 23 Feb 2016 11:44:34 -0800
Message-ID: <bed91e066a4998603c33ebcfaf507ccd2fabab5e.1456256461.git.poh@qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org

From: poh <poh@qca.qualcomm.com>

Check and set Rx MAC timestamp when firmware indicates it.
Firmware adds it in Rx beacon frame only at this moment.
Driver and mac80211 may utilize it to detect such clockdrift
or beacon collision and use the result for beacon collision
avoidance.

Signed-off-by: poh <poh@qca.qualcomm.com>
---

v2:
	- fix kbuild test robot warning, left shift count >= width of type,
	at __le32_to_cpu(arg.ext_info.rx_mac_timestamp_u32) << 32

 drivers/net/wireless/ath/ath10k/wmi.c | 14 ++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 0f01a8d..b2a4cda 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2167,6 +2167,7 @@ static int ath10k_wmi_op_pull_mgmt_rx_ev(struct ath10k *ar, struct sk_buff *skb,
 	struct wmi_mgmt_rx_event_v1 *ev_v1;
 	struct wmi_mgmt_rx_event_v2 *ev_v2;
 	struct wmi_mgmt_rx_hdr_v1 *ev_hdr;
+	struct wmi_mgmt_rx_ext_info *ext_info;
 	size_t pull_len;
 	u32 msdu_len;
 
@@ -2195,6 +2196,12 @@ static int ath10k_wmi_op_pull_mgmt_rx_ev(struct ath10k *ar, struct sk_buff *skb,
 	if (skb->len < msdu_len)
 		return -EPROTO;
 
+	if (arg->status & WMI_RX_STATUS_EXT_INFO) {
+		ext_info = (struct wmi_mgmt_rx_ext_info *)
+			   (skb->data + arg->buf_len);
+		memcpy(&arg->ext_info, ext_info,
+		       sizeof(struct wmi_mgmt_rx_ext_info));
+	}
 	/* the WMI buffer might've ended up being padded to 4 bytes due to HTC
 	 * trailer with credit update. Trim the excess garbage.
 	 */
@@ -2281,6 +2288,13 @@ int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	if (rx_status & WMI_RX_STATUS_ERR_MIC)
 		status->flag |= RX_FLAG_MMIC_ERROR;
 
+	if (rx_status & WMI_RX_STATUS_EXT_INFO) {
+		status->mactime =
+			__le32_to_cpu(arg.ext_info.rx_mac_timestamp_l32) |
+			(u64)__le32_to_cpu(arg.ext_info.rx_mac_timestamp_u32)
+			<< 32;
+		status->flag |= RX_FLAG_MACTIME_END;
+	}
 	/* Hardware can Rx CCK rates on 5GHz. In that case phy_mode is set to
 	 * MODE_11B. This means phy_mode is not a reliable source for the band
 	 * of mgmt rx.
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 806d4bb..8667a6b 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -3025,11 +3025,18 @@ struct wmi_10_4_mgmt_rx_event {
 	u8 buf[0];
 } __packed;
 
+struct wmi_mgmt_rx_ext_info {
+	__le32 rx_mac_timestamp_l32;
+	__le32 rx_mac_timestamp_u32;
+} __packed;
+
 #define WMI_RX_STATUS_OK			0x00
 #define WMI_RX_STATUS_ERR_CRC			0x01
 #define WMI_RX_STATUS_ERR_DECRYPT		0x08
 #define WMI_RX_STATUS_ERR_MIC			0x10
 #define WMI_RX_STATUS_ERR_KEY_CACHE_MISS	0x20
+/* Extension data at the end of mgmt frame */
+#define WMI_RX_STATUS_EXT_INFO		0x40
 
 #define PHY_ERROR_GEN_SPECTRAL_SCAN		0x26
 #define PHY_ERROR_GEN_FALSE_RADAR_EXT		0x24
@@ -6076,6 +6083,7 @@ struct wmi_mgmt_rx_ev_arg {
 	__le32 phy_mode;
 	__le32 buf_len;
 	__le32 status; /* %WMI_RX_STATUS_ */
+	struct wmi_mgmt_rx_ext_info ext_info;
 };
 
 struct wmi_ch_info_ev_arg {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
