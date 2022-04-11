Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D145C433F5
	for <ath10k@archiver.kernel.org>; Mon, 11 Apr 2022 23:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wneZaEC0VxJhGqMUkFkIl1Vnsg8N34O6IjUQ2kGNWGY=; b=IRayv6cUKDqodv
	LVpFixQ/rWFYsuzNNVtIuC30M9oMcE8EefJ6p8JtZHv2n1T4u5Pv7MBcGr97TuppVj3WLNdBM/RAm
	aWzZjXNqcfla4jFaU7GwuHSyd2PEA14TzzfFZQ/Sm3kUzHWZa7DPb7Zv4wVs6z3T3QZeCDEIbSK3c
	wXA6RmDWoCwmSAo/OYOifIw7q+GrD0FPrzAskgGHfJITyb3Rf2xmQ/xNO+dwdtLX6htBSZm8d+K9U
	apuxr6p8zeB6rKoCUJp0ObSas1XIvP5tjdQ5vKnc+dv/8opdfL9zPuGoNyA9hHaGaF2bltOn6QkVY
	FJVID0ZcU6owR1UAdVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne3PT-00Aneg-Ns; Mon, 11 Apr 2022 23:25:27 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne3PQ-00Ancn-15
 for ath10k@lists.infradead.org; Mon, 11 Apr 2022 23:25:25 +0000
Received: by mail-io1-xd31.google.com with SMTP id k25so20495052iok.8
 for <ath10k@lists.infradead.org>; Mon, 11 Apr 2022 16:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZMH2dd4dVn+sN1LqPK8n3ci7MR968dRhguypuScj1CQ=;
 b=ijlqLq1r5A5qgzxLGR/tGje43sMc4riYXtrunxa/mGx8f4zKJEFIf05RsL5cjMGewb
 VJZ2x/gZ72iq00W0xsklSEyD8uxS4AmHHHCnMhTXShKF3y97oKuk3nJimNiE4EA2RsDF
 Qcp0uGmDhPpr4bQjm4OMVo+tlEsLlBhw5kNXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZMH2dd4dVn+sN1LqPK8n3ci7MR968dRhguypuScj1CQ=;
 b=MGLCAAo6ld3D2zIiJhGntLWPMtqBhOZ9da3mWhgFIu5pqIgfq/OkkK99OxJcCs8QyM
 eLedDTv2LuWLrckJBPt00T9mhVFqcUSKeLv9f95MVLjY42EwsfV7Cjv4kJJAb58xQFGs
 PcFnjtLBghiYyKi/Ks9N/e2S4mFJaja8QlKKpGT5EvC8AQXrs6gexSMRZ5rf6mWwuXNM
 RYG5gI3G4//TE1GEzPg1sIPNFQNXugr5XDbIi881t09qio8p52XDJCXIL7YXIfpfUuj0
 OVdMHmSXsxjSJyFK5ItEZe+JbWOmgV0OHiEEIW2h5yrU352Jyqxam9vKO86XBKILgPd1
 DuDg==
X-Gm-Message-State: AOAM5314N1Am+/b+BgXHqodl/CjTCDAsRVZl0JFt5cSo4L+m5M/Tu/x9
 C2tQNAFKgLLA7OLH5z/2MWrQDM8QoIm6JosOo9Tb1Q==
X-Google-Smtp-Source: ABdhPJymNLhei+3dXAexxhqaNraz8xNcaGrsEziyPA34FmXI+XSwyqsdE2qSztrB1S+TZxsnyQinZIyNAhyA3Y54alQ=
X-Received: by 2002:a05:6602:1682:b0:63d:cac5:fd0a with SMTP id
 s2-20020a056602168200b0063dcac5fd0amr14271798iow.132.1649719521434; Mon, 11
 Apr 2022 16:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220107200417.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
 <CAD=FV=W5fHP8K-PcoYWxYHiDWnPUVQQzOzw=REbuJSSqGeVVfg@mail.gmail.com>
 <87sfrqqfzy.fsf@kernel.org>
 <CAD=FV=U0Qw-OnKJg8SWk9=e=B0qgqnaTHpuR0cRA0WCmSHSJYQ@mail.gmail.com>
In-Reply-To: <CAD=FV=U0Qw-OnKJg8SWk9=e=B0qgqnaTHpuR0cRA0WCmSHSJYQ@mail.gmail.com>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Mon, 11 Apr 2022 16:25:10 -0700
Message-ID: <CACTWRwtpYBokTehRE0_zSdSjio6Ga1yqdCfj1TNck7SqOT8o_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: search for default BDF name provided in DT
To: Doug Anderson <dianders@chromium.org>
Cc: Kalle Valo <kvalo@kernel.org>, Rakesh Pillai <pillair@codeaurora.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, ath10k <ath10k@lists.infradead.org>, 
 netdev <netdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_162524_110182_F0896CA9 
