Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk1-f193.google.com ([209.85.221.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwos-0002t8-CK
 for ath10k@lists.infradead.org; Wed, 26 Aug 2020 14:54:49 +0000
Received: by mail-vk1-f193.google.com with SMTP id s81so492447vkb.3
 for <ath10k@lists.infradead.org>; Wed, 26 Aug 2020 07:54:32 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47])
 by smtp.gmail.com with ESMTPSA id k12sm413191vke.4.2020.08.26.07.54.29
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2020 07:54:29 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id o184so1095433vsc.0
 for <ath10k@lists.infradead.org>; Wed, 26 Aug 2020 07:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <1593193967-29897-1-git-send-email-pillair@codeaurora.org>
 <CAD=FV=V_ynwukeR92nbJXkuQ7OAW4mLaTjxko7fXt5aEfDUNhA@mail.gmail.com>
 <CAD=FV=XJDmGbEJQ1U-VDuN2p0+V+uRm_1=DwBnDPmPQsXqS4ZA@mail.gmail.com>
 <CA+ASDXNOCFZhdNMDk9XTuC2H+owQ0+wHipDbkJAGnU9q7BXz_w@mail.gmail.com>
 <871rlcx8uv.fsf@codeaurora.org>
 <CALhWmc1PbTKhrkaPn9yfpx3gZHAMuR-bPY=4_o4wQHv_H5D9dA@mail.gmail.com>
 <CALhWmc3i9Z+KiG1cJNvpSWNsiFhOa5jBw=XfcFz_gKwi_5QibA@mail.gmail.com>
 <CALhWmc1B0+SONV6_AF+nUzgxZdekPD3sZuhrsmwVQx1Q-cgT_g@mail.gmail.com>
 <CALhWmc0qF5stKRcikjwbeFmE-32hNCDazgQdqTMidUyt7u-T1Q@mail.gmail.com>
 <CALhWmc0JtQZE5CfLPb1WnwhE9wCYsjE-53kYWbwtFCs1k7FrCQ@mail.gmail.com>
 <CALhWmc11OefTh6Ov5GqP-yHMVTUO4r9CxqkdHT1F3yzor72v7g@mail.gmail.com>
 <000201d65f51$83d2ac60$8b780520$@codeaurora.org>
 <877dtlcvs1.fsf@codeaurora.org>
In-Reply-To: <877dtlcvs1.fsf@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 26 Aug 2020 07:54:17 -0700
Message-ID: <CAD=FV=XMPZhS6NHGcxTu5DWbsg5PvL=8Je2JyQF=zX-hY3R0Lw@mail.gmail.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Peter Oh <peter.oh@eero.com>, Rakesh Pillai <pillair@codeaurora.org>

Hi,

On Wed, Aug 26, 2020 at 7:44 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> (Guys, PLEASE edit your quotes. These long emails my use of patchwork
> horrible.)
>
> "Rakesh Pillai" <pillair@codeaurora.org> writes:
>
> >> -----Original Message-----
> >> From: Peter Oh <peter.oh@eero.com>
> >> Sent: Tuesday, July 21, 2020 7:03 AM
> >> To: Kalle Valo <kvalo@codeaurora.org>
> >> Cc: Brian Norris <briannorris@chromium.org>; Doug Anderson
> >> <dianders@chromium.org>; linux-wireless <linux-
> >> wireless@vger.kernel.org>; Rakesh Pillai <pillair@codeaurora.org>; ath10k
> >> <ath10k@lists.infradead.org>; LKML <linux-kernel@vger.kernel.org>
> >> Subject: Re: [PATCH] ath10k: Add interrupt summary based CE processing
> >>
> >> I'll take my word back.
> >> It's not this patch problem, but by others.
> >> I have 2 extra patches before the 3 patches so my system looks like
> >>
> >> backports from ath.git 5.6-rc1 + linux kernel 4.4 (similar to OpenWrt)
> >> On top of the working system, I cherry-picked these 5.
> >>
> >> #1.
> >> ath10k: Avoid override CE5 configuration for QCA99X0 chipsets
> >> ath.git commit 521fc37be3d879561ca5ab42d64719cf94116af0
> >> #2.
> >> ath10k: Fix NULL pointer dereference in AHB device probe
> >> wireless-drivers.git commit 1cfd3426ef989b83fa6176490a38777057e57f6c
> >> #3.
> >> ath10k: Add interrupt summary based CE processing
> >> https://patchwork.kernel.org/patch/11628299/
> >
> > This patch is applicable only for snoc target WCN3990, since there is
> > a check for per_ce_irq. For PCI targets, per_ce_irq is false, and
> > hence follows a different path.
>
> This information should be in the commit log. But I have a patch in the
> pending branch which removes per_ce_irq:
>
> [v2,2/2] ath10k: Get rid of "per_ce_irq" hw param
>
> https://patchwork.kernel.org/patch/11654621/
>
> So how will multilple hardware support work then?

In theory my patches and Rakesh's patches could be squashed.  His
patch made things marginally better but still didn't really address
the root cause.  When addressing the root cause, I ended up deleting
most of the code that he introduced.  I think it'd be fine to just
apply all 3 patches (Rakesh's plus my 2) and the end result will be
good, but if desired either Rakesh or I could post a squashed series.


> In theory I like the patch but there's no information in the patch if
> this works or breaks other hardware, especially QCA9884 or QCA6174 PCI
> devices. I really need some kind of assurance that this works with all
> ath10k devices, not just WCN3990 which you are working on.
>
> I have written about this in the wiki:
>
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#hardware_families

The end result is that it should only affect "wcn3990-wifi", which is
what this was tested on.  Specifically you can see that "snoc.c" only
includes one compatible string: "qcom,wcn3990-wifi".  You can also see
that the only place that has "per_ce_irq" set to true is
"WCN3990_HW_1_0_DEV_VERSION".



-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
