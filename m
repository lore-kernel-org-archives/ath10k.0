Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buDyu-0002lJ-RM
 for ath10k@lists.infradead.org; Wed, 12 Oct 2016 07:29:41 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH] ath10k: Fix failure to send NULL func frame for 10.4
Date: Wed, 12 Oct 2016 12:59:02 +0530
Message-ID: <1476257342-3241-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

This partially reverts 'commit 2cdce425aa33
("ath10k: Fix broken NULL func data frame status for 10.4")'
Unfortunately this breaks sending NULL func and the existing
issue of obtaining proper tx status for NULL function will be
fixed. Also update the comments for feature flag added to be
useless and not working

Fixes: 2cdce425aa33 "ath10k: Fix broken NULL func data frame status for
10.4"
Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.h | 6 ++----
 drivers/net/wireless/ath/ath10k/mac.c  | 2 --
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index b367e9c..42c3f1b 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -552,10 +552,8 @@ enum ath10k_fw_features {
 	 */
 	ATH10K_FW_FEATURE_BTCOEX_PARAM = 14,
 
-	/* Older firmware with HTT delivers incorrect tx status for null func
-	 * frames to driver, but this fixed in 10.2 and 10.4 firmware versions.
-	 * Also this workaround results in reporting of incorrect null func
-	 * status for 10.4. This flag is used to skip the workaround.
+	/* Unused flag and proven to be not working, enable this if you want
+	 * to experiment sending NULL func data frames in HTT TX
 	 */
 	ATH10K_FW_FEATURE_SKIP_NULL_FUNC_WAR = 15,
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 4565321..86a6610 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3255,8 +3255,6 @@ ath10k_mac_tx_h_get_txmode(struct ath10k *ar,
 	if (ar->htt.target_version_major < 3 &&
 	    (ieee80211_is_nullfunc(fc) || ieee80211_is_qos_nullfunc(fc)) &&
 	    !test_bit(ATH10K_FW_FEATURE_HAS_WMI_MGMT_TX,
-		      ar->running_fw->fw_file.fw_features) &&
-	    !test_bit(ATH10K_FW_FEATURE_SKIP_NULL_FUNC_WAR,
 		      ar->running_fw->fw_file.fw_features))
 		return ATH10K_HW_TXRX_MGMT;
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
