Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJuY0-0007dL-RW
 for ath10k@lists.infradead.org; Fri, 26 Apr 2019 06:41:27 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 5/5] ath10k: enable QCA6174 hw3.2 SDIO hardware
Date: Fri, 26 Apr 2019 09:41:11 +0300
Message-Id: <1556260871-2919-6-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1556260871-2919-1-git-send-email-kvalo@codeaurora.org>
References: <1556260871-2919-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Wen Gong <wgong@codeaurora.org>

From: Wen Gong <wgong@codeaurora.org>

After implementing PN replay check we can enable SDIO support on QCA6174.
Tested with client mode on all security modes, and fragmentation as well. AP
mode does not work yet.

Also tone down the warning about SDIO being not ready yet.

Tested on QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00007-QCARMSWP-1. AP mode
is not working yet.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 27 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h   |  1 +
 drivers/net/wireless/ath/ath10k/sdio.c |  2 +-
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index cfd7bb29a1ec..525a7ff87bf4 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -154,6 +154,33 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.fw_diag_ce_download = false,
 	},
 	{
+		.id = QCA6174_HW_3_2_VERSION,
+		.dev_id = QCA6174_3_2_DEVICE_ID,
+		.bus = ATH10K_BUS_SDIO,
+		.name = "qca6174 hw3.2 sdio",
+		.patch_load_addr = QCA6174_HW_3_0_PATCH_LOAD_ADDR,
+		.uart_pin = 19,
+		.otp_exe_param = 0,
+		.channel_counters_freq_hz = 88000,
+		.max_probe_resp_desc_thres = 0,
+		.cal_data_len = 0,
+		.fw = {
+			.dir = QCA6174_HW_3_0_FW_DIR,
+			.board = QCA6174_HW_3_0_BOARD_DATA_FILE,
+			.board_size = QCA6174_BOARD_DATA_SZ,
+			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
+		},
+		.hw_ops = &qca6174_ops,
+		.hw_clk = qca6174_clk,
+		.target_cpu_freq = 176000000,
+		.decap_align_bytes = 4,
+		.n_cipher_suites = 8,
+		.num_peers = 10,
+		.ast_skid_limit = 0x10,
+		.num_wds_entries = 0x20,
+		.uart_pin_workaround = true,
+	},
+	{
 		.id = QCA6174_HW_2_1_VERSION,
 		.dev_id = QCA6164_2_1_DEVICE_ID,
 		.bus = ATH10K_BUS_PCI,
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index a92fce1bb6f0..248cfb4e53c3 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -24,6 +24,7 @@ enum ath10k_bus {
 #define QCA988X_2_0_DEVICE_ID   (0x003c)
 #define QCA6164_2_1_DEVICE_ID   (0x0041)
 #define QCA6174_2_1_DEVICE_ID   (0x003e)
+#define QCA6174_3_2_DEVICE_ID   (0x0042)
 #define QCA99X0_2_0_DEVICE_ID   (0x0040)
 #define QCA9888_2_0_DEVICE_ID	(0x0056)
 #define QCA9984_1_0_DEVICE_ID	(0x0046)
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 30102090e282..a2c1bad67b5b 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2059,7 +2059,7 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 	}
 
 	/* TODO: remove this once SDIO support is fully implemented */
-	ath10k_warn(ar, "WARNING: ath10k SDIO support is incomplete, don't expect anything to work!\n");
+	ath10k_warn(ar, "WARNING: ath10k SDIO support is work-in-progress, problems may arise!\n");
 
 	return 0;
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
