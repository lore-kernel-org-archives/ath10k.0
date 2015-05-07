Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqJ5m-0005p8-Vc
 for ath10k@lists.infradead.org; Thu, 07 May 2015 10:31:47 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH v3] ath10k: Bypass PLL setting on target init for QCA9888
Date: Thu, 7 May 2015 16:01:03 +0530
Message-ID: <1430994663-30006-1-git-send-email-rmanohar@qti.qualcomm.com>
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
 drivers/net/wireless/ath/ath10k/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index bcccae1..cb34619 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1084,6 +1084,16 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
 	if (status)
 		goto err;
 
+	if ((ar->hw_rev == ATH10K_HW_QCA988X) &&
+	    (ar->wmi.op_version == ATH10K_FW_WMI_OP_VERSION_10_2_4)) {
+		status = ath10k_bmi_write32(ar, hi_skip_clock_init, 1);
+		if (status) {
+			ath10k_err(ar, "could not write skip_clock_init (%d)\n",
+				   status);
+			goto err;
+		}
+	}
+
 	status = ath10k_download_fw(ar, mode);
 	if (status)
 		goto err;
-- 
2.3.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
