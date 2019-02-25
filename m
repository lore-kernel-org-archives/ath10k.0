Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyFgp-0007Ix-8W
 for ath10k@lists.infradead.org; Mon, 25 Feb 2019 12:49:01 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH v3] ath10k: Add support to provide higher range mem chunks in
 wmi init command
Date: Mon, 25 Feb 2019 18:18:46 +0530
Message-Id: <1551098926-24644-1-git-send-email-svishnoi@codeaurora.org>
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
Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1

Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
---
This patch is dependent on following patch:
ath10k: correct the format of host memory chunks in wmi init command (https://patchwork.kernel.org/patch/10811669/)
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 10 ++++++--
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 42 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h     |  1 +
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 554000c..4978299 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1572,7 +1572,7 @@ static enum wmi_txbf_conf ath10k_wmi_tlv_txbf_conf_scheme(struct ath10k *ar)
 static void
 ath10k_wmi_tlv_put_host_mem_chunks(struct ath10k *ar, void *host_mem_chunks)
 {
-	struct host_memory_chunk *chunk;
+	struct host_memory_chunk_tlv *chunk;
 	struct wmi_tlv *tlv;
 	int i;
 	__le16 tlv_len, tlv_tag;
@@ -1589,6 +1589,12 @@ static enum wmi_txbf_conf ath10k_wmi_tlv_txbf_conf_scheme(struct ath10k *ar)
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
@@ -1612,7 +1618,7 @@ static struct sk_buff *ath10k_wmi_tlv_op_gen_init(struct ath10k *ar)
 	void *ptr;
 
 	chunks_len = ar->wmi.num_mem_chunks *
-		     (sizeof(struct host_memory_chunk) + sizeof(*tlv));
+		     (sizeof(struct host_memory_chunk_tlv) + sizeof(*tlv));
 	len = (sizeof(*tlv) + sizeof(*cmd)) +
 	      (sizeof(*tlv) + sizeof(*cfg)) +
 	      (sizeof(*tlv) + chunks_len);
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index af4cb0e..b57522b 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1384,6 +1384,30 @@ enum wmi_tlv_service {
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
+	WMI_TLV_SERVICE_HTT_H2T_NO_HTC_HDR_LEN_IN_MSG_LEN = 176,
+	WMI_TLV_SERVICE_COEX_SUPPORT_UNEQUAL_ISOLATION = 177,
+	WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT = 178,
+	WMI_TLV_SERVICE_SUPPORT_EXTEND_ADDRESS = 179,
 
 	WMI_TLV_MAX_EXT_SERVICE = 256,
 };
@@ -1557,6 +1581,9 @@ enum wmi_tlv_service {
 	SVCMAP(WMI_TLV_SERVICE_THERM_THROT,
 	       WMI_SERVICE_THERM_THROT,
 	       WMI_TLV_MAX_SERVICE);
+	SVCMAP(WMI_TLV_SERVICE_SUPPORT_EXTEND_ADDRESS,
+	       WMI_SERVICE_SUPPORT_EXTEND_ADDRESS,
+	       WMI_TLV_MAX_SERVICE);
 }
 
 #undef SVCMAP
@@ -1694,6 +1721,21 @@ struct wmi_tlv_resource_config {
 	__le32 host_capab;
 } __packed;
 
+/* structure describing host memory chunk. */
+struct host_memory_chunk_tlv {
+	/* id of the request that is passed up in service ready */
+	__le32 req_id;
+
+	/* the physical address the memory chunk */
+	__le32 ptr;
+
+	/* size of the chunk */
+	__le32 size;
+
+	/* the upper 32 bit address valid only for more than 32 bit target */
+	__le32 ptr_high;
+} __packed;
+
 struct wmi_tlv_init_cmd {
 	struct wmi_tlv_abi_version abi;
 	__le32 num_host_mem_chunks;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index d9b646f..6277511 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -200,6 +200,7 @@ enum wmi_service {
 	WMI_SERVICE_RTT_RESPONDER_ROLE,
 	WMI_SERVICE_PER_PACKET_SW_ENCRYPT,
 	WMI_SERVICE_REPORT_AIRTIME,
+	WMI_SERVICE_SUPPORT_EXTEND_ADDRESS,
 
 	/* Remember to add the new value to wmi_service_name()! */
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
