Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XssH7-0006qn-Ip
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 11:57:50 +0000
From: Vivek Natarajan <nataraja@qti.qualcomm.com>
Subject: [PATCH] ath10k: Do not limit RTS threshold value to 2347
Date: Mon, 24 Nov 2014 17:27:20 +0530
Message-ID: <1416830240-3019-1-git-send-email-nataraja@qti.qualcomm.com>
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
To: kvalo@qca.qualcomm.com
Cc: ath10k@lists.infradead.org

Increase the rts threshold from the legacy value of 2347 to support higher
threshold limit.

Signed-off-by: Vivek Natarajan <nataraja@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    6 +-----
 drivers/net/wireless/ath/ath10k/wmi.h |    1 -
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8b60749..61f7e22 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -391,15 +391,11 @@ static int ath10k_mac_set_kickout(struct ath10k_vif *arvif)
 	return 0;
 }
 
-static int  ath10k_mac_set_rts(struct ath10k_vif *arvif, u32 value)
+static int ath10k_mac_set_rts(struct ath10k_vif *arvif, u32 value)
 {
 	struct ath10k *ar = arvif->ar;
 	u32 vdev_param;
 
-	if (value != 0xFFFFFFFF)
-		value = min_t(u32, arvif->ar->hw->wiphy->rts_threshold,
-			      ATH10K_RTS_MAX);
-
 	vdev_param = ar->wmi.vdev_param->rts_threshold;
 	return ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param, value);
 }
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index a38d788..8a4e779 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4547,7 +4547,6 @@ struct wmi_dbglog_cfg_cmd {
 	__le32 config_valid;
 } __packed;
 
-#define ATH10K_RTS_MAX		2347
 #define ATH10K_FRAGMT_THRESHOLD_MIN	540
 #define ATH10K_FRAGMT_THRESHOLD_MAX	2346
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
