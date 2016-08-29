Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1beNpl-00016d-HH
 for ath10k@lists.infradead.org; Mon, 29 Aug 2016 14:46:53 +0000
From: Benjamin Berg <benjamin@sipsolutions.net>
Subject: [PATCHv3 2/5] ath10k: Add provision for Rx descriptor abstraction
Date: Mon, 29 Aug 2016 16:45:54 +0200
Message-Id: <20160829144557.11678-3-benjamin@sipsolutions.net>
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
Cc: Simon Wunderlich <sw@simonwunderlich.de>, Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Benjamin Berg <benjamin@sipsolutions.net>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, Michal Kazior <michal.kazior@tieto.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>

From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

There are slight differences in Rx hw descriptor information
among different chips. So far driver does not use those new
information for any functionalities, but there is one important
information which is available from QCA99X0 onwards to indicate
the number of bytes that hw padded at the begining of the rx
payload and this information is needed to undecap the rx
packet. Add an abstraction for Rx desc to make use of the
new desc information available. The callback that this patch
defines to retrieve the padding bytes will be used in follow-up
patch.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
[Rename operations to hw_ops for other purposes]
Signed-off-by: Benjamin Berg <benjamin@sipsolutions.net>
---
 drivers/net/wireless/ath/ath10k/core.c | 12 ++++++++++++
 drivers/net/wireless/ath/ath10k/hw.c   | 13 +++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h   | 12 ++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index e889829..6dd42d3 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -68,6 +68,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA988X_BOARD_DATA_SZ,
 			.board_ext_size = QCA988X_BOARD_EXT_DATA_SZ,
 		},
+		.hw_ops = &qca988x_ops,
 	},
 	{
 		.id = QCA9887_HW_1_0_VERSION,
@@ -87,6 +88,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA9887_BOARD_DATA_SZ,
 			.board_ext_size = QCA9887_BOARD_EXT_DATA_SZ,
 		},
+		.hw_ops = &qca988x_ops,
 	},
 	{
 		.id = QCA6174_HW_2_1_VERSION,
@@ -104,6 +106,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
+		.hw_ops = &qca988x_ops,
 	},
 	{
 		.id = QCA6174_HW_2_1_VERSION,
@@ -122,6 +125,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
+		.hw_ops = &qca988x_ops,
 	},
 	{
 		.id = QCA6174_HW_3_0_VERSION,
@@ -140,6 +144,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
+		.hw_ops = &qca988x_ops,
 	},
 	{
 		.id = QCA6174_HW_3_2_VERSION,
@@ -159,6 +164,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
+		.hw_ops = &qca988x_ops,
 	},
 	{
 		.id = QCA99X0_HW_2_0_DEV_VERSION,
@@ -182,6 +188,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA99X0_BOARD_DATA_SZ,
 			.board_ext_size = QCA99X0_BOARD_EXT_DATA_SZ,
 		},
+		.hw_ops = &qca99x0_ops,
 	},
 	{
 		.id = QCA9984_HW_1_0_DEV_VERSION,
@@ -205,6 +212,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA99X0_BOARD_DATA_SZ,
 			.board_ext_size = QCA99X0_BOARD_EXT_DATA_SZ,
 		},
+		.hw_ops = &qca99x0_ops,
 	},
 	{
 		.id = QCA9888_HW_2_0_DEV_VERSION,
@@ -227,6 +235,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA99X0_BOARD_DATA_SZ,
 			.board_ext_size = QCA99X0_BOARD_EXT_DATA_SZ,
 		},
+		.hw_ops = &qca99x0_ops,
 	},
 	{
 		.id = QCA9377_HW_1_0_DEV_VERSION,
@@ -244,6 +253,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA9377_BOARD_DATA_SZ,
 			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
 		},
+		.hw_ops = &qca988x_ops,
 	},
 	{
 		.id = QCA9377_HW_1_1_DEV_VERSION,
@@ -261,6 +271,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA9377_BOARD_DATA_SZ,
 			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
 		},
+		.hw_ops = &qca988x_ops,
 	},
 	{
 		.id = QCA4019_HW_1_0_DEV_VERSION,
@@ -285,6 +296,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA4019_BOARD_DATA_SZ,
 			.board_ext_size = QCA4019_BOARD_EXT_DATA_SZ,
 		},
+		.hw_ops = &qca99x0_ops,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index f903d46..c2ecb9b 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -219,3 +219,16 @@ void ath10k_hw_fill_survey_time(struct ath10k *ar, struct survey_info *survey,
 	survey->time = CCNT_TO_MSEC(ar, cc);
 	survey->time_busy = CCNT_TO_MSEC(ar, rcc);
 }
+
+const struct ath10k_hw_ops qca988x_ops = {
+};
+
+static int ath10k_qca99x0_rx_desc_get_l3_pad_bytes(struct htt_rx_desc *rxd)
+{
+	return MS(__le32_to_cpu(rxd->msdu_end.qca99x0.info1),
+		  RX_MSDU_END_INFO1_L3_HDR_PAD);
+}
+
+const struct ath10k_hw_ops qca99x0_ops = {
+	.rx_desc_get_l3_pad_bytes = ath10k_qca99x0_rx_desc_get_l3_pad_bytes,
+};
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 1315557..1ef7dc6 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -409,8 +409,20 @@ struct ath10k_hw_params {
 		size_t board_size;
 		size_t board_ext_size;
 	} fw;
+
+	const struct ath10k_hw_ops *hw_ops;
 };
 
+struct htt_rx_desc;
+
+/* Defines needed for Rx descriptor abstraction */
+struct ath10k_hw_ops {
+	int (*rx_desc_get_l3_pad_bytes)(struct htt_rx_desc *rxd);
+};
+
+extern const struct ath10k_hw_ops qca988x_ops;
+extern const struct ath10k_hw_ops qca99x0_ops;
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
