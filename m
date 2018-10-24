Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFRMS-0003Ee-EA
 for ath10k@lists.infradead.org; Wed, 24 Oct 2018 22:10:46 +0000
Received: by mail-pg1-x541.google.com with SMTP id 32-v6so2998718pgu.2
 for <ath10k@lists.infradead.org>; Wed, 24 Oct 2018 15:10:33 -0700 (PDT)
Date: Wed, 24 Oct 2018 15:10:29 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH 2/4] ath10k: snoc: fix unabalanced regulator error handling
Message-ID: <20181024221028.GA44244@rodete-desktop-imager.corp.google.com>
References: <20181013005504.46399-1-briannorris@chromium.org>
 <20181013005504.46399-2-briannorris@chromium.org>
 <CAD=FV=U0uK25mL9_d1nVB7uBV+vR9YTqGm1iTQgzdNuZO5O5_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=U0uK25mL9_d1nVB7uBV+vR9YTqGm1iTQgzdNuZO5O5_A@mail.gmail.com>
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
Cc: kvalo@qca.qualcomm.com, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

Hi,

On Thu, Oct 18, 2018 at 10:54:39AM -0700, Doug Anderson wrote:
> On Fri, Oct 12, 2018 at 5:55 PM Brian Norris <briannorris@chromium.org> wrote:
> > +       if (vreg_info->settle_delay)
> > +               udelay(vreg_info->settle_delay);
> 
> Not new to your patch, but this seems like a duplication of what the
> regulator framework is doing for you.  There are plenty of regulator
> properties describing lots of different types delays and that would be
> the place to put it.  Doing so makes it automatically easy for boards
> to specify a different delay if they have different ramp
> characteristics (like someone put a bigger capacitor on the line or
> somesuch).
> 
> At the moment it would be easy for someone to submit a patch to kill
> the settle delay in this driver this since the entire vreg_cfg table
> has 0 for the settle delay.

Thanks! I'll probably take a stab at killing the excessive
specifications in these tables, in a later patch. Would be nice to get
the bugfixes landed first though.

> > +static int __ath10k_snoc_vreg_off(struct ath10k *ar,
> > +                                 struct ath10k_vreg_info *vreg_info)
> > +{
> > +       int ret;
> > +
> > +       ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc regulator %s being disabled\n",
> > +                  vreg_info->name);
> > +
> > +       ret = regulator_disable(vreg_info->reg);
> > +       if (ret)
> > +               ath10k_err(ar, "failed to disable regulator %s\n",
> > +                          vreg_info->name);
> > +
> > +       ret = regulator_set_load(vreg_info->reg, 0);
> > +       if (ret < 0)
> > +               ath10k_err(ar, "failed to set load %s\n", vreg_info->name);
> > +
> > +       ret = regulator_set_voltage(vreg_info->reg, 0, vreg_info->max_v);
> > +       if (ret)
> > +               ath10k_err(ar, "failed to set voltage %s\n", vreg_info->name);
> 
> Not new to your patch, but ick, forcing someone to manually set the
> load / voltage of a regulator that they've turned off is silly.  It's
> only list to try to send a patch to remedy this situation.  Let me try

I'm guessing you meant:

s/only/on my/

> to put that higher on my plate.
> 
> 
> ...just like with the clock patch I suspect that some of this is
> duplicating the "regulator_bulk" APIs.  ...though I guess maybe we
> can't use those too easily until we can avoid setting voltage and
> current so much...  In any case, your patch overall looks good and an
> improvement.

I'll admit I've never used the bulk APIs. But I might give them a try as
a follow-up cleanup. (As before: would be nice to have the simpler
bugfix first.)

> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
