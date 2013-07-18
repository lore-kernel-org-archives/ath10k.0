Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uzhmf-0001Lc-KD
 for ath10k@lists.infradead.org; Thu, 18 Jul 2013 06:33:50 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/3] ath10k: prevent HTC from being used after stopping
Date: Thu, 18 Jul 2013 08:33:11 +0200
Message-ID: <1374129193-3533-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1374129193-3533-1-git-send-email-michal.kazior@tieto.com>
References: <1374129193-3533-1-git-send-email-michal.kazior@tieto.com>
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

It was possible to submit new HTC commands
after/while HTC stopped. This led to memory
corruption in some rare cases.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htc.c |   28 +++++++++++++---------------
 drivers/net/wireless/ath/ath10k/htc.h |    4 ++--
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 7d5a366..f5610f1 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -251,10 +251,14 @@ int ath10k_htc_send(struct ath10k_htc *htc,
 		return -ENOENT;
 	}
 
-	skb_push(skb, sizeof(struct ath10k_htc_hdr));
-
 	spin_lock_bh(&htc->tx_lock);
+	if (htc->stopped) {
+		spin_unlock_bh(&htc->tx_lock);
+		return -ESHUTDOWN;
+	}
+
 	__skb_queue_tail(&ep->tx_queue, skb);
+	skb_push(skb, sizeof(struct ath10k_htc_hdr));
 	spin_unlock_bh(&htc->tx_lock);
 
 	queue_work(htc->ar->workqueue, &ep->send_work);
@@ -267,23 +271,17 @@ static int ath10k_htc_tx_completion_handler(struct ath10k *ar,
 {
 	struct ath10k_htc *htc = &ar->htc;
 	struct ath10k_htc_ep *ep = &htc->endpoint[eid];
-	bool stopping;
 
 	ath10k_htc_notify_tx_completion(ep, skb);
 	/* the skb now belongs to the completion handler */
 
+	/* note: when using TX credit flow, the re-checking of queues happens
+	 * when credits flow back from the target.  in the non-TX credit case,
+	 * we recheck after the packet completes */
 	spin_lock_bh(&htc->tx_lock);
-	stopping = htc->stopping;
-	spin_unlock_bh(&htc->tx_lock);
-
-	if (!ep->tx_credit_flow_enabled && !stopping)
-		/*
-		 * note: when using TX credit flow, the re-checking of
-		 * queues happens when credits flow back from the target.
-		 * in the non-TX credit case, we recheck after the packet
-		 * completes
-		 */
+	if (!ep->tx_credit_flow_enabled && !htc->stopped)
 		queue_work(ar->workqueue, &ep->send_work);
+	spin_unlock_bh(&htc->tx_lock);
 
 	return 0;
 }
@@ -948,7 +946,7 @@ void ath10k_htc_stop(struct ath10k_htc *htc)
 	struct ath10k_htc_ep *ep;
 
 	spin_lock_bh(&htc->tx_lock);
-	htc->stopping = true;
+	htc->stopped = true;
 	spin_unlock_bh(&htc->tx_lock);
 
 	for (i = ATH10K_HTC_EP_0; i < ATH10K_HTC_EP_COUNT; i++) {
@@ -957,7 +955,6 @@ void ath10k_htc_stop(struct ath10k_htc *htc)
 	}
 
 	ath10k_hif_stop(htc->ar);
-	ath10k_htc_reset_endpoint_states(htc);
 }
 
 /* registered target arrival callback from the HIF layer */
@@ -969,6 +966,7 @@ int ath10k_htc_init(struct ath10k *ar)
 
 	spin_lock_init(&htc->tx_lock);
 
+	htc->stopped = false;
 	ath10k_htc_reset_endpoint_states(htc);
 
 	/* setup HIF layer callbacks */
diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
index 1606c9f..e1dd8c7 100644
--- a/drivers/net/wireless/ath/ath10k/htc.h
+++ b/drivers/net/wireless/ath/ath10k/htc.h
@@ -335,7 +335,7 @@ struct ath10k_htc {
 	struct ath10k *ar;
 	struct ath10k_htc_ep endpoint[ATH10K_HTC_EP_COUNT];
 
-	/* protects endpoint and stopping fields */
+	/* protects endpoint and stopped fields */
 	spinlock_t tx_lock;
 
 	struct ath10k_htc_ops htc_ops;
@@ -349,7 +349,7 @@ struct ath10k_htc {
 	struct ath10k_htc_svc_tx_credits service_tx_alloc[ATH10K_HTC_EP_COUNT];
 	int target_credit_size;
 
-	bool stopping;
+	bool stopped;
 };
 
 int ath10k_htc_init(struct ath10k *ar);
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
