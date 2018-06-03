Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fPXe5-0006VX-0M
 for ath10k@lists.infradead.org; Sun, 03 Jun 2018 18:22:43 +0000
Received: by mail-lf0-x244.google.com with SMTP id j13-v6so17336471lfb.13
 for <ath10k@lists.infradead.org>; Sun, 03 Jun 2018 11:22:14 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v5 05/12] ath10k: add per target config of max_num_peers
Date: Sun,  3 Jun 2018 20:20:22 +0200
Message-Id: <20180603182029.8914-6-erik.stromdahl@gmail.com>
In-Reply-To: <20180603182029.8914-1-erik.stromdahl@gmail.com>
References: <20180603182029.8914-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

This patch makes sure the value of max_num_peers matches
num_peers in hw_params (if set to a non zero value).

hw_params->num_peers is used in the TLV WMI init command.
If ar->max_num_peers is not set to the same value, there is a risk
that the user creates more peers than the maximum number of peers
supported by the device.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index a146c83d6ff9..8244e9184760 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1986,6 +1986,7 @@ static void ath10k_core_set_coverage_class_work(struct work_struct *work)
 static int ath10k_core_init_firmware_features(struct ath10k *ar)
 {
 	struct ath10k_fw_file *fw_file = &ar->normal_mode_fw.fw_file;
+	int max_num_peers;
 
 	if (test_bit(ATH10K_FW_FEATURE_WMI_10_2, fw_file->fw_features) &&
 	    !test_bit(ATH10K_FW_FEATURE_WMI_10X, fw_file->fw_features)) {
@@ -2065,7 +2066,7 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 
 	switch (fw_file->wmi_op_version) {
 	case ATH10K_FW_WMI_OP_VERSION_MAIN:
-		ar->max_num_peers = TARGET_NUM_PEERS;
+		max_num_peers = TARGET_NUM_PEERS;
 		ar->max_num_stations = TARGET_NUM_STATIONS;
 		ar->max_num_vdevs = TARGET_NUM_VDEVS;
 		ar->htt.max_num_pending_tx = TARGET_NUM_MSDU_DESC;
@@ -2077,10 +2078,10 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 	case ATH10K_FW_WMI_OP_VERSION_10_2:
 	case ATH10K_FW_WMI_OP_VERSION_10_2_4:
 		if (ath10k_peer_stats_enabled(ar)) {
-			ar->max_num_peers = TARGET_10X_TX_STATS_NUM_PEERS;
+			max_num_peers = TARGET_10X_TX_STATS_NUM_PEERS;
 			ar->max_num_stations = TARGET_10X_TX_STATS_NUM_STATIONS;
 		} else {
-			ar->max_num_peers = TARGET_10X_NUM_PEERS;
+			max_num_peers = TARGET_10X_NUM_PEERS;
 			ar->max_num_stations = TARGET_10X_NUM_STATIONS;
 		}
 		ar->max_num_vdevs = TARGET_10X_NUM_VDEVS;
@@ -2089,7 +2090,7 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 		ar->max_spatial_stream = WMI_MAX_SPATIAL_STREAM;
 		break;
 	case ATH10K_FW_WMI_OP_VERSION_TLV:
-		ar->max_num_peers = TARGET_TLV_NUM_PEERS;
+		max_num_peers = TARGET_TLV_NUM_PEERS;
 		ar->max_num_stations = TARGET_TLV_NUM_STATIONS;
 		ar->max_num_vdevs = TARGET_TLV_NUM_VDEVS;
 		ar->max_num_tdls_vdevs = TARGET_TLV_NUM_TDLS_VDEVS;
@@ -2100,7 +2101,7 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 		ar->max_spatial_stream = WMI_MAX_SPATIAL_STREAM;
 		break;
 	case ATH10K_FW_WMI_OP_VERSION_10_4:
-		ar->max_num_peers = TARGET_10_4_NUM_PEERS;
+		max_num_peers = TARGET_10_4_NUM_PEERS;
 		ar->max_num_stations = TARGET_10_4_NUM_STATIONS;
 		ar->num_active_peers = TARGET_10_4_ACTIVE_PEERS;
 		ar->max_num_vdevs = TARGET_10_4_NUM_VDEVS;
@@ -2119,10 +2120,16 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 		break;
 	case ATH10K_FW_WMI_OP_VERSION_UNSET:
 	case ATH10K_FW_WMI_OP_VERSION_MAX:
+	default:
 		WARN_ON(1);
 		return -EINVAL;
 	}
 
+	if (ar->hw_params.num_peers)
+		ar->max_num_peers = ar->hw_params.num_peers;
+	else
+		ar->max_num_peers = max_num_peers;
+
 	/* Backwards compatibility for firmwares without
 	 * ATH10K_FW_IE_HTT_OP_VERSION.
 	 */
-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
