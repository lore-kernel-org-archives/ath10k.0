Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22a.google.com ([2a00:1450:4013:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYwG2-0003L1-3j
 for ath10k@lists.infradead.org; Wed, 23 Oct 2013 11:05:46 +0000
Received: by mail-ea0-f170.google.com with SMTP id q10so277937eaj.1
 for <ath10k@lists.infradead.org>; Wed, 23 Oct 2013 04:05:22 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/3] ath10k: setup min channel power to a reasonable value
Date: Wed, 23 Oct 2013 04:02:13 -0700
Message-Id: <1382526135-3215-2-git-send-email-michal.kazior@tieto.com>
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

This will be needed for proper support of (user)
configurable tx power level.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index da23c3f..35d5d3a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -450,7 +450,7 @@ static int ath10k_vdev_start(struct ath10k_vif *arvif)
 
 	arg.channel.mode = chan_to_phymode(&conf->chandef);
 
-	arg.channel.min_power = channel->max_power * 3;
+	arg.channel.min_power = 0;
 	arg.channel.max_power = channel->max_power * 4;
 	arg.channel.max_reg_power = channel->max_reg_power * 4;
 	arg.channel.max_antenna_gain = channel->max_antenna_gain;
@@ -529,7 +529,7 @@ static int ath10k_monitor_start(struct ath10k *ar, int vdev_id)
 	   don't have any vifs? */
 	arg.channel.mode = chan_to_phymode(&ar->hw->conf.chandef);
 
-	arg.channel.min_power = channel->max_power * 3;
+	arg.channel.min_power = 0;
 	arg.channel.max_power = channel->max_power * 4;
 	arg.channel.max_reg_power = channel->max_reg_power * 4;
 	arg.channel.max_antenna_gain = channel->max_antenna_gain;
@@ -1375,7 +1375,7 @@ static int ath10k_update_channel_list(struct ath10k *ar)
 			ch->passive = passive;
 
 			ch->freq = channel->center_freq;
-			ch->min_power = channel->max_power * 3;
+			ch->min_power = 0;
 			ch->max_power = channel->max_power * 4;
 			ch->max_reg_power = channel->max_reg_power * 4;
 			ch->max_antenna_gain = channel->max_antenna_gain;
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
