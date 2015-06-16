Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4jhy-0000H7-Qk
 for ath10k@lists.infradead.org; Tue, 16 Jun 2015 05:46:51 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH 01/10] ath10k: include new wmi op version for 10.4 fw
Date: Tue, 16 Jun 2015 11:15:14 +0530
Message-ID: <1434433523-8357-2-git-send-email-rmani@qti.qualcomm.com>
In-Reply-To: <1434433523-8357-1-git-send-email-rmani@qti.qualcomm.com>
References: <1434433523-8357-1-git-send-email-rmani@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>

qca99X0 chip uses firmware version 10.4. Define a new macro
ATH10K_FW_WMI_OP_VERSION_10_4 for 10.4 firmware and include
in switch cases where ATH10K_FW_WMI_OP_VERSION_* is used
to avoid compilation error.

Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 2 ++
 drivers/net/wireless/ath/ath10k/hw.h   | 1 +
 drivers/net/wireless/ath/ath10k/mac.c  | 2 ++
 drivers/net/wireless/ath/ath10k/wmi.c  | 2 ++
 4 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 102191a..f4f6da6 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1312,6 +1312,7 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 		ar->fw_stats_req_mask = WMI_STAT_PDEV | WMI_STAT_VDEV |
 			WMI_STAT_PEER;
 		break;
+	case ATH10K_FW_WMI_OP_VERSION_10_4:
 	case ATH10K_FW_WMI_OP_VERSION_UNSET:
 	case ATH10K_FW_WMI_OP_VERSION_MAX:
 		WARN_ON(1);
@@ -1334,6 +1335,7 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 		case ATH10K_FW_WMI_OP_VERSION_TLV:
 			ar->htt.op_version = ATH10K_FW_HTT_OP_VERSION_TLV;
 			break;
+		case ATH10K_FW_WMI_OP_VERSION_10_4:
 		case ATH10K_FW_WMI_OP_VERSION_UNSET:
 		case ATH10K_FW_WMI_OP_VERSION_MAX:
 			WARN_ON(1);
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 5635340..eb65709 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -137,6 +137,7 @@ enum ath10k_fw_wmi_op_version {
 	ATH10K_FW_WMI_OP_VERSION_10_2 = 3,
 	ATH10K_FW_WMI_OP_VERSION_TLV = 4,
 	ATH10K_FW_WMI_OP_VERSION_10_2_4 = 5,
+	ATH10K_FW_WMI_OP_VERSION_10_4 = 6,
 
 	/* keep last */
 	ATH10K_FW_WMI_OP_VERSION_MAX,
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index e834a9d..187e524 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6941,6 +6941,8 @@ int ath10k_mac_register(struct ath10k *ar)
 		ar->hw->wiphy->n_iface_combinations =
 			ARRAY_SIZE(ath10k_10x_if_comb);
 		break;
+	case ATH10K_FW_WMI_OP_VERSION_10_4:
+		break;
 	case ATH10K_FW_WMI_OP_VERSION_UNSET:
 	case ATH10K_FW_WMI_OP_VERSION_MAX:
 		WARN_ON(1);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 6c046c2..b32bb68 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5415,6 +5415,8 @@ static const struct wmi_ops wmi_10_2_4_ops = {
 int ath10k_wmi_attach(struct ath10k *ar)
 {
 	switch (ar->wmi.op_version) {
+	case ATH10K_FW_WMI_OP_VERSION_10_4:
+		break;
 	case ATH10K_FW_WMI_OP_VERSION_10_2_4:
 		ar->wmi.cmd = &wmi_10_2_4_cmd_map;
 		ar->wmi.ops = &wmi_10_2_4_ops;
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
