Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEALC-0005ZX-Vm
 for ath10k@lists.infradead.org; Fri, 14 Feb 2014 04:25:31 +0000
Received: by mail-pa0-f45.google.com with SMTP id lf10so11733213pab.4
 for <ath10k@lists.infradead.org>; Thu, 13 Feb 2014 20:25:09 -0800 (PST)
From: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Subject: [PATCH v2] ath10k: implement drv_get_tsf for ibss merging
Date: Fri, 14 Feb 2014 12:24:55 +0800
Message-Id: <1392351895-20495-1-git-send-email-yeohchunyeow@gmail.com>
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
v2: simplify without mutex (Kalle Valo)

 drivers/net/wireless/ath/ath10k/mac.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index afa1226..f39d1b0 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4049,6 +4049,15 @@ static void ath10k_sta_rc_update(struct ieee80211_hw *hw,
 	ieee80211_queue_work(hw, &arsta->update_wk);
 }
 
+static u64 ath10k_get_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
+{
+	/* FIXME: Return 0 for time being. Need to figure out whether FW has
+	 * the API to fetch 64-bit local TSF
+	 */
+
+	return 0;
+}
+
 static const struct ieee80211_ops ath10k_ops = {
 	.tx				= ath10k_tx,
 	.start				= ath10k_start,
@@ -4074,6 +4083,7 @@ static const struct ieee80211_ops ath10k_ops = {
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
