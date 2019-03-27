Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9BQk-0003VW-4h
 for ath10k@lists.infradead.org; Wed, 27 Mar 2019 16:29:35 +0000
Received: by mail-lj1-x243.google.com with SMTP id k8so14970206lja.8
 for <ath10k@lists.infradead.org>; Wed, 27 Mar 2019 09:29:31 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH] ath10k: remove iteration in wake_tx_queue
Date: Wed, 27 Mar 2019 17:29:06 +0100
Message-Id: <20190327162906.6010-1-erik.stromdahl@gmail.com>
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
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>, yiboz@codeaurora.org

Iterating the TX queue and thereby dequeuing all available packets in the
queue could result in performance penalties on some SMP systems.

The reason for this is most likely that the per-ac lock (active_txq_lock)
in mac80211 will be held by the CPU iterating the current queue.

This will lock up other CPUs trying to push new messages on the TX
queue.

Instead of iterating the queue we fetch just one packet at the time,
resulting in minimal starvation of the other CPUs.

Reported-by: Yibo Zhao <yiboz@codeaurora.org>
Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index b73c23d4ce86..c9e700b844f8 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4356,7 +4356,6 @@ static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 					struct ieee80211_txq *txq)
 {
 	struct ath10k *ar = hw->priv;
-	int ret;
 	u8 ac;
 
 	ath10k_htt_tx_txq_update(hw, txq);
@@ -4369,11 +4368,9 @@ static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	if (!txq)
 		goto out;
 
-	while (ath10k_mac_tx_can_push(hw, txq)) {
-		ret = ath10k_mac_tx_push_txq(hw, txq);
-		if (ret < 0)
-			break;
-	}
+	if (ath10k_mac_tx_can_push(hw, txq))
+		ath10k_mac_tx_push_txq(hw, txq);
+
 	ieee80211_return_txq(hw, txq);
 	ath10k_htt_tx_txq_update(hw, txq);
 out:
-- 
2.19.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
