Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXQ7Z-0000Wk-2G
 for ath10k@lists.infradead.org; Thu, 03 Sep 2015 08:43:50 +0000
Received: by lbcao8 with SMTP id ao8so20145221lbc.3
 for <ath10k@lists.infradead.org>; Thu, 03 Sep 2015 01:43:23 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: move hw_scan worker queuing
Date: Thu,  3 Sep 2015 10:43:45 +0200
Message-Id: <1441269825-344-1-git-send-email-michal.kazior@tieto.com>
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

The remain_on_channel callback needs different
timeout. Calling ieee80211_queue_work() with a
shorter delay after calling it with a longer delay
will not change the timer. This caused the
offchannel timeout worker to not trigger in time
and caused the device to stay on channel longer
then expected. This could cause some problems and
was be easily reproduced with `iw offchannel`
command.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 64674c955d44..708fc2d2de2f 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3617,9 +3617,6 @@ static int ath10k_start_scan(struct ath10k *ar,
 	}
 	spin_unlock_bh(&ar->data_lock);
 
-	/* Add a 200ms margin to account for event/command processing */
-	ieee80211_queue_delayed_work(ar->hw, &ar->scan.timeout,
-				     msecs_to_jiffies(arg->max_scan_time+200));
 	return 0;
 }
 
@@ -4751,6 +4748,11 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 		spin_unlock_bh(&ar->data_lock);
 	}
 
+	/* Add a 200ms margin to account for event/command processing */
+	ieee80211_queue_delayed_work(ar->hw, &ar->scan.timeout,
+				     msecs_to_jiffies(arg.max_scan_time +
+						      200));
+
 exit:
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
