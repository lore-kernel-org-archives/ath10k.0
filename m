Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh01.mail.saunalahti.fi ([62.142.5.107])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW9eQ-0001Jo-0X
 for ath10k@lists.infradead.org; Tue, 15 Oct 2013 18:47:27 +0000
Subject: [PATCH 5/7] ath10k: remove unnecessary checks
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 15 Oct 2013 21:47:08 +0300
Message-ID: <20131015184708.14123.49715.stgit@localhost6.localdomain6>
In-Reply-To: <20131015184548.14123.56949.stgit@localhost6.localdomain6>
References: <20131015184548.14123.56949.stgit@localhost6.localdomain6>
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
Cc: linux-wireless@vger.kernel.org

From: Michal Kazior <michal.kazior@tieto.com>

mac80211 interface iteration functions that were
used originally iterated over interfaces that
weren't re-added to the driver during recovery.

Since internal vif list is now used it's safe to
remove the safe-guard as internal vif list is
based on add/remove_interface function which
guarantees that vdev is created in FW before it is
iterated over.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index bd42a14..4273eef 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1964,13 +1964,6 @@ static int ath10k_config_ps(struct ath10k *ar)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	/* During HW reconfiguration mac80211 reports all interfaces that were
-	 * running until reconfiguration was started. Since FW doesn't have any
-	 * vdevs at this point we must not iterate over this interface list.
-	 * This setting will be updated upon add_interface(). */
-	if (ar->state == ATH10K_STATE_RESTARTED)
-		return 0;
-
 	list_for_each_entry(arvif, &ar->arvifs, list) {
 		ret = ath10k_mac_vif_setup_ps(arvif);
 		if (ret) {
@@ -2888,13 +2881,6 @@ static int ath10k_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
 	struct ath10k_vif *arvif;
 	int ret = 0;
 
-	/* During HW reconfiguration mac80211 reports all interfaces that were
-	 * running until reconfiguration was started. Since FW doesn't have any
-	 * vdevs at this point we must not iterate over this interface list.
-	 * This setting will be updated upon add_interface(). */
-	if (ar->state == ATH10K_STATE_RESTARTED)
-		return 0;
-
 	mutex_lock(&ar->conf_mutex);
 	list_for_each_entry(arvif, &ar->arvifs, list) {
 		ath10k_dbg(ATH10K_DBG_MAC, "mac vdev %d rts threshold %d\n",
@@ -2918,13 +2904,6 @@ static int ath10k_set_frag_threshold(struct ieee80211_hw *hw, u32 value)
 	struct ath10k_vif *arvif;
 	int ret = 0;
 
-	/* During HW reconfiguration mac80211 reports all interfaces that were
-	 * running until reconfiguration was started. Since FW doesn't have any
-	 * vdevs at this point we must not iterate over this interface list.
-	 * This setting will be updated upon add_interface(). */
-	if (ar->state == ATH10K_STATE_RESTARTED)
-		return 0;
-
 	mutex_lock(&ar->conf_mutex);
 	list_for_each_entry(arvif, &ar->arvifs, list) {
 		ath10k_dbg(ATH10K_DBG_MAC, "mac vdev %d fragmentation threshold %d\n",


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
