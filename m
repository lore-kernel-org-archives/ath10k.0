Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYwG1-0003L2-0u
 for ath10k@lists.infradead.org; Wed, 23 Oct 2013 11:05:45 +0000
Received: by mail-ee0-f53.google.com with SMTP id c13so301186eek.12
 for <ath10k@lists.infradead.org>; Wed, 23 Oct 2013 04:05:23 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/3] ath10k: use proper tx power unit
Date: Wed, 23 Oct 2013 04:02:14 -0700
Message-Id: <1382526135-3215-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1382526135-3215-1-git-send-email-michal.kazior@tieto.com>
References: <1382526135-3215-1-git-send-email-michal.kazior@tieto.com>
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

It was previously thought that FW expects tx power
in quarters of dBm.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 18 +++++++++---------
 drivers/net/wireless/ath/ath10k/wmi.h |  3 ++-
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 35d5d3a..1d91201 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -451,9 +451,9 @@ static int ath10k_vdev_start(struct ath10k_vif *arvif)
 	arg.channel.mode = chan_to_phymode(&conf->chandef);
 
 	arg.channel.min_power = 0;
-	arg.channel.max_power = channel->max_power * 4;
-	arg.channel.max_reg_power = channel->max_reg_power * 4;
-	arg.channel.max_antenna_gain = channel->max_antenna_gain;
+	arg.channel.max_power = channel->max_power * 2;
+	arg.channel.max_reg_power = channel->max_reg_power * 2;
+	arg.channel.max_antenna_gain = channel->max_antenna_gain * 2;
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		arg.ssid = arvif->u.ap.ssid;
@@ -530,9 +530,9 @@ static int ath10k_monitor_start(struct ath10k *ar, int vdev_id)
 	arg.channel.mode = chan_to_phymode(&ar->hw->conf.chandef);
 
 	arg.channel.min_power = 0;
-	arg.channel.max_power = channel->max_power * 4;
-	arg.channel.max_reg_power = channel->max_reg_power * 4;
-	arg.channel.max_antenna_gain = channel->max_antenna_gain;
+	arg.channel.max_power = channel->max_power * 2;
+	arg.channel.max_reg_power = channel->max_reg_power * 2;
+	arg.channel.max_antenna_gain = channel->max_antenna_gain * 2;
 
 	ret = ath10k_wmi_vdev_start(ar, &arg);
 	if (ret) {
@@ -1376,9 +1376,9 @@ static int ath10k_update_channel_list(struct ath10k *ar)
 
 			ch->freq = channel->center_freq;
 			ch->min_power = 0;
-			ch->max_power = channel->max_power * 4;
-			ch->max_reg_power = channel->max_reg_power * 4;
-			ch->max_antenna_gain = channel->max_antenna_gain;
+			ch->max_power = channel->max_power * 2;
+			ch->max_reg_power = channel->max_reg_power * 2;
+			ch->max_antenna_gain = channel->max_antenna_gain * 2;
 			ch->reg_class_id = 0; /* FIXME */
 
 			/* FIXME: why use only legacy modes, why not any
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 78c991a..81e33a7 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -893,6 +893,7 @@ struct wmi_channel {
 	union {
 		__le32 reginfo0;
 		struct {
+			/* note: power unit is 0.5 dBm */
 			u8 min_power;
 			u8 max_power;
 			u8 reg_power;
@@ -915,7 +916,7 @@ struct wmi_channel_arg {
 	bool allow_ht;
 	bool allow_vht;
 	bool ht40plus;
-	/* note: power unit is 1/4th of dBm */
+	/* note: power unit is 0.5 dBm */
 	u32 min_power;
 	u32 max_power;
 	u32 max_reg_power;
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
