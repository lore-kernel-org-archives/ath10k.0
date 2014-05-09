Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22a.google.com ([2a00:1450:4013:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WijqU-0006zr-PG
 for ath10k@lists.infradead.org; Fri, 09 May 2014 12:24:11 +0000
Received: by mail-ee0-f42.google.com with SMTP id d49so2640056eek.1
 for <ath10k@lists.infradead.org>; Fri, 09 May 2014 05:23:44 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/5] ath10k: drain tx before restarting hw
Date: Fri,  9 May 2014 14:15:47 +0200
Message-Id: <1399637749-13489-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
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

This makes sure no further tx requests are
submitted to HTT before driver teardown.

This should prevent invalid pointer/NULL
dereference on htt tx pool in ath10k_htt_tx() in
some cases of heavy traffic.

Reported-By: Ben Greear <greearb@candelatech.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index dbf0960..40ce1e9 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2289,6 +2289,21 @@ static void ath10k_tx(struct ieee80211_hw *hw,
 /*
  * Initialize various parameters with default vaules.
  */
+static void ath10k_drain_tx(struct ath10k *ar)
+{
+	/* workers can hold conf_mutex -- avoid deadlock */
+	WARN_ON(lockdep_is_held(&ar->conf_mutex));
+
+	/* make sure rcu-protected mac80211 tx path itself is drained */
+	synchronize_net();
+
+	ath10k_offchan_tx_purge(ar);
+	ath10k_mgmt_over_wmi_tx_purge(ar);
+
+	cancel_work_sync(&ar->offchan_tx_work);
+	cancel_work_sync(&ar->wmi_mgmt_tx_work);
+}
+
 void ath10k_halt(struct ath10k *ar)
 {
 	struct ath10k_vif *arvif;
@@ -2304,8 +2319,6 @@ void ath10k_halt(struct ath10k *ar)
 
 	del_timer_sync(&ar->scan.timeout);
 	ath10k_reset_scan((unsigned long)ar);
-	ath10k_offchan_tx_purge(ar);
-	ath10k_mgmt_over_wmi_tx_purge(ar);
 	ath10k_peer_cleanup_all(ar);
 	ath10k_core_stop(ar);
 	ath10k_hif_power_down(ar);
@@ -2329,6 +2342,13 @@ static int ath10k_start(struct ieee80211_hw *hw)
 	struct ath10k *ar = hw->priv;
 	int ret = 0;
 
+	/*
+	 * This makes sense only when restarting hw. It is harmless to call
+	 * uncoditionally. This is necessary to make sure no HTT/WMI tx
+	 * commands will be submitted while restarting.
+	 */
+	ath10k_drain_tx(ar);
+
 	mutex_lock(&ar->conf_mutex);
 
 	switch (ar->state) {
@@ -2408,6 +2428,8 @@ static void ath10k_stop(struct ieee80211_hw *hw)
 {
 	struct ath10k *ar = hw->priv;
 
+	ath10k_drain_tx(ar);
+
 	mutex_lock(&ar->conf_mutex);
 	if (ar->state != ATH10K_STATE_OFF) {
 		ath10k_halt(ar);
@@ -2415,10 +2437,6 @@ static void ath10k_stop(struct ieee80211_hw *hw)
 	}
 	mutex_unlock(&ar->conf_mutex);
 
-	ath10k_mgmt_over_wmi_tx_purge(ar);
-
-	cancel_work_sync(&ar->offchan_tx_work);
-	cancel_work_sync(&ar->wmi_mgmt_tx_work);
 	cancel_work_sync(&ar->restart_work);
 }
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
