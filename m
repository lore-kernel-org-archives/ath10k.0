Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jowDj-0006DR-On
 for ath10k@lists.infradead.org; Fri, 26 Jun 2020 21:49:16 +0000
Received: by mail-vs1-xe44.google.com with SMTP id s18so6271842vsi.6
 for <ath10k@lists.infradead.org>; Fri, 26 Jun 2020 14:49:15 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42])
 by smtp.gmail.com with ESMTPSA id p189sm1748868vsp.28.2020.06.26.14.49.13
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2020 14:49:13 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id 64so3404vsl.3
 for <ath10k@lists.infradead.org>; Fri, 26 Jun 2020 14:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <1593193967-29897-1-git-send-email-pillair@codeaurora.org>
 <CAD=FV=V_ynwukeR92nbJXkuQ7OAW4mLaTjxko7fXt5aEfDUNhA@mail.gmail.com>
In-Reply-To: <CAD=FV=V_ynwukeR92nbJXkuQ7OAW4mLaTjxko7fXt5aEfDUNhA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 Jun 2020 14:49:01 -0700
Message-ID: <CAD=FV=XJDmGbEJQ1U-VDuN2p0+V+uRm_1=DwBnDPmPQsXqS4ZA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Add interrupt summary based CE processing
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
To: Rakesh Pillai <pillair@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

Hi,

On Fri, Jun 26, 2020 at 2:37 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Jun 26, 2020 at 10:53 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
> >
> > Currently the NAPI processing loops through all
> > the copy engines and processes a particular copy
> > engine is the copy completion is set for that copy
> > engine. The host driver is not supposed to access
> > any copy engine register after clearing the interrupt
> > status register.
> >
> > This might result in kernel crash like the one below
> > [ 1159.220143] Call trace:
> > [ 1159.220170]  ath10k_snoc_read32+0x20/0x40 [ath10k_snoc]
> > [ 1159.220193]  ath10k_ce_per_engine_service_any+0x78/0x130 [ath10k_core]
> > [ 1159.220203]  ath10k_snoc_napi_poll+0x38/0x8c [ath10k_snoc]
> > [ 1159.220270]  net_rx_action+0x100/0x3b0
> > [ 1159.220312]  __do_softirq+0x164/0x30c
> > [ 1159.220345]  run_ksoftirqd+0x2c/0x64
> > [ 1159.220380]  smpboot_thread_fn+0x1b0/0x288
> > [ 1159.220405]  kthread+0x11c/0x12c
> > [ 1159.220423]  ret_from_fork+0x10/0x18
> >
> > To avoid such a scenario, we generate an interrupt
> > summary by reading the copy completion for all the
> > copy engine before actually processing any of them.
> > This will avoid reading the interrupt status register
> > for any CE after the interrupt status is cleared.
> >
> > Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > ---
> >  drivers/net/wireless/ath/ath10k/ce.c | 63 ++++++++++++++++++++++--------------
> >  drivers/net/wireless/ath/ath10k/ce.h |  5 +--
> >  2 files changed, 42 insertions(+), 26 deletions(-)
>
> I'm not an expert on this driver, but your change seems sane to me.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> With your patch I can no longer find a place to put in a magic delay
> and reproduce the crash, thus:
>
> Tested-by: Douglas Anderson <dianders@chromium.org>
>
>
> If it matters, my WiFi firmware reports this:
>
> WLAN.HL.3.2.2-00490-QCAHLSWMTPL-1
>
> ...and it should also be WCN3990.

I should also note that, while I'm not terribly familiar with Kalle's
workflow, I would have expected to see him in the "To:" list.  I've
added him, but it's possible he'll need you to repost the patch with
him in the "To:" list.

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
