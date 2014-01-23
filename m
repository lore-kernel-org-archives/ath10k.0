Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x232.google.com ([2a00:1450:4013:c00::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6HlY-00045q-I0
 for ath10k@lists.infradead.org; Thu, 23 Jan 2014 10:44:09 +0000
Received: by mail-ee0-f50.google.com with SMTP id d17so331427eek.9
 for <ath10k@lists.infradead.org>; Thu, 23 Jan 2014 02:43:44 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: implement AP CSA
Date: Thu, 23 Jan 2014 11:38:26 +0100
Message-Id: <1390473506-15677-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1390473506-15677-1-git-send-email-michal.kazior@tieto.com>
References: <1390473506-15677-1-git-send-email-michal.kazior@tieto.com>
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

Most channel switching logic has been implemented
already so this patch is pretty small. The patch
makes use of mac80211's vif->csa_active for AP CSA
handling.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 10 ++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c | 11 +++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 323c886..ebaa8ad 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3760,6 +3760,14 @@ static int ath10k_set_bitrate_mask(struct ieee80211_hw *hw,
 	return ath10k_set_fixed_rate_param(arvif, fixed_rate, fixed_nss);
 }
 
+static void ath10k_channel_switch_beacon(struct ieee80211_hw *hw,
+					 struct ieee80211_vif *vif,
+					 struct cfg80211_chan_def *chandef)
+{
+	/* there's no need to do anything here. vif->csa_active is enough */
+	return;
+}
+
 static const struct ieee80211_ops ath10k_ops = {
 	.tx				= ath10k_tx,
 	.start				= ath10k_start,
@@ -3783,6 +3791,7 @@ static const struct ieee80211_ops ath10k_ops = {
 	.restart_complete		= ath10k_restart_complete,
 	.get_survey			= ath10k_get_survey,
 	.set_bitrate_mask		= ath10k_set_bitrate_mask,
+	.channel_switch_beacon		= ath10k_channel_switch_beacon,
 #ifdef CONFIG_PM
 	.suspend			= ath10k_suspend,
 	.resume				= ath10k_resume,
@@ -4162,6 +4171,7 @@ int ath10k_mac_register(struct ath10k *ar)
 	ar->hw->max_listen_interval = ATH10K_MAX_HW_LISTEN_INTERVAL;
 
 	ar->hw->wiphy->flags |= WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
+	ar->hw->wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH;
 	ar->hw->wiphy->max_remain_on_channel_duration = 5000;
 
 	ar->hw->wiphy->flags |= WIPHY_FLAG_AP_UAPSD;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 712a606..67e91a4 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1385,6 +1385,17 @@ static void ath10k_wmi_event_host_swba(struct ath10k *ar, struct sk_buff *skb)
 			continue;
 		}
 
+		/* There are no completions for beacons so wait for next SWBA
+		 * before telling mac80211 to decrement CSA counter
+		 *
+		 * Once CSA counter is completed stop sending beacons until
+		 * actual channel switch is done */
+		if (arvif->vif->csa_active &&
+		    ieee80211_csa_is_complete(arvif->vif)) {
+			ieee80211_csa_finish(arvif->vif);
+			continue;
+		}
+
 		bcn = ieee80211_beacon_get(ar->hw, arvif->vif);
 		if (!bcn) {
 			ath10k_warn("could not get mac80211 beacon\n");
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
