Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNoly-0006AL-U8
 for ath10k@lists.infradead.org; Sat, 17 Nov 2018 00:47:44 +0000
Received: by mail-pl1-x643.google.com with SMTP id v1-v6so4756870plo.2
 for <ath10k@lists.infradead.org>; Fri, 16 Nov 2018 16:47:32 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH] qca-swiss-army-knife: ath10k-fwencoder: add new
 'single-chan-info-per-channel'
Date: Fri, 16 Nov 2018 16:47:20 -0800
Message-Id: <20181117004720.205811-1-briannorris@chromium.org>
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
To: qca-linux-team@qca.qualcomm.com
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This ancient Wifi still tells me I can send patches here, though I
haven't seen that much :)

https://github.com/mcgrof/qca-swiss-army-knife/wiki

 tools/scripts/ath10k/ath10k-fwencoder | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/scripts/ath10k/ath10k-fwencoder b/tools/scripts/ath10k/ath10k-fwencoder
index be1e7844345d..848e92054ff5 100755
--- a/tools/scripts/ath10k/ath10k-fwencoder
+++ b/tools/scripts/ath10k/ath10k-fwencoder
@@ -63,7 +63,8 @@ ATH10K_FW_FEATURE_ALLOWS_MESH_BCAST = 16
 ATH10K_FW_FEATURE_NO_PS = 17
 ATH10K_FW_FEATURE_MGMT_TX_BY_REF = 18
 ATH10K_FW_FEATURE_NON_BMI = 19
-ATH10K_FW_FEATURE_MAX = 20
+ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL = 20
+ATH10K_FW_FEATURE_MAX = 21
 
 feature_map = {
     'ext-wmi-mgmt-rx': ATH10K_FW_FEATURE_EXT_WMI_MGMT_RX,
@@ -87,6 +88,8 @@ feature_map = {
     'no-ps': ATH10K_FW_FEATURE_NO_PS,
     'mgmt-tx-by-ref': ATH10K_FW_FEATURE_MGMT_TX_BY_REF,
     'non-bmi': ATH10K_FW_FEATURE_NON_BMI,
+    'single-chan-info-per-channel':
+        ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL,
 }
 
 # from enum ath10k_fw_wmi_op_version in ath10k/hw.h
-- 
2.19.1.1215.g8438c0b245-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
