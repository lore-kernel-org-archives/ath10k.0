Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8VUG-00052Q-O7
 for ath10k@lists.infradead.org; Fri, 05 Oct 2018 19:10:10 +0000
Subject: Re: [PATCH] ath10k: htt_rx: Fix signedness bug in
 ath10k_update_per_peer_tx_stats
References: <20181005184245.GA11700@embeddedor.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <3a55bec6-d20d-f500-e741-b228a86b7117@candelatech.com>
Date: Fri, 5 Oct 2018 12:09:50 -0700
MIME-Version: 1.0
In-Reply-To: <20181005184245.GA11700@embeddedor.com>
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
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

On 10/05/2018 11:42 AM, Gustavo A. R. Silva wrote:
> Currently, the error handling for the call to function
> ath10k_get_legacy_rate_idx() doesn't work because
> *rate_idx* is of type u8 (8 bits, unsigned), which
> makes it impossible for it to hold a value less
> than 0.
>
> Fix this by changing the type of variable *rate_idx*
> to s8 (8 bits, signed).

There are more than 127 rates, are you sure this is doing
what you want?

Thanks,
Ben

>
> Addresses-Coverity-ID: 1473914 ("Unsigned compared against 0")
> Fixes: 0189dbd71cbd ("ath10k: get the legacy rate index to update the txrate table")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/net/wireless/ath/ath10k/htt_rx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> index f240525..edd0e74 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -2753,7 +2753,8 @@ ath10k_update_per_peer_tx_stats(struct ath10k *ar,
>  				struct ath10k_per_peer_tx_stats *peer_stats)
>  {
>  	struct ath10k_sta *arsta = (struct ath10k_sta *)sta->drv_priv;
> -	u8 rate = 0, rate_idx = 0, sgi;
> +	u8 rate = 0, sgi;
> +	s8 rate_idx = 0;
>  	struct rate_info txrate;
>
>  	lockdep_assert_held(&ar->data_lock);
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
