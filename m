Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG923-0004pP-4E
 for ath10k@lists.infradead.org; Wed, 19 Feb 2014 15:25:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: set the mactime of ieee80211_rx_status
References: <1392197866-1261-1-git-send-email-yeohchunyeow@gmail.com>
Date: Wed, 19 Feb 2014 17:25:28 +0200
In-Reply-To: <1392197866-1261-1-git-send-email-yeohchunyeow@gmail.com>
 (Chun-Yeow Yeoh's message of "Wed, 12 Feb 2014 17:37:46 +0800")
Message-ID: <877g8rxgyf.fsf@kamboji.qca.qualcomm.com>
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
To: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Chun-Yeow Yeoh <yeohchunyeow@gmail.com> writes:

> Retrieve the mactime of ieee80211_rx_status based on received
> data frame. The value is obtained from the htt_rx_indication_ppdu
> structure and only available in 32-bit.
>
> Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>

Why? Where do you need tsf exactly? And what bug are you actually fixing
here?

> --- a/drivers/net/wireless/ath/ath10k/txrx.c
> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
> @@ -258,6 +258,12 @@ void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
>  	status->band = ch->band;
>  	status->freq = ch->center_freq;
>  
> +	if (info->rate.info0 & HTT_RX_INDICATION_INFO0_END_VALID) {
> +		/* TSF available only in 32-bit */
> +		status->mactime = info->tsf & 0xffffffff;
> +		status->flag |= RX_FLAG_MACTIME_END;
> +	}

Do we get some regressions because of proving only a 32 bit TSF? Which
one is better, provide a 32-bit TSF or not at all?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
