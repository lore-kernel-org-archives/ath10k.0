Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xdand-0005Gg-Vg
 for ath10k@lists.infradead.org; Mon, 13 Oct 2014 08:16:14 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k: speed up hw recovery
References: <1412847527-25983-1-git-send-email-michal.kazior@tieto.com>
 <1412847527-25983-4-git-send-email-michal.kazior@tieto.com>
Date: Mon, 13 Oct 2014 11:15:41 +0300
In-Reply-To: <1412847527-25983-4-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 9 Oct 2014 11:38:47 +0200")
Message-ID: <877g049yhe.fsf@kamboji.qca.qualcomm.com>
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

> In some cases hw recovery was taking an absurdly
> long time due to ath10k waiting for things that
> would never really complete.
>
> Instead of waiting for inevitable timeouts poke
> all completions and wakequeues and check if it's
> still worth waiting.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -685,6 +685,20 @@ static void ath10k_core_restart(struct work_struct *work)
>  {
>  	struct ath10k *ar = container_of(work, struct ath10k, restart_work);
>  
> +	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
> +	barrier();

Please document why the barrier is needed.

> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -371,6 +371,11 @@ enum ath10k_dev_flags {
>  	/* Indicates that ath10k device is during CAC phase of DFS */
>  	ATH10K_CAC_RUNNING,
>  	ATH10K_FLAG_CORE_REGISTERED,
> +
> +	/* Device has crashed and needs to restart. This indicates any pending
> +	 * waiters should immediately cancel instead of waiting for a time out.
> +	 */
> +	ATH10K_FLAG_CRASH_FLUSH,
>  };

Instead of a dev flag, should this actually be a new state to enum
ath10k_state? The reason I ask, I don't see how we would use this flag
with other states than with ATH10K_STATE_ON. Or is this needed because
of locking?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
