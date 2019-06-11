Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from durin.narfation.org ([79.140.41.39])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hakSs-0003jn-Uw
 for ath10k@lists.infradead.org; Tue, 11 Jun 2019 17:21:45 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH v2] ath10k: fix max antenna gain unit
Date: Tue, 11 Jun 2019 19:21:31 +0200
Message-Id: <20190611172131.6064-1-sven@narfation.org>
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
Cc: linux-wireless@vger.kernel.org, Sven Eckelmann <seckelmann@datto.com>

From: Sven Eckelmann <seckelmann@datto.com>

Most of the txpower for the ath10k firmware is stored as twicepower (0.5 dB
steps). This isn't the case for max_antenna_gain - which is still expected
by the firmware as dB.

The firmware is converting it from dB to the internal (twicepower)
representation when it calculates the limits of a channel. This can be seen
in tpc_stats when configuring "12" as max_antenna_gain. Instead of the
expected 12 (6 dB), the tpc_stats shows 24 (12 dB).

Tested on QCA9888 and IPQ4019 with firmware 10.4-3.5.3-00057.

Fixes: 02256930d9b8 ("ath10k: use proper tx power unit")
Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
---
v2:
* Add comments to wmi.h regarding the power unit

 drivers/net/wireless/ath/ath10k/mac.c | 6 +++---
 drivers/net/wireless/ath/ath10k/wmi.h | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 9c703d287333..35d026a2772a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1008,7 +1008,7 @@ static int ath10k_monitor_vdev_start(struct ath10k *ar, int vdev_id)
 	arg.channel.min_power = 0;
 	arg.channel.max_power = channel->max_power * 2;
 	arg.channel.max_reg_power = channel->max_reg_power * 2;
-	arg.channel.max_antenna_gain = channel->max_antenna_gain * 2;
+	arg.channel.max_antenna_gain = channel->max_antenna_gain;
 
 	reinit_completion(&ar->vdev_setup_done);
 
@@ -1450,7 +1450,7 @@ static int ath10k_vdev_start_restart(struct ath10k_vif *arvif,
 	arg.channel.min_power = 0;
 	arg.channel.max_power = chandef->chan->max_power * 2;
 	arg.channel.max_reg_power = chandef->chan->max_reg_power * 2;
-	arg.channel.max_antenna_gain = chandef->chan->max_antenna_gain * 2;
+	arg.channel.max_antenna_gain = chandef->chan->max_antenna_gain;
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		arg.ssid = arvif->u.ap.ssid;
@@ -3105,7 +3105,7 @@ static int ath10k_update_channel_list(struct ath10k *ar)
 			ch->min_power = 0;
 			ch->max_power = channel->max_power * 2;
 			ch->max_reg_power = channel->max_reg_power * 2;
-			ch->max_antenna_gain = channel->max_antenna_gain * 2;
+			ch->max_antenna_gain = channel->max_antenna_gain;
 			ch->reg_class_id = 0; /* FIXME */
 
 			/* FIXME: why use only legacy modes, why not any
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index e1c40bb69932..9cc0ef47deb7 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -2038,7 +2038,9 @@ struct wmi_channel {
 	union {
 		__le32 reginfo1;
 		struct {
+			/* note: power unit is 1 dBm */
 			u8 antenna_max;
+			/* note: power unit is 0.5 dBm */
 			u8 max_tx_power;
 		} __packed;
 	} __packed;
@@ -2058,6 +2060,7 @@ struct wmi_channel_arg {
 	u32 min_power;
 	u32 max_power;
 	u32 max_reg_power;
+	/* note: power unit is 1 dBm */
 	u32 max_antenna_gain;
 	u32 reg_class_id;
 	enum wmi_phy_mode mode;
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
