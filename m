Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6dMa-0002T8-PI
 for ath10k@lists.infradead.org; Fri, 14 Aug 2020 17:19:37 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v4 1/2] ath10k: add refcount for ath10k_core_restart
References: <20200108031957.22308-1-wgong@codeaurora.org>
 <20200108031957.22308-2-wgong@codeaurora.org>
Date: Fri, 14 Aug 2020 20:19:19 +0300
In-Reply-To: <20200108031957.22308-2-wgong@codeaurora.org> (Wen Gong's message
 of "Wed, 8 Jan 2020 11:19:56 +0800")
Message-ID: <87imdlkuw8.fsf@codeaurora.org>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> When it has more than one restart_work queued meanwhile, the 2nd
> restart_work is very esay to break the 1st restart work and lead
> recovery fail.
>
> Add a ref count to allow only one restart work running untill
> device successfully recovered.
>
> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00029.
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 13 +++++++++++++
>  drivers/net/wireless/ath/ath10k/core.h |  2 ++
>  drivers/net/wireless/ath/ath10k/mac.c  |  1 +
>  3 files changed, 16 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 91f131b87efc..0e31846e6c89 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2199,6 +2199,14 @@ static void ath10k_core_restart(struct work_struct *work)
>  {
>  	struct ath10k *ar = container_of(work, struct ath10k, restart_work);
>  	int ret;
> +	int restart_count;
> +
> +	restart_count = atomic_add_return(1, &ar->restart_count);
> +	if (restart_count > 1) {
> +		ath10k_warn(ar, "can not restart, count: %d\n", restart_count);
> +		atomic_dec(&ar->restart_count);
> +		return;
> +	}

I have been thinking a different approach for this. I think another
option is to have a function like this:

ath10k_core_firmware_crashed()
{
        queue_work(ar->workqueue, &ar->restart_work);
}

In patch 1 we would convert all existing callers to call that
function instead of queue_work() directly.

In patch 2 we would add a new flag to enum ath10k_dev_flags, or maybe
should actually use existing ATH10K_FLAG_CRASH_FLUSH? Don't know yet
which one is better. Now the function would do:

ath10k_core_firmware_crashed()
{
        if (test_bit(flag))
                return

        set_bit(flag)                                
	queue_work(ar->workqueue, &ar->restart_work);
}

That way restart_work queue would be called only one time.

Though I'm not sure how ATH10K_STATE_WEDGED would behave after this
change, it might get broken. Ah, actually I think even this patch breaks
the WEDGED state. This firmware restart is tricky, difficult to say what
is the best approach. Michal, are you reading? :) Any ideas?

And after looking more about this patch I don't see the need for the new
ar->restart_count atomic variable. Checking for ATH10K_FLAG_CRASH_FLUSH
would do the same thing AFAICS.

And related to this, (in a separate patch) I think we should utilise
ATH10K_FLAG_CRASH_FLUSH more. For example in ath10k_wmi_cmd_send() to
not even try to send a WMI command if the flag is set. Basically all
hardware access should be disabled except what is needed to restart the
firmware.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
