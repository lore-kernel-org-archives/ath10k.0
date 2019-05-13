Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQCKT-0003MG-2H
 for ath10k@lists.infradead.org; Mon, 13 May 2019 14:53:26 +0000
From: Balaji Pothunoori <bpothuno@codeaurora.org>
Subject: [PATCH] ath10k: enabling tx stats support over pktlog
Date: Mon, 13 May 2019 20:23:07 +0530
Message-Id: <1557759187-23910-1-git-send-email-bpothuno@codeaurora.org>
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Balaji Pothunoori <bpothuno@codeaurora.org>

For QCA988X target, pktlog gives details of the tx bitrate
which is used in the driver for station info.

Enabling pktlog by default will cause more interrupts
in target to host CE pipe, which can impact more CPU usage
for targets ex:WCN3990 and also not required for all other
platforms (eg: WCN3990), for getting tx bitrate.

Enable pktlog only for QCA988X based on hardware params.

Tested HW : WCN3990
Tested FW : WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1

Fixes: e8123bb74c4e ("ath10k: add per peer tx stats support for 10.2.4")
Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 15 +++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h   |  3 +++
 drivers/net/wireless/ath/ath10k/mac.c  |  3 ++-
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 61ef903..252e9af 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -83,6 +83,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
 		.fw_diag_ce_download = false,
+		.tx_stats_over_pktlog = true,
 	},
 	{
 		.id = QCA988X_HW_2_0_VERSION,
@@ -117,6 +118,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
 		.fw_diag_ce_download = false,
+		.tx_stats_over_pktlog = true,
 	},
 	{
 		.id = QCA9887_HW_1_0_VERSION,
@@ -152,6 +154,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
 		.fw_diag_ce_download = false,
+		.tx_stats_over_pktlog = false,
 	},
 	{
 		.id = QCA6174_HW_3_2_VERSION,
@@ -179,6 +182,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.ast_skid_limit = 0x10,
 		.num_wds_entries = 0x20,
 		.uart_pin_workaround = true,
+		.tx_stats_over_pktlog = false,
 	},
 	{
 		.id = QCA6174_HW_2_1_VERSION,
@@ -213,6 +217,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
 		.fw_diag_ce_download = false,
+		.tx_stats_over_pktlog = false,
 	},
 	{
 		.id = QCA6174_HW_2_1_VERSION,
@@ -247,6 +252,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
 		.fw_diag_ce_download = false,
+		.tx_stats_over_pktlog = false,
 	},
 	{
 		.id = QCA6174_HW_3_0_VERSION,
@@ -281,6 +287,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
 		.fw_diag_ce_download = false,
+		.tx_stats_over_pktlog = false,
 	},
 	{
 		.id = QCA6174_HW_3_2_VERSION,
@@ -318,6 +325,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
 		.fw_diag_ce_download = true,
+		.tx_stats_over_pktlog = false,
 	},
 	{
 		.id = QCA99X0_HW_2_0_DEV_VERSION,
@@ -358,6 +366,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
 		.fw_diag_ce_download = false,
+		.tx_stats_over_pktlog = false,
 	},
 	{
 		.id = QCA9984_HW_1_0_DEV_VERSION,
@@ -405,6 +414,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
 		.fw_diag_ce_download = false,
+		.tx_stats_over_pktlog = false,
 	},
 	{
 		.id = QCA9888_HW_2_0_DEV_VERSION,
@@ -449,6 +459,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
 		.fw_diag_ce_download = false,
+		.tx_stats_over_pktlog = false,
 	},
 	{
 		.id = QCA9377_HW_1_0_DEV_VERSION,
@@ -483,6 +494,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
 		.fw_diag_ce_download = false,
+		.tx_stats_over_pktlog = false,
 	},
 	{
 		.id = QCA9377_HW_1_1_DEV_VERSION,
@@ -519,6 +531,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
 		.fw_diag_ce_download = true,
+		.tx_stats_over_pktlog = false,
 	},
 	{
 		.id = QCA4019_HW_1_0_DEV_VERSION,
@@ -560,6 +573,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.rri_on_ddr = false,
 		.hw_filter_reset_required = true,
 		.fw_diag_ce_download = false,
+		.tx_stats_over_pktlog = false,
 	},
 	{
 		.id = WCN3990_HW_1_0_DEV_VERSION,
@@ -587,6 +601,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.rri_on_ddr = true,
 		.hw_filter_reset_required = false,
 		.fw_diag_ce_download = false,
+		.tx_stats_over_pktlog = false,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 248cfb4..1e80beb 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -612,6 +612,9 @@ struct ath10k_hw_params {
 	 * firmware bug
 	 */
 	bool uart_pin_workaround;
+
+	/* tx stats support over pktlog */
+	bool tx_stats_over_pktlog;
 };
 
 struct htt_rx_desc;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index b500fd4..40e7cea 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -7877,7 +7877,8 @@ ath10k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 				    arvif->vdev_id, ret);
 	}
 
-	if (ath10k_peer_stats_enabled(ar)) {
+	if (ath10k_peer_stats_enabled(ar) &&
+	    ar->hw_params.tx_stats_over_pktlog) {
 		ar->pktlog_filter |= ATH10K_PKTLOG_PEER_STATS;
 		ret = ath10k_wmi_pdev_pktlog_enable(ar,
 						    ar->pktlog_filter);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
