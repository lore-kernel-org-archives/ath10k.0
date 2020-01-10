Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iprXt-0000FA-4j
 for ath10k@lists.infradead.org; Fri, 10 Jan 2020 10:29:38 +0000
MIME-Version: 1.0
Date: Fri, 10 Jan 2020 18:29:34 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v4 1/2] ath10k: add refcount for ath10k_core_restart
In-Reply-To: <CAMrEMU-UTtxJ-eMoNEBONXJCTpaZCcGc8Mu34wqQNXkpVz=gJA@mail.gmail.com>
References: <20200108031957.22308-1-wgong@codeaurora.org>
 <20200108031957.22308-2-wgong@codeaurora.org>
 <CAMrEMU-UTtxJ-eMoNEBONXJCTpaZCcGc8Mu34wqQNXkpVz=gJA@mail.gmail.com>
Message-ID: <55ab2d64e78d51a9da587f276899e08b@codeaurora.org>
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
To: Justin Capella <justincapella@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>

On 2020-01-08 20:02, Justin Capella wrote:
> I think this might break the "wedged" state.
> 
> Would simply not taking action unless STATE ON avoid the problems with
> multiple calls to _restart? ie:
> 

ath10k_core_restart is one part of the recovery process,
after ath10k_core_restart, it has other things do in mac80211/ath10k...,
it need to make sure all the recovery 
finished(ath10k_reconfig_complete),
then the next recovery can start from ath10k_core_restart.

so it can not simply change like below.
> diff --git a/drivers/net/wireless/ath/ath10k/core.c
> b/drivers/net/wireless/ath/ath10k/core.c
> index 5ec16ce19b69..a6c11b2bc97c 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2198,11 +2198,8 @@ static int ath10k_init_hw_params(struct ath10k 
> *ar)
>   return 0;
>  }
> 
> -static void ath10k_core_restart(struct work_struct *work)
> +static void inline _ath10k_core_restart(struct ath10k *ar)
>  {
> - struct ath10k *ar = container_of(work, struct ath10k, restart_work);
> - int ret;
> -
>   set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
> 
>   /* Place a barrier to make sure the compiler doesn't reorder
> @@ -2232,14 +2229,28 @@ static void ath10k_core_restart(struct
> work_struct *work)
>   */
>   cancel_work_sync(&ar->set_coverage_class_work);
> 
> + ath10k_halt(ar);
> + ath10k_scan_finish(ar);
> + ieee80211_restart_hw(ar->hw);
> +
> + ret = ath10k_coredump_submit(ar);
> + if (ret)
> + ath10k_warn(ar, "failed to send firmware crash dump via devcoredump:
> %d", ret);
> +
> + complete(&ar->driver_recovery);
> +}
> +
> +static void ath10k_core_restart(struct work_struct *work)
> +{
> + struct ath10k *ar = container_of(work, struct ath10k, restart_work);
> + int ret;
> +
>   mutex_lock(&ar->conf_mutex);
> 
>   switch (ar->state) {
>   case ATH10K_STATE_ON:
>   ar->state = ATH10K_STATE_RESTARTING;
> - ath10k_halt(ar);
> - ath10k_scan_finish(ar);
> - ieee80211_restart_hw(ar->hw);
> + _ath10k_core_restart(ar);
>   break;
>   case ATH10K_STATE_OFF:
>   /* this can happen if driver is being unloaded
> @@ -2262,13 +2273,6 @@ static void ath10k_core_restart(struct 
> work_struct *work)
>   }
> 
>   mutex_unlock(&ar->conf_mutex);
> -
> - ret = ath10k_coredump_submit(ar);
> - if (ret)
> - ath10k_warn(ar, "failed to send firmware crash dump via devcoredump: 
> %d",
> -     ret);
> -
> - complete(&ar->driver_recovery);
>  }
> 
>  static void ath10k_core_set_coverage_class_work(struct work_struct 
> *work)
> 
> On Tue, Jan 7, 2020 at 7:20 PM Wen Gong <wgong@codeaurora.org> wrote:

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
