Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh03.mail.saunalahti.fi ([62.142.5.109])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XdZJj-0005sR-Sk
 for ath10k@lists.infradead.org; Mon, 13 Oct 2014 06:41:16 +0000
Subject: [PATCH 2/3] ath10k: refactor ath10k_init_download_firmware()
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 13 Oct 2014 09:40:53 +0300
Message-ID: <20141013064053.30315.78692.stgit@potku.adurom.net>
In-Reply-To: <20141013063929.30315.41969.stgit@potku.adurom.net>
References: <20141013063929.30315.41969.stgit@potku.adurom.net>
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

This is preparation for being able to download calibration data from a file.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |   27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 76f0db0654bb..d0b67a7512cf 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -225,6 +225,12 @@ static int ath10k_download_and_run_otp(struct ath10k *ar)
 	u32 result, address = ar->hw_params.patch_load_addr;
 	int ret;
 
+	ret = ath10k_download_board_data(ar);
+	if (ret) {
+		ath10k_err(ar, "failed to download board data: %d\n", ret);
+		return ret;
+	}
+
 	/* OTP is optional */
 
 	if (!ar->otp_data || !ar->otp_len) {
@@ -589,29 +595,16 @@ success:
 	return 0;
 }
 
-static int ath10k_init_download_firmware(struct ath10k *ar,
-					 enum ath10k_firmware_mode mode)
+static int ath10k_download_cal_data(struct ath10k *ar)
 {
 	int ret;
 
-	ret = ath10k_download_board_data(ar);
-	if (ret) {
-		ath10k_err(ar, "failed to download board data: %d\n", ret);
-		return ret;
-	}
-
 	ret = ath10k_download_and_run_otp(ar);
 	if (ret) {
 		ath10k_err(ar, "failed to run otp: %d\n", ret);
 		return ret;
 	}
 
-	ret = ath10k_download_fw(ar, mode);
-	if (ret) {
-		ath10k_err(ar, "failed to download firmware: %d\n", ret);
-		return ret;
-	}
-
 	return ret;
 }
 
@@ -729,7 +722,11 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
 		goto err;
 	}
 
-	status = ath10k_init_download_firmware(ar, mode);
+	status = ath10k_download_cal_data(ar);
+	if (status)
+		goto err;
+
+	status = ath10k_download_fw(ar, mode);
 	if (status)
 		goto err;
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
