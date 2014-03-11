Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh04.mail.saunalahti.fi ([62.142.5.110])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNOgg-0002EV-SH
 for ath10k@lists.infradead.org; Tue, 11 Mar 2014 15:33:51 +0000
Subject: [PATCH 2/2] ath10k: check otp.bin result
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 11 Mar 2014 17:33:28 +0200
Message-ID: <20140311153328.7148.50188.stgit@potku.adurom.net>
In-Reply-To: <20140311153318.7148.47415.stgit@potku.adurom.net>
References: <20140311153318.7148.47415.stgit@potku.adurom.net>
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

When we execute otp.bin in the target check that the result it returns doesn't
contain an error. This is to make sure that we don't accidentally use invalid
calibration data.

While at it, remove the useless label in the function and add few debug messages.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |   21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 602fb9644cbf..e8f419144db6 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -254,23 +254,34 @@ static int ath10k_download_and_run_otp(struct ath10k *ar)
 
 	/* OTP is optional */
 
-	if (!ar->otp_data || !ar->otp_len)
+	if (!ar->otp_data || !ar->otp_len) {
+		ath10k_warn("Not running otp, calibration will be incorrect!\n");
 		return 0;
+	}
+
+	ath10k_dbg(ATH10K_DBG_BOOT, "boot upload otp to 0x%x len %d\n",
+		   address, ar->otp_len);
 
 	ret = ath10k_bmi_fast_download(ar, address, ar->otp_data, ar->otp_len);
 	if (ret) {
 		ath10k_err("could not write otp (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	ret = ath10k_bmi_execute(ar, address, 0, &result);
 	if (ret) {
 		ath10k_err("could not execute otp (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
-exit:
-	return ret;
+	ath10k_dbg(ATH10K_DBG_BOOT, "boot otp execute result %d\n", result);
+
+	if (result != 0) {
+		ath10k_err("otp calibration failed: %d", result);
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static int ath10k_download_fw(struct ath10k *ar)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
