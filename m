Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtJGs-0005cX-GW
 for ath10k@lists.infradead.org; Wed, 08 Jul 2020 23:14:35 +0000
Received: by mail-vs1-xe44.google.com with SMTP id a17so100053vsq.6
 for <ath10k@lists.infradead.org>; Wed, 08 Jul 2020 16:14:33 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id i7sm140233vsi.10.2020.07.08.16.14.30
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 16:14:31 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id o25so144015uar.1
 for <ath10k@lists.infradead.org>; Wed, 08 Jul 2020 16:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200707101712.1.I4d2f85ffa06f38532631e864a3125691ef5ffe06@changeid>
 <CA+ASDXMXtwdV4BNL1GSj8DY-3z8-dZ=1hP8Xv_R-AjKvJs0NMw@mail.gmail.com>
In-Reply-To: <CA+ASDXMXtwdV4BNL1GSj8DY-3z8-dZ=1hP8Xv_R-AjKvJs0NMw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 Jul 2020 16:14:18 -0700
Message-ID: <CAD=FV=WU2dUFtG4W6o574DRN9VV+u_B5-ThqV3BogjztBibyLQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Keep track of which interrupts fired,
 don't poll them
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
To: Brian Norris <briannorris@chromium.org>
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Rakesh Pillai <pillair@codeaurora.org>, "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>, Abhishek Kumar <kuabhs@google.com>

Hi,

On Wed, Jul 8, 2020 at 4:03 PM Brian Norris <briannorris@chromium.org> wrote:
>
> On Tue, Jul 7, 2020 at 10:18 AM Douglas Anderson <dianders@chromium.org> wrote:
> > diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
> > index a440aaf74aa4..666ce384a1d8 100644
> > --- a/drivers/net/wireless/ath/ath10k/ce.h
> > +++ b/drivers/net/wireless/ath/ath10k/ce.h
> ...
> > @@ -376,12 +377,9 @@ static inline u32 ath10k_ce_interrupt_summary(struct ath10k *ar)
> >  {
> >         struct ath10k_ce *ce = ath10k_ce_priv(ar);
> >
> > -       if (!ar->hw_params.per_ce_irq)
>
> If I'm reading correctly, you're removing the only remaining use of
> 'per_ce_irq'. Should we kill the field entirely?

Ah, you are indeed correct!  I hadn't noticed that.  Unless I hear
otherwise, I'll send a v2 tomorrow that removes the field entirely.


> Or perhaps we should
> leave some kind of WARN_ON() (BUG_ON()?) if this function is called
> erroneously with per_ce_irq==true? But I suppose this driver is full
> of landmines if the CE API is used incorrectly.

Yeah, I originally had a WARN_ON() here and then took it out because
it seemed like extra overhead and, as you said, someone writing the
code has to know how the API works already I think.  ...but I'll add
it back in if people want.


> > -               return CE_WRAPPER_INTERRUPT_SUMMARY_HOST_MSI_GET(
> > -                       ce->bus_ops->read32((ar), CE_WRAPPER_BASE_ADDRESS +
> > -                       CE_WRAPPER_INTERRUPT_SUMMARY_ADDRESS));
> > -       else
> > -               return ath10k_ce_gen_interrupt_summary(ar);
> > +       return CE_WRAPPER_INTERRUPT_SUMMARY_HOST_MSI_GET(
> > +               ce->bus_ops->read32((ar), CE_WRAPPER_BASE_ADDRESS +
> > +               CE_WRAPPER_INTERRUPT_SUMMARY_ADDRESS));
> >  }
> >
> >  /* Host software's Copy Engine configuration. */
>
> > diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
> > index a3dd06f6ac62..5095d1893681 100644
> > --- a/drivers/net/wireless/ath/ath10k/snoc.h
> > +++ b/drivers/net/wireless/ath/ath10k/snoc.h
> > @@ -78,6 +78,7 @@ struct ath10k_snoc {
> >         unsigned long flags;
> >         bool xo_cal_supported;
> >         u32 xo_cal_data;
> > +       DECLARE_BITMAP(pending_ce_irqs, CE_COUNT_MAX);
>
> Do you need to clear this map if the interface goes down or if there's
> a firmware crash? Right now, I don't think there's a guarantee that
> we'll run through a NAPI poll in those cases, which is the only place
> you clear the map, and if the hardware/firmware has been reset, the
> state map is probably not valid.

Seems like a good idea.  Is the right place at the start of
ath10k_snoc_hif_start()?


> Otherwise, looks OK to me:
>
> Reviewed-by: Brian Norris <briannorris@chromium.org>

Thanks for the review!

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
