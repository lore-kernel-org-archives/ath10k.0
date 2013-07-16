Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UyzrB-0003Vb-1U
 for ath10k@lists.infradead.org; Tue, 16 Jul 2013 07:39:34 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v4 07/10] ath10k: make sure all resources are freed upon
 ath10k_stop()
Date: Tue, 16 Jul 2013 09:38:56 +0200
Message-ID: <1373960339-8525-8-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1373960339-8525-1-git-send-email-michal.kazior@tieto.com>
References: <1371041642-20273-1-git-send-email-michal.kazior@tieto.com>
 <1373960339-8525-1-git-send-email-michal.kazior@tieto.com>
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

This is necessary for proper hw reconfiguration
and to avoid memory leaks.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index febba7d..b9663e9 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -369,6 +369,20 @@ static void ath10k_peer_cleanup(struct ath10k *ar, u32 vdev_id)
 	spin_unlock_bh(&ar->data_lock);
 }
 
+static void ath10k_peer_cleanup_all(struct ath10k *ar)
+{
+	struct ath10k_peer *peer, *tmp;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	spin_lock_bh(&ar->data_lock);
+	list_for_each_entry_safe(peer, tmp, &ar->peers, list) {
+		list_del(&peer->list);
+		kfree(peer);
+	}
+	spin_unlock_bh(&ar->data_lock);
+}
+
 /************************/
 /* Interface management */
 /************************/
@@ -1753,7 +1767,18 @@ static void ath10k_stop(struct ieee80211_hw *hw)
 	struct ath10k *ar = hw->priv;
 
 	mutex_lock(&ar->conf_mutex);
+	del_timer_sync(&ar->scan.timeout);
 	ath10k_offchan_tx_purge(ar);
+	ath10k_peer_cleanup_all(ar);
+
+	spin_lock_bh(&ar->data_lock);
+	if (ar->scan.in_progress) {
+		del_timer(&ar->scan.timeout);
+		ar->scan.in_progress = false;
+		ieee80211_scan_completed(ar->hw, true);
+	}
+	spin_unlock_bh(&ar->data_lock);
+
 	ar->state = ATH10K_STATE_OFF;
 	mutex_unlock(&ar->conf_mutex);
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
