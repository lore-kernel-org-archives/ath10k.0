Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1beNpl-00017g-EU
 for ath10k@lists.infradead.org; Mon, 29 Aug 2016 14:46:52 +0000
From: Benjamin Berg <benjamin@sipsolutions.net>
Subject: [PATCHv3 4/5] ath10k: Remove 4-addr padding related hw_param
 configuration
Date: Mon, 29 Aug 2016 16:45:56 +0200
Message-Id: <20160829144557.11678-5-benjamin@sipsolutions.net>
In-Reply-To: <20160829144557.11678-1-benjamin@sipsolutions.net>
References: <20160829144557.11678-1-benjamin@sipsolutions.net>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>, Michal Kazior <michal.kazior@tieto.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, Simon Wunderlich <sw@simonwunderlich.de>

From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

hw_4addr_pad was added to handle different types of padding
in 4-address rx frame. But this padding is not very specific
to 4-address, it can happen even with three address + ethernet
decap mode. Since the  padding information can be obtained
through Rx desc for QCA99X0 and newer chips, this hw_param
is not needed any more.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 9 ---------
 drivers/net/wireless/ath/ath10k/hw.h   | 8 --------
 2 files changed, 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6dd42d3..29c795f 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -60,7 +60,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.otp_exe_param = 0,
 		.channel_counters_freq_hz = 88000,
 		.max_probe_resp_desc_thres = 0,
-		.hw_4addr_pad = ATH10K_HW_4ADDR_PAD_AFTER,
 		.cal_data_len = 2116,
 		.fw = {
 			.dir = QCA988X_HW_2_0_FW_DIR,
@@ -80,7 +79,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.otp_exe_param = 0,
 		.channel_counters_freq_hz = 88000,
 		.max_probe_resp_desc_thres = 0,
-		.hw_4addr_pad = ATH10K_HW_4ADDR_PAD_AFTER,
 		.cal_data_len = 2116,
 		.fw = {
 			.dir = QCA9887_HW_1_0_FW_DIR,
@@ -117,7 +115,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.otp_exe_param = 0,
 		.channel_counters_freq_hz = 88000,
 		.max_probe_resp_desc_thres = 0,
-		.hw_4addr_pad = ATH10K_HW_4ADDR_PAD_AFTER,
 		.cal_data_len = 8124,
 		.fw = {
 			.dir = QCA6174_HW_2_1_FW_DIR,
@@ -136,7 +133,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.otp_exe_param = 0,
 		.channel_counters_freq_hz = 88000,
 		.max_probe_resp_desc_thres = 0,
-		.hw_4addr_pad = ATH10K_HW_4ADDR_PAD_AFTER,
 		.cal_data_len = 8124,
 		.fw = {
 			.dir = QCA6174_HW_3_0_FW_DIR,
@@ -155,7 +151,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.otp_exe_param = 0,
 		.channel_counters_freq_hz = 88000,
 		.max_probe_resp_desc_thres = 0,
-		.hw_4addr_pad = ATH10K_HW_4ADDR_PAD_AFTER,
 		.cal_data_len = 8124,
 		.fw = {
 			/* uses same binaries as hw3.0 */
@@ -177,7 +172,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cck_rate_map_rev2 = true,
 		.channel_counters_freq_hz = 150000,
 		.max_probe_resp_desc_thres = 24,
-		.hw_4addr_pad = ATH10K_HW_4ADDR_PAD_BEFORE,
 		.tx_chain_mask = 0xf,
 		.rx_chain_mask = 0xf,
 		.max_spatial_stream = 4,
@@ -201,7 +195,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cck_rate_map_rev2 = true,
 		.channel_counters_freq_hz = 150000,
 		.max_probe_resp_desc_thres = 24,
-		.hw_4addr_pad = ATH10K_HW_4ADDR_PAD_BEFORE,
 		.tx_chain_mask = 0xf,
 		.rx_chain_mask = 0xf,
 		.max_spatial_stream = 4,
@@ -224,7 +217,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.continuous_frag_desc = true,
 		.channel_counters_freq_hz = 150000,
 		.max_probe_resp_desc_thres = 24,
-		.hw_4addr_pad = ATH10K_HW_4ADDR_PAD_BEFORE,
 		.tx_chain_mask = 3,
 		.rx_chain_mask = 3,
 		.max_spatial_stream = 2,
@@ -285,7 +277,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cck_rate_map_rev2 = true,
 		.channel_counters_freq_hz = 125000,
 		.max_probe_resp_desc_thres = 24,
-		.hw_4addr_pad = ATH10K_HW_4ADDR_PAD_BEFORE,
 		.tx_chain_mask = 0x3,
 		.rx_chain_mask = 0x3,
 		.max_spatial_stream = 2,
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 82efbfc..5e7c2c9 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -338,11 +338,6 @@ enum ath10k_hw_rate_rev2_cck {
 	ATH10K_HW_RATE_REV2_CCK_SP_11M,
 };
 
-enum ath10k_hw_4addr_pad {
-	ATH10K_HW_4ADDR_PAD_AFTER,
-	ATH10K_HW_4ADDR_PAD_BEFORE,
-};
-
 enum ath10k_hw_cc_wraparound_type {
 	ATH10K_HW_CC_WRAP_DISABLED = 0,
 
@@ -395,9 +390,6 @@ struct ath10k_hw_params {
 	 */
 	u32 max_probe_resp_desc_thres;
 
-	/* The padding bytes's location is different on various chips */
-	enum ath10k_hw_4addr_pad hw_4addr_pad;
-
 	u32 tx_chain_mask;
 	u32 rx_chain_mask;
 	u32 max_spatial_stream;
-- 
2.9.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
