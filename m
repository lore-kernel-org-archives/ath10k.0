Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XIGRK-0004uX-Pt
 for ath10k@lists.infradead.org; Fri, 15 Aug 2014 12:17:03 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: logging for state change transitions.
References: <1407274934-5048-1-git-send-email-greearb@candelatech.com>
Date: Fri, 15 Aug 2014 15:16:33 +0300
In-Reply-To: <1407274934-5048-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Tue, 5 Aug 2014 14:42:14
 -0700")
Message-ID: <87a976j6ce.fsf@kamboji.qca.qualcomm.com>
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
> Print error if device failed to recover.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index b2e7303..ced5eca 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -3905,8 +3905,10 @@ static void ath10k_restart_complete(struct ieee80211_hw *hw)
>  	/* If device failed to restart it will be in a different state, e.g.
>  	 * ATH10K_STATE_WEDGED */
>  	if (ar->state == ATH10K_STATE_RESTARTED) {
> -		ath10k_info("device successfully recovered\n");
> +		ath10k_info("device successfully recovered (state RESTARTED to ON)\n");
>  		ar->state = ATH10K_STATE_ON;

Here I think state prints should be in debug level too.

> +	} else {
> +		ath10k_info("device failed to recover (state %d)\n", ar->state);
>  	}

And should this be ath10k_err() as it's an unrecoverable error?

Also I would prefer this kind of indentation:

	if (ar->state != ATH10K_STATE_RESTARTED) {
                ath10k_err("device failed to recover");
                goto out;
        }

	ath10k_info("device successfully recovered\n");
	ar->state = ATH10K_STATE_ON;

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
