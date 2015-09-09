Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh04.mail.saunalahti.fi ([62.142.5.110])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZaqM-0004r9-8Q
 for ath10k@lists.infradead.org; Wed, 09 Sep 2015 08:35:03 +0000
Subject: [PATCH] ath10k: add ATH10K_FW_FEATURE_RAW_MODE_SUPPORT to
 ath10k_core_fw_feature_str[]
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 09 Sep 2015 11:34:37 +0300
Message-ID: <20150909083437.12465.89335.stgit@potku.adurom.net>
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

This was missed in the original commit adding the flag and ath10k only printed "bit10":

ath10k_pci 0000:02:00.0: qca988x hw2.0 (0x4100016c, 0x043202ff) fw 10.2.4.70.6-2 api 3
htt-ver 2.1 wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1 features no-p2p,bit10

Also add a build test to avoid this happening again.

Fixes: ccec9038c721 ("ath10k: enable raw encap mode and software crypto engine")
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index b87b98617073..9e3d89d06445 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -142,12 +142,17 @@ static const char *const ath10k_core_fw_feature_str[] = {
 	[ATH10K_FW_FEATURE_IGNORE_OTP_RESULT] = "ignore-otp",
 	[ATH10K_FW_FEATURE_NO_NWIFI_DECAP_4ADDR_PADDING] = "no-4addr-pad",
 	[ATH10K_FW_FEATURE_SUPPORTS_SKIP_CLOCK_INIT] = "skip-clock-init",
+	[ATH10K_FW_FEATURE_RAW_MODE_SUPPORT] = "raw-mode",
 };
 
 static unsigned int ath10k_core_get_fw_feature_str(char *buf,
 						   size_t buf_len,
 						   enum ath10k_fw_features feat)
 {
+	/* make sure that ath10k_core_fw_feature_str[] gets updated */
+	BUILD_BUG_ON(ARRAY_SIZE(ath10k_core_fw_feature_str) !=
+		     ATH10K_FW_FEATURE_COUNT);
+
 	if (feat >= ARRAY_SIZE(ath10k_core_fw_feature_str) ||
 	    WARN_ON(!ath10k_core_fw_feature_str[feat])) {
 		return scnprintf(buf, buf_len, "bit%d", feat);


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
