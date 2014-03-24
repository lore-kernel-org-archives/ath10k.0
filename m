Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSASn-0000xI-KQ
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 19:23:14 +0000
From: greearb@candelatech.com
Subject: [PATCH 3/4 v2] ath10k:  add otp and firmware boot error messages
Date: Mon, 24 Mar 2014 12:20:42 -0700
Message-Id: <1395688844-24640-3-git-send-email-greearb@candelatech.com>
In-Reply-To: <1395688844-24640-1-git-send-email-greearb@candelatech.com>
References: <1395688844-24640-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

If OTP or firmware fails to load properly, print out some
extra info in the kernel logs.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 79c7d48..da59c8a 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -255,7 +255,8 @@ static int ath10k_download_and_run_otp(struct ath10k *ar)
 	/* OTP is optional */
 
 	if (!ar->otp_data || !ar->otp_len) {
-		ath10k_warn("Not running otp, calibration will be incorrect!\n");
+		ath10k_warn("Not running otp, calibration will be incorrect (otp-data %p otp_len %zd)!\n",
+			    ar->otp_data, ar->otp_len);
 		return 0;
 	}
 
@@ -585,16 +586,22 @@ static int ath10k_init_download_firmware(struct ath10k *ar)
 	int ret;
 
 	ret = ath10k_download_board_data(ar);
-	if (ret)
+	if (ret) {
+		ath10k_err("failed to download board data: %d\n", ret);
 		return ret;
+	}
 
 	ret = ath10k_download_and_run_otp(ar);
-	if (ret)
+	if (ret) {
+		ath10k_err("failed to run otp: %d\n", ret);
 		return ret;
+	}
 
 	ret = ath10k_download_fw(ar);
-	if (ret)
+	if (ret) {
+		ath10k_err("failed to download firmware: %d\n", ret);
 		return ret;
+	}
 
 	return ret;
 }
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
