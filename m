Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fe1hQ-0004og-AK
 for ath10k@lists.infradead.org; Fri, 13 Jul 2018 17:17:45 +0000
Received: by mail-qt0-x242.google.com with SMTP id b15-v6so27699901qtp.11
 for <ath10k@lists.infradead.org>; Fri, 13 Jul 2018 10:17:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1531501683-32299-1-git-send-email-greearb@candelatech.com>
References: <1531501683-32299-1-git-send-email-greearb@candelatech.com>
From: =?UTF-8?Q?Micha=C5=82_Kazior?= <kazikcz@gmail.com>
Date: Fri, 13 Jul 2018 19:17:32 +0200
Message-ID: <CABvG-CUdxFE8NiFfUKyeApm9dXqNWtGUWUBV1q8Fn3WF7zUnuQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix vdev-start timeout on error
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, kvalo@codeaurora.org, ath10k@lists.infradead.org

On 13 July 2018 at 19:08,  <greearb@candelatech.com> wrote:
> From: Ben Greear <greearb@candelatech.com>
>
> The vdev-start-response message should cause the
> completion to fire, even in the error case.  Otherwise,
> the user still gets no useful information and everything
> is blocked until the timeout period.
>
> Add some warning text to print out the invalid status
> code to aid debugging.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>  drivers/net/wireless/ath/ath10k/wmi.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index a60de71..ec4cd1e 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -3443,12 +3443,18 @@ void ath10k_wmi_event_vdev_start_resp(struct ath10k *ar, struct sk_buff *skb)
>         ret = ath10k_wmi_pull_vdev_start(ar, skb, &arg);
>         if (ret) {
>                 ath10k_warn(ar, "failed to parse vdev start event: %d\n", ret);
> -               return;
> +               goto out;
>         }
>
> -       if (WARN_ON(__le32_to_cpu(arg.status)))
> -               return;
> +       if (WARN_ON_ONCE(__le32_to_cpu(arg.status))) {
> +               ath10k_warn(ar, "vdev-start-response reports status error: %d\n",
> +                           __le32_to_cpu(arg.status));
> +               /* Setup is done one way or another though, so we should still
> +                * do the completion, so don't return here.
> +                */
> +       }
>
> +out:
>         complete(&ar->vdev_setup_done);

With this the waiter can no longer tell if vdev_start succeeded or
not. It'll always think it succeeded even if arg.status or parsing
failed. Waiter instead of erroring out will continue to play out happy
scenario and may end up crashing firmware.

Not stalling is nice, but I'd argue the status should be propagated
back to the waiter so it can error-check.


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
