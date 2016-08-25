Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcufT-00044k-4J
 for ath10k@lists.infradead.org; Thu, 25 Aug 2016 13:26:06 +0000
From: Benjamin Berg <benjamin@sipsolutions.net>
Subject: [PATCHv3 1/2] ath10k: Rename hw_rx_desc_ops to hw_ops to use it for
 other purposes
Date: Thu, 25 Aug 2016 15:25:21 +0200
Message-Id: <20160825132522.30994-2-benjamin@sipsolutions.net>
In-Reply-To: <20160825132522.30994-1-benjamin@sipsolutions.net>
References: <20160825132522.30994-1-benjamin@sipsolutions.net>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Benjamin Berg <benjamin@sipsolutions.net>, Michal Kazior <michal.kazior@tieto.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

The structure contains hardware specific operations. Rename the struct so
that it is appropriate to be used for other operations.

Signed-off-by: Benjamin Berg <benjamin@sipsolutions.net>
---
 drivers/net/wireless/ath/ath10k/core.c | 24 ++++++++++++------------
 drivers/net/wireless/ath/ath10k/hw.c   |  4 ++--
 drivers/net/wireless/ath/ath10k/hw.h   |  8 ++++----
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 9c5e93b..6dd42d3 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -68,7 +68,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA988X_BOARD_DATA_SZ,
 			.board_ext_size = QCA988X_BOARD_EXT_DATA_SZ,
 		},
-		.hw_rx_desc_ops = &qca988x_rx_desc_ops,
+		.hw_ops = &qca988x_ops,
 	},
 	{
 		.id = QCA9887_HW_1_0_VERSION,
@@ -88,7 +88,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA9887_BOARD_DATA_SZ,
 			.board_ext_size = QCA9887_BOARD_EXT_DATA_SZ,
 		},
-		.hw_rx_desc_ops = &qca988x_rx_desc_ops,
+		.hw_ops = &qca988x_ops,
 	},
 	{
 		.id = QCA6174_HW_2_1_VERSION,
@@ -106,7 +106,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
-		.hw_rx_desc_ops = &qca988x_rx_desc_ops,
+		.hw_ops = &qca988x_ops,
 	},
 	{
 		.id = QCA6174_HW_2_1_VERSION,
@@ -125,7 +125,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
-		.hw_rx_desc_ops = &qca988x_rx_desc_ops,
+		.hw_ops = &qca988x_ops,
 	},
 	{
 		.id = QCA6174_HW_3_0_VERSION,
@@ -144,7 +144,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
-		.hw_rx_desc_ops = &qca988x_rx_desc_ops,
+		.hw_ops = &qca988x_ops,
 	},
 	{
 		.id = QCA6174_HW_3_2_VERSION,
@@ -164,7 +164,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
-		.hw_rx_desc_ops = &qca988x_rx_desc_ops,
+		.hw_ops = &qca988x_ops,
 	},
 	{
 		.id = QCA99X0_HW_2_0_DEV_VERSION,
@@ -188,7 +188,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA99X0_BOARD_DATA_SZ,
 			.board_ext_size = QCA99X0_BOARD_EXT_DATA_SZ,
 		},
-		.hw_rx_desc_ops = &qca99x0_rx_desc_ops,
+		.hw_ops = &qca99x0_ops,
 	},
 	{
 		.id = QCA9984_HW_1_0_DEV_VERSION,
@@ -212,7 +212,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA99X0_BOARD_DATA_SZ,
 			.board_ext_size = QCA99X0_BOARD_EXT_DATA_SZ,
 		},
-		.hw_rx_desc_ops = &qca99x0_rx_desc_ops,
+		.hw_ops = &qca99x0_ops,
 	},
 	{
 		.id = QCA9888_HW_2_0_DEV_VERSION,
@@ -235,7 +235,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA99X0_BOARD_DATA_SZ,
 			.board_ext_size = QCA99X0_BOARD_EXT_DATA_SZ,
 		},
-		.hw_rx_desc_ops = &qca99x0_rx_desc_ops,
+		.hw_ops = &qca99x0_ops,
 	},
 	{
 		.id = QCA9377_HW_1_0_DEV_VERSION,
@@ -253,7 +253,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA9377_BOARD_DATA_SZ,
 			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
 		},
-		.hw_rx_desc_ops = &qca988x_rx_desc_ops,
+		.hw_ops = &qca988x_ops,
 	},
 	{
 		.id = QCA9377_HW_1_1_DEV_VERSION,
@@ -271,7 +271,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA9377_BOARD_DATA_SZ,
 			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
 		},
-		.hw_rx_desc_ops = &qca988x_rx_desc_ops,
+		.hw_ops = &qca988x_ops,
 	},
 	{
 		.id = QCA4019_HW_1_0_DEV_VERSION,
@@ -296,7 +296,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA4019_BOARD_DATA_SZ,
 			.board_ext_size = QCA4019_BOARD_EXT_DATA_SZ,
 		},
-		.hw_rx_desc_ops = &qca99x0_rx_desc_ops,
+		.hw_ops = &qca99x0_ops,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index 6149aa9..c2ecb9b 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -220,7 +220,7 @@ void ath10k_hw_fill_survey_time(struct ath10k *ar, struct survey_info *survey,
 	survey->time_busy = CCNT_TO_MSEC(ar, rcc);
 }
 
-const struct ath10k_hw_rx_desc_ops qca988x_rx_desc_ops = {
+const struct ath10k_hw_ops qca988x_ops = {
 };
 
 static int ath10k_qca99x0_rx_desc_get_l3_pad_bytes(struct htt_rx_desc *rxd)
@@ -229,6 +229,6 @@ static int ath10k_qca99x0_rx_desc_get_l3_pad_bytes(struct htt_rx_desc *rxd)
 		  RX_MSDU_END_INFO1_L3_HDR_PAD);
 }
 
-const struct ath10k_hw_rx_desc_ops qca99x0_rx_desc_ops = {
+const struct ath10k_hw_ops qca99x0_ops = {
 	.rx_desc_get_l3_pad_bytes = ath10k_qca99x0_rx_desc_get_l3_pad_bytes,
 };
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index a281544..1ef7dc6 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -410,18 +410,18 @@ struct ath10k_hw_params {
 		size_t board_ext_size;
 	} fw;
 
-	const struct ath10k_hw_rx_desc_ops *hw_rx_desc_ops;
+	const struct ath10k_hw_ops *hw_ops;
 };
 
 struct htt_rx_desc;
 
 /* Defines needed for Rx descriptor abstraction */
-struct ath10k_hw_rx_desc_ops {
+struct ath10k_hw_ops {
 	int (*rx_desc_get_l3_pad_bytes)(struct htt_rx_desc *rxd);
 };
 
-extern const struct ath10k_hw_rx_desc_ops qca988x_rx_desc_ops;
-extern const struct ath10k_hw_rx_desc_ops qca99x0_rx_desc_ops;
+extern const struct ath10k_hw_ops qca988x_ops;
+extern const struct ath10k_hw_ops qca99x0_ops;
 
 /* Target specific defines for MAIN firmware */
 #define TARGET_NUM_VDEVS			8
-- 
2.9.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
