Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1beNpl-000163-ER
 for ath10k@lists.infradead.org; Mon, 29 Aug 2016 14:46:48 +0000
From: Benjamin Berg <benjamin@sipsolutions.net>
Subject: [PATCHv3 1/5] ath10k: Move ath10k_hw_params definition to hw.h
Date: Mon, 29 Aug 2016 16:45:53 +0200
Message-Id: <20160829144557.11678-2-benjamin@sipsolutions.net>
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

This is to prepare for rx descriptor abstraction where we'll
be dereferencing ath10k_hw_params member in hw.h. Moreover
hw.h looks more suitable to house ath10k_hw_params definition
than core.h

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.h | 48 +---------------------------------
 drivers/net/wireless/ath/ath10k/hw.h   | 48 ++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 47 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 30ae5bf..5ace413 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -715,53 +715,7 @@ struct ath10k {
 	struct ath10k_htc htc;
 	struct ath10k_htt htt;
 
-	struct ath10k_hw_params {
-		u32 id;
-		u16 dev_id;
-		const char *name;
-		u32 patch_load_addr;
-		int uart_pin;
-		u32 otp_exe_param;
-
-		/* Type of hw cycle counter wraparound logic, for more info
-		 * refer enum ath10k_hw_cc_wraparound_type.
-		 */
-		enum ath10k_hw_cc_wraparound_type cc_wraparound_type;
-
-		/* Some of chip expects fragment descriptor to be continuous
-		 * memory for any TX operation. Set continuous_frag_desc flag
-		 * for the hardware which have such requirement.
-		 */
-		bool continuous_frag_desc;
-
-		/* CCK hardware rate table mapping for the newer chipsets
-		 * like QCA99X0, QCA4019 got revised. The CCK h/w rate values
-		 * are in a proper order with respect to the rate/preamble
-		 */
-		bool cck_rate_map_rev2;
-
-		u32 channel_counters_freq_hz;
-
-		/* Mgmt tx descriptors threshold for limiting probe response
-		 * frames.
-		 */
-		u32 max_probe_resp_desc_thres;
-
-		/* The padding bytes's location is different on various chips */
-		enum ath10k_hw_4addr_pad hw_4addr_pad;
-
-		u32 tx_chain_mask;
-		u32 rx_chain_mask;
-		u32 max_spatial_stream;
-		u32 cal_data_len;
-
-		struct ath10k_hw_params_fw {
-			const char *dir;
-			const char *board;
-			size_t board_size;
-			size_t board_ext_size;
-		} fw;
-	} hw_params;
+	struct ath10k_hw_params hw_params;
 
 	/* contains the firmware images used with ATH10K_FIRMWARE_MODE_NORMAL */
 	struct ath10k_fw_components normal_mode_fw;
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index e014cd7..1315557 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -363,6 +363,54 @@ enum ath10k_hw_cc_wraparound_type {
 	ATH10K_HW_CC_WRAP_SHIFTED_EACH = 2,
 };
 
+struct ath10k_hw_params {
+	u32 id;
+	u16 dev_id;
+	const char *name;
+	u32 patch_load_addr;
+	int uart_pin;
+	u32 otp_exe_param;
+
+	/* Type of hw cycle counter wraparound logic, for more info
+	 * refer enum ath10k_hw_cc_wraparound_type.
+	 */
+	enum ath10k_hw_cc_wraparound_type cc_wraparound_type;
+
+	/* Some of chip expects fragment descriptor to be continuous
+	 * memory for any TX operation. Set continuous_frag_desc flag
+	 * for the hardware which have such requirement.
+	 */
+	bool continuous_frag_desc;
+
+	/* CCK hardware rate table mapping for the newer chipsets
+	 * like QCA99X0, QCA4019 got revised. The CCK h/w rate values
+	 * are in a proper order with respect to the rate/preamble
+	 */
+	bool cck_rate_map_rev2;
+
+	u32 channel_counters_freq_hz;
+
+	/* Mgmt tx descriptors threshold for limiting probe response
+	 * frames.
+	 */
+	u32 max_probe_resp_desc_thres;
+
+	/* The padding bytes's location is different on various chips */
+	enum ath10k_hw_4addr_pad hw_4addr_pad;
+
+	u32 tx_chain_mask;
+	u32 rx_chain_mask;
+	u32 max_spatial_stream;
+	u32 cal_data_len;
+
+	struct ath10k_hw_params_fw {
+		const char *dir;
+		const char *board;
+		size_t board_size;
+		size_t board_ext_size;
+	} fw;
+};
+
 /* Target specific defines for MAIN firmware */
 #define TARGET_NUM_VDEVS			8
 #define TARGET_NUM_PEER_AST			2
-- 
2.9.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
