Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eL61d-0008F3-Kw
 for ath10k@lists.infradead.org; Sat, 02 Dec 2017 11:32:08 +0000
From: Rakesh Pillai <pillair@qti.qualcomm.com>
Subject: [PATCH v2 4/4] ath10k: WMI: add hw params entry for wcn3990
Date: Sat,  2 Dec 2017 17:00:48 +0530
Message-Id: <1512214248-17127-5-git-send-email-pillair@qti.qualcomm.com>
In-Reply-To: <1512214248-17127-1-git-send-email-pillair@qti.qualcomm.com>
References: <1512214248-17127-1-git-send-email-pillair@qti.qualcomm.com>
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
Cc: Govind Singh <govinds@qti.qualcomm.com>, linux-wireless@vger.kernel.org, Rakesh Pillai <pillair@qti.qualcomm.com>

Add hw params entry for wcn3990 and populate various
target specific values for wcn3990.

Signed-off-by: Rakesh Pillai <pillair@qti.qualcomm.com>
Signed-off-by: Govind Singh <govinds@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 18 ++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.c   |  2 ++
 drivers/net/wireless/ath/ath10k/hw.h   | 10 ++++++++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index be18913..6abffb5 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -405,6 +405,24 @@
 		.ast_skid_limit = 0x10,
 		.num_wds_entries = 0x20,
 	},
+	{
+		.id = WCN3990_HW_1_0_DEV_VERSION,
+		.dev_id = 0,
+		.name = "wcn3990 hw1.0",
+		.continuous_frag_desc = true,
+		.tx_chain_mask = 0x7,
+		.rx_chain_mask = 0x7,
+		.max_spatial_stream = 4,
+		.fw = {
+			.dir = WCN3990_HW_1_0_FW_DIR,
+		},
+		.sw_decrypt_mcast_mgmt = true,
+		.hw_ops = &wcn3990_ops,
+		.decap_align_bytes = 1,
+		.num_peers = TARGET_HL_10_TLV_NUM_PEERS,
+		.ast_skid_limit = TARGET_HL_10_TLV_AST_SKID_LIMIT,
+		.num_wds_entries = TARGET_HL_10_TLV_NUM_WDS_ENTRIES,
+	},
 };
 
 static const char *const ath10k_core_fw_feature_str[] = {
diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index 88955bb..76b9b41 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -931,3 +931,5 @@ static int ath10k_qca99x0_rx_desc_get_l3_pad_bytes(struct htt_rx_desc *rxd)
 	.set_coverage_class = ath10k_hw_qca988x_set_coverage_class,
 	.enable_pll_clk = ath10k_hw_qca6174_enable_pll_clock,
 };
+
+const struct ath10k_hw_ops wcn3990_ops = {0};
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index fedb6c7..90ad39b 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -128,6 +128,10 @@ enum qca9377_chip_id_rev {
 #define QCA4019_HW_1_0_BOARD_DATA_FILE "board.bin"
 #define QCA4019_HW_1_0_PATCH_LOAD_ADDR  0x1234
 
+/* WCN3990 1.0 definitions */
+#define WCN3990_HW_1_0_DEV_VERSION	ATH10K_HW_WCN3990
+#define WCN3990_HW_1_0_FW_DIR		ATH10K_FW_DIR "/WCN3990/hw3.0"
+
 #define ATH10K_FW_FILE_BASE		"firmware"
 #define ATH10K_FW_API_MAX		6
 #define ATH10K_FW_API_MIN		2
@@ -571,6 +575,7 @@ struct ath10k_hw_ops {
 extern const struct ath10k_hw_ops qca988x_ops;
 extern const struct ath10k_hw_ops qca99x0_ops;
 extern const struct ath10k_hw_ops qca6174_ops;
+extern const struct ath10k_hw_ops wcn3990_ops;
 
 extern const struct ath10k_hw_clk_params qca6174_clk[];
 
@@ -667,6 +672,11 @@ struct ath10k_hw_ops {
 #define TARGET_TLV_NUM_MSDU_DESC		(1024 + 32)
 #define TARGET_TLV_NUM_WOW_PATTERNS		22
 
+/* Target specific defines for WMI-HL-1.0 firmware */
+#define TARGET_HL_10_TLV_NUM_PEERS		14
+#define TARGET_HL_10_TLV_AST_SKID_LIMIT		6
+#define TARGET_HL_10_TLV_NUM_WDS_ENTRIES	2
+
 /* Diagnostic Window */
 #define CE_DIAG_PIPE	7
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
