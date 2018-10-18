Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDCXY-0003WC-AE
 for ath10k@lists.infradead.org; Thu, 18 Oct 2018 17:56:57 +0000
Received: by mail-vs1-xe44.google.com with SMTP id m5so23654537vsk.6
 for <ath10k@lists.infradead.org>; Thu, 18 Oct 2018 10:56:45 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id w131-v6sm4519649vkw.33.2018.10.18.10.56.42
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Oct 2018 10:56:42 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id f12so6485785uan.6
 for <ath10k@lists.infradead.org>; Thu, 18 Oct 2018 10:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20181013005504.46399-1-briannorris@chromium.org>
 <20181013005504.46399-3-briannorris@chromium.org>
In-Reply-To: <20181013005504.46399-3-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Oct 2018 10:56:30 -0700
Message-ID: <CAD=FV=VvaNTqEEC8XuOZ4ekNtPaj-KO3WdENQ6evweMjp8yoew@mail.gmail.com>
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
To: Brian Norris <briannorris@chromium.org>
Cc: kvalo@qca.qualcomm.com, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

Hi,
On Fri, Oct 12, 2018 at 5:55 PM Brian Norris <briannorris@chromium.org> wrote:
>
> I rarely see drivers specify precise voltage requirements like this, but
> if we really have to...let's at least give a little wiggle room. Board
> designs (and accompanying device trees) may not provide exactly the
> voltage listed here, and we shouldn't fail to probe just because of
> this.
>
> Round these ranges down to the nearest volt, and provide a 0.05V margin.
> The regulator should provide its own supported ranges, which will
> helpfully intersect with these ranges.
>
> I would just as well remove these ranges entirely, but if I understand
> correctly, there's some reason that QCOM SoC's like to set zero /
> non-zero voltages.

Yeah, I'll try to up-prioritize working on making that better
(assuming others like my ideas in that area).


> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index b63ae8b006b4..5a8e87339df2 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -47,10 +47,10 @@ static char *const ce_name[] = {
>  };
>
>  static struct ath10k_vreg_info vreg_cfg[] = {
> -       {NULL, "vdd-0.8-cx-mx", 800000, 800000, 0, 0, false},
> -       {NULL, "vdd-1.8-xo", 1800000, 1800000, 0, 0, false},
> -       {NULL, "vdd-1.3-rfa", 1304000, 1304000, 0, 0, false},
> -       {NULL, "vdd-3.3-ch0", 3312000, 3312000, 0, 0, false},
> +       {NULL, "vdd-0.8-cx-mx", 800000, 850000, 0, 0, false},
> +       {NULL, "vdd-1.8-xo", 1800000, 1850000, 0, 0, false},
> +       {NULL, "vdd-1.3-rfa", 1300000, 1350000, 0, 0, false},
> +       {NULL, "vdd-3.3-ch0", 3300000, 3350000, 0, 0, false},

These look fine to me.  I find it really funny that this array has all
those load values and they're all 0, but that's not new to your patch.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
