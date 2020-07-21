Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxvrY-0000XM-Al
 for ath10k@lists.infradead.org; Tue, 21 Jul 2020 17:15:35 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [RFC 5/7] ath10k: Handle the rx packet processing in thread
Date: Tue, 21 Jul 2020 22:44:24 +0530
Message-Id: <1595351666-28193-6-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, dianders@chromium.org, Rakesh Pillai <pillair@codeaurora.org>, kuba@kernel.org, johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org

Add the support to handle the receive packet and
the tx completion processing in a thread context
if the feature has been enabled via module parameter.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c   |  8 ++++++
 drivers/net/wireless/ath/ath10k/core.h   |  4 +++
 drivers/net/wireless/ath/ath10k/htt.h    |  2 ++
 drivers/net/wireless/ath/ath10k/htt_rx.c | 46 +++++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/snoc.c   | 12 +++++++--
 5 files changed, 64 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2b520a0..4064fa2 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -668,6 +668,14 @@ static unsigned int ath10k_core_get_fw_feature_str(char *buf,
 	return scnprintf(buf, buf_len, "%s", ath10k_core_fw_feature_str[feat]);
 }
 
+void ath10k_core_thread_post_event(struct ath10k_thread *thread,
+				   enum ath10k_thread_events event)
+{
+	set_bit(event, thread->event_flags);
+	wake_up(&thread->wait_q);
+}
+EXPORT_SYMBOL(ath10k_core_thread_post_event);
+
 int ath10k_core_thread_shutdown(struct ath10k *ar,
 				struct ath10k_thread *thread)
 {
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 59bdf11..596d31b 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -974,6 +974,8 @@ struct ath10k_bus_params {
 
 enum ath10k_thread_events {
 	ATH10K_THREAD_EVENT_SHUTDOWN,
+	ATH10K_THREAD_EVENT_RX_POST,
+	ATH10K_THREAD_EVENT_TX_POST,
 	ATH10K_THREAD_EVENT_MAX,
 };
 
@@ -1294,6 +1296,8 @@ static inline bool ath10k_peer_stats_enabled(struct ath10k *ar)
 
 extern unsigned long ath10k_coredump_mask;
 
+void ath10k_core_thread_post_event(struct ath10k_thread *thread,
+				   enum ath10k_thread_events event);
 int ath10k_core_thread_shutdown(struct ath10k *ar,
 				struct ath10k_thread *thread);
 int ath10k_core_thread_init(struct ath10k *ar,
diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index cad5949..e3cb723 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1970,6 +1970,8 @@ struct ath10k_htt {
 		spinlock_t lock;
 	} rx_ring;
 
+	/* Protects access to in order indication queue */
+	spinlock_t rx_in_ord_q_lock;
 	unsigned int prefetch_len;
 
 	/* Protects access to pending_tx, num_pending_tx */
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index a4a6618..becbd56 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -796,6 +796,7 @@ int ath10k_htt_rx_alloc(struct ath10k_htt *htt)
 	timer_setup(timer, ath10k_htt_rx_ring_refill_retry, 0);
 
 	spin_lock_init(&htt->rx_ring.lock);
+	spin_lock_init(&htt->rx_in_ord_q_lock);
 
 	htt->rx_ring.fill_cnt = 0;
 	htt->rx_ring.sw_rd_idx.msdu_payld = 0;
@@ -2702,10 +2703,17 @@ static void ath10k_htt_rx_tx_compl_ind(struct ath10k *ar,
 		 */
 		if (ar->bus_param.dev_type == ATH10K_DEV_TYPE_HL) {
 			ath10k_txrx_tx_unref(htt, &tx_done);
-		} else if (!kfifo_put(&htt->txdone_fifo, tx_done)) {
-			ath10k_warn(ar, "txdone fifo overrun, msdu_id %d status %d\n",
-				    tx_done.msdu_id, tx_done.status);
-			ath10k_txrx_tx_unref(htt, &tx_done);
+		} else {
+			if (!kfifo_put(&htt->txdone_fifo, tx_done)) {
+				ath10k_warn(ar, "txdone fifo overrun, msdu_id %d status %d\n",
+					    tx_done.msdu_id, tx_done.status);
+				ath10k_txrx_tx_unref(htt, &tx_done);
+				continue;
+			}
+			if (ar->rx_thread_enable)
+				ath10k_core_thread_post_event(
+					&ar->rx_thread,
+					ATH10K_THREAD_EVENT_TX_POST);
 		}
 	}
 
@@ -3903,7 +3911,16 @@ bool ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 		break;
 	}
 	case HTT_T2H_MSG_TYPE_RX_IN_ORD_PADDR_IND: {
-		skb_queue_tail(&htt->rx_in_ord_compl_q, skb);
+		if (!ar->rx_thread_enable) {
+			skb_queue_tail(&htt->rx_in_ord_compl_q, skb);
+		} else {
+			spin_lock_bh(&htt->rx_in_ord_q_lock);
+			skb_queue_tail(&htt->rx_in_ord_compl_q, skb);
+			spin_unlock_bh(&htt->rx_in_ord_q_lock);
+			ath10k_core_thread_post_event(
+				&ar->rx_thread,
+				ATH10K_THREAD_EVENT_RX_POST);
+		}
 		return false;
 	}
 	case HTT_T2H_MSG_TYPE_TX_CREDIT_UPDATE_IND: {
@@ -4032,6 +4049,23 @@ int ath10k_htt_rx_hl_indication(struct ath10k *ar, int budget)
 }
 EXPORT_SYMBOL(ath10k_htt_rx_hl_indication);
 
+static inline struct sk_buff *
+ath10k_htt_dequeue_in_ord_q(struct ath10k_htt *htt)
+{
+	struct ath10k *ar = htt->ar;
+	struct sk_buff *skb = NULL;
+
+	if (ar->rx_thread_enable) {
+		spin_lock_bh(&htt->rx_in_ord_q_lock);
+		skb = skb_dequeue(&htt->rx_in_ord_compl_q);
+		spin_unlock_bh(&htt->rx_in_ord_q_lock);
+	} else {
+		skb = skb_dequeue(&htt->rx_in_ord_compl_q);
+	}
+
+	return skb;
+}
+
 int ath10k_htt_txrx_compl_task(struct ath10k *ar, int budget)
 {
 	struct ath10k_htt *htt = &ar->htt;
@@ -4053,7 +4087,7 @@ int ath10k_htt_txrx_compl_task(struct ath10k *ar, int budget)
 		goto exit;
 	}
 
-	while ((skb = skb_dequeue(&htt->rx_in_ord_compl_q))) {
+	while ((skb = ath10k_htt_dequeue_in_ord_q(htt))) {
 		spin_lock_bh(&htt->rx_ring.lock);
 		ret = ath10k_htt_rx_in_ord_ind(ar, skb);
 		spin_unlock_bh(&htt->rx_ring.lock);
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index f01725b..3eb5eac 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -920,6 +920,7 @@ int ath10k_snoc_rx_thread_loop(void *data)
 	struct ath10k_thread *rx_thread = data;
 	struct ath10k *ar = rx_thread->ar;
 	bool shutdown = false;
+	u32 thread_budget = 8192;
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "rx thread started\n");
 	set_user_nice(current, -1);
@@ -927,8 +928,14 @@ int ath10k_snoc_rx_thread_loop(void *data)
 	while (!shutdown) {
 		wait_event_interruptible(
 			rx_thread->wait_q,
-			(test_bit(ATH10K_THREAD_EVENT_SHUTDOWN,
+			(test_and_clear_bit(ATH10K_THREAD_EVENT_RX_POST,
+					    rx_thread->event_flags) ||
+			 test_and_clear_bit(ATH10K_THREAD_EVENT_TX_POST,
+					    rx_thread->event_flags) ||
+			 test_bit(ATH10K_THREAD_EVENT_SHUTDOWN,
 				  rx_thread->event_flags)));
+
+		ath10k_htt_txrx_compl_task(ar, thread_budget);
 		if (test_and_clear_bit(ATH10K_THREAD_EVENT_SHUTDOWN,
 				       rx_thread->event_flags))
 			shutdown = true;
@@ -1235,7 +1242,8 @@ static int ath10k_snoc_napi_poll(struct napi_struct *ctx, int budget)
 			ath10k_ce_enable_interrupt(ar, ce_id);
 		}
 
-	done = ath10k_htt_txrx_compl_task(ar, budget);
+	if (!ar->rx_thread_enable)
+		done = ath10k_htt_txrx_compl_task(ar, budget);
 
 	if (done < budget)
 		napi_complete(ctx);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
