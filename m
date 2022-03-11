Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D32AC433EF
	for <ath10k@archiver.kernel.org>; Fri, 11 Mar 2022 00:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybhkauTYcE74lqyKPXwfPA30OjSYHF3LgEpeciO63ng=; b=Nz6rAj9v4p0ino
	mR/vGaHGJpBkwGgvSsj8z32b/0MC82E1D9MH5F6ubZqXh1epOlsHkuxqL+pZwa7hwUAc2HH1C4NNk
	Y0mJ8MspV1x69igxX1VUwwnFSV845xvxBjqpHcMuv80T2nzKsH7gZcD1VjDjZTxj+AXjXqc8HfeUg
	cczNX3xed4vsVzuM1Ngng3D7laeZW8q0DTuU3XRA56R+/3VwdY4o6bF+c0HGZ+551Ozb5DdMXKeLf
	izRO9iAQP8q5anUmgv/ueHqGhyMBa/yb/okhp0j92GQ2C5El4C8M+Hzw17Q/9yodblKs7NZFJ1I3a
	Dx+hv7FnWADpWs3I8fYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nST8i-00EPrK-GJ; Fri, 11 Mar 2022 00:28:16 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nST8g-00EPqu-4O
 for ath10k@lists.infradead.org; Fri, 11 Mar 2022 00:28:15 +0000
Received: by mail-ed1-x535.google.com with SMTP id x5so9014894edd.11
 for <ath10k@lists.infradead.org>; Thu, 10 Mar 2022 16:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KJotzhJGvWm+YufqU6PpQz3ArjHus4r0EIp+aEcC2NQ=;
 b=oU2DYJ9ubZ08kyUFNEx64k2K9ZSCSnvY0QqZ0Ba5UuSoVuPchLbVNNS2cdlTIFV6Q9
 7DYZEpM/tvSuXQlWZw3A7X9peM2zKTIBtbvLMzymLGZoBym4VM9RwpYhC11Ameeb7HAK
 YApwdT56YOWvIUz5M040GJaZ0RzQa2zxjqWzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KJotzhJGvWm+YufqU6PpQz3ArjHus4r0EIp+aEcC2NQ=;
 b=I7zyXujCh/EwiovhB07h+LUF+qFfuieGssqepQDOkEcXjk09B/4aHQvLc6frBYFrpS
 ypzQx0sutcIMCqqc14GOWdQACdKt7Tb67De+2cD8GcvIGmd++csd5tNWTsQaNStW16lu
 zUdxNx085wyvRkfnfEHvKuSs4TwyHO5aUW8bvC/dCNG7liFH/dvidpwI1axRCnJhhN1j
 udmAormiC1g77DZNmmk5CsgBjUoH8IMxVhk7Xv6+MCBkjGwhyTCGMx9686ofy79DkuIk
 w5rxAyVRkErD2KjE59x1uJqunBqoRRoRCOto6MMd5+KW1OgsgQ3HERqkpPRD/4mKKd0c
 v2Rg==
X-Gm-Message-State: AOAM531oqd+fJN62w6UYjHYd0cuJnNIJlxtIcIu452w5aEnXw8SQmTP+
 hyawE8k1/ZE1+yxvpp2OXB+4bE9X9ZlqbUsC9E8=
X-Google-Smtp-Source: ABdhPJycqQcdlHy0btYB4xe707KNqJ/OAv+J+K+qXWFU1EfKxmASWyokvq4Xhbwd2cu+j+b8rf3nPg==
X-Received: by 2002:a05:6402:4386:b0:416:9ea3:5ee2 with SMTP id
 o6-20020a056402438600b004169ea35ee2mr6834855edc.298.1646958491422; 
 Thu, 10 Mar 2022 16:28:11 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 z3-20020a056402274300b004169771bd91sm2622672edd.39.2022.03.10.16.28.10
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 16:28:10 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id q14so10625879wrc.4
 for <ath10k@lists.infradead.org>; Thu, 10 Mar 2022 16:28:10 -0800 (PST)
X-Received: by 2002:a5d:490f:0:b0:1f0:6791:a215 with SMTP id
 x15-20020a5d490f000000b001f06791a215mr5446099wrq.422.1646958490250; Thu, 10
 Mar 2022 16:28:10 -0800 (PST)
MIME-Version: 1.0
References: <20220107200417.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
 <CAD=FV=W5fHP8K-PcoYWxYHiDWnPUVQQzOzw=REbuJSSqGeVVfg@mail.gmail.com>
 <87sfrqqfzy.fsf@kernel.org>
