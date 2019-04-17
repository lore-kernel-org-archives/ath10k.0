Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGfzT-0008EA-UN
 for ath10k@lists.infradead.org; Wed, 17 Apr 2019 08:32:25 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH 1/3] ath10k: Add wmi tlv vdev subtype for mesh in WCN3990
Date: Wed, 17 Apr 2019 14:01:45 +0530
Message-Id: <1555489907-30117-2-git-send-email-svishnoi@codeaurora.org>
In-Reply-To: <1555489907-30117-1-git-send-email-svishnoi@codeaurora.org>
References: <1555489907-30117-1-git-send-email-svishnoi@codeaurora.org>
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

There is a disparity in wmi and wmi tlv vdev subtype
enum for WMI_VDEV_SUBTYPE_MESH_11S.

Add different enum for wmi tlv vdev subtype to support
vdev of subtype mesh 11s for WCN3990.

Tested HW: WCN3990

Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 24 +++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 10 ++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 582fb11..a19f7e2 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1905,6 +1905,28 @@ static struct sk_buff *ath10k_wmi_tlv_op_gen_init(struct ath10k *ar)
 	return skb;
 }
 
+static int ath10k_wmi_tlv_op_get_vdev_subtype(struct ath10k *ar,
+					      enum wmi_vdev_subtype subtype)
+{
+	switch (subtype) {
+	case WMI_VDEV_SUBTYPE_NONE:
+		return WMI_TLV_VDEV_SUBTYPE_NONE;
+	case WMI_VDEV_SUBTYPE_P2P_DEVICE:
+		return WMI_TLV_VDEV_SUBTYPE_P2P_DEV;
+	case WMI_VDEV_SUBTYPE_P2P_CLIENT:
+		return WMI_TLV_VDEV_SUBTYPE_P2P_CLI;
+	case WMI_VDEV_SUBTYPE_P2P_GO:
+		return WMI_TLV_VDEV_SUBTYPE_P2P_GO;
+	case WMI_VDEV_SUBTYPE_PROXY_STA:
+		return WMI_TLV_VDEV_SUBTYPE_PROXY_STA;
+	case WMI_VDEV_SUBTYPE_MESH_11S:
+		return WMI_TLV_VDEV_SUBTYPE_MESH_11S;
+	case WMI_VDEV_SUBTYPE_MESH_NON_11S:
+		return -ENOTSUPP;
+	}
+	return -ENOTSUPP;
+}
+
 static struct sk_buff *
 ath10k_wmi_tlv_op_gen_vdev_create(struct ath10k *ar,
 				  u32 vdev_id,
@@ -4305,7 +4327,7 @@ static struct sk_buff *ath10k_wmi_tlv_op_gen_config_pno_stop(struct ath10k *ar,
 	.gen_tdls_peer_update = ath10k_wmi_tlv_op_gen_tdls_peer_update,
 	.gen_adaptive_qcs = ath10k_wmi_tlv_op_gen_adaptive_qcs,
 	.fw_stats_fill = ath10k_wmi_main_op_fw_stats_fill,
-	.get_vdev_subtype = ath10k_wmi_op_get_vdev_subtype,
+	.get_vdev_subtype = ath10k_wmi_tlv_op_get_vdev_subtype,
 	.gen_echo = ath10k_wmi_tlv_op_gen_echo,
 	.gen_vdev_spectral_conf = ath10k_wmi_tlv_op_gen_vdev_spectral_conf,
 	.gen_vdev_spectral_enable = ath10k_wmi_tlv_op_gen_vdev_spectral_enable,
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index 65e6aa5..55da01f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1775,6 +1775,16 @@ struct wmi_tlv_start_scan_cmd {
 	struct wmi_mac_addr mac_mask;
 } __packed;
 
+enum wmi_tlv_vdev_subtype {
+	WMI_TLV_VDEV_SUBTYPE_NONE	= 0,
+	WMI_TLV_VDEV_SUBTYPE_P2P_DEV	= 1,
+	WMI_TLV_VDEV_SUBTYPE_P2P_CLI	= 2,
+	WMI_TLV_VDEV_SUBTYPE_P2P_GO	= 3,
+	WMI_TLV_VDEV_SUBTYPE_PROXY_STA	= 4,
+	WMI_TLV_VDEV_SUBTYPE_MESH	= 5,
+	WMI_TLV_VDEV_SUBTYPE_MESH_11S	= 6,
+};
+
 struct wmi_tlv_vdev_start_cmd {
 	__le32 vdev_id;
 	__le32 requestor_id;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
