Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAl6K-0004tH-Kz
 for ath10k@lists.infradead.org; Tue, 04 Feb 2014 18:52:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/4] ath10k:  Add more debugging for receive errors.
References: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
 <1390435562-15473-3-git-send-email-greearb@candelatech.com>
Date: Tue, 4 Feb 2014 20:51:35 +0200
In-Reply-To: <1390435562-15473-3-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 22 Jan 2014 16:06:01
 -0800")
Message-ID: <87ppn2ognc.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -937,6 +937,7 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
>  			}
>  
>  			if (ath10k_htt_rx_has_decrypt_err(msdu_head)) {
> +				ath10k_warn("htt rx dropping due to decrypt-err\n");
>  				ath10k_htt_rx_free_msdu_chain(msdu_head);
>  				continue;
>  			}
> @@ -975,6 +976,13 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
>  			info.skb     = msdu_head;
>  			info.fcs_err = ath10k_htt_rx_has_fcs_err(msdu_head);
>  			info.mic_err = ath10k_htt_rx_has_mic_err(msdu_head);
> +
> +			if (info.fcs_err)
> +				ath10k_warn("htt rx has FCS err\n");
> +
> +			if (info.mic_err)
> +				ath10k_warn("htt rx has MIC err\n");
> +

Do we really want to print warning messages to the user when these
happen? I would consider these as "business as usual" in 802.11 world,
not a problem in driver.

> --- a/drivers/net/wireless/ath/ath10k/txrx.c
> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
> @@ -259,7 +259,7 @@ void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
>  	status->freq = ch->center_freq;
>  
>  	ath10k_dbg(ATH10K_DBG_DATA,
> -		   "rx skb %p len %u %s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u\n",
> +		   "rx skb %p len %u %s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag: 0x%x fcs-err: %i\n",
>  		   info->skb,
>  		   info->skb->len,
>  		   status->flag == 0 ? "legacy" : "",
> @@ -271,7 +271,7 @@ void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
>  		   status->rate_idx,
>  		   status->vht_nss,
>  		   status->freq,
> -		   status->band);
> +		   status->band, status->flag, info->fcs_err);

This makes sense, but please use the style used in ath10k debug messages:

"... band %u flag 0x%x fcs-err %i\n"

And as status->flag is u32, maybe 0x%08x makes it easier to read and
compare?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