In-Reply-To: <87sfrqqfzy.fsf@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Mar 2022 16:27:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U0Qw-OnKJg8SWk9=e=B0qgqnaTHpuR0cRA0WCmSHSJYQ@mail.gmail.com>
Message-ID: <CAD=FV=U0Qw-OnKJg8SWk9=e=B0qgqnaTHpuR0cRA0WCmSHSJYQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: search for default BDF name provided in DT
To: Kalle Valo <kvalo@kernel.org>
Cc: Abhishek Kumar <kuabhs@chromium.org>,
 Rakesh Pillai <pillair@codeaurora.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, ath10k <ath10k@lists.infradead.org>, 
 netdev <netdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_162814_213108_CEFA3307 
X-CRM114-Status: GOOD (  40.95  )
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

Hi,

On Thu, Mar 10, 2022 at 2:06 AM Kalle Valo <kvalo@kernel.org> wrote:
>
> Doug Anderson <dianders@chromium.org> writes:
>
> > Hi,
> >
> > On Fri, Jan 7, 2022 at 12:05 PM Abhishek Kumar <kuabhs@chromium.org> wrote:
> >>
> >> There can be cases where the board-2.bin does not contain
> >> any BDF matching the chip-id+board-id+variant combination.
> >> This causes the wlan probe to fail and renders wifi unusable.
> >> For e.g. if the board-2.bin has default BDF as:
> >> bus=snoc,qmi-board-id=67 but for some reason the board-id
> >> on the wlan chip is not programmed and read 0xff as the
> >> default value. In such cases there won't be any matching BDF
> >> because the board-2.bin will be searched with following:
> >> bus=snoc,qmi-board-id=ff
>
> I just checked, in ath10k-firmware WCN3990/hw1.0/board-2.bin we have
> that entry:
>
> BoardNames[1]: 'bus=snoc,qmi-board-id=ff'
>
> >> To address these scenarios, there can be an option to provide
> >> fallback default BDF name in the device tree. If none of the
> >> BDF names match then the board-2.bin file can be searched with
> >> default BDF names assigned in the device tree.
> >>
> >> The default BDF name can be set as:
> >> wifi@a000000 {
> >>         status = "okay";
> >>         qcom,ath10k-default-bdf = "bus=snoc,qmi-board-id=67";
> >
> > Rather than add a new device tree property, wouldn't it be good enough
> > to leverage the existing variant?
>
> I'm not thrilled either adding this to Device Tree, we should keep the
> bindings as simple as possible.
>
> > Right now I think that the board file contains:
> >
> > 'bus=snoc,qmi-board-id=67.bin'
> > 'bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_LAZOR.bin'
> > 'bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_POMPOM.bin'
> > 'bus=snoc,qmi-board-id=67,qmi-chip-id=4320,variant=GO_LAZOR.bin'
> > 'bus=snoc,qmi-board-id=67,qmi-chip-id=4320,variant=GO_POMPOM.bin'
> >
> > ...and, on lazor for instance, we have:
> >
> > qcom,ath10k-calibration-variant = "GO_LAZOR";
> >
> > The problem you're trying to solve is that on some early lazor
> > prototype hardware we didn't have the "board-id" programmed we could
> > get back 0xff from the hardware. As I understand it 0xff always means
> > "unprogrammed".
> >
> > It feels like you could just have a special case such that if the
> > hardware reports board ID of 0xff and you don't get a "match" that you
> > could just treat 0xff as a wildcard. That means that you'd see the
> > "variant" in the device tree and pick one of the "GO_LAZOR" entries.
> >
> > Anyway, I guess it's up to the people who spend more time in this file
> > which they'd prefer, but that seems like it'd be simple and wouldn't
> > require a bindings addition...
>
> In ath11k we need something similar for that I have been thinking like
> this:
>
> 'bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_LAZOR'
>
> 'bus=snoc,qmi-board-id=67,qmi-chip-id=320'
>
> 'bus=snoc,qmi-board-id=67'
>
> 'bus=snoc'
>
> Ie. we drop one attribute at a time and try to find a suitable board
> file. Though I'm not sure if it's possible to find a board file which
> works with many different hardware, but the principle would be at least
> that. Would something like that work in your case?

I'll leave it for Abhishek to comment for sure since he's been the one
actively involved in keeping track of our board-2.bin file. As far as
I know:

* Mostly we need this for pre-production hardware that developers
inside Google and Qualcomm still have sitting around on their desks. I
guess some people are even still using this pre-production hardware to
surf the web?

* In the ideal world, we think that the best calibration would be to
use the board-specific one in these cases. AKA if board_id is 0xff
(unprogrammed) and variant is "GO_LAZOR" then the best solution would
be to use the settings for board id 0x67 and variant "GO_LAZOR". This
_ought_ to be better settings than the default 0xff settings without
the "GO_LAZOR".

* In reality, we're probably OK as long as _some_ reasonable settings
get picked. WiFi might not be super range optimized but at least it
will still come up and work.

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
