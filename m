Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x234.google.com ([2a00:1450:4010:c04::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNKZR-0006Xa-Ui
 for ath10k@lists.infradead.org; Thu, 06 Aug 2015 12:46:54 +0000
Received: by lbbpu9 with SMTP id pu9so14613614lbb.3
 for <ath10k@lists.infradead.org>; Thu, 06 Aug 2015 05:46:25 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: wake up offchannel queue properly
Date: Thu,  6 Aug 2015 14:46:54 +0200
Message-Id: <1438865214-1651-1-git-send-email-michal.kazior@tieto.com>
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

Once HTT Tx queue got full offchannel queue was
stopped and never woken up again. This broke, e.g.
P2P. This could be reproduced after running a lot
of traffic enough to saturate 100% of the driver
Tx queue and then trying to send offchannel
traffic.

Fixes: 96d828d45e16 ("ath10k: rework tx queue locking")
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index acd222f3b899..c7ff0c8a5bd4 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3002,6 +3002,8 @@ void ath10k_mac_tx_unlock(struct ath10k *ar, int reason)
 						   IEEE80211_IFACE_ITER_RESUME_ALL,
 						   ath10k_mac_tx_unlock_iter,
 						   ar);
+
+	ieee80211_wake_queue(ar->hw, ar->hw->offchannel_tx_hw_queue);
 }
 
 void ath10k_mac_vif_tx_lock(struct ath10k_vif *arvif, int reason)
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
