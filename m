Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auybN-0004NM-H7
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 08:44:13 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH] ath10k: release pre_cal_file while unloading driver
Date: Tue, 26 Apr 2016 14:13:37 +0530
Message-ID: <1461660217-23046-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, rmanohar@codeaurora.org

Failing to release pre_cal_file caldata on deinit causes memory leak.

Fixes: b131129d9657 ("ath10k: fix calibration init sequence of qca99x0")
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5f846bd4054c..6e37184abab6 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -712,6 +712,9 @@ static void ath10k_core_free_firmware_files(struct ath10k *ar)
 	if (!IS_ERR(ar->cal_file))
 		release_firmware(ar->cal_file);
 
+	if (!IS_ERR(ar->pre_cal_file))
+		release_firmware(ar->pre_cal_file);
+
 	ath10k_swap_code_seg_release(ar);
 
 	ar->otp = NULL;
@@ -723,6 +726,7 @@ static void ath10k_core_free_firmware_files(struct ath10k *ar)
 	ar->firmware_len = 0;
 
 	ar->cal_file = NULL;
+	ar->pre_cal_file = NULL;
 }
 
 static int ath10k_fetch_cal_file(struct ath10k *ar)
-- 
2.8.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
