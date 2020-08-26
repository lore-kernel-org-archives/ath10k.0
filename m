Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwuH-0006B2-Ql
 for ath10k@lists.infradead.org; Wed, 26 Aug 2020 15:00:18 +0000
Received: by mail-vs1-xe43.google.com with SMTP id b16so1099424vsl.6
 for <ath10k@lists.infradead.org>; Wed, 26 Aug 2020 08:00:08 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com.
 [209.85.221.177])
 by smtp.gmail.com with ESMTPSA id l84sm436067vkl.36.2020.08.26.08.00.05
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2020 08:00:05 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id k1so492479vkb.7
 for <ath10k@lists.infradead.org>; Wed, 26 Aug 2020 08:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200709082024.v2.1.I4d2f85ffa06f38532631e864a3125691ef5ffe06@changeid>
 <20200826145011.C4E48C43387@smtp.codeaurora.org>
In-Reply-To: <20200826145011.C4E48C43387@smtp.codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 26 Aug 2020 07:59:52 -0700
Message-ID: <CAD=FV=Uu4dnzeTB+DfecO5uZSJWjq4qbi4=Uwgy-QwPphLApBw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ath10k: Keep track of which interrupts fired,
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Rakesh Pillai <pillair@codeaurora.org>, netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, Abhishek Kumar <kuabhs@google.com>

Hi,

On Wed, Aug 26, 2020 at 7:51 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Douglas Anderson <dianders@chromium.org> wrote:
>
> > If we have a per CE (Copy Engine) IRQ then we have no summary
> > register.  Right now the code generates a summary register by
> > iterating over all copy engines and seeing if they have an interrupt
> > pending.
> >
> > This has a problem.  Specifically if _none_ if the Copy Engines have
> > an interrupt pending then they might go into low power mode and
> > reading from their address space will cause a full system crash.  This
> > was seen to happen when two interrupts went off at nearly the same
> > time.  Both were handled by a single call of ath10k_snoc_napi_poll()
> > but, because there were two interrupts handled and thus two calls to
> > napi_schedule() there was still a second call to
> > ath10k_snoc_napi_poll() which ran with no interrupts pending.
> >
> > Instead of iterating over all the copy engines, let's just keep track
> > of the IRQs that fire.  Then we can effectively generate our own
> > summary without ever needing to read the Copy Engines.
> >
> > Tested-on: WCN3990 SNOC WLAN.HL.3.2.2-00490-QCAHLSWMTPL-1
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Rakesh Pillai <pillair@codeaurora.org>
> > Reviewed-by: Brian Norris <briannorris@chromium.org>
> > Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
> My main concern of this patch is that there's no info how it works on other
> hardware families. For example, QCA9984 is very different from WCN3990. The
> best would be if someone can provide a Tested-on tags for other hardware (even
> some of them).

I simply don't have access to any other Atheros hardware.  Hopefully
others on this thread do, though?  ...but, if nothing else, I believe
code inspection shows that the only places that are affected by the
changes here are:

* Wifi devices that use "snoc.c".  The only compatible string listed
in "snoc.c" is wcn3990.

* Wifi devices that set "per_ce_irq" to true.  The only place in the
table where this is set to true is wcn3990.

While it is certainly possible that I messed up and somehow affected
other WiFi devices, the common bits of code in "ce.c" and "ce.h" are
fairly easy to validate so hopefully they look OK?

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
