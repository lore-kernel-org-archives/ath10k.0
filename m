Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from narfation.org ([79.140.41.39] helo=v3-1039.vlinux.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXoq5-0005GU-8N
 for ath10k@lists.infradead.org; Mon, 03 Jun 2019 15:25:34 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH v2] ath10k: avoid leaving .bss_info_changed prematurely
Date: Mon,  3 Jun 2019 17:25:07 +0200
Message-Id: <20190603152507.22011-1-sven@narfation.org>
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
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>, Sven Eckelmann <seckelmann@datto.com>, Sriram R <srirrama@codeaurora.org>

From: Sven Eckelmann <seckelmann@datto.com>

ath10k_bss_info_changed() handles various events from the upper layers. It
parses the changed bitfield and then configures the driver/firmware
accordingly. Each detected event is handled in a separate scope which is
independent of each other - but in the same function.

The commit f279294e9ee2 ("ath10k: add support for configuring management
packet rate") changed this behavior by returning from this function
prematurely when some precondition was not fulfilled. All new event
handlers added after the BSS_CHANGED_BASIC_RATES event handler would then
also be skipped.

Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
---
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: Sriram R <srirrama@codeaurora.org>

Only compile tested

v2:

* rebased on top of commit 9e7251fa3897 ("ath10k: Check tx_stats before
  use it")

 drivers/net/wireless/ath/ath10k/mac.c | 64 ++++++++++++++++-----------
 1 file changed, 38 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 98a7842e09b1..90f59117a04d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5582,6 +5582,40 @@ static void ath10k_configure_filter(struct ieee80211_hw *hw,
 	mutex_unlock(&ar->conf_mutex);
 }
 
+static void ath10k_recalculate_mgmt_rate(struct ath10k *ar,
+					 struct ieee80211_vif *vif)
+{
+	struct ath10k_vif *arvif = (void *)vif->drv_priv;
+	const struct ieee80211_supported_band *sband;
+	struct cfg80211_chan_def def;
+	u8 basic_rate_idx;
+	int hw_rate_code;
+	u32 vdev_param;
+	u16 bitrate;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	if (WARN_ON(ath10k_mac_vif_chan(vif, &def)))
+		return;
+
+	sband = ar->hw->wiphy->bands[def.chan->band];
+	basic_rate_idx = ffs(vif->bss_conf.basic_rates) - 1;
+	bitrate = sband->bitrates[basic_rate_idx].bitrate;
+
+	hw_rate_code = ath10k_mac_get_rate_hw_value(bitrate);
+	if (hw_rate_code < 0) {
+		ath10k_warn(ar, "bitrate not supported %d\n", bitrate);
+		return;
+	}
+
+	vdev_param = ar->wmi.vdev_param->mgmt_rate;
+	ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
+					hw_rate_code);
+	if (ret)
+		ath10k_warn(ar, "failed to set mgmt tx rate %d\n", ret);
+}
+
 static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 				    struct ieee80211_vif *vif,
 				    struct ieee80211_bss_conf *info,
@@ -5592,10 +5626,9 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 	struct cfg80211_chan_def def;
 	u32 vdev_param, pdev_param, slottime, preamble;
 	u16 bitrate, hw_value;
-	u8 rate, basic_rate_idx, rateidx;
-	int ret = 0, hw_rate_code, mcast_rate;
+	u8 rate, rateidx;
+	int ret = 0, mcast_rate;
 	enum nl80211_band band;
-	const struct ieee80211_supported_band *sband;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -5819,29 +5852,8 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 				    arvif->vdev_id,  ret);
 	}
 
-	if (changed & BSS_CHANGED_BASIC_RATES) {
-		if (WARN_ON(ath10k_mac_vif_chan(vif, &def))) {
-			mutex_unlock(&ar->conf_mutex);
-			return;
-		}
-
-		sband = ar->hw->wiphy->bands[def.chan->band];
-		basic_rate_idx = ffs(vif->bss_conf.basic_rates) - 1;
-		bitrate = sband->bitrates[basic_rate_idx].bitrate;
-
-		hw_rate_code = ath10k_mac_get_rate_hw_value(bitrate);
-		if (hw_rate_code < 0) {
-			ath10k_warn(ar, "bitrate not supported %d\n", bitrate);
-			mutex_unlock(&ar->conf_mutex);
-			return;
-		}
-
-		vdev_param = ar->wmi.vdev_param->mgmt_rate;
-		ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
-						hw_rate_code);
-		if (ret)
-			ath10k_warn(ar, "failed to set mgmt tx rate %d\n", ret);
-	}
+	if (changed & BSS_CHANGED_BASIC_RATES)
+		ath10k_recalculate_mgmt_rate(ar, vif);
 
 	mutex_unlock(&ar->conf_mutex);
 }
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
