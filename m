Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkzOo-0007tU-Il
 for ath10k@lists.infradead.org; Thu, 15 May 2014 17:24:55 +0000
Message-ID: <5374F84E.1090208@candelatech.com>
Date: Thu, 15 May 2014 10:24:30 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] ath10k: fix rssi and rate reporting
References: <1395692698-4745-1-git-send-email-janusz.dziedzic@tieto.com>
 <1395692698-4745-2-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1395692698-4745-2-git-send-email-janusz.dziedzic@tieto.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

I have a few questions on this patch (long since accepted upstream).

First, why do you only memset the rx_status if START_VALID is set,
and why do you not set:

rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL

in an else clause if START_VALID is not set?

The patch definitely helps, but I'm still getting less accuracy than expected
(as compared to ath9k going through a similar rate vs range test).

Thanks,
Ben


> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> index be25e16..f7ecc10 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -1154,8 +1154,6 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
>  
>  	lockdep_assert_held(&htt->rx_ring.lock);
>  
> -	memset(rx_status, 0, sizeof(*rx_status));
> -
>  	fw_desc_len = __le16_to_cpu(rx->prefix.fw_rx_desc_bytes);
>  	fw_desc = (u8 *)&rx->fw_desc;
>  
> @@ -1164,8 +1162,11 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
>  	mpdu_ranges = htt_rx_ind_get_mpdu_ranges(rx);
>  
>  	/* Fill this once, while this is per-ppdu */
> -	rx_status->signal  = ATH10K_DEFAULT_NOISE_FLOOR;
> -	rx_status->signal += rx->ppdu.combined_rssi;
> +	if (rx->ppdu.info0 & HTT_RX_INDICATION_INFO0_START_VALID) {
> +		memset(rx_status, 0, sizeof(*rx_status));
> +		rx_status->signal  = ATH10K_DEFAULT_NOISE_FLOOR +
> +				     rx->ppdu.combined_rssi;
> +	}
>  
>  	if (rx->ppdu.info0 & HTT_RX_INDICATION_INFO0_END_VALID) {
>  		/* TSF available only in 32-bit */
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
