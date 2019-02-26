Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyZQR-0003oS-Ea
 for ath10k@lists.infradead.org; Tue, 26 Feb 2019 09:53:25 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH v2] ath10k: Fill rx duration for each peer in fw_stats for
 WCN3990
Date: Tue, 26 Feb 2019 15:23:16 +0530
Message-Id: <1551174796-25264-1-git-send-email-svishnoi@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Surabhi Vishnoi <svishnoi@codeaurora.org>

Currently, rx_duration for each peer is not getting populated in
fw_stats debugfs entry for WCN3990.

WCN3990 firmware sends rx duration for each peer as part of
peer_extd_stats in WMI_UPDATE_STATS_EVENT. To enable peer_extd_stats,
firmware expects host to send fw_stats_req_mask with flag
WMI_TLV_PEER_STATS_EXTD set in WMI_REQUEST_STATS_CMD.

Send fw_stats_req_mask with flag WMI_TLV_PEER_STATS_EXTD set in
WMI_REQUEST_STATS_CMD and parse the peer_extd_stats in
WMI_UPDATE_STATS_EVENT to populate the rx_duration of each peer
in fw_stats debugfs entry.

Currently the driver handles 32-bit rx_duration, but the rx_duration
for WCN3990 can be upto 63 bit. The firmware sends rx_duration split
into two 32-bit fields, with the upper 32-bits being valid only if its
MSB is set. This change handles the 63-bit rx_duration obtained from
WCN3990 and maintain the backward compatibility.

To get the rx_duration of each connected peer :
cat /sys/kernel/debug/ieee80211/phyX/ath10k/fw_stats

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1

Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
---
Changes from v1:
-Fixed the Kbuild bot warning (left shift count >= width of type [-Wshift-count-overflow])
---
 drivers/net/wireless/ath/ath10k/core.c    |  4 ++--
 drivers/net/wireless/ath/ath10k/core.h    |  2 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 31 +++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 20 ++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c     |  2 +-
 drivers/net/wireless/ath/ath10k/wmi.h     |  7 +++++++
 6 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index ac2cf3f..8afa3be 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2304,8 +2304,8 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 		else
 			ar->htt.max_num_pending_tx = TARGET_TLV_NUM_MSDU_DESC;
 		ar->wow.max_num_patterns = TARGET_TLV_NUM_WOW_PATTERNS;
