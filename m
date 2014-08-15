Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XIGFm-0007u5-6s
 for ath10k@lists.infradead.org; Fri, 15 Aug 2014 12:05:07 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: extra logging for core-restart state change logic.
References: <1407272099-6271-1-git-send-email-greearb@candelatech.com>
Date: Fri, 15 Aug 2014 15:04:11 +0300
In-Reply-To: <1407272099-6271-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Tue, 5 Aug 2014 13:54:59
 -0700")
Message-ID: <87egwij6x0.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---

[...]

> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -700,6 +700,7 @@ static void ath10k_core_restart(struct work_struct *work)
>  	switch (ar->state) {
>  	case ATH10K_STATE_ON:
>  		ar->state = ATH10K_STATE_RESTARTING;
> +		ath10k_warn("core-restart, going to state RESTARTING from ON\n");
>  		del_timer_sync(&ar->scan.timeout);
>  		ath10k_reset_scan((unsigned long)ar);
>  		ieee80211_restart_hw(ar->hw);
> @@ -713,10 +714,11 @@ static void ath10k_core_restart(struct work_struct *work)
>  		/* hw restart might be requested from multiple places */
>  		break;
>  	case ATH10K_STATE_RESTARTED:
> -		ar->state = ATH10K_STATE_WEDGED;
>  		/* fall through */
>  	case ATH10K_STATE_WEDGED:
> -		ath10k_warn("device is wedged, will not restart\n");
> +		ath10k_warn("device is wedged, will not restart (state %d)\n",
> +			ar->state);
> +		ar->state = ATH10K_STATE_WEDGED;
>  		break;
>  	}

I think state prints should be debug messages, not part of error
messages. For example, we could add new debug level ATH10K_DBG_CORE or
something like that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
