Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z35JH-0006Pl-5P
 for ath10k@lists.infradead.org; Thu, 11 Jun 2015 16:26:32 +0000
From: Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH] ath10k: mac: remove unreachable negative return check
Date: Thu, 11 Jun 2015 18:17:41 +0200
Message-Id: <1434039461-24899-1-git-send-email-hofrat@osadl.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Nicholas Mc Guire <hofrat@osadl.org>

wait_event_timeout(), introduced in 'commit 5e3dd157d7e7 ("ath10k: mac80211
driver for Qualcomm Atheros 802.11ac CQA98xx devices")' never returns < 0
so the only failure condition to be checked is ==0 (timeout). Further the
return type is long not int - an appropriately named variable is added 
and the assignments fixed up.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

Patch was compile tested with x86_64_defconfig + CONFIG_ATH_CARD=y
CONFIG_ATH10K=m

Patch is against 4.1-rc7 (localversion-next is -next-20150611)

 drivers/net/wireless/ath/ath10k/mac.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 0ed422a..cc67de9 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5643,7 +5643,7 @@ static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 {
 	struct ath10k *ar = hw->priv;
 	bool skip;
-	int ret;
+	long time_left;
 
 	/* mac80211 doesn't care if we really xmit queued frames or not
 	 * we'll collect those frames either way if we stop/delete vdevs */
@@ -5655,7 +5655,7 @@ static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	if (ar->state == ATH10K_STATE_WEDGED)
 		goto skip;
 
-	ret = wait_event_timeout(ar->htt.empty_tx_wq, ({
+	time_left = wait_event_timeout(ar->htt.empty_tx_wq, ({
 			bool empty;
 
 			spin_lock_bh(&ar->htt.tx_lock);
@@ -5669,9 +5669,9 @@ static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			(empty || skip);
 		}), ATH10K_FLUSH_TIMEOUT_HZ);
 
-	if (ret <= 0 || skip)
-		ath10k_warn(ar, "failed to flush transmit queue (skip %i ar-state %i): %i\n",
-			    skip, ar->state, ret);
+	if (time_left == 0 || skip)
+		ath10k_warn(ar, "failed to flush transmit queue (skip %i ar-state %i): %ld\n",
+			    skip, ar->state, time_left);
 
 skip:
 	mutex_unlock(&ar->conf_mutex);
-- 
1.7.10.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
