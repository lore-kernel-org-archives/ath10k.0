Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aP6sQ-0002cb-8G
 for ath10k@lists.infradead.org; Fri, 29 Jan 2016 11:06:08 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH 1/2] ath10k: add qca4019 hw params
Date: Fri, 29 Jan 2016 16:35:11 +0530
Message-ID: <1454065512-8238-2-git-send-email-rmani@qti.qualcomm.com>
In-Reply-To: <1454065512-8238-1-git-send-email-rmani@qti.qualcomm.com>
References: <1454065512-8238-1-git-send-email-rmani@qti.qualcomm.com>
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
Cc: Raja Mani <rmani@codeaurora.org>, linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>

From: Raja Mani <rmani@codeaurora.org>

Add a new entry in hw_params_list for qca4019 with list of
it's own details.

Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c      | 20 ++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h        |  8 ++++++++
 drivers/net/wireless/ath/ath10k/targaddrs.h |  3 +++
 3 files changed, 31 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5c684e0..ac29813 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -201,6 +201,26 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
 		},
 	},
+	{
+		.id = QCA4019_HW_1_0_DEV_VERSION,
+		.dev_id = 0,
+		.name = "qca4019 hw1.0",
+		.patch_load_addr = QCA4019_HW_1_0_PATCH_LOAD_ADDR,
+		.uart_pin = 7,
+		.otp_exe_param = 0x0010000,
+		.continuous_frag_desc = true,
+		.channel_counters_freq_hz = 125000,
+		.max_probe_resp_desc_thres = 24,
+		.hw_4addr_pad = ATH10K_HW_4ADDR_PAD_BEFORE,
+		.fw = {
+			.dir = QCA4019_HW_1_0_FW_DIR,
+			.fw = QCA4019_HW_1_0_FW_FILE,
+			.otp = QCA4019_HW_1_0_OTP_FILE,
+			.board = QCA4019_HW_1_0_BOARD_DATA_FILE,
+			.board_size = QCA4019_BOARD_DATA_SZ,
+			.board_ext_size = QCA4019_BOARD_EXT_DATA_SZ,
+		},
+	},
 };
 
 static const char *const ath10k_core_fw_feature_str[] = {
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 4217bdb..291ca1f 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -106,6 +106,14 @@ enum qca9377_chip_id_rev {
 #define QCA9377_HW_1_0_BOARD_DATA_FILE "board.bin"
 #define QCA9377_HW_1_0_PATCH_LOAD_ADDR	0x1234
 
+/* QCA4019 1.0 definitions */
+#define QCA4019_HW_1_0_DEV_VERSION     0x01000000
+#define QCA4019_HW_1_0_FW_DIR          ATH10K_FW_DIR "/QCA4019/hw1.0"
+#define QCA4019_HW_1_0_FW_FILE         "firmware.bin"
+#define QCA4019_HW_1_0_OTP_FILE        "otp.bin"
+#define QCA4019_HW_1_0_BOARD_DATA_FILE "board.bin"
+#define QCA4019_HW_1_0_PATCH_LOAD_ADDR  0x1234
+
 #define ATH10K_FW_API2_FILE		"firmware-2.bin"
 #define ATH10K_FW_API3_FILE		"firmware-3.bin"
 
diff --git a/drivers/net/wireless/ath/ath10k/targaddrs.h b/drivers/net/wireless/ath/ath10k/targaddrs.h
index 05a421b..361f143 100644
--- a/drivers/net/wireless/ath/ath10k/targaddrs.h
+++ b/drivers/net/wireless/ath/ath10k/targaddrs.h
@@ -456,4 +456,7 @@ Fw Mode/SubMode Mask
 #define QCA99X0_BOARD_DATA_SZ	  12288
 #define QCA99X0_BOARD_EXT_DATA_SZ 0
 
+#define QCA4019_BOARD_DATA_SZ	  12064
+#define QCA4019_BOARD_EXT_DATA_SZ 0
+
 #endif /* __TARGADDRS_H__ */
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
