Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pb0-x230.google.com ([2607:f8b0:400e:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDWGV-0002tx-CE
 for ath10k@lists.infradead.org; Wed, 12 Feb 2014 09:38:00 +0000
Received: by mail-pb0-f48.google.com with SMTP id rr13so8977576pbb.21
 for <ath10k@lists.infradead.org>; Wed, 12 Feb 2014 01:37:37 -0800 (PST)
From: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Subject: [PATCH] ath10k: implement drv_get_tsf for ibss merging
Date: Wed, 12 Feb 2014 17:37:24 +0800
Message-Id: <1392197844-1223-1-git-send-email-yeohchunyeow@gmail.com>
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
To: linux-wireless@vger.kernel.org
Cc: kvalo@qca.qualcomm.com, Chun-Yeow Yeoh <yeohchunyeow@gmail.com>, ath10k@lists.infradead.org

Implement the get TSF by simply returning 0 so that IBSS
merging is happening. Otherwise, IBSS nodes that have similar
SSID naming won't merge. This is simply fooling the mac80211
that the TSF in the received beacon is higher than the local TSF.

Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index afa1226..d62d39e 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4049,6 +4049,21 @@ static void ath10k_sta_rc_update(struct ieee80211_hw *hw,
 	ieee80211_queue_work(hw, &arsta->update_wk);
 }
 
+static u64 ath10k_get_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
+{
+	struct ath10k *ar = hw->priv;
+	u64 tsf;
+
+	mutex_lock(&ar->conf_mutex);
+	/* FIXME: Return 0 for time being. Need to figure out whether FW has
+	 * the API to fetch 64-bit TSF
+	 */
+	tsf = 0;
+	mutex_unlock(&ar->conf_mutex);
+
+	return tsf;
+}
+
 static const struct ieee80211_ops ath10k_ops = {
 	.tx				= ath10k_tx,
 	.start				= ath10k_start,
@@ -4074,6 +4089,7 @@ static const struct ieee80211_ops ath10k_ops = {
 	.set_bitrate_mask		= ath10k_set_bitrate_mask,
 	.channel_switch_beacon		= ath10k_channel_switch_beacon,
 	.sta_rc_update			= ath10k_sta_rc_update,
+	.get_tsf			= ath10k_get_tsf,
 #ifdef CONFIG_PM
 	.suspend			= ath10k_suspend,
 	.resume				= ath10k_resume,
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
