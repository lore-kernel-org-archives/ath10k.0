Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVbUm-0001r2-E4
 for ath10k@lists.infradead.org; Tue, 28 May 2019 12:46:25 +0000
Received: by mail-vs1-xe42.google.com with SMTP id w124so12662672vsb.11
 for <ath10k@lists.infradead.org>; Tue, 28 May 2019 05:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <1556417825-13713-1-git-send-email-wgong@codeaurora.org>
 <CANEJEGug_YregN5vZq_R=ppUV5ptb4WUq_TB+JApzQ4DEO_AfQ@mail.gmail.com>
 <36950ff25c0747629e60ccb68819e93a@aptaiexm02f.ap.qualcomm.com>
 <87pnour4jg.fsf@codeaurora.org>
In-Reply-To: <87pnour4jg.fsf@codeaurora.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 28 May 2019 14:45:46 +0200
Message-ID: <CAPDyKFrs1rO38yd-yQ50y2Oo1JE=R2hWM-5FWp=Ng_TM1df7ww@mail.gmail.com>
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
To: Kalle Valo <kvalo@codeaurora.org>, Wen Gong <wgong@qti.qualcomm.com>, Grant Grundler <grundler@google.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

On Tue, 7 May 2019 at 11:35, Kalle Valo <kvalo@codeaurora.org> wrote:
>
> + Ulf to give comments from SDIO point of view

Apologize for the delay, it's been a busy period.

>
> Wen Gong <wgong@qti.qualcomm.com> writes:
>
> >> -----Original Message-----
> >> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Grant
> >> Grundler
> >> Sent: Saturday, May 4, 2019 2:01 AM
> >> To: Wen Gong <wgong@codeaurora.org>
> >> Cc: linux-wireless@vger.kernel.org; ath10k@lists.infradead.org
> >> Subject: [EXT] Re: [PATCH] ath10k: remove mmc_hw_reset while hif power
> >> down
> >>
> >> [repeating comments I made in the gerrit review for Chrome OS :
> >> https://chromium-
> >> review.googlesource.com/c/chromiumos/third_party/kernel/+/1585667
> >> ]
> >>
> >> On Sat, Apr 27, 2019 at 7:17 PM Wen Gong <wgong@codeaurora.org> wrote:
> >> >
> >> > For sdio 3.0 chip, the clock will drop from 200M Hz to 50M Hz after load
> >> > ath10k driver, it is because mmc_hw_reset will reset the sdio's power,
> >> > then mmc will consider it as sdio 2.0 and drop the clock.
> >>
> >> Wen,
> >> 5468e784c0600551ca03263f5255a375c05f88e7 commit message gives
> >> reasons
> >> for adding the mmc_hw_reset() call. The commit message for removing
> >> gives different reason for removal. Both are good but second one is
> >> incomplete.
> >>
> >> The commit message for removal should ALSO explain why adding this
> >> call wasn't necessary in the first place OR move the call to a
> >> different code path.
> >>
> >> > Remove mmc_hw_reset will avoid the drop of clock.
> >>
> >> This commit message makes it clear the original patch introduced a new
> >> problem. But the original patch fixed a different problem and that
> >> this proposed change seems likely to re-introduce and the commit
> >> message should explain why that isn't true (or how the original was
> >> fixed differently)
> >
> > The mmc_hw_reset's effect depends on the hardware layout/configure
> > software's behavior, recently it will effect the clock of sdio for the
> > platform I used. And it will still work well without mmc_hw_reset for
> > the platform I Used currently. If sdio cannot work on other platform,
> > I think it can add flag in ath10k_hw_params_list for the platform to
> > call the mmc_hw_reset depends on the flag.
>
> I don't see how you can use ath10k_hw_params_list to separate SDIO
> controller functionality, I assume that's the real reason for difference
> of functionality? Maybe this is a bug on the SDIO controller?

Ideally mmc_hw_reset() should not make the SDIO card to become
re-initialized differently than it was originally.

However, as that is the case here, it sounds like that there is a bug
somewhere. Perhaps the boot-loader have done some pre-initialization,
which isn't covered in the second case, or maybe a bug in the mmc host
driver.

>
> Ulf, what do you think? Any suggestions? Full discussion here:
>
> https://patchwork.kernel.org/patch/10920563/
>
> --
> Kalle Valo

In the end, it seems like this needs a more detailed debug study, to
figure out what exactly happens during the re-initialization of the
SDIO card, rather than just papering over the problem by removing the
call to mmc_hw_reset() in the SDIO func driver. Hope this helps.

Kind regards
Uffe

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
