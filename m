Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adxbI-0005FD-Mn
 for ath10k@lists.infradead.org; Thu, 10 Mar 2016 10:14:26 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH 1/3] ath10k: pass cal data location as an argument to
 ath10k_download_cal_{file|dt}
Date: Thu, 10 Mar 2016 15:42:36 +0530
Message-ID: <1457604758-14454-2-git-send-email-rmani@qti.qualcomm.com>
In-Reply-To: <1457604758-14454-1-git-send-email-rmani@qti.qualcomm.com>
References: <1457604758-14454-1-git-send-email-rmani@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>

Both ath10k_download_cal_file() and ath10k_download_cal_dt() uses
hard coded file pointer (ar->cal_file) and device tree entry
(qcom,ath10k-calibration-data) respectively to get calibration
data content.

There is a need to use those two functions in qca4019 calibration
download sequence with different file pointer and device tree entry name.
Modify those two functions to take cal data location as an argument.
So that it can serve the purpose for other file pointer and device
tree entry.

This is just preparation before adding actual qca4019 calibration
download sequence. No functional changes.

Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2389c07..4ec4d72 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -462,18 +462,18 @@ exit:
 	return ret;
 }
 
-static int ath10k_download_cal_file(struct ath10k *ar)
+static int ath10k_download_cal_file(struct ath10k *ar,
+				    const struct firmware *file)
 {
 	int ret;
 
-	if (!ar->cal_file)
+	if (!file)
 		return -ENOENT;
 
-	if (IS_ERR(ar->cal_file))
-		return PTR_ERR(ar->cal_file);
+	if (IS_ERR(file))
+		return PTR_ERR(file);
 
-	ret = ath10k_download_board_data(ar, ar->cal_file->data,
-					 ar->cal_file->size);
+	ret = ath10k_download_board_data(ar, file->data, file->size);
 	if (ret) {
 		ath10k_err(ar, "failed to download cal_file data: %d\n", ret);
 		return ret;
@@ -484,7 +484,7 @@ static int ath10k_download_cal_file(struct ath10k *ar)
 	return 0;
 }
 
-static int ath10k_download_cal_dt(struct ath10k *ar)
+static int ath10k_download_cal_dt(struct ath10k *ar, const char *dt_name)
 {
 	struct device_node *node;
 	int data_len;
@@ -498,8 +498,7 @@ static int ath10k_download_cal_dt(struct ath10k *ar)
 		 */
 		return -ENOENT;
 
-	if (!of_get_property(node, "qcom,ath10k-calibration-data",
-			     &data_len)) {
+	if (!of_get_property(node, dt_name, &data_len)) {
 		/* The calibration data node is optional */
 		return -ENOENT;
 	}
@@ -517,8 +516,7 @@ static int ath10k_download_cal_dt(struct ath10k *ar)
 		goto out;
 	}
 
-	ret = of_property_read_u8_array(node, "qcom,ath10k-calibration-data",
-					data, data_len);
+	ret = of_property_read_u8_array(node, dt_name, data, data_len);
 	if (ret) {
 		ath10k_warn(ar, "failed to read calibration data from DT: %d\n",
 			    ret);
@@ -1258,7 +1256,7 @@ static int ath10k_download_cal_data(struct ath10k *ar)
 {
 	int ret;
 
-	ret = ath10k_download_cal_file(ar);
+	ret = ath10k_download_cal_file(ar, ar->cal_file);
 	if (ret == 0) {
 		ar->cal_mode = ATH10K_CAL_MODE_FILE;
 		goto done;
@@ -1268,7 +1266,7 @@ static int ath10k_download_cal_data(struct ath10k *ar)
 		   "boot did not find a calibration file, try DT next: %d\n",
 		   ret);
 
-	ret = ath10k_download_cal_dt(ar);
+	ret = ath10k_download_cal_dt(ar, "qcom,ath10k-calibration-data");
 	if (ret == 0) {
 		ar->cal_mode = ATH10K_CAL_MODE_DT;
 		goto done;
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
