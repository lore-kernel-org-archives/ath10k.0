Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVkMZ-0004nf-HU
 for ath10k@lists.infradead.org; Wed, 11 Mar 2015 17:24:08 +0000
From: Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH 1/2 RFC] ath10k: move code out of the parameter list
Date: Wed, 11 Mar 2015 13:19:29 -0400
Message-Id: <1426094369-10213-1-git-send-email-hofrat@osadl.org>
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
Cc: Valdis.Kletnieks@vt.edu, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Nicholas Mc Guire <hofrat@osadl.org>, Bj??rn Mork <bjorn@mork.no>

Putting code into the parameter list of wait_event_timeout() might be 
legal C-code but not really readable - the "inline" code is simply
moved into a function and that passed to wait_event_timeout() as the
condition.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

Thanks to Bjorn Mork <bjorn@mork.no> for clarifying my initial confusion !

Patch was only compile tested with x86_64_defconfig + CONFIG_ATH_CARDS=m,
CONFIG_ATH10K=m

Patch is against 4.0-rc3 (localversion-next is -next-20150311)

 drivers/net/wireless/ath/ath10k/mac.c |   32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index e8cc19f..7b27d99 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4463,11 +4463,25 @@ static int ath10k_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
 	return ret;
 }
 
+static bool check_htt_state(struct ath10k *ar, bool skip)
+{
+	bool empty;
+
+	spin_lock_bh(&ar->htt.tx_lock);
+	empty = (ar->htt.num_pending_tx == 0);
+	spin_unlock_bh(&ar->htt.tx_lock);
+
+	skip = (ar->state == ATH10K_STATE_WEDGED) ||
+		test_bit(ATH10K_FLAG_CRASH_FLUSH,
+			 &ar->dev_flags);
+	return (empty || skip);
+}
+
 static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			 u32 queues, bool drop)
 {
 	struct ath10k *ar = hw->priv;
-	bool skip;
+	bool skip = false;
 	int ret;
 
 	/* mac80211 doesn't care if we really xmit queued frames or not
@@ -4480,19 +4494,9 @@ static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	if (ar->state == ATH10K_STATE_WEDGED)
 		goto skip;
 
-	ret = wait_event_timeout(ar->htt.empty_tx_wq, ({
-			bool empty;
-
-			spin_lock_bh(&ar->htt.tx_lock);
-			empty = (ar->htt.num_pending_tx == 0);
-			spin_unlock_bh(&ar->htt.tx_lock);
-
-			skip = (ar->state == ATH10K_STATE_WEDGED) ||
-			       test_bit(ATH10K_FLAG_CRASH_FLUSH,
-					&ar->dev_flags);
-
-			(empty || skip);
-		}), ATH10K_FLUSH_TIMEOUT_HZ);
+	ret = wait_event_timeout(ar->htt.empty_tx_wq,
+				 check_htt_state(ar, skip),
+				 ATH10K_FLUSH_TIMEOUT_HZ);
 
 	if (ret <= 0 || skip)
 		ath10k_warn(ar, "failed to flush transmit queue (skip %i ar-state %i): %i\n",
-- 
1.7.10.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
