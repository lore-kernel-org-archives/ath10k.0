Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNblJ-0000CU-0c
 for ath10k@lists.infradead.org; Fri, 07 Aug 2015 07:08:18 +0000
Received: by labd1 with SMTP id d1so3217347lab.1
 for <ath10k@lists.infradead.org>; Fri, 07 Aug 2015 00:07:51 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: wake up queue upon vif creation
Date: Fri,  7 Aug 2015 09:08:21 +0200
Message-Id: <1438931301-27081-1-git-send-email-michal.kazior@tieto.com>
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

Vif's vdev_id is used as queue number. However due
to the tx pausing design in ath10k it was possible
for a new interface to be created with its tx
queue stopped (via ieee80211_stop_queues). This
could in turn leave the interface inoperable until
ath10k_mac_tx_unlock() was called.

This problem only affected multi-vif scenarios when
new interfaces were created some time later after
other interfaces have been running for some time
and had Tx queue full at some point prior.

Possible manifestation of the bug was
authentication timeout for a client vif.

Fixes: 96d828d45e16 ("ath10k: rework tx queue locking")
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index acd222f3b899..03e498cb64b4 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4299,6 +4299,11 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		}
 	}
 
+	spin_lock_bh(&ar->htt.tx_lock);
+	if (!ar->tx_paused)
+		ieee80211_wake_queue(ar->hw, arvif->vdev_id);
+	spin_unlock_bh(&ar->htt.tx_lock);
+
 	mutex_unlock(&ar->conf_mutex);
 	return 0;
 
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
