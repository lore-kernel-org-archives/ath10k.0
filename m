Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkvbV-00085n-9P
 for ath10k@lists.infradead.org; Thu, 15 May 2014 13:21:45 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 4/7] ath10k: wake up everything on core restart
References: <1399638957-20449-1-git-send-email-michal.kazior@tieto.com>
 <1399638957-20449-5-git-send-email-michal.kazior@tieto.com>
Date: Thu, 15 May 2014 16:21:18 +0300
In-Reply-To: <1399638957-20449-5-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 9 May 2014 14:35:54 +0200")
Message-ID: <87fvkb89f5.fsf@kamboji.qca.qualcomm.com>
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

> It makes sense to finish completions as they may
> be waited for while holding conf_mutex thus
> delaying hw restart.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 3f4d28f..bf7c323 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -709,6 +709,18 @@ void ath10k_core_restart(struct ath10k *ar)
>  	spin_lock_bh(&ar->data_lock);
>  	ar->wmi.drop = true;
>  	wake_up(&ar->wmi.tx_credits_wq);
> +
> +	complete(&ar->target_suspend);
> +	complete(&ar->debug.event_stats_compl);

We dropped this patchset already, but for the future, this patch
introduces a new warning:

   drivers/net/wireless/ath/ath10k/core.c: In function 'ath10k_core_restart':
>> drivers/net/wireless/ath/ath10k/core.c:714:14: error: 'struct ath10k'
>> has no member named 'debug'
     complete(&ar->debug.event_stats_compl);
                 ^

Maybe that complete call should be in debug.c?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
