Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g61Eg-0001W5-IP
 for ath10k@lists.infradead.org; Fri, 28 Sep 2018 22:27:54 +0000
MIME-Version: 1.0
Date: Fri, 28 Sep 2018 15:27:35 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [RFC 1/2] ath10k: migrate to mac80211 txq scheduling
In-Reply-To: <1538008874-11692-1-git-send-email-rmanohar@codeaurora.org>
References: <1538008874-11692-1-git-send-email-rmanohar@codeaurora.org>
Message-ID: <2548421a777c2223b5b31459222fe1e1@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless-owner@vger.kernel.org, =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rg?= =?UTF-8?Q?ensen?= <toke@toke.dk>, linux-wireless@vger.kernel.org

On 2018-09-26 17:41, Rajkumar Manoharan wrote:
> @@ -4293,32 +4281,7 @@ static void ath10k_mac_op_tx(struct ieee80211_hw 
> *hw,
>  static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
>  					struct ieee80211_txq *txq)
>  {
> -	struct ath10k *ar = hw->priv;
> -	struct ath10k_txq *artxq = (void *)txq->drv_priv;
> -	struct ieee80211_txq *f_txq;
> -	struct ath10k_txq *f_artxq;
> -	int ret = 0;
> -	int max = HTC_HOST_MAX_MSG_PER_TX_BUNDLE;
> -
> -	spin_lock_bh(&ar->txqs_lock);
> -	if (list_empty(&artxq->list))
> -		list_add_tail(&artxq->list, &ar->txqs);
> -
> -	f_artxq = list_first_entry(&ar->txqs, struct ath10k_txq, list);
> -	f_txq = container_of((void *)f_artxq, struct ieee80211_txq, 
> drv_priv);
> -	list_del_init(&f_artxq->list);
> -
> -	while (ath10k_mac_tx_can_push(hw, f_txq) && max--) {
> -		ret = ath10k_mac_tx_push_txq(hw, f_txq);
> -		if (ret < 0)
> -			break;
> -	}
> -	if (ret != -ENOENT)
> -		list_add_tail(&f_artxq->list, &ar->txqs);
> -	spin_unlock_bh(&ar->txqs_lock);
> -
> -	ath10k_htt_tx_txq_update(hw, f_txq);
> -	ath10k_htt_tx_txq_update(hw, txq);
> +	ath10k_mac_schedule_txq(hw, txq->ac);
>  }
> 
With below change I were able to fix the performance impact in 
multiclient scenario.
Will fold them in next version.

diff --git a/drivers/net/wireless/ath/ath10k/mac.c 
b/drivers/net/wireless/ath/ath10k/mac.c
index 6da64412cc14..965aaa731f04 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4473,7 +4473,26 @@ static void ath10k_mac_op_tx(struct ieee80211_hw 
*hw,
  static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
                                         struct ieee80211_txq *txq)
  {
-       ath10k_mac_schedule_txq(hw, txq->ac);
+       u8 ac = txq->ac;
+       int ret = 0;
+
+       ieee80211_txq_schedule_start(hw, ac);
+       txq = ieee80211_next_txq(hw, ac);
+       ieee80211_txq_schedule_end(hw, ac);
+       if (!txq)
+               return;
+
+       while (ath10k_mac_tx_can_push(hw, txq)) {
+               ret = ath10k_mac_tx_push_txq(hw, txq);
+               if (ret < 0)
+                       break;
+       }
+       if (ret == -EBUSY) {
+               ieee80211_txq_schedule_start(hw, ac);
+               ieee80211_return_txq(hw, txq);
+               ieee80211_txq_schedule_end(hw, ac);
+       }
+       ath10k_htt_tx_txq_update(hw, txq);
  }

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
