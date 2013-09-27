Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh07.mail.saunalahti.fi ([62.142.5.117])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPXyr-0003IA-QF
 for ath10k@lists.infradead.org; Fri, 27 Sep 2013 13:21:14 +0000
Subject: [PATCH v2 1/3] ath10k: rename board_data in struct ath10k
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 27 Sep 2013 16:20:51 +0300
Message-ID: <20130927132051.20789.23994.stgit@localhost6.localdomain6>
In-Reply-To: <20130927131812.20789.9941.stgit@localhost6.localdomain6>
References: <20130927131812.20789.9941.stgit@localhost6.localdomain6>
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
Cc: linux-wireless@vger.kernel.org

I will use board_data for something else in the following patch
so I need to rename it.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |   18 +++++++++---------
 drivers/net/wireless/ath/ath10k/core.h |    2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 76906d5..e07c487 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -236,7 +236,7 @@ static int ath10k_push_board_ext_data(struct ath10k *ar,
 
 static int ath10k_download_board_data(struct ath10k *ar)
 {
-	const struct firmware *fw = ar->board_data;
+	const struct firmware *fw = ar->board;
 	u32 board_data_size = QCA988X_BOARD_DATA_SZ;
 	u32 address;
 	int ret;
@@ -319,8 +319,8 @@ exit:
 
 static void ath10k_core_free_firmware_files(struct ath10k *ar)
 {
-	if (ar->board_data && !IS_ERR(ar->board_data))
-		release_firmware(ar->board_data);
+	if (ar->board && !IS_ERR(ar->board))
+		release_firmware(ar->board);
 
 	if (ar->otp && !IS_ERR(ar->otp))
 		release_firmware(ar->otp);
@@ -328,7 +328,7 @@ static void ath10k_core_free_firmware_files(struct ath10k *ar)
 	if (ar->firmware && !IS_ERR(ar->firmware))
 		release_firmware(ar->firmware);
 
-	ar->board_data = NULL;
+	ar->board = NULL;
 	ar->otp = NULL;
 	ar->firmware = NULL;
 }
@@ -347,11 +347,11 @@ static int ath10k_core_fetch_firmware_files(struct ath10k *ar)
 		return -EINVAL;
 	}
 
-	ar->board_data = ath10k_fetch_fw_file(ar,
-					      ar->hw_params.fw.dir,
-					      ar->hw_params.fw.board);
-	if (IS_ERR(ar->board_data)) {
-		ret = PTR_ERR(ar->board_data);
+	ar->board = ath10k_fetch_fw_file(ar,
+					 ar->hw_params.fw.dir,
+					 ar->hw_params.fw.board);
+	if (IS_ERR(ar->board)) {
+		ret = PTR_ERR(ar->board);
 		ath10k_err("could not fetch board data (%d)\n", ret);
 		goto err;
 	}
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 292ad45..12b03b6 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -324,7 +324,7 @@ struct ath10k {
 		} fw;
 	} hw_params;
 
-	const struct firmware *board_data;
+	const struct firmware *board;
 	const struct firmware *otp;
 	const struct firmware *firmware;
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
