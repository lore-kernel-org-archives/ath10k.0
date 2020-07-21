Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxgKT-00075K-3N
 for ath10k@lists.infradead.org; Tue, 21 Jul 2020 00:40:21 +0000
Received: by mail-vs1-xe41.google.com with SMTP id x205so9468460vsc.11
 for <ath10k@lists.infradead.org>; Mon, 20 Jul 2020 17:40:17 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id i4sm3032265vkg.55.2020.07.20.17.40.15
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2020 17:40:15 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id c7so5658499uap.0
 for <ath10k@lists.infradead.org>; Mon, 20 Jul 2020 17:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <1593193967-29897-1-git-send-email-pillair@codeaurora.org>
 <CAD=FV=V_ynwukeR92nbJXkuQ7OAW4mLaTjxko7fXt5aEfDUNhA@mail.gmail.com>
 <CAD=FV=XJDmGbEJQ1U-VDuN2p0+V+uRm_1=DwBnDPmPQsXqS4ZA@mail.gmail.com>
 <CA+ASDXNOCFZhdNMDk9XTuC2H+owQ0+wHipDbkJAGnU9q7BXz_w@mail.gmail.com>
 <871rlcx8uv.fsf@codeaurora.org>
 <CALhWmc1PbTKhrkaPn9yfpx3gZHAMuR-bPY=4_o4wQHv_H5D9dA@mail.gmail.com>
In-Reply-To: <CALhWmc1PbTKhrkaPn9yfpx3gZHAMuR-bPY=4_o4wQHv_H5D9dA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 Jul 2020 17:40:02 -0700
Message-ID: <CAD=FV=XUpwVoxNPELFfWnKRYFornTFMvtgFaOgD7ij-fQNEvmQ@mail.gmail.com>
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
To: Peter Oh <peter.oh@eero.com>
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Rakesh Pillai <pillair@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>

Hi,

On Mon, Jul 20, 2020 at 5:33 PM Peter Oh <peter.oh@eero.com> wrote:
>
> I'm getting this panic on IPQ4019 system after cherry-picked this
> single patch on top of working system.
>
> [   14.226184] ath10k_ahb a000000.wifi: failed to receive initialized
> event from target: 80000000

A bit of a shot in the dark, but any chance you could try this atop it
and see if it helps?

https://lore.kernel.org/r/20200709082024.v2.1.I4d2f85ffa06f38532631e864a3125691ef5ffe06@changeid/

...most of this patch is gutted by that one.

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
