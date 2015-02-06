Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJhOD-0006sj-BC
 for ath10k@lists.infradead.org; Fri, 06 Feb 2015 11:48:02 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 1/2] ath10k: Bypass PLL setting on target init for QCA9888
Date: Fri, 6 Feb 2015 17:17:17 +0530
Message-ID: <1423223238-17530-1-git-send-email-rmanohar@qti.qualcomm.com>
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

Some of of qca988x solutions are having global reset issue
during target initialization. Bypassing PLL setting before
downloading firmware and letting the SoC run on REF_CLK is fixing
the problem. Corresponding firmware change is also needed to set
the clock source once the target is initialized. Since 10.2.4
firmware is having this ROM patch, applying skip_clock_init only
for 10.2.4 firmware versions.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 310e12b..3119192 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -797,6 +797,20 @@ static int ath10k_download_cal_data(struct ath10k *ar)
 	ar->cal_mode = ATH10K_CAL_MODE_OTP;
 
 done:
+	if ((ar->hw_rev != ATH10K_HW_QCA988X) ||
+	    (ar->wmi.op_version != ATH10K_FW_WMI_OP_VERSION_10_2_4)) {
+		ath10k_dbg(ar, ATH10K_DBG_BOOT,
+			   "boot using calibration mode %s\n",
+			   ath10k_cal_mode_str(ar->cal_mode));
+		return 0;
+	}
+
+	ret = ath10k_bmi_write32(ar, hi_skip_clock_init, 1);
+	if (ret) {
+		ath10k_err(ar, "could not write skip_clock_init (%d)\n", ret);
+		return ret;
+	}
+
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot using calibration mode %s\n",
 		   ath10k_cal_mode_str(ar->cal_mode));
 	return 0;
-- 
2.2.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
