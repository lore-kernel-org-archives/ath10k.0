Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xw51A-00088G-V4
 for ath10k@lists.infradead.org; Wed, 03 Dec 2014 08:10:37 +0000
Subject: [PATCH v4 3/8] ath10k: add ATH10K_FW_IE_WMI_OP_VERSION
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 3 Dec 2014 10:10:08 +0200
Message-ID: <20141203081008.31187.99268.stgit@potku.adurom.net>
In-Reply-To: <20141203080803.31187.85059.stgit@potku.adurom.net>
References: <20141203080803.31187.85059.stgit@potku.adurom.net>
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

Instead of using feature flags, add new 32 bit variable for managing different
WMI versions. This makes it firmware interface tests a bit less convoluted,
especially when we add one more interface.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |   49 +++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/core.h |    8 +++--
 drivers/net/wireless/ath/ath10k/hw.h   |   16 ++++++++++
 3 files changed, 65 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 05ca1b6ac704..30891f5d6830 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -447,7 +447,7 @@ static int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name)
 	int ie_id, i, index, bit, ret;
 	struct ath10k_fw_ie *hdr;
 	const u8 *data;
-	__le32 *timestamp;
+	__le32 *timestamp, *version;
 
 	/* first fetch the firmware file (firmware-*.bin) */
 	ar->firmware = ath10k_fetch_fw_file(ar, ar->hw_params.fw.dir, name);
@@ -562,6 +562,17 @@ static int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name)
 			ar->otp_len = ie_len;
 
 			break;
+		case ATH10K_FW_IE_WMI_OP_VERSION:
+			if (ie_len != sizeof(u32))
+				break;
+
+			version = (__le32 *)data;
+
+			ar->wmi.op_version = le32_to_cpup(version);
+
+			ath10k_dbg(ar, ATH10K_DBG_BOOT, "found fw ie wmi op version %d\n",
+				   ar->wmi.op_version);
+			break;
 		default:
 			ath10k_warn(ar, "Unknown FW IE: %u\n",
 				    le32_to_cpu(hdr->id));
@@ -800,12 +811,40 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 		return -EINVAL;
 	}
 
-	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
-		ar->max_num_peers = TARGET_10X_NUM_PEERS;
-		ar->max_num_stations = TARGET_10X_NUM_STATIONS;
-	} else {
+	if (ar->wmi.op_version >= ATH10K_FW_WMI_OP_VERSION_MAX) {
+		ath10k_err(ar, "unsupported WMI OP version (max %d): %d\n",
+			   ATH10K_FW_WMI_OP_VERSION_MAX, ar->wmi.op_version);
+		return -EINVAL;
+	}
+
+	/* Backwards compatibility for firmwares without
+	 * ATH10K_FW_IE_WMI_OP_VERSION.
+	 */
+	if (ar->wmi.op_version == ATH10K_FW_WMI_OP_VERSION_UNSET) {
+		if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
+			if (test_bit(ATH10K_FW_FEATURE_WMI_10_2, ar->fw_features))
+				ar->wmi.op_version = ATH10K_FW_WMI_OP_VERSION_10_2;
+			else
+				ar->wmi.op_version = ATH10K_FW_WMI_OP_VERSION_10_1;
+		} else {
+			ar->wmi.op_version = ATH10K_FW_WMI_OP_VERSION_MAIN;
+		}
+	}
+
+	switch (ar->wmi.op_version) {
+	case ATH10K_FW_WMI_OP_VERSION_MAIN:
 		ar->max_num_peers = TARGET_NUM_PEERS;
 		ar->max_num_stations = TARGET_NUM_STATIONS;
+		break;
+	case ATH10K_FW_WMI_OP_VERSION_10_1:
+	case ATH10K_FW_WMI_OP_VERSION_10_2:
+		ar->max_num_peers = TARGET_10X_NUM_PEERS;
+		ar->max_num_stations = TARGET_10X_NUM_STATIONS;
+		break;
+	case ATH10K_FW_WMI_OP_VERSION_UNSET:
+	case ATH10K_FW_WMI_OP_VERSION_MAX:
+		WARN_ON(1);
+		return -EINVAL;
 	}
 
 	return 0;
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 514c219263a5..e0999cdaa18f 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -120,6 +120,7 @@ struct ath10k_mem_chunk {
 };
 
 struct ath10k_wmi {
+	enum ath10k_fw_wmi_op_version op_version;
 	enum ath10k_htc_ep_id eid;
 	struct completion service_ready;
 	struct completion unified_ready;
@@ -369,7 +370,7 @@ enum ath10k_fw_features {
 	/* wmi_mgmt_rx_hdr contains extra RSSI information */
 	ATH10K_FW_FEATURE_EXT_WMI_MGMT_RX = 0,
 
-	/* firmware from 10X branch */
+	/* Firmware from 10X branch. Deprecated, don't use in new code. */
 	ATH10K_FW_FEATURE_WMI_10X = 1,
 
 	/* firmware support tx frame management over WMI, otherwise it's HTT */
@@ -378,8 +379,9 @@ enum ath10k_fw_features {
 	/* Firmware does not support P2P */
 	ATH10K_FW_FEATURE_NO_P2P = 3,
 
-	/* Firmware 10.2 feature bit. The ATH10K_FW_FEATURE_WMI_10X feature bit
-	 * is required to be set as well.
+	/* Firmware 10.2 feature bit. The ATH10K_FW_FEATURE_WMI_10X feature
+	 * bit is required to be set as well. Deprecated, don't use in new
+	 * code.
 	 */
 	ATH10K_FW_FEATURE_WMI_10_2 = 4,
 
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index dfedfd0e0f34..5bae90c3db99 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -58,6 +58,22 @@ enum ath10k_fw_ie_type {
 	ATH10K_FW_IE_FEATURES = 2,
 	ATH10K_FW_IE_FW_IMAGE = 3,
 	ATH10K_FW_IE_OTP_IMAGE = 4,
+
+	/* WMI "operations" interface version, 32 bit value. Supported from
+	 * FW API 4 and above.
+	 */
+	ATH10K_FW_IE_WMI_OP_VERSION = 5,
+};
+
+enum ath10k_fw_wmi_op_version {
+	ATH10K_FW_WMI_OP_VERSION_UNSET = 0,
+
+	ATH10K_FW_WMI_OP_VERSION_MAIN = 1,
+	ATH10K_FW_WMI_OP_VERSION_10_1 = 2,
+	ATH10K_FW_WMI_OP_VERSION_10_2 = 3,
+
+	/* keep last */
+	ATH10K_FW_WMI_OP_VERSION_MAX,
 };
 
 /* Known pecularities:


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
