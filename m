Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRyBV-0001NT-Ht
 for ath10k@lists.infradead.org; Fri, 04 Oct 2013 05:44:18 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH/RFT v2 4/4] ath10k: remove unnecessary checks
Date: Fri, 4 Oct 2013 07:43:45 +0200
Message-ID: <1380865425-3791-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1380865425-3791-1-git-send-email-michal.kazior@tieto.com>
References: <1380805765-31521-1-git-send-email-michal.kazior@tieto.com>
 <1380865425-3791-1-git-send-email-michal.kazior@tieto.com>
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

mac80211 interface iteration functions that were
used originally iterated over interfaces that
weren't re-added to the driver during recovery.

Since internal vif list is now used it's safe to
remove the safe-guard as internal vif list is
based on add/remove_interface function which
guarantees that vdev is created in FW before it is
iterated over.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 583f065..7567db0 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1924,13 +1924,6 @@ static int ath10k_config_ps(struct ath10k *ar)
 
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
@@ -2840,13 +2833,6 @@ static int ath10k_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
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
@@ -2870,13 +2856,6 @@ static int ath10k_set_frag_threshold(struct ieee80211_hw *hw, u32 value)
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
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
