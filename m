Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtJfY-0007bd-3E
 for ath10k@lists.infradead.org; Wed, 08 Jul 2020 23:40:04 +0000
Received: by mail-qv1-xf42.google.com with SMTP id e3so152108qvo.10
 for <ath10k@lists.infradead.org>; Wed, 08 Jul 2020 16:40:03 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com.
 [209.85.222.173])
 by smtp.gmail.com with ESMTPSA id x14sm1595543qki.65.2020.07.08.16.39.59
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 16:40:00 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id 145so131970qke.9
 for <ath10k@lists.infradead.org>; Wed, 08 Jul 2020 16:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200707101712.1.I4d2f85ffa06f38532631e864a3125691ef5ffe06@changeid>
 <CA+ASDXMXtwdV4BNL1GSj8DY-3z8-dZ=1hP8Xv_R-AjKvJs0NMw@mail.gmail.com>
 <CAD=FV=WU2dUFtG4W6o574DRN9VV+u_B5-ThqV3BogjztBibyLQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WU2dUFtG4W6o574DRN9VV+u_B5-ThqV3BogjztBibyLQ@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 8 Jul 2020 16:39:47 -0700
Message-ID: <CA+ASDXOwFnCcMC9g11FSVLvj2nepArJyihGvx3SU-XqySoJruw@mail.gmail.com>
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
To: Doug Anderson <dianders@chromium.org>
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Rakesh Pillai <pillair@codeaurora.org>, "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>, Abhishek Kumar <kuabhs@google.com>

On Wed, Jul 8, 2020 at 4:14 PM Doug Anderson <dianders@chromium.org> wrote:
> On Wed, Jul 8, 2020 at 4:03 PM Brian Norris <briannorris@chromium.org> wrote:
> > If I'm reading correctly, you're removing the only remaining use of
> > 'per_ce_irq'. Should we kill the field entirely?
>
> Ah, you are indeed correct!  I hadn't noticed that.  Unless I hear
> otherwise, I'll send a v2 tomorrow that removes the field entirely.

A healthy middle ground might put that in a patch 2, so it's easily
dropped if desired. *shrug*

> > Or perhaps we should
> > leave some kind of WARN_ON() (BUG_ON()?) if this function is called
> > erroneously with per_ce_irq==true? But I suppose this driver is full
> > of landmines if the CE API is used incorrectly.
>
> Yeah, I originally had a WARN_ON() here and then took it out because
> it seemed like extra overhead and, as you said, someone writing the
> code has to know how the API works already I think.  ...but I'll add
> it back in if people want.

I believe WARN_ON() and friends have a built-in unlikely(), so it
shouldn't have much overhead. But I don't really mind either way.

> > Do you need to clear this map if the interface goes down or if there's
> > a firmware crash? Right now, I don't think there's a guarantee that
> > we'll run through a NAPI poll in those cases, which is the only place
> > you clear the map, and if the hardware/firmware has been reset, the
> > state map is probably not valid.
>
> Seems like a good idea.  Is the right place at the start of
> ath10k_snoc_hif_start()?

Either there or in .power_down()/.power_up(). I think either would be
equally correct, but I'm not entirely sure if the semantic difference
is meaningful for this.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
