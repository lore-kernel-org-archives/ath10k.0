Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6J2i-0005HY-Dx
 for ath10k@lists.infradead.org; Fri, 27 May 2016 14:47:17 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 4/5] ath10k: add new ATH10K_FW_FEATURE_BTCOEX_PARAM
Date: Fri, 27 May 2016 20:15:58 +0530
Message-ID: <20160527144559.4053-4-rmanohar@qti.qualcomm.com>
In-Reply-To: <20160527144559.4053-1-rmanohar@qti.qualcomm.com>
References: <20160527144559.4053-1-rmanohar@qti.qualcomm.com>
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

This feature flag will be used for firmware to support BT-Coex feature
without reloading firmware via WMI pdev param. To support Bluetooth
coexistence pdev param, WMI_COEX_GPIO_SUPPORT of extended resource
config should be enabled always. This firmware IE is used to configure
WMI_COEX_GPIO_SUPPORT.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 1 +
 drivers/net/wireless/ath/ath10k/core.h | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 21b8c8c2a08e..88b51225a52a 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -258,6 +258,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
 	[ATH10K_FW_FEATURE_SUPPORTS_ADAPTIVE_CCA] = "adaptive-cca",
 	[ATH10K_FW_FEATURE_MFP_SUPPORT] = "mfp",
 	[ATH10K_FW_FEATURE_PEER_FLOW_CONTROL] = "peer-flow-ctrl",
+	[ATH10K_FW_FEATURE_BTCOEX_PARAM] = "btcoex-param",
 };
 
 static unsigned int ath10k_core_get_fw_feature_str(char *buf,
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 1852e0ee3fa1..4462c3f81c05 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -535,6 +535,13 @@ enum ath10k_fw_features {
 	 */
 	ATH10K_FW_FEATURE_PEER_FLOW_CONTROL = 13,
 
+	/* Firmware supports BT-Coex without reloading firmware via pdev param.
+	 * To support Bluetooth coexistence pdev param, WMI_COEX_GPIO_SUPPORT of
+	 * extended resource config should be enabled always. This firmware IE
+	 * is used to configure WMI_COEX_GPIO_SUPPORT.
+	 */
+	ATH10K_FW_FEATURE_BTCOEX_PARAM = 14,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
-- 
2.8.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
