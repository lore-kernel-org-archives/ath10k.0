Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7LMj-0001no-9d
 for ath10k@lists.infradead.org; Thu, 08 Aug 2013 08:14:38 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/4] ath10k: clean up monitor start code
Date: Thu, 8 Aug 2013 10:14:07 +0200
Message-ID: <1375949650-9699-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1375949650-9699-1-git-send-email-michal.kazior@tieto.com>
References: <1375949650-9699-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Remove useless code that was causing WARN_ON when
a 80MHz+ vif entered promiscuous mode or monitor
interface was started.

The channel mode is already computed by
chan_to_phymode().

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index cf2ba4d..05f5f76 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -503,13 +503,10 @@ static int ath10k_monitor_start(struct ath10k *ar, int vdev_id)
 {
 	struct ieee80211_channel *channel = ar->hw->conf.chandef.chan;
 	struct wmi_vdev_start_request_arg arg = {};
-	enum nl80211_channel_type type;
 	int ret = 0;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	type = cfg80211_get_chandef_type(&ar->hw->conf.chandef);
-
 	arg.vdev_id = vdev_id;
 	arg.channel.freq = channel->center_freq;
 	arg.channel.band_center_freq1 = ar->hw->conf.chandef.center_freq1;
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
