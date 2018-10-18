Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDCog-0002wC-8j
 for ath10k@lists.infradead.org; Thu, 18 Oct 2018 18:14:49 +0000
Received: by mail-ed1-x544.google.com with SMTP id c1-v6so29129643ede.5
 for <ath10k@lists.infradead.org>; Thu, 18 Oct 2018 11:14:27 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46])
 by smtp.gmail.com with ESMTPSA id y32-v6sm8051231edb.66.2018.10.18.11.14.23
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Oct 2018 11:14:23 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id x31-v6so29112818edd.8
 for <ath10k@lists.infradead.org>; Thu, 18 Oct 2018 11:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20181013005504.46399-1-briannorris@chromium.org>
 <20181013005504.46399-3-briannorris@chromium.org>
 <CAD=FV=VvaNTqEEC8XuOZ4ekNtPaj-KO3WdENQ6evweMjp8yoew@mail.gmail.com>
In-Reply-To: <CAD=FV=VvaNTqEEC8XuOZ4ekNtPaj-KO3WdENQ6evweMjp8yoew@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Thu, 18 Oct 2018 11:14:11 -0700
Message-ID: <CA+ASDXM0K3dVxg-Q5gJFOQkciLo424p2HtoYgu=AYYCRBfrnCQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] ath10k: snoc: relax voltage requirements
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
Cc: govinds@codeaurora.org, linux-wireless@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, swboyd@chromium.org, Kalle Valo <kvalo@qca.qualcomm.com>

On Thu, Oct 18, 2018 at 10:56 AM Doug Anderson <dianders@chromium.org> wrote:
> On Fri, Oct 12, 2018 at 5:55 PM Brian Norris <briannorris@chromium.org> wrote:
> >
> > I rarely see drivers specify precise voltage requirements like this, but
> > if we really have to...let's at least give a little wiggle room. Board
> > designs (and accompanying device trees) may not provide exactly the
> > voltage listed here, and we shouldn't fail to probe just because of
> > this.
> >
> > Round these ranges down to the nearest volt, and provide a 0.05V margin.
> > The regulator should provide its own supported ranges, which will
> > helpfully intersect with these ranges.
> >
> > I would just as well remove these ranges entirely, but if I understand
> > correctly, there's some reason that QCOM SoC's like to set zero /
> > non-zero voltages.
>
> Yeah, I'll try to up-prioritize working on making that better
> (assuming others like my ideas in that area).

Ah, OK, so my understanding is correct? (I feel like I've bumped into
this multiple times, but it probably didn't stick because it makes so
little sense to me.)

> >  static struct ath10k_vreg_info vreg_cfg[] = {
> > -       {NULL, "vdd-0.8-cx-mx", 800000, 800000, 0, 0, false},
> > -       {NULL, "vdd-1.8-xo", 1800000, 1800000, 0, 0, false},
> > -       {NULL, "vdd-1.3-rfa", 1304000, 1304000, 0, 0, false},
> > -       {NULL, "vdd-3.3-ch0", 3312000, 3312000, 0, 0, false},
> > +       {NULL, "vdd-0.8-cx-mx", 800000, 850000, 0, 0, false},
> > +       {NULL, "vdd-1.8-xo", 1800000, 1850000, 0, 0, false},
> > +       {NULL, "vdd-1.3-rfa", 1300000, 1350000, 0, 0, false},
> > +       {NULL, "vdd-3.3-ch0", 3300000, 3350000, 0, 0, false},
>
> These look fine to me.  I find it really funny that this array has all
> those load values and they're all 0, but that's not new to your patch.

Indeed, funny. It's also funny to have that 'required' field, which is
all 'false' -- but that kinda goes to your binding review too: there's
an overabundant use of "optional", to avoid defining real requirements
on a per-IP basis.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
