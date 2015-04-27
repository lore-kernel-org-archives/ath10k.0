Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ymjy7-0005NT-Pa
 for ath10k@lists.infradead.org; Mon, 27 Apr 2015 14:25:08 +0000
Subject: [PATCH] ath10k: add ATH10K_FW_FEATURE_IGNORE_OTP_RESULT
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 27 Apr 2015 17:24:38 +0300
Message-ID: <20150427142438.25600.26537.stgit@potku.adurom.net>
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

qca6174 otp binary seems to always return an error to the host, even if the
calibration succeeded. Add a firmware feature flag to detect if the firmware
image which have this problem and workaround the issue in ath10k by ignoring
the error code.

I was also considering making this hw specific flag but as this is strictly a
firmware issue it's best to handle this via a firmware feature flag so that it
will be easy to disable the workaround.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |    4 +++-
 drivers/net/wireless/ath/ath10k/core.h |    3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 987b266278a8..bcccae19325d 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -387,7 +387,9 @@ static int ath10k_download_and_run_otp(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot otp execute result %d\n", result);
 
-	if (!skip_otp && result != 0) {
+	if (!(skip_otp || test_bit(ATH10K_FW_FEATURE_IGNORE_OTP_RESULT,
+				   ar->fw_features))
+	    && result != 0) {
 		ath10k_err(ar, "otp calibration failed: %d", result);
 		return -EINVAL;
 	}
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 8444adf42195..827b3d79ed0c 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -460,6 +460,9 @@ enum ath10k_fw_features {
 	 */
 	ATH10K_FW_FEATURE_WOWLAN_SUPPORT = 6,
 
+	/* Don't trust error code from otp.bin */
+	ATH10K_FW_FEATURE_IGNORE_OTP_RESULT,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
