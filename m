Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fD2Ho-0003ny-6Q
 for ath10k@lists.infradead.org; Mon, 30 Apr 2018 06:27:45 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH 1/2 linux-stable-4.4] ath10k: Add new hw param to identify
 alignment for different chipsets
Date: Mon, 30 Apr 2018 11:56:26 +0530
Message-Id: <1525069587-19281-2-git-send-email-srirrama@codeaurora.org>
In-Reply-To: <1525069587-19281-1-git-send-email-srirrama@codeaurora.org>
References: <1525069587-19281-1-git-send-email-srirrama@codeaurora.org>
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
To: stable@vger.kernel.org
Cc: Vasanthkumar Thiagarajan <vthiagar@codeaurora.org>, linux-wireless@vger.kernel.org, Sriram R <srirrama@codeaurora.org>, ath10k@lists.infradead.org

Chipset QCA99X0 doesnot have rx_hdr_status padded to
align in 4-byte boundary.Hence define a new hw_params
field to handle different alignment behaviour between
different chipsets.

[Upstream commit : 2f38c3c01de945234d23dd163e3528ccb413066d]

Signed-off-by: Vasanthkumar Thiagarajan <vthiagar@codeaurora.org>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
 drivers/net/wireless/ath/ath10k/core.h | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index ee638cb..0c23768 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -67,6 +67,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA988X_BOARD_DATA_SZ,
 			.board_ext_size = QCA988X_BOARD_EXT_DATA_SZ,
 		},
+		.decap_align_bytes = 4,
 	},
 	{
 		.id = QCA6174_HW_2_1_VERSION,
@@ -85,6 +86,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
+		.decap_align_bytes = 4,
 	},
 	{
 		.id = QCA6174_HW_2_1_VERSION,
@@ -103,6 +105,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
+		.decap_align_bytes = 4,
 	},
 	{
 		.id = QCA6174_HW_3_0_VERSION,
@@ -121,6 +124,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
+		.decap_align_bytes = 4,
 	},
 	{
 		.id = QCA6174_HW_3_2_VERSION,
@@ -140,6 +144,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
+		.decap_align_bytes = 4,
 	},
 	{
 		.id = QCA99X0_HW_2_0_DEV_VERSION,
@@ -159,6 +164,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA99X0_BOARD_DATA_SZ,
 			.board_ext_size = QCA99X0_BOARD_EXT_DATA_SZ,
 		},
+		.decap_align_bytes = 1,
 	},
 	{
 		.id = QCA9377_HW_1_0_DEV_VERSION,
@@ -177,6 +183,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA9377_BOARD_DATA_SZ,
 			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
 		},
+		.decap_align_bytes = 4,
 	},
 	{
 		.id = QCA9377_HW_1_1_DEV_VERSION,
@@ -195,6 +202,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_size = QCA9377_BOARD_DATA_SZ,
 			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
 		},
+		.decap_align_bytes = 4,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 858d75f..e4e3b41 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -670,6 +670,10 @@ struct ath10k {
 			size_t board_size;
 			size_t board_ext_size;
 		} fw;
+
+		/* Number of bytes used for alignment in rx_hdr_status */
+		int decap_align_bytes;
+
 	} hw_params;
 
 	const struct firmware *board;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
