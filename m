Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x235.google.com ([2a00:1450:4010:c04::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ya1fc-0000GJ-QT
 for ath10k@lists.infradead.org; Mon, 23 Mar 2015 12:41:30 +0000
Received: by lbcmq2 with SMTP id mq2so7070151lbc.0
 for <ath10k@lists.infradead.org>; Mon, 23 Mar 2015 05:41:06 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/2] ath10k: share board file loading code across FW APIs
Date: Mon, 23 Mar 2015 12:38:20 +0000
Message-Id: <1427114301-18886-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1427114301-18886-1-git-send-email-michal.kazior@tieto.com>
References: <1427114301-18886-1-git-send-email-michal.kazior@tieto.com>
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

There's no need to implement the same thing twice.
Reduce code duplication.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 68 +++++++++++++++-------------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index c0e454b..1785e0e 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -482,6 +482,30 @@ static int ath10k_fetch_cal_file(struct ath10k *ar)
 	return 0;
 }
 
+static int ath10k_core_fetch_board_file(struct ath10k *ar)
+{
+	int ret;
+
+	if (!ar->hw_params.fw.board) {
+		ath10k_err(ar, "failed to find board file fw entry\n");
+		return -EINVAL;
+	}
+
+	ar->board = ath10k_fetch_fw_file(ar,
+					 ar->hw_params.fw.dir,
+					 ar->hw_params.fw.board);
+	if (IS_ERR(ar->board)) {
+		ret = PTR_ERR(ar->board);
+		ath10k_err(ar, "failed to fetch board data: %d\n", ret);
+		return ret;
+	}
+
+	ar->board_data = ar->board->data;
+	ar->board_len = ar->board->size;
+
+	return 0;
+}
+
 static int ath10k_core_fetch_firmware_api_1(struct ath10k *ar)
 {
 	int ret = 0;
@@ -491,23 +515,6 @@ static int ath10k_core_fetch_firmware_api_1(struct ath10k *ar)
 		return -EINVAL;
 	}
 
-	if (ar->hw_params.fw.board == NULL) {
-		ath10k_err(ar, "board data file not defined");
-		return -EINVAL;
-	}
-
-	ar->board = ath10k_fetch_fw_file(ar,
-					 ar->hw_params.fw.dir,
-					 ar->hw_params.fw.board);
-	if (IS_ERR(ar->board)) {
-		ret = PTR_ERR(ar->board);
-		ath10k_err(ar, "could not fetch board data (%d)\n", ret);
-		goto err;
-	}
-
-	ar->board_data = ar->board->data;
-	ar->board_len = ar->board->size;
-
 	ar->firmware = ath10k_fetch_fw_file(ar,
 					    ar->hw_params.fw.dir,
 					    ar->hw_params.fw.fw);
@@ -695,27 +702,6 @@ static int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name)
 		goto err;
 	}
 
-	/* now fetch the board file */
-	if (ar->hw_params.fw.board == NULL) {
-		ath10k_err(ar, "board data file not defined");
-		ret = -EINVAL;
-		goto err;
-	}
-
-	ar->board = ath10k_fetch_fw_file(ar,
-					 ar->hw_params.fw.dir,
-					 ar->hw_params.fw.board);
-	if (IS_ERR(ar->board)) {
-		ret = PTR_ERR(ar->board);
-		ath10k_err(ar, "could not fetch board data '%s/%s' (%d)\n",
-			   ar->hw_params.fw.dir, ar->hw_params.fw.board,
-			   ret);
-		goto err;
-	}
-
-	ar->board_data = ar->board->data;
-	ar->board_len = ar->board->size;
-
 	return 0;
 
 err:
@@ -730,6 +716,12 @@ static int ath10k_core_fetch_firmware_files(struct ath10k *ar)
 	/* calibration file is optional, don't check for any errors */
 	ath10k_fetch_cal_file(ar);
 
+	ret = ath10k_core_fetch_board_file(ar);
+	if (ret) {
+		ath10k_err(ar, "failed to fetch board file: %d\n", ret);
+		return ret;
+	}
+
 	ar->fw_api = 4;
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "trying fw api %d\n", ar->fw_api);
 
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