-		ar->fw_stats_req_mask = WMI_STAT_PDEV | WMI_STAT_VDEV |
-			WMI_STAT_PEER;
+		ar->fw_stats_req_mask = WMI_TLV_STAT_PDEV | WMI_TLV_STAT_VDEV |
+			WMI_TLV_STAT_PEER | WMI_TLV_STAT_PEER_EXTD;
 		ar->max_spatial_stream = WMI_MAX_SPATIAL_STREAM;
 		ar->wmi.mgmt_max_num_pending_tx = TARGET_TLV_MGMT_NUM_MSDU_DESC;
 		break;
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 27ec555..e08a17b 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -189,7 +189,7 @@ struct ath10k_fw_stats_peer {
 	u32 peer_rssi;
 	u32 peer_tx_rate;
 	u32 peer_rx_rate; /* 10x only */
-	u32 rx_duration;
+	u64 rx_duration;
 };
 
 struct ath10k_fw_extd_stats_peer {
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index fc62174..9b2ed0e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -13,6 +13,7 @@
 #include "wmi-tlv.h"
 #include "p2p.h"
 #include "testmode.h"
+#include <linux/bitfield.h>
 
 /***************/
 /* TLV helpers */
@@ -1278,6 +1279,7 @@ static int ath10k_wmi_tlv_op_pull_fw_stats(struct ath10k *ar,
 {
 	const void **tb;
 	const struct wmi_tlv_stats_ev *ev;
+	u32 num_peer_stats_extd;
 	const void *data;
 	u32 num_pdev_stats;
 	u32 num_vdev_stats;
@@ -1285,6 +1287,7 @@ static int ath10k_wmi_tlv_op_pull_fw_stats(struct ath10k *ar,
 	u32 num_bcnflt_stats;
 	u32 num_chan_stats;
 	size_t data_len;
+	u32 stats_id;
 	int ret;
 	int i;
 
@@ -1309,11 +1312,13 @@ static int ath10k_wmi_tlv_op_pull_fw_stats(struct ath10k *ar,
 	num_peer_stats = __le32_to_cpu(ev->num_peer_stats);
 	num_bcnflt_stats = __le32_to_cpu(ev->num_bcnflt_stats);
 	num_chan_stats = __le32_to_cpu(ev->num_chan_stats);
+	stats_id = __le32_to_cpu(ev->stats_id);
+	num_peer_stats_extd = __le32_to_cpu(ev->num_peer_stats_extd);
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI,
-		   "wmi tlv stats update pdev %i vdev %i peer %i bcnflt %i chan %i\n",
+		   "wmi tlv stats update pdev %i vdev %i peer %i bcnflt %i chan %i peer_extd %i\n",
 		   num_pdev_stats, num_vdev_stats, num_peer_stats,
-		   num_bcnflt_stats, num_chan_stats);
+		   num_bcnflt_stats, num_chan_stats, num_peer_stats_extd);
 
 	for (i = 0; i < num_pdev_stats; i++) {
 		const struct wmi_pdev_stats *src;
@@ -1378,6 +1383,28 @@ static int ath10k_wmi_tlv_op_pull_fw_stats(struct ath10k *ar,
 
 		ath10k_wmi_pull_peer_stats(&src->old, dst);
 		dst->peer_rx_rate = __le32_to_cpu(src->peer_rx_rate);
+
+		if (stats_id & WMI_TLV_STAT_PEER_EXTD) {
+			const struct wmi_tlv_peer_stats_extd *extd;
+			unsigned long rx_duration_high;
+
+			extd = data + sizeof(*src) * (num_peer_stats - i - 1)
+			       + sizeof(*extd) * i;
+
+			dst->rx_duration = __le32_to_cpu(extd->rx_duration);
+			rx_duration_high = __le32_to_cpu
+						(extd->rx_duration_high);
+
+			if (test_bit(WMI_TLV_PEER_RX_DURATION_HIGH_VALID_BIT,
+				     &rx_duration_high)) {
+				rx_duration_high =
+					FIELD_GET(WMI_TLV_PEER_RX_DURATION_HIGH_MASK,
+						  rx_duration_high);
+				dst->rx_duration |= (u64)rx_duration_high <<
+						    WMI_TLV_PEER_RX_DURATION_SHIFT;
+			}
+		}
+
 		list_add_tail(&dst->list, &stats->peers);
 	}
 
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index af4cb0e..03d02ed 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1864,6 +1864,22 @@ struct wmi_tlv_req_stats_cmd {
 	struct wmi_mac_addr peer_macaddr;
 } __packed;
 
+#define WMI_TLV_PEER_RX_DURATION_HIGH_VALID_BIT	31
+#define WMI_TLV_PEER_RX_DURATION_HIGH_MASK	GENMASK(30, 0)
+#define WMI_TLV_PEER_RX_DURATION_SHIFT		32
+
+struct wmi_tlv_peer_stats_extd {
+	struct wmi_mac_addr peer_macaddr;
+	__le32 rx_duration;
+	__le32 peer_tx_bytes;
+	__le32 peer_rx_bytes;
+	__le32 last_tx_rate_code;
+	__le32 last_tx_power;
+	__le32 rx_mc_bc_cnt;
+	__le32 rx_duration_high;
+	__le32 reserved[2];
+} __packed;
+
 struct wmi_tlv_vdev_stats {
 	__le32 vdev_id;
 	__le32 beacon_snr;
@@ -1957,6 +1973,10 @@ struct wmi_tlv_stats_ev {
 	__le32 num_peer_stats;
 	__le32 num_bcnflt_stats;
 	__le32 num_chan_stats;
+	__le32 num_mib_stats;
+	__le32 pdev_id;
+	__le32 num_bcn_stats;
+	__le32 num_peer_stats_extd;
 } __packed;
 
 struct wmi_tlv_p2p_noa_ev {
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 97e5b2e..8fb043e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -8304,7 +8304,7 @@ size_t ath10k_wmi_fw_stats_num_vdevs(struct list_head *head)
 			"Peer TX rate", peer->peer_tx_rate);
 	len += scnprintf(buf + len, buf_len - len, "%30s %u\n",
 			"Peer RX rate", peer->peer_rx_rate);
-	len += scnprintf(buf + len, buf_len - len, "%30s %u\n",
+	len += scnprintf(buf + len, buf_len - len, "%30s %llu\n",
 			"Peer RX duration", peer->rx_duration);
 
 	len += scnprintf(buf + len, buf_len - len, "\n");
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index d9b646f..39a6568 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4534,6 +4534,13 @@ enum wmi_10_4_stats_id {
 	WMI_10_4_STAT_VDEV_EXTD		= BIT(4),
 };
 
+enum wmi_tlv_stats_id {
+	WMI_TLV_STAT_PDEV	= BIT(0),
+	WMI_TLV_STAT_VDEV	= BIT(1),
+	WMI_TLV_STAT_PEER	= BIT(2),
+	WMI_TLV_STAT_PEER_EXTD  = BIT(10),
+};
+
 struct wlan_inst_rssi_args {
 	__le16 cfg_retry_count;
 	__le16 retry_count;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
