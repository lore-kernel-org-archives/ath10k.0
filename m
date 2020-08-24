Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA9Kl-0008GX-1q
 for ath10k@lists.infradead.org; Mon, 24 Aug 2020 10:04:11 +0000
Received: by mail-yb1-xb41.google.com with SMTP id q3so4845548ybp.7
 for <ath10k@lists.infradead.org>; Mon, 24 Aug 2020 03:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <1598243612-4627-1-git-send-email-wgong@codeaurora.org>
 <CABPxzYLjys+cXXRM5J680ZOs+6VrYt=_3rWv-gqkCod=-A1VrA@mail.gmail.com>
 <fd98989a87f2a50655dc95bdcd535c0d@codeaurora.org>
In-Reply-To: <fd98989a87f2a50655dc95bdcd535c0d@codeaurora.org>
From: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Date: Mon, 24 Aug 2020 15:33:57 +0530
Message-ID: <CABPxzYKvPwtQwxMfRcv9jT+d92ErhYGR91SKBH86T3Rd2QH9Qg@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: add flag to protect napi operation to avoid
 dead loop hang for SDIO
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On Mon, Aug 24, 2020 at 3:10 PM Wen Gong <wgong@codeaurora.org> wrote:
>
> On 2020-08-24 16:35, Krishna Chaitanya wrote:
> > On Mon, Aug 24, 2020 at 10:03 AM Wen Gong <wgong@codeaurora.org> wrote:
> >>
> >> It happened "Kernel panic - not syncing: hung_task: blocked tasks"
> >> when
> >> test simulate crash and ifconfig down/rmmod meanwhile.
> >>
> ...
> >>
> >>  #ifdef CONFIG_PM
> > Even though your DUT is SDIO based we should be doing this in general
> > for all, no?
> > core_restart + hif_stop is common to all.
> this patch does not have core_restart.
I was referring to the combination which is causing the issue.

> I dit not hit the issue for others bus(PCIe,SNOC...), so I can not
> change them with a
> assumption they also have this issue.
But that doesn't make sense, the combination is being hit for others also.
(they should also endup calling napi_disable twice?) or they are using
some other check to avoid this (doesn't appear so from a quick look at the
code).

So, I am back to my initial guess that the SDIO specific async_rx_work is
causing/aggravating this issue.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
