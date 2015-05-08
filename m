Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqisD-0005Gg-Mk
 for ath10k@lists.infradead.org; Fri, 08 May 2015 14:03:30 +0000
From: <c_mpubbi@qti.qualcomm.com>
Subject: [PATCH] ath10k-fwencoder: add ATH10k_FW_FEATURE_HAS_ADAPTIVE_CCA
Date: Fri, 8 May 2015 19:32:48 +0530
Message-ID: <1431093768-15248-1-git-send-email-c_mpubbi@qti.qualcomm.com>
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
Cc: Pubbisetty Manikanta <c_mpubbi@qti.qualcomm.com>, linux-wireless@vger.kernel.org

From: Pubbisetty Manikanta <c_mpubbi@qti.qualcomm.com>

add new firmware feature to advertise firmware support for
adaptive CCA.

Signed-off-by: Pubbisetty Manikanta <c_mpubbi@qti.qualcomm.com>
---
 ath10k-fwencoder/ath10k-fwencoder | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ath10k-fwencoder/ath10k-fwencoder b/ath10k-fwencoder/ath10k-fwencoder
index 0b71c62..27566a2 100755
--- a/ath10k-fwencoder/ath10k-fwencoder
+++ b/ath10k-fwencoder/ath10k-fwencoder
@@ -38,7 +38,8 @@ ATH10K_FW_FEATURE_WMI_10_2 = 4
 ATH10K_FW_FEATURE_MULTI_VIF_PS_SUPPORT = 5
 ATH10K_FW_FEATURE_WOWLAN_SUPPORT = 6
 ATH10K_FW_FEATURE_IGNORE_OTP_RESULT = 7
-ATH10K_FW_FEATURE_MAX = 8
+ATH10k_FW_FEATURE_HAS_ADAPTIVE_CCA = 8
+ATH10K_FW_FEATURE_MAX = 9
 
 feature_map = {
     'ext-wmi-mgmt-rx': ATH10K_FW_FEATURE_EXT_WMI_MGMT_RX,
@@ -49,6 +50,7 @@ feature_map = {
     'multi-vif-ps': ATH10K_FW_FEATURE_MULTI_VIF_PS_SUPPORT,
     'wowlan': ATH10K_FW_FEATURE_WOWLAN_SUPPORT,
     'ignore-otp-result': ATH10K_FW_FEATURE_IGNORE_OTP_RESULT,
+    'adaptive-cca': ATH10k_FW_FEATURE_HAS_ADAPTIVE_CCA,
     }
 
 # from enum ath10k_fw_wmi_op_version in ath10k/hw.h
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
