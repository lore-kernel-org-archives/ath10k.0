Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1azkDx-0005dY-FU
 for ath10k@lists.infradead.org; Mon, 09 May 2016 12:23:46 +0000
Received: by mail-lf0-x22e.google.com with SMTP id y84so198469942lfc.0
 for <ath10k@lists.infradead.org>; Mon, 09 May 2016 05:23:23 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: improve tx scheduling
Date: Mon,  9 May 2016 14:25:08 +0200
Message-Id: <1462796708-13880-1-git-send-email-michal.kazior@tieto.com>
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

Recent changes revolving around implementing
wake_tx_queue support introduced a significant
performance regressions on some (slower, uni-proc)
systems.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 3 ---
 drivers/net/wireless/ath/ath10k/mac.c    | 7 ++++---
 drivers/net/wireless/ath/ath10k/txrx.c   | 3 +++
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index cc979a4faeb0..7411b69fde42 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2291,7 +2291,6 @@ bool ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 			ath10k_htt_tx_mgmt_dec_pending(htt);
 			spin_unlock_bh(&htt->tx_lock);
 		}
-		ath10k_mac_tx_push_pending(ar);
 		break;
 	}
 	case HTT_T2H_MSG_TYPE_TX_COMPL_IND:
@@ -2442,8 +2441,6 @@ static void ath10k_htt_txrx_compl_task(unsigned long ptr)
 		dev_kfree_skb_any(skb);
 	}
 
-	ath10k_mac_tx_push_pending(ar);
-
 	num_mpdus = atomic_read(&htt->num_mpdus_ready);
 
 	while (num_mpdus) {
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 6dd1d26b357f..1dd415d3c0ee 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3781,6 +3781,9 @@ void ath10k_mac_tx_push_pending(struct ath10k *ar)
 	int ret;
 	int max;
 
+	if (ar->htt.num_pending_tx >= (ar->htt.max_num_pending_tx / 2))
+		return;
+
 	spin_lock_bh(&ar->txqs_lock);
 	rcu_read_lock();
 
@@ -4051,9 +4054,7 @@ static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 		list_add_tail(&artxq->list, &ar->txqs);
 	spin_unlock_bh(&ar->txqs_lock);
 
-	if (ath10k_mac_tx_can_push(hw, txq))
-		tasklet_schedule(&ar->htt.txrx_compl_task);
-
+	ath10k_mac_tx_push_pending(ar);
 	ath10k_htt_tx_txq_update(hw, txq);
 }
 
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 576e7c42ed65..1966c787998b 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -117,6 +117,9 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 
 	ieee80211_tx_status(htt->ar->hw, msdu);
 	/* we do not own the msdu anymore */
+
+	ath10k_mac_tx_push_pending(ar);
+
 	return 0;
 }
 
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
