Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMFYu-0000NP-Rm
 for ath10k@lists.infradead.org; Thu, 21 Jan 2016 13:46:14 +0000
Received: by mail-lb0-x22c.google.com with SMTP id bc4so23434869lbc.2
 for <ath10k@lists.infradead.org>; Thu, 21 Jan 2016 05:45:48 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 08/13] ath10k: implement updating shared htt txq state
Date: Thu, 21 Jan 2016 14:46:41 +0100
Message-Id: <1453384006-31907-9-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
References: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
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

Firmware 10.4.3 onwards can support a pull-push Tx
model where it shares a Tx queue state with the
host.

The host updates the DMA region it pointed to
during HTT setup whenever number of software
queued from (on host) changes. Based on this
information firmware issues fetch requests to the
host telling the host how many frames from a list
of given stations/tids should be submitted to the
firmware.

The code won't be called because not all
appropriate HTT events are processed yet.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt.h    |   3 +
 drivers/net/wireless/ath/ath10k/htt_tx.c | 100 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/mac.c    |   9 ++-
 3 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 65dcd22f31df..b1e40f44e76b 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1667,6 +1667,7 @@ struct ath10k_htt {
 	} txbuf;
 
 	struct {
+		bool enabled;
 		struct htt_q_state *vaddr;
 		dma_addr_t paddr;
 		u16 num_peers;
@@ -1758,6 +1759,8 @@ int ath10k_htt_tx_fetch_resp(struct ath10k *ar,
 			     struct htt_tx_fetch_record *records,
 			     size_t num_records);
 
+void ath10k_htt_tx_txq_update(struct ieee80211_hw *hw,
+			      struct ieee80211_txq *txq);
 void ath10k_htt_tx_dec_pending(struct ath10k_htt *htt,
 			       bool is_mgmt);
 int ath10k_htt_tx_inc_pending(struct ath10k_htt *htt,
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 225f0561b3fd..5ef0a1b3773c 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -22,6 +22,106 @@
 #include "txrx.h"
 #include "debug.h"
 
+static u8 ath10k_htt_tx_txq_calc_size(size_t count)
+{
+	int exp;
+	int factor;
+
+	exp = 0;
+	factor = count >> 7;
+
+	while (factor >= 64 && exp < 4) {
+		factor >>= 3;
+		exp++;
+	}
+
+	if (exp == 4)
+		return 0xff;
+
+	if (count > 0)
+		factor = max(1, factor);
+
+	return SM(exp, HTT_TX_Q_STATE_ENTRY_EXP) |
+	       SM(factor, HTT_TX_Q_STATE_ENTRY_FACTOR);
+}
+
+static void __ath10k_htt_tx_txq_recalc(struct ieee80211_hw *hw,
+				       struct ieee80211_txq *txq)
+{
+	struct ath10k *ar = hw->priv;
+	struct ath10k_sta *arsta = (void *)txq->sta->drv_priv;
+	struct ath10k_vif *arvif = (void *)txq->vif->drv_priv;
+	int idx;
+	u32 bit;
+	u16 peer_id;
+	u8 tid;
+	u8 count;
+
+	lockdep_assert_held(&ar->htt.tx_lock);
+
+	if (!ar->htt.tx_q_state.enabled)
+		return;
+
+	if (txq->sta)
+		peer_id = arsta->peer_id;
+	else
+		peer_id = arvif->peer_id;
+
+	tid = txq->tid;
+	bit = BIT(peer_id % 32);
+	idx = peer_id / 32;
+	count = ath10k_htt_tx_txq_calc_size(txq->qsize);
+
+	if (unlikely(peer_id >= ar->htt.tx_q_state.num_peers) ||
+	    unlikely(tid >= ar->htt.tx_q_state.num_tids)) {
+		ath10k_warn(ar, "refusing to update txq for peer_id %hu tid %hhu due to out of bounds\n",
+			    peer_id, tid);
+		return;
+	}
+
+	ar->htt.tx_q_state.vaddr->count[tid][peer_id] = count;
+	ar->htt.tx_q_state.vaddr->map[tid][idx] &= ~bit;
+	ar->htt.tx_q_state.vaddr->map[tid][idx] |= count ? bit : 0;
+
+	ath10k_dbg(ar, ATH10K_DBG_HTT, "htt tx txq state update peer_id %hu tid %hhu count %hhu\n",
+		   peer_id, tid, count);
+}
+
+static void __ath10k_htt_tx_txq_sync(struct ath10k *ar)
+{
+	u32 seq;
+	size_t size;
+
+	lockdep_assert_held(&ar->htt.tx_lock);
+
+	if (!ar->htt.tx_q_state.enabled)
+		return;
+
+	seq = le32_to_cpu(ar->htt.tx_q_state.vaddr->seq);
+	seq++;
+	ar->htt.tx_q_state.vaddr->seq = cpu_to_le32(seq);
+
+	ath10k_dbg(ar, ATH10K_DBG_HTT, "htt tx txq state update commit seq %u\n",
+		   seq);
+
+	size = sizeof(*ar->htt.tx_q_state.vaddr);
+	dma_sync_single_for_device(ar->dev,
+				   ar->htt.tx_q_state.paddr,
+				   size,
+				   DMA_TO_DEVICE);
+}
+
+void ath10k_htt_tx_txq_update(struct ieee80211_hw *hw,
+			      struct ieee80211_txq *txq)
+{
+	struct ath10k *ar = hw->priv;
+
+	spin_lock_bh(&ar->htt.tx_lock);
+	__ath10k_htt_tx_txq_recalc(hw, txq);
+	__ath10k_htt_tx_txq_sync(ar);
+	spin_unlock_bh(&ar->htt.tx_lock);
+}
+
 void ath10k_htt_tx_dec_pending(struct ath10k_htt *htt,
 			       bool is_mgmt)
 {
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 111baa104f8e..d9566ba70af3 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3695,12 +3695,19 @@ static void ath10k_mac_tx_push(struct ieee80211_hw *hw,
 				    txq->vif->addr, ret);
 		return;
 	}
+
+	ath10k_htt_tx_txq_update(hw, txq);
 }
 
 static void ath10k_mac_tx_wake(struct ieee80211_hw *hw,
 			       struct ieee80211_txq *txq)
 {
-	WARN_ON(1); /* TBD */
+	/* TODO: Possible optimization is to defer the updates until a certain
+	 * time/quantity threshold is reached to avoid hammering DMA and
+	 * flushing d-caches for each submitted msdu.
+	 */
+
+	ath10k_htt_tx_txq_update(hw, txq);
 }
 
 /************/
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