X-CRM114-Status: GOOD (  52.27  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi All,

Apologies for the late reply, too many things at the same time. Just a
quick note, Qcomm provided a new BDF file with support for
'bus=snoc,qmi-board-id=ff' as well, so even without this patch, the
non-programmed devices(with board-id=0xff) would work. However, for
optimization of the BDF search strategy, the above mentioned strategy
would still not work:
- The stripping of full Board name would not work if board-id itself
is not programmed i.e. =0xff
e.g. for
 'bus=snoc,qmi-board-id=ff,qmi-chip-id=320,variant=GO_LAZOR' => no match
 'bus=snoc,qmi-board-id=ff,qmi-chip-id=320' => no match
 'bus=snoc,qmi-board-id=ff' => no match
 'bus=snoc' => no match
because all the BDFs contains board-id=67

So with this DT patch specifically for case 'bus=snoc,qmi-board-id=ff'
=> no match, we fallback to default case ( the one provided in DT)
i.e. 'bus=snoc,qmi-board-id=67' => match . I do not see how exactly
the driver can know that it should check for a board-id of 67.

However, to still remove dependency on the DT, we can make the
board-id as no-op if it is not programmed i.e. if the board-id=ff then
we would pick any BDF that match 'bus=snoc,qmi-board-id=<XX>' where XX
can be any arbitrary number. Thoughts ?

-Abhishek

On Thu, Mar 10, 2022 at 4:28 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Mar 10, 2022 at 2:06 AM Kalle Valo <kvalo@kernel.org> wrote:
> >
> > Doug Anderson <dianders@chromium.org> writes:
> >
> > > Hi,
> > >
> > > On Fri, Jan 7, 2022 at 12:05 PM Abhishek Kumar <kuabhs@chromium.org> wrote:
> > >>
> > >> There can be cases where the board-2.bin does not contain
> > >> any BDF matching the chip-id+board-id+variant combination.
> > >> This causes the wlan probe to fail and renders wifi unusable.
> > >> For e.g. if the board-2.bin has default BDF as:
> > >> bus=snoc,qmi-board-id=67 but for some reason the board-id
> > >> on the wlan chip is not programmed and read 0xff as the
> > >> default value. In such cases there won't be any matching BDF
> > >> because the board-2.bin will be searched with following:
> > >> bus=snoc,qmi-board-id=ff
> >
> > I just checked, in ath10k-firmware WCN3990/hw1.0/board-2.bin we have
> > that entry:
> >
> > BoardNames[1]: 'bus=snoc,qmi-board-id=ff'
> >
> > >> To address these scenarios, there can be an option to provide
> > >> fallback default BDF name in the device tree. If none of the
> > >> BDF names match then the board-2.bin file can be searched with
> > >> default BDF names assigned in the device tree.
> > >>
> > >> The default BDF name can be set as:
> > >> wifi@a000000 {
> > >>         status = "okay";
> > >>         qcom,ath10k-default-bdf = "bus=snoc,qmi-board-id=67";
> > >
> > > Rather than add a new device tree property, wouldn't it be good enough
> > > to leverage the existing variant?
> >
> > I'm not thrilled either adding this to Device Tree, we should keep the
> > bindings as simple as possible.
> >
> > > Right now I think that the board file contains:
> > >
> > > 'bus=snoc,qmi-board-id=67.bin'
> > > 'bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_LAZOR.bin'
> > > 'bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_POMPOM.bin'
> > > 'bus=snoc,qmi-board-id=67,qmi-chip-id=4320,variant=GO_LAZOR.bin'
> > > 'bus=snoc,qmi-board-id=67,qmi-chip-id=4320,variant=GO_POMPOM.bin'
> > >
> > > ...and, on lazor for instance, we have:
> > >
> > > qcom,ath10k-calibration-variant = "GO_LAZOR";
> > >
> > > The problem you're trying to solve is that on some early lazor
> > > prototype hardware we didn't have the "board-id" programmed we could
> > > get back 0xff from the hardware. As I understand it 0xff always means
> > > "unprogrammed".
> > >
> > > It feels like you could just have a special case such that if the
> > > hardware reports board ID of 0xff and you don't get a "match" that you
> > > could just treat 0xff as a wildcard. That means that you'd see the
> > > "variant" in the device tree and pick one of the "GO_LAZOR" entries.
> > >
> > > Anyway, I guess it's up to the people who spend more time in this file
> > > which they'd prefer, but that seems like it'd be simple and wouldn't
> > > require a bindings addition...
> >
> > In ath11k we need something similar for that I have been thinking like
> > this:
> >
> > 'bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_LAZOR'
> >
> > 'bus=snoc,qmi-board-id=67,qmi-chip-id=320'
> >
> > 'bus=snoc,qmi-board-id=67'
> >
> > 'bus=snoc'
> >
> > Ie. we drop one attribute at a time and try to find a suitable board
> > file. Though I'm not sure if it's possible to find a board file which
> > works with many different hardware, but the principle would be at least
> > that. Would something like that work in your case?
>
> I'll leave it for Abhishek to comment for sure since he's been the one
> actively involved in keeping track of our board-2.bin file. As far as
> I know:
>
> * Mostly we need this for pre-production hardware that developers
> inside Google and Qualcomm still have sitting around on their desks. I
> guess some people are even still using this pre-production hardware to
> surf the web?
>
> * In the ideal world, we think that the best calibration would be to
> use the board-specific one in these cases. AKA if board_id is 0xff
> (unprogrammed) and variant is "GO_LAZOR" then the best solution would
> be to use the settings for board id 0x67 and variant "GO_LAZOR". This
> _ought_ to be better settings than the default 0xff settings without
> the "GO_LAZOR".
>
> * In reality, we're probably OK as long as _some_ reasonable settings
> get picked. WiFi might not be super range optimized but at least it
> will still come up and work.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
