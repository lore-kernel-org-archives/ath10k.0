Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1WPm-0006Un-Fa
 for ath10k@lists.infradead.org; Sat, 24 Aug 2019 13:49:11 +0000
Received: by mail-lj1-x241.google.com with SMTP id h15so11278807ljg.10
 for <ath10k@lists.infradead.org>; Sat, 24 Aug 2019 06:49:09 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH] ath10k: remove TX lock from ath10k_htt_tx_inc_pending
Date: Sat, 24 Aug 2019 15:48:57 +0200
Message-Id: <20190824134857.4094-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

This commit removes the call to ath10k_mac_tx_lock() from
ath10k_htt_tx_inc_pending() in case the high water mark is reached.

ath10k_mac_tx_lock() calls ieee80211_stop_queues() in order to stop
mac80211 from pushing more TX data to the driver (this is the TX lock).

If a driver is trying to fetch an skb from a queue while the queue is
stopped, ieee80211_tx_dequeue() will return NULL.

So, in ath10k_mac_tx_push_txq(), there is a risk that the call to
ath10k_htt_tx_inc_pending() results in a stop of the mac80211 TX queues
just before the skb is fetched.

This will cause ieee80211_tx_dequeue() to return NULL and
ath10k_mac_tx_push_txq() to exit prematurely and return -ENOENT.
Before the function returns ath10k_htt_tx_dec_pending() will be called.
This call will re-enable the TX queues through ath10k_mac_tx_unlock().
When ath10k_mac_tx_push_txq() has returned, the TX queue will be
returned back to mac80211 with ieee80211_return_txq() without the skb
being properly consumed.

Since the TX queues were re-enabled in the error exit path of
ath10k_mac_tx_push_txq(), mac80211 can continue pushing data to the
driver. If the hardware does not consume the data, the above mentioned
case will be repeated over and over.

A case when the hardware is not able to transmit the data from the host
is when a STA has been dis-associated from an AP and has not yet been
able to re-associate. In this case there will be no TX_COMPL_INDs from
the hardware, resulting in the TX counter not be decremented.

This phenomenon has been observed in both a real and a test setup.

In order to fix this, the actual TX locking (the call to
ath10k_mac_tx_lock()) was removed from ath10k_htt_tx_inc_pending().
Instead, ath10k_mac_tx_lock() is called separately after the skb has
been fetched (after the call to ieee80211_tx_dequeue()). At this point
it is OK to stop the queues.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 2 --
 drivers/net/wireless/ath/ath10k/mac.c    | 8 ++++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 2ef717f18795..32fd71f28ef9 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -157,8 +157,6 @@ int ath10k_htt_tx_inc_pending(struct ath10k_htt *htt)
 		return -EBUSY;
 
 	htt->num_pending_tx++;
-	if (htt->num_pending_tx == htt->max_num_pending_tx)
-		ath10k_mac_tx_lock(htt->ar, ATH10K_TX_PAUSE_Q_FULL);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index c1bf1167a2ce..8d357c79ca59 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4078,6 +4078,11 @@ int ath10k_mac_tx_push_txq(struct ieee80211_hw *hw,
 		return -ENOENT;
 	}
 
+	spin_lock_bh(&ar->htt.tx_lock);
+	if (htt->num_pending_tx == htt->max_num_pending_tx)
+		ath10k_mac_tx_lock(ar, ATH10K_TX_PAUSE_Q_FULL);
+	spin_unlock_bh(&ar->htt.tx_lock);
+
 	airtime = ath10k_mac_update_airtime(ar, txq, skb);
 	ath10k_mac_tx_h_fill_cb(ar, vif, txq, skb, airtime);
 
@@ -4370,6 +4375,9 @@ static void ath10k_mac_op_tx(struct ieee80211_hw *hw,
 			return;
 		}
 
+		if (htt->num_pending_tx == htt->max_num_pending_tx)
+			ath10k_mac_tx_lock(ar, ATH10K_TX_PAUSE_Q_FULL);
+
 		ret = ath10k_htt_tx_mgmt_inc_pending(htt, is_mgmt, is_presp);
 		if (ret) {
 			ath10k_dbg(ar, ATH10K_DBG_MAC, "failed to increase tx mgmt pending count: %d, dropping\n",
-- 
2.22.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
