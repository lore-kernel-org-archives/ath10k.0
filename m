Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMcUz-0002s9-3Y
 for ath10k@lists.infradead.org; Fri, 03 May 2019 18:01:31 +0000
Received: by mail-io1-xd42.google.com with SMTP id r18so5947428ioh.2
 for <ath10k@lists.infradead.org>; Fri, 03 May 2019 11:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <1556417825-13713-1-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1556417825-13713-1-git-send-email-wgong@codeaurora.org>
From: Grant Grundler <grundler@google.com>
Date: Fri, 3 May 2019 11:01:14 -0700
Message-ID: <CANEJEGug_YregN5vZq_R=ppUV5ptb4WUq_TB+JApzQ4DEO_AfQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: remove mmc_hw_reset while hif power down
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

[repeating comments I made in the gerrit review for Chrome OS :
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1585667
]

On Sat, Apr 27, 2019 at 7:17 PM Wen Gong <wgong@codeaurora.org> wrote:
>
> For sdio 3.0 chip, the clock will drop from 200M Hz to 50M Hz after load
> ath10k driver, it is because mmc_hw_reset will reset the sdio's power,
> then mmc will consider it as sdio 2.0 and drop the clock.

Wen,
5468e784c0600551ca03263f5255a375c05f88e7 commit message gives reasons
for adding the mmc_hw_reset() call. The commit message for removing
gives different reason for removal. Both are good but second one is
incomplete.

The commit message for removal should ALSO explain why adding this
call wasn't necessary in the first place OR move the call to a
different code path.

> Remove mmc_hw_reset will avoid the drop of clock.

This commit message makes it clear the original patch introduced a new
problem. But the original patch fixed a different problem and that
this proposed change seems likely to re-introduce and the commit
message should explain why that isn't true (or how the original was
fixed differently)

cheers,
grant

>
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00007-QCARMSWP-1.
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/sdio.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index fae56c6..f1d2af8 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -1433,10 +1433,6 @@ static void ath10k_sdio_hif_power_down(struct ath10k *ar)
>                 return;
>         }
>
> -       ret = mmc_hw_reset(ar_sdio->func->card->host);
> -       if (ret)
> -               ath10k_warn(ar, "unable to reset sdio: %d\n", ret);
> -
>         sdio_release_host(ar_sdio->func);
>
>         ar_sdio->is_disabled = true;
> --
> 1.9.1
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
