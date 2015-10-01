Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh04.mail.saunalahti.fi ([62.142.5.110])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhbSA-00062G-Jp
 for ath10k@lists.infradead.org; Thu, 01 Oct 2015 10:51:12 +0000
Subject: [PATCH 1/6] ath10k: fix checkpatch warning about logical continuations
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 01 Oct 2015 13:50:45 +0300
Message-ID: <20151001105045.8770.44227.stgit@potku.adurom.net>
In-Reply-To: <20151001105001.8770.96252.stgit@potku.adurom.net>
References: <20151001105001.8770.96252.stgit@potku.adurom.net>
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

checkpatch found:

drivers/net/wireless/ath/ath9k/core.c:490: Logical continuations should be on the previous line

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 879625adc63a..87ad2e998a94 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -486,8 +486,8 @@ static int ath10k_download_and_run_otp(struct ath10k *ar)
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot otp execute result %d\n", result);
 
 	if (!(skip_otp || test_bit(ATH10K_FW_FEATURE_IGNORE_OTP_RESULT,
-				   ar->fw_features))
-	    && result != 0) {
+				   ar->fw_features)) &&
+	    result != 0) {
 		ath10k_err(ar, "otp calibration failed: %d", result);
 		return -EINVAL;
 	}


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
