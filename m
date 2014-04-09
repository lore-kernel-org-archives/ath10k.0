Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXqAd-0005vF-8H
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 10:55:58 +0000
Received: by mail-ee0-f53.google.com with SMTP id b57so1733167eek.12
 for <ath10k@lists.infradead.org>; Wed, 09 Apr 2014 03:55:33 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFTv2 4/5] ath10k: wait for mgmt tx when flushing too
Date: Wed,  9 Apr 2014 12:48:50 +0200
Message-Id: <1397040531-6224-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1397040531-6224-1-git-send-email-michal.kazior@tieto.com>
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-1-git-send-email-michal.kazior@tieto.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

The 10.1 firmware uses WMI to Tx management frames
but ath10k_flush() didn't care. This could lead to
some frames not being sent.

Although there are no Tx completions for WMI
mangement frames it's still better to at least
wait for ath10k queue to be drained.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index adb5da1..1d95500 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3782,19 +3782,27 @@ static void ath10k_flush(struct ieee80211_hw *hw, u32 queues, bool drop)
 
 	mutex_lock(&ar->conf_mutex);
 
-	if (ar->state == ATH10K_STATE_WEDGED)
+	if (ar->state == ATH10K_STATE_WEDGED) {
+		ret = -EBUSY;
 		goto skip;
+	}
 
 	ret = wait_event_timeout(ar->htt.empty_tx_wq, ({
-			bool empty;
+			bool htt_empty, wmi_empty;
+			unsigned long flags;
 
 			spin_lock_bh(&ar->htt.tx_lock);
-			empty = (ar->htt.num_pending_tx == 0);
+			htt_empty = (ar->htt.num_pending_tx == 0);
 			spin_unlock_bh(&ar->htt.tx_lock);
 
+			spin_lock_irqsave(&ar->wmi_mgmt_tx_queue.lock, flags);
+			wmi_empty = skb_queue_len(&ar->wmi_mgmt_tx_queue) == 0;
+			spin_unlock_irqrestore(&ar->wmi_mgmt_tx_queue.lock,
+					       flags);
+
 			skip = (ar->state == ATH10K_STATE_WEDGED);
 
-			(empty || skip);
+			((htt_empty && wmi_empty) || skip);
 		}), ATH10K_FLUSH_TIMEOUT_HZ);
 
 	if (ret <= 0 || skip)
@@ -3803,6 +3811,11 @@ static void ath10k_flush(struct ieee80211_hw *hw, u32 queues, bool drop)
 
 skip:
 	mutex_unlock(&ar->conf_mutex);
+
+	/* empty mgmt tx queue doesn't mean mgmt tx is flushed because the last
+	 * frame still may be processed by a worker */
+	if (ret > 0 && !skip)
+		cancel_work_sync(&ar->wmi_mgmt_tx_work);
 }
 
 /* TODO: Implement this function properly
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
