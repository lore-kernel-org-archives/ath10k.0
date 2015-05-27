Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxcAA-0008R6-T7
 for ath10k@lists.infradead.org; Wed, 27 May 2015 14:18:32 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: [PATCH v4] ath10k: bypass PLL setting on target init for QCA9888
Date: Wed, 27 May 2015 17:17:33 +0300
Message-ID: <1432736253-30040-1-git-send-email-kvalo@qca.qualcomm.com>
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

From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Some of of qca988x solutions are having global reset issue
during target initialization. Bypassing PLL setting before
downloading firmware and letting the SoC run on REF_CLK is fixing
the problem. Corresponding firmware change is also needed to set
the clock source once the target is initialized. Since 10.2.4
firmware is having this ROM patch, applying skip_clock_init only
for 10.2.4 firmware versions.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
v4:

* add ATH10K_FW_FEATURE_SUPPORTS_SKIP_CLOCK_INIT
* add comment to ath10k_core_start()

 drivers/net/wireless/ath/ath10k/core.c |   16 ++++++++++++++++
 drivers/net/wireless/ath/ath10k/core.h |    3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index bcccae19325d..e3249630d9d5 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1084,6 +1084,22 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
 	if (status)
 		goto err;
 
+	/* Some of of qca988x solutions are having global reset issue
+         * during target initialization. Bypassing PLL setting before
+         * downloading firmware and letting the SoC run on REF_CLK is
+         * fixing the problem. Corresponding firmware change is also needed
+         * to set the clock source once the target is initialized.
+	 */
+	if (test_bit(ATH10K_FW_FEATURE_SUPPORTS_SKIP_CLOCK_INIT,
+		     ar->fw_features)) {
+		status = ath10k_bmi_write32(ar, hi_skip_clock_init, 1);
+		if (status) {
+			ath10k_err(ar, "could not write to skip_clock_init: %d\n",
+				   status);
+			goto err;
+		}
+	}
+
 	status = ath10k_download_fw(ar, mode);
 	if (status)
 		goto err;
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 70fcdc9c2758..21a8bf166005 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -468,6 +468,9 @@ enum ath10k_fw_features {
 	 */
 	ATH10K_FW_FEATURE_NO_NWIFI_DECAP_4ADDR_PADDING,
 
+	/* Firmware supports bypassing PLL setting on init. */ 
+	ATH10K_FW_FEATURE_SUPPORTS_SKIP_CLOCK_INIT = 9,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
