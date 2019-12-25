Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ik8NB-0002TQ-A4
 for ath10k@lists.infradead.org; Wed, 25 Dec 2019 15:14:54 +0000
Received: by mail-oi1-x243.google.com with SMTP id i1so8123077oie.8
 for <ath10k@lists.infradead.org>; Wed, 25 Dec 2019 07:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20191225120002.11163-1-wgong@codeaurora.org>
 <20191225120002.11163-2-wgong@codeaurora.org>
In-Reply-To: <20191225120002.11163-2-wgong@codeaurora.org>
From: Justin Capella <justincapella@gmail.com>
Date: Wed, 25 Dec 2019 07:14:38 -0800
Message-ID: <CAMrEMU-p3+HRZYW6TzXwZSwhxj9oJ9JW1Rg=ZysJ3fr0rm45Ng@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ath10k: add refcount for ath10k_core_restart
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
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>

This does not only effect SDIO.

Why a semaphore / count? Could the conf_mutex be held earlier, or
perhaps change the state to ATH10K_STATE_RESTARTING first?
ath10k_reconfig_complete is also called in mac.c when channel is changed so

On Wed, Dec 25, 2019 at 4:01 AM Wen Gong <wgong@codeaurora.org> wrote:
>
> When it has more than one restart_work queued meanwhile, the 2nd
> restart_work is very esay to break the 1st restart work and lead
> recovery fail.
>
> Add a ref count to allow only one restart work running untill
> device successfully recovered.
>
> This patch only effect sdio chips.
>
> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00029.
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
>  drivers/net/wireless/ath/ath10k/core.h | 2 ++
>  drivers/net/wireless/ath/ath10k/mac.c  | 1 +
>  3 files changed, 11 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 91f131b87efc..4e0e8c86bdd4 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2199,6 +2199,14 @@ static void ath10k_core_restart(struct work_struct *work)
>  {
>         struct ath10k *ar = container_of(work, struct ath10k, restart_work);
>         int ret;
> +       int restart_count;
> +
> +       restart_count = atomic_inc_and_test(&ar->restart_count);
> +       if (restart_count > 1) {
> +               ath10k_warn(ar, "can not restart, count: %d\n", restart_count);
> +               atomic_dec(&ar->restart_count);
> +               return;
> +       }
>
>         set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> index e57b2e7235e3..810c99f2dc0e 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -982,6 +982,8 @@ struct ath10k {
>         /* protected by conf_mutex */
>         u8 ps_state_enable;
>
> +       atomic_t restart_count;
> +
>         bool nlo_enabled;
>         bool p2p;
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 3856edba7915..bc1574145e66 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -7208,6 +7208,7 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
>                 ath10k_info(ar, "device successfully recovered\n");
>                 ar->state = ATH10K_STATE_ON;
>                 ieee80211_wake_queues(ar->hw);
> +               atomic_dec(&ar->restart_count);
>         }
>
>         mutex_unlock(&ar->conf_mutex);
> --
> 2.23.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
