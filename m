Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWaED-0004b2-S9
 for ath10k@lists.infradead.org; Tue, 11 Dec 2018 05:05:07 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH] ath10k: Add support to provide higher range mem chunks in wmi
 init command
Date: Tue, 11 Dec 2018 10:34:35 +0530
Message-Id: <1544504675-6905-1-git-send-email-svishnoi@codeaurora.org>
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

With the current implementation of wmi init command,
there is no provision for the host driver to provide mem
chunks addresses with more than 32-bit, to the firmware.
WCN3990 is a 35-bit target and can accept mem chunks addresses
which are above 32-bit.

If firmware supports address range more than 32 bit, it
advertises the support by setting the WMI_SERVICE_EXTEND_ADDRESS
service. Based on this service fill the upper bits of paddr while
providing the mem chunks in the wmi init command.

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0-01552-QCAHLSWMTPL-1

Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  6 ++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 26 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h     |  3 +++
 3 files changed, 35 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 64e856c..57d1f01 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1538,6 +1538,12 @@ static enum wmi_txbf_conf ath10k_wmi_tlv_txbf_conf_scheme(struct ath10k *ar)
 		chunk->size = __cpu_to_le32(ar->wmi.mem_chunks[i].len);
 		chunk->req_id = __cpu_to_le32(ar->wmi.mem_chunks[i].req_id);
 
+		if (test_bit(WMI_SERVICE_SUPPORT_EXTEND_ADDRESS,
+			     ar->wmi.svc_map))
+			chunk->ptr_high = __cpu_to_le32
+					 (upper_32_bits
+					 (ar->wmi.mem_chunks[i].paddr));
+
 		ath10k_dbg(ar, ATH10K_DBG_WMI,
 			   "wmi-tlv chunk %d len %d, addr 0x%llx, id 0x%x\n",
 			   i,
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index bf8a432..d3f1bd0 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1394,6 +1394,27 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_AP_TWT = 153,
 	WMI_TLV_SERVICE_GMAC_OFFLOAD_SUPPORT = 154,
 	WMI_TLV_SERVICE_SPOOF_MAC_SUPPORT = 155,
+	WMI_TLV_SERVICE_PEER_TID_CONFIGS_SUPPORT = 156,
+	WMI_TLV_SERVICE_VDEV_SWRETRY_PER_AC_CONFIG_SUPPORT = 157,
+	WMI_TLV_SERVICE_DUAL_BEACON_ON_SINGLE_MAC_SCC_SUPPORT = 158,
+	WMI_TLV_SERVICE_DUAL_BEACON_ON_SINGLE_MAC_MCC_SUPPORT = 159,
+	WMI_TLV_SERVICE_MOTION_DET = 160,
+	WMI_TLV_SERVICE_INFRA_MBSSID = 161,
+	WMI_TLV_SERVICE_OBSS_SPATIAL_REUSE = 162,
+	WMI_TLV_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT = 163,
+	WMI_TLV_SERVICE_NAN_DBS_SUPPORT = 164,
+	WMI_TLV_SERVICE_NDI_DBS_SUPPORT = 165,
+	WMI_TLV_SERVICE_NAN_SAP_SUPPORT = 166,
+	WMI_TLV_SERVICE_NDI_SAP_SUPPORT = 167,
+	WMI_TLV_SERVICE_CFR_CAPTURE_SUPPORT = 168,
+	WMI_TLV_SERVICE_CFR_CAPTURE_IND_MSG_TYPE_1 = 169,
+	WMI_TLV_SERVICE_ESP_SUPPORT = 170,
+	WMI_TLV_SERVICE_PEER_CHWIDTH_CHANGE = 171,
+	WMI_TLV_SERVICE_WLAN_HPCS_PULSE = 172,
+	WMI_TLV_SERVICE_PER_VDEV_CHAINMASK_CONFIG_SUPPORT = 173,
+	WMI_TLV_SERVICE_TX_DATA_MGMT_ACK_RSSI = 174,
+	WMI_TLV_SERVICE_NAN_DISABLE_SUPPORT = 175,
+	WMI_TLV_SERVICE_SUPPORT_EXTEND_ADDRESS = 176,
 
 	WMI_TLV_MAX_EXT_SERVICE = 256,
 };
@@ -1564,6 +1585,11 @@ enum wmi_tlv_service {
 	SVCMAP(WMI_TLV_SERVICE_SPOOF_MAC_SUPPORT,
 	       WMI_SERVICE_SPOOF_MAC_SUPPORT,
 	       WMI_TLV_MAX_SERVICE);
+
+	SVCMAP(WMI_TLV_SERVICE_SUPPORT_EXTEND_ADDRESS,
+	       WMI_SERVICE_SUPPORT_EXTEND_ADDRESS,
+	       WMI_TLV_MAX_SERVICE);
+
 }
 
 #undef SVCMAP
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 58e33ab..ec2bfcf 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -205,6 +205,7 @@ enum wmi_service {
 	WMI_SERVICE_SPOOF_MAC_SUPPORT,
 	WMI_SERVICE_TX_DATA_ACK_RSSI,
 	WMI_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT,
+	WMI_SERVICE_SUPPORT_EXTEND_ADDRESS,
 
 	/* keep last */
 	WMI_SERVICE_MAX,
@@ -2990,6 +2991,8 @@ struct host_memory_chunk {
 	__le32 ptr;
 	/* size of the chunk */
 	__le32 size;
+	/* the upper 32 bit address valid only for more than 32 bit target */
+	__le32 ptr_high;
 } __packed;
 
 struct wmi_host_mem_chunks {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
