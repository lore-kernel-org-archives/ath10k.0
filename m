Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dT1RQ-00032P-S7
 for ath10k@lists.infradead.org; Thu, 06 Jul 2017 07:43:14 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: set a-mpdu reference number in ath10k (receiver)
Date: Thu, 6 Jul 2017 07:42:48 +0000
Message-ID: <87o9syf1uf.fsf@kamboji.qca.qualcomm.com>
References: <B8D63297-0A88-42A3-B789-3849895CF201@frei.media>
Content-Language: en-US
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
To: Matthias Frei <mf@frei.media>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Matthias Frei <mf@frei.media> writes:

> Set the a-mpdu reference number in ath10k to make it accessible in the receivers radiotap header. Implemented as in ath9k. 
> The reference number is needed for troubleshooting and research at the receivers site (e.g. to identify mpdu's that were aggregated in an a-mpdu)
>
> Signed-off-by: Matthias Frei <mf@frei.media>

I did some changes in pending branch, please review them:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=f722728460a5c9e9200a7f1362fa605a714c1968

> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -989,6 +989,9 @@ struct ath10k {
>  		u32 reg_ack_cts_timeout_orig;
>  	} fw_coverage;
>  
> +	/* AMPDU */
> +	u32 ampdu_ref;

The comment is not providing any extra value, I'll remove that.

What about locking? How is this protected or doesn't it need anything?

Also I renamed this to ampdu_reference just to be consistent with the
mac80211 name.

> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -877,16 +877,24 @@ static void ath10k_htt_rx_h_ppdu(struct ath10k *ar,
>  		status->nss = 0;
>  		status->encoding = RX_ENC_LEGACY;
>  		status->bw = RATE_INFO_BW_20;
> -		status->flag &= ~RX_FLAG_MACTIME_END;
> -		status->flag |= RX_FLAG_NO_SIGNAL_VAL;
> +		status->flag &= ~(RX_FLAG_MACTIME_END | RX_FLAG_AMPDU_IS_LAST);
> +		status->flag |= RX_FLAG_NO_SIGNAL_VAL | RX_FLAG_AMPDU_DETAILS | RX_FLAG_AMPDU_LAST_KNOWN;

This added a new warning:

drivers/net/wireless/ath/ath10k/htt_rx.c:894: line over 90 characters

I fixed that by separating the setting of ampdu flags.

> +		/* set ampdu ref */
> +		status->ampdu_reference = ar->ampdu_ref;

The comment is not telling anything new so removed it.

> -	if (is_last_ppdu)
> +	if (is_last_ppdu) {
>  		ath10k_htt_rx_h_mactime(ar, status, rxd);
> +
> +		/* set ampdu last segment flag */
> +		status->flag |= RX_FLAG_AMPDU_IS_LAST;
> +		ar->ampdu_ref++;
> +	}

So this counter is per wiphy, not per vdev. Is that ok?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
