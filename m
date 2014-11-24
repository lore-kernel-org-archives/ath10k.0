Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsueO-0007SZ-DB
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 14:30:01 +0000
Received: by mail-wi0-f178.google.com with SMTP id hi2so5936747wib.11
 for <ath10k@lists.infradead.org>; Mon, 24 Nov 2014 06:29:38 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/3] ath10k: put board size into hw_params
Date: Mon, 24 Nov 2014 15:17:25 +0100
Message-Id: <1416838646-18801-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1416838646-18801-1-git-send-email-michal.kazior@tieto.com>
References: <1416838646-18801-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

This makes it easier to extend the list of
supported hardware.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 +++++---
 drivers/net/wireless/ath/ath10k/core.h | 2 ++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 3904ce3..204aa04 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -63,6 +63,8 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.fw = QCA988X_HW_2_0_FW_FILE,
 			.otp = QCA988X_HW_2_0_OTP_FILE,
 			.board = QCA988X_HW_2_0_BOARD_DATA_FILE,
+			.board_size = QCA988X_BOARD_DATA_SZ,
+			.board_ext_size = QCA988X_BOARD_EXT_DATA_SZ,
 		},
 	},
 };
@@ -156,8 +158,8 @@ static const struct firmware *ath10k_fetch_fw_file(struct ath10k *ar,
 static int ath10k_push_board_ext_data(struct ath10k *ar, const void *data,
 				      size_t data_len)
 {
-	u32 board_data_size = QCA988X_BOARD_DATA_SZ;
-	u32 board_ext_data_size = QCA988X_BOARD_EXT_DATA_SZ;
+	u32 board_data_size = ar->hw_params.fw.board_size;
+	u32 board_ext_data_size = ar->hw_params.fw.board_ext_size;
 	u32 board_ext_data_addr;
 	int ret;
 
@@ -203,7 +205,7 @@ static int ath10k_push_board_ext_data(struct ath10k *ar, const void *data,
 static int ath10k_download_board_data(struct ath10k *ar, const void *data,
 				      size_t data_len)
 {
-	u32 board_data_size = QCA988X_BOARD_DATA_SZ;
+	u32 board_data_size = ar->hw_params.fw.board_size;
 	u32 address;
 	int ret;
 
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index d37ffd6..1cc81e8 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -482,6 +482,8 @@ struct ath10k {
 			const char *fw;
 			const char *otp;
 			const char *board;
+			size_t board_size;
+			size_t board_ext_size;
 		} fw;
 	} hw_params;
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
