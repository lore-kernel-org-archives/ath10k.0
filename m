Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTnUw-0004ee-Lu
 for ath10k@lists.infradead.org; Fri, 15 Jun 2018 12:06:36 +0000
Received: by mail-lf0-x244.google.com with SMTP id d24-v6so14281399lfa.8
 for <ath10k@lists.infradead.org>; Fri, 15 Jun 2018 05:06:25 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 2/2] ath10k: replace hardcoded constant with define
Date: Fri, 15 Jun 2018 14:04:23 +0200
Message-Id: <20180615120423.4963-2-erik.stromdahl@gmail.com>
In-Reply-To: <20180615120423.4963-1-erik.stromdahl@gmail.com>
References: <20180615120423.4963-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

The hardcoded values used in ath10k_mac_tx_push_pending and
ath10k_mac_op_wake_tx_queue set an upper limit of how many packets that
can be consumed from the TX queue.

HTC_HOST_MAX_MSG_PER_TX_BUNDLE is a proper name for this constant, as
the value effectively limits the number of messages that can be consumed
in one step. Thus, the value is an upper limit of the number of messages
that can be added to a TX message bundle.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htc.h | 1 +
 drivers/net/wireless/ath/ath10k/mac.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
index e60fbea698a9..d69bb83049c4 100644
--- a/drivers/net/wireless/ath/ath10k/htc.h
+++ b/drivers/net/wireless/ath/ath10k/htc.h
@@ -51,6 +51,7 @@ struct ath10k;
  */
 
 #define HTC_HOST_MAX_MSG_PER_RX_BUNDLE        8
+#define HTC_HOST_MAX_MSG_PER_TX_BUNDLE        16
 
 enum ath10k_htc_tx_flags {
 	ATH10K_HTC_FLAG_NEED_CREDIT_UPDATE = 0x01,
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index f31ae3be4778..e36ca4145572 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4026,7 +4026,7 @@ void ath10k_mac_tx_push_pending(struct ath10k *ar)
 				   drv_priv);
 
 		/* Prevent aggressive sta/tid taking over tx queue */
-		max = 16;
+		max = HTC_HOST_MAX_MSG_PER_TX_BUNDLE;
 		ret = 0;
 		while (ath10k_mac_tx_can_push(hw, txq) && max--) {
 			ret = ath10k_mac_tx_push_txq(hw, txq);
@@ -4287,7 +4287,7 @@ static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	struct ieee80211_txq *f_txq;
 	struct ath10k_txq *f_artxq;
 	int ret = 0;
-	int max = 16;
+	int max = HTC_HOST_MAX_MSG_PER_TX_BUNDLE;
 
 	spin_lock_bh(&ar->txqs_lock);
 	if (list_empty(&artxq->list))
-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
