Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipA2R-0005tt-CI
 for ath10k@lists.infradead.org; Wed, 08 Jan 2020 12:02:17 +0000
Received: by mail-oi1-x243.google.com with SMTP id z64so2397648oia.4
 for <ath10k@lists.infradead.org>; Wed, 08 Jan 2020 04:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20200108031957.22308-1-wgong@codeaurora.org>
 <20200108031957.22308-2-wgong@codeaurora.org>
In-Reply-To: <20200108031957.22308-2-wgong@codeaurora.org>
From: Justin Capella <justincapella@gmail.com>
Date: Wed, 8 Jan 2020 04:02:02 -0800
Message-ID: <CAMrEMU-UTtxJ-eMoNEBONXJCTpaZCcGc8Mu34wqQNXkpVz=gJA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ath10k: add refcount for ath10k_core_restart
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

I think this might break the "wedged" state.

Would simply not taking action unless STATE ON avoid the problems with
multiple calls to _restart? ie:

diff --git a/drivers/net/wireless/ath/ath10k/core.c
b/drivers/net/wireless/ath/ath10k/core.c
index 5ec16ce19b69..a6c11b2bc97c 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2198,11 +2198,8 @@ static int ath10k_init_hw_params(struct ath10k *ar)
  return 0;
 }

-static void ath10k_core_restart(struct work_struct *work)
+static void inline _ath10k_core_restart(struct ath10k *ar)
 {
- struct ath10k *ar = container_of(work, struct ath10k, restart_work);
- int ret;
-
  set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);

  /* Place a barrier to make sure the compiler doesn't reorder
@@ -2232,14 +2229,28 @@ static void ath10k_core_restart(struct
work_struct *work)
  */
  cancel_work_sync(&ar->set_coverage_class_work);

+ ath10k_halt(ar);
+ ath10k_scan_finish(ar);
+ ieee80211_restart_hw(ar->hw);
+
+ ret = ath10k_coredump_submit(ar);
+ if (ret)
+ ath10k_warn(ar, "failed to send firmware crash dump via devcoredump:
%d", ret);
+
+ complete(&ar->driver_recovery);
+}
+
+static void ath10k_core_restart(struct work_struct *work)
+{
+ struct ath10k *ar = container_of(work, struct ath10k, restart_work);
+ int ret;
+
  mutex_lock(&ar->conf_mutex);

  switch (ar->state) {
  case ATH10K_STATE_ON:
  ar->state = ATH10K_STATE_RESTARTING;
- ath10k_halt(ar);
- ath10k_scan_finish(ar);
- ieee80211_restart_hw(ar->hw);
+ _ath10k_core_restart(ar);
  break;
  case ATH10K_STATE_OFF:
  /* this can happen if driver is being unloaded
@@ -2262,13 +2273,6 @@ static void ath10k_core_restart(struct work_struct *work)
  }

  mutex_unlock(&ar->conf_mutex);
-
- ret = ath10k_coredump_submit(ar);
- if (ret)
- ath10k_warn(ar, "failed to send firmware crash dump via devcoredump: %d",
-     ret);
-
- complete(&ar->driver_recovery);
 }

 static void ath10k_core_set_coverage_class_work(struct work_struct *work)

On Tue, Jan 7, 2020 at 7:20 PM Wen Gong <wgong@codeaurora.org> wrote:
>
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
>         struct ath10k *ar = container_of(work, struct ath10k, restart_work);
>         int ret;
> +       int restart_count;
> +
> +       restart_count = atomic_add_return(1, &ar->restart_count);
> +       if (restart_count > 1) {
> +               ath10k_warn(ar, "can not restart, count: %d\n", restart_count);
> +               atomic_dec(&ar->restart_count);
> +               return;
> +       }
>
>         set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
>
> @@ -2231,6 +2239,11 @@ static void ath10k_core_restart(struct work_struct *work)
>
>         mutex_lock(&ar->conf_mutex);
>
> +       if (ar->state != ATH10K_STATE_ON) {
> +               ath10k_warn(ar, "state is not on: %d\n", ar->state);
> +               atomic_dec(&ar->restart_count);
> +       }
> +
>         switch (ar->state) {
>         case ATH10K_STATE_ON:
>                 ar->state = ATH10K_STATE_RESTARTING;
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
