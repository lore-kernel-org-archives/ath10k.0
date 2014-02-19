Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG8nQ-0004BO-JY
 for ath10k@lists.infradead.org; Wed, 19 Feb 2014 15:10:49 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC/RFT 5/7] ath10k: batch htt tx/rx completions
References: <1392629563-31046-1-git-send-email-michal.kazior@tieto.com>
 <1392629563-31046-6-git-send-email-michal.kazior@tieto.com>
Date: Wed, 19 Feb 2014 17:10:19 +0200
In-Reply-To: <1392629563-31046-6-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 17 Feb 2014 10:32:41 +0100")
Message-ID: <87lhx7xhno.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> HTT Rx endpoint processes both frame rx
> indications and frame tx completion indications.
>
> Those completions typically come in batches and
> may be mixed so it makes sense to defer processing
> hoping to get a bunch of them and take advantage
> of hot caches.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> @@ -270,7 +274,7 @@ static inline struct sk_buff *ath10k_htt_rx_netbuf_pop(struct ath10k_htt *htt)
>  	int idx;
>  	struct sk_buff *msdu;
>  
> -	spin_lock_bh(&htt->rx_ring.lock);
> +	lockdep_assert_held(&htt->rx_ring.lock);

There are some locking changes which I think would be better to have in
a separate patch.


>  	case HTT_T2H_MSG_TYPE_MGMT_TX_COMPLETION: {
> +		struct htt_resp *resp = (struct htt_resp *)skb->data;
>  		struct htt_tx_done tx_done = {};
>  		int status = __le32_to_cpu(resp->mgmt_tx_completion.status);
>  
> -		tx_done.msdu_id =
> -			__le32_to_cpu(resp->mgmt_tx_completion.desc_id);
> +		tx_done.msdu_id = __le32_to_cpu(resp->mgmt_tx_completion.desc_id);

I don't see any changes here.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
