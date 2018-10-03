Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Xck-0005Op-00
 for ath10k@lists.infradead.org; Wed, 03 Oct 2018 03:14:55 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath10k: Fix possible out of bound access of ath10k_rates array
Date: Wed,  3 Oct 2018 08:43:50 +0530
Message-Id: <1538536430-6555-1-git-send-email-srirrama@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Sriram R <srirrama@codeaurora.org>

While using 'ath10k_mac_get_rate_hw_value()' to obtain the hw value
from the passed bitrate, there is a chance of out of bound array access
when wrong bitrate is passed. This is fixed by comparing the bitrates
within the correct size of the ath10k_rates array.

Fixes commit f279294e9ee2 ("ath10k: add support for configuring management
packet rate")
(Also correction made to some indents used in the above commit)

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3933dd9..1f1c1c7 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -164,7 +164,7 @@ static int ath10k_mac_get_rate_hw_value(int bitrate)
 	if (ath10k_mac_bitrate_is_cck(bitrate))
 		hw_value_prefix = WMI_RATE_PREAMBLE_CCK << 6;
 
-	for (i = 0; i < sizeof(ath10k_rates); i++) {
+	for (i = 0; i < ARRAY_SIZE(ath10k_rates); i++) {
 		if (ath10k_rates[i].bitrate == bitrate)
 			return hw_value_prefix | ath10k_rates[i].hw_value;
 	}
@@ -5682,22 +5682,22 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 			return;
 		}
 
-	sband = ar->hw->wiphy->bands[def.chan->band];
-	basic_rate_idx = ffs(vif->bss_conf.basic_rates) - 1;
-	bitrate = sband->bitrates[basic_rate_idx].bitrate;
+		sband = ar->hw->wiphy->bands[def.chan->band];
+		basic_rate_idx = ffs(vif->bss_conf.basic_rates) - 1;
+		bitrate = sband->bitrates[basic_rate_idx].bitrate;
 
-	hw_rate_code = ath10k_mac_get_rate_hw_value(bitrate);
-	if (hw_rate_code < 0) {
-		ath10k_warn(ar, "bitrate not supported %d\n", bitrate);
-		mutex_unlock(&ar->conf_mutex);
-		return;
-	}
+		hw_rate_code = ath10k_mac_get_rate_hw_value(bitrate);
+		if (hw_rate_code < 0) {
+			ath10k_warn(ar, "bitrate not supported %d\n", bitrate);
+			mutex_unlock(&ar->conf_mutex);
+			return;
+		}
 
-	vdev_param = ar->wmi.vdev_param->mgmt_rate;
-	ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
-					hw_rate_code);
-	if (ret)
-		ath10k_warn(ar, "failed to set mgmt tx rate %d\n", ret);
+		vdev_param = ar->wmi.vdev_param->mgmt_rate;
+		ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
+						hw_rate_code);
+		if (ret)
+			ath10k_warn(ar, "failed to set mgmt tx rate %d\n", ret);
 	}
 
 	mutex_unlock(&ar->conf_mutex);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
