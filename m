Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDCVl-0001vl-Ok
 for ath10k@lists.infradead.org; Thu, 18 Oct 2018 17:55:37 +0000
Received: by mail-vs1-xe43.google.com with SMTP id c205so23647535vsd.3
 for <ath10k@lists.infradead.org>; Thu, 18 Oct 2018 10:54:54 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id s188sm4623010vkb.31.2018.10.18.10.54.51
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Oct 2018 10:54:51 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id c89so6476129uac.10
 for <ath10k@lists.infradead.org>; Thu, 18 Oct 2018 10:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20181013005504.46399-1-briannorris@chromium.org>
 <20181013005504.46399-2-briannorris@chromium.org>
In-Reply-To: <20181013005504.46399-2-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Oct 2018 10:54:39 -0700
Message-ID: <CAD=FV=U0uK25mL9_d1nVB7uBV+vR9YTqGm1iTQgzdNuZO5O5_A@mail.gmail.com>
Subject: Re: [PATCH 2/4] ath10k: snoc: fix unabalanced regulator error handling
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
Cc: kvalo@qca.qualcomm.com, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

Hi,

On Fri, Oct 12, 2018 at 5:55 PM Brian Norris <briannorris@chromium.org> wrote:
> +       if (vreg_info->settle_delay)
> +               udelay(vreg_info->settle_delay);

Not new to your patch, but this seems like a duplication of what the
regulator framework is doing for you.  There are plenty of regulator
properties describing lots of different types delays and that would be
the place to put it.  Doing so makes it automatically easy for boards
to specify a different delay if they have different ramp
characteristics (like someone put a bigger capacitor on the line or
somesuch).

At the moment it would be easy for someone to submit a patch to kill
the settle delay in this driver this since the entire vreg_cfg table
has 0 for the settle delay.


> +static int __ath10k_snoc_vreg_off(struct ath10k *ar,
> +                                 struct ath10k_vreg_info *vreg_info)
> +{
> +       int ret;
> +
> +       ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc regulator %s being disabled\n",
> +                  vreg_info->name);
> +
> +       ret = regulator_disable(vreg_info->reg);
> +       if (ret)
> +               ath10k_err(ar, "failed to disable regulator %s\n",
> +                          vreg_info->name);
> +
> +       ret = regulator_set_load(vreg_info->reg, 0);
> +       if (ret < 0)
> +               ath10k_err(ar, "failed to set load %s\n", vreg_info->name);
> +
> +       ret = regulator_set_voltage(vreg_info->reg, 0, vreg_info->max_v);
> +       if (ret)
> +               ath10k_err(ar, "failed to set voltage %s\n", vreg_info->name);

Not new to your patch, but ick, forcing someone to manually set the
load / voltage of a regulator that they've turned off is silly.  It's
only list to try to send a patch to remedy this situation.  Let me try
to put that higher on my plate.


...just like with the clock patch I suspect that some of this is
duplicating the "regulator_bulk" APIs.  ...though I guess maybe we
can't use those too easily until we can avoid setting voltage and
current so much...  In any case, your patch overall looks good and an
improvement.


Reviewed-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
