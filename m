Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fToJ9-0001Ut-20
 for ath10k@lists.infradead.org; Fri, 15 Jun 2018 12:58:28 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: fix bug in masking of TID value
References: <20180615120153.4677-1-erik.stromdahl@gmail.com>
Date: Fri, 15 Jun 2018 15:58:11 +0300
In-Reply-To: <20180615120153.4677-1-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Fri, 15 Jun 2018 14:01:53 +0200")
Message-ID: <878t7g6wbg.fsf@kamboji.qca.qualcomm.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> Although the TID mask is 0xf, the modulus operation does still not
> produce identical results as the bitwise and operator.
>
> If the TID is 15, the modulus operation will "convert" it to 0, whereas
> the bitwise and will keep it as 15.
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/htt_tx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
> index 89157c5b5e5f..be5b52aaffa6 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_tx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
> @@ -1056,7 +1056,7 @@ static u8 ath10k_htt_tx_get_tid(struct sk_buff *skb, bool is_eth)
>  	if (!is_eth && ieee80211_is_mgmt(hdr->frame_control))
>  		return HTT_DATA_TX_EXT_TID_MGMT;
>  	else if (cb->flags & ATH10K_SKB_F_QOS)
> -		return skb->priority % IEEE80211_QOS_CTL_TID_MASK;
> +		return skb->priority & IEEE80211_QOS_CTL_TID_MASK;

I guess you just found this during code review? If yes, I'll add that to
the commit log.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
