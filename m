Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6TTs-0004YN-EH
 for ath10k@lists.infradead.org; Thu, 12 Apr 2018 04:05:07 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH] ath10k:add support for multicast rate control
Date: Wed, 11 Apr 2018 21:04:46 -0700
Message-Id: <1523505886-14695-1-git-send-email-pradeepc@codeaurora.org>
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org

Issues wmi command to firmware when multicast rate change is received
with the new BSS_CHANGED_MCAST_RATE flag.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index bf05a36..63af46f 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5419,8 +5419,12 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 {
 	struct ath10k *ar = hw->priv;
 	struct ath10k_vif *arvif = (void *)vif->drv_priv;
-	int ret = 0;
+	struct ieee80211_supported_band *sband;
+	struct cfg80211_chan_def def;
 	u32 vdev_param, pdev_param, slottime, preamble;
+	int rate_index, ret = 0;
+	u8 rate;
+	enum nl80211_band band;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -5588,6 +5592,25 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 				    arvif->vdev_id, ret);
 	}
 
+	if (changed & BSS_CHANGED_MCAST_RATE &&
+	    !WARN_ON(ath10k_mac_vif_chan(arvif->vif, &def))) {
+		band = def.chan->band;
+		sband = &ar->mac.sbands[band];
+		vdev_param = ar->wmi.vdev_param->mcast_data_rate;
+		rate_index = vif->bss_conf.mcast_rate[band] - 1;
+		rate = ATH10K_HW_MCS_RATE(sband->bitrates[rate_index].hw_value);
+		ath10k_dbg(ar, ATH10K_DBG_MAC,
+			   "mac vdev %d mcast_rate %d\n",
+			   arvif->vdev_id, rate);
+
+		ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id,
+						vdev_param, rate);
+		if (ret)
+			ath10k_warn(ar,
+				    "failed to set mcast rate on vdev"
+				    " %i: %d\n", arvif->vdev_id,  ret);
+	}
+
 	mutex_unlock(&ar->conf_mutex);
 }
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
