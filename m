Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcmCw-00060s-O2
 for ath10k@lists.infradead.org; Mon, 17 Jun 2019 07:37:40 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: add new hw_ops for sdio chip
Date: Mon, 17 Jun 2019 15:37:28 +0800
Message-Id: <1560757048-19223-1-git-send-email-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

It report error message while suspend/resume test.
dmesg log:
[  150.749962] ath10k_sdio mmc1:0001:1: hif read32 not supported
[  150.755728] ath10k_sdio mmc1:0001:1: failed to set coverage class: expected integer microsecond value in register

Reason is sdio chip does not support set_coverage_class as well as
pcie chip, remove the set_coverage_class handler will avoid it.

callstack of the error message:
OUTLINED_FUNCTION_6+0xc/0x14 [ath10k_core]
ath10k_mac_op_set_coverage_class+0x2c/0x40 [ath10k_core]
ieee80211_reconfig+0x5d0/0x108c [mac80211]
ieee80211_resume+0x34/0x6c [mac80211]
wiphy_resume+0xbc/0x13c [cfg80211]
dpm_run_callback+0xa4/0x168
device_resume+0x1d4/0x200
async_resume+0x1c/0x34
async_run_entry_fn+0x48/0xf8
process_one_work+0x178/0x2f8
worker_thread+0x1d8/0x2cc
kthread+0x11c/0x12c
ret_from_fork+0x10/0x18

the error log will not happen after this patch applied.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 2 +-
 drivers/net/wireless/ath/ath10k/hw.c   | 4 ++++
 drivers/net/wireless/ath/ath10k/hw.h   | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 76504bc..3c6d921 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -101,7 +101,7 @@
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
-		.hw_ops = &qca6174_ops,
+		.hw_ops = &qca6174_sdio_ops,
 		.hw_clk = qca6174_clk,
 		.target_cpu_freq = 176000000,
 		.decap_align_bytes = 4,
diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index ad082b7..a6a38c9 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -1153,6 +1153,10 @@ static bool ath10k_qca99x0_rx_desc_msdu_limit_error(struct htt_rx_desc *rxd)
 	.is_rssi_enable = ath10k_htt_tx_rssi_enable,
 };
 
+const struct ath10k_hw_ops qca6174_sdio_ops = {
+	.enable_pll_clk = ath10k_hw_qca6174_enable_pll_clock,
+};
+
 const struct ath10k_hw_ops wcn3990_ops = {
 	.tx_data_rssi_pad_bytes = ath10k_get_htt_tx_data_rssi_pad,
 	.is_rssi_enable = ath10k_htt_tx_rssi_enable_wcn3990,
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 54c01f1..3a6f87e 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -626,6 +626,7 @@ struct ath10k_hw_ops {
 extern const struct ath10k_hw_ops qca988x_ops;
 extern const struct ath10k_hw_ops qca99x0_ops;
 extern const struct ath10k_hw_ops qca6174_ops;
+extern const struct ath10k_hw_ops qca6174_sdio_ops;
 extern const struct ath10k_hw_ops wcn3990_ops;
 
 extern const struct ath10k_hw_clk_params qca6174_clk[];
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
