Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avN9T-0003bB-6f
 for ath10k@lists.infradead.org; Wed, 27 Apr 2016 10:57:03 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH v2] ath10k: release pre_cal_file while unloading driver
Date: Wed, 27 Apr 2016 16:26:26 +0530
Message-ID: <1461754586-7928-1-git-send-email-rmanohar@qti.qualcomm.com>
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
v2: rebased

 drivers/net/wireless/ath/ath10k/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 3c38adafcc7a..dcc1c2ec14f7 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -686,6 +686,9 @@ static void ath10k_core_free_firmware_files(struct ath10k *ar)
 	if (!IS_ERR(ar->cal_file))
 		release_firmware(ar->cal_file);
 
+	if (!IS_ERR(ar->pre_cal_file))
+		release_firmware(ar->pre_cal_file);
+
 	ath10k_swap_code_seg_release(ar);
 
 	ar->normal_mode_fw.fw_file.otp_data = NULL;
@@ -696,6 +699,7 @@ static void ath10k_core_free_firmware_files(struct ath10k *ar)
 	ar->normal_mode_fw.fw_file.firmware_len = 0;
 
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
