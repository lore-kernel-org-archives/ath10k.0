Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMF2b-0001NP-8W
 for ath10k@lists.infradead.org; Thu, 21 Jan 2016 13:12:46 +0000
Received: by mail-lf0-x233.google.com with SMTP id 17so26277971lfz.1
 for <ath10k@lists.infradead.org>; Thu, 21 Jan 2016 05:12:24 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/5] ath10k: add new FW_FEATURE_PEER_FLOW_CONTROL
Date: Thu, 21 Jan 2016 14:13:25 +0100
Message-Id: <1453382007-24622-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1453382007-24622-1-git-send-email-michal.kazior@tieto.com>
References: <1452693668-30030-1-git-send-email-michal.kazior@tieto.com>
 <1453382007-24622-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

This feature flag will be used for firmware which
supports pull-push model where host shares it's
software queue state with firmware and firmware
generates fetch requests telling host which queues
to dequeue tx from.

Primary function of this is improved MU-MIMO
performance with multiple clients.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 1 +
 drivers/net/wireless/ath/ath10k/core.h | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index b41eb3f4ee56..48a26206c5c1 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -217,6 +217,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
 	[ATH10K_FW_FEATURE_RAW_MODE_SUPPORT] = "raw-mode",
 	[ATH10K_FW_FEATURE_SUPPORTS_ADAPTIVE_CCA] = "adaptive-cca",
 	[ATH10K_FW_FEATURE_MFP_SUPPORT] = "mfp",
+	[ATH10K_FW_FEATURE_PEER_FLOW_CONTROL] = "peer-flow-ctrl",
 };
 
 static unsigned int ath10k_core_get_fw_feature_str(char *buf,
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 7840cf3ef7a6..822e3195533a 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -510,6 +510,15 @@ enum ath10k_fw_features {
 	/* Firmware supports management frame protection */
 	ATH10K_FW_FEATURE_MFP_SUPPORT = 12,
 
+	/* Firmware supports pull-push model where host shares it's software
+	 * queue state with firmware and firmware generates fetch requests
+	 * telling host which queues to dequeue tx from.
+	 *
+	 * Primary function of this is improved MU-MIMO performance with
+	 * multiple clients.
+	 */
+	ATH10K_FW_FEATURE_PEER_FLOW_CONTROL = 13,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
