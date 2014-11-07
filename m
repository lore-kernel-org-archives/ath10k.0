Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmjNY-0004mS-4o
 for ath10k@lists.infradead.org; Fri, 07 Nov 2014 13:15:04 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 1/2] ath10k: add modpram 'skip_otp' to ignore empty otp error
 during BMI
Date: Fri, 7 Nov 2014 18:46:44 +0530
Message-ID: <1415366205-11672-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

This patch would help bring up wifi interface with default board
data in case of failures in otp download. It is useful for initial
caliberation.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5c23d00..2de49e4 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -31,12 +31,15 @@
 unsigned int ath10k_debug_mask;
 static bool uart_print;
 static unsigned int ath10k_p2p;
+static bool skip_otp;
 module_param_named(debug_mask, ath10k_debug_mask, uint, 0644);
 module_param(uart_print, bool, 0644);
 module_param_named(p2p, ath10k_p2p, uint, 0644);
+module_param(skip_otp, bool, 0644);
 MODULE_PARM_DESC(debug_mask, "Debugging mask");
 MODULE_PARM_DESC(uart_print, "Uart target debugging");
 MODULE_PARM_DESC(p2p, "Enable ath10k P2P support");
+MODULE_PARM_DESC(skip_otp, "Skip otp failure for calibration in testmode");
 
 static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 	{
@@ -280,7 +283,7 @@ static int ath10k_download_and_run_otp(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot otp execute result %d\n", result);
 
-	if (result != 0) {
+	if (!skip_otp && result != 0) {
 		ath10k_err(ar, "otp calibration failed: %d", result);
 		return -EINVAL;
 	}
-- 
2.1.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
