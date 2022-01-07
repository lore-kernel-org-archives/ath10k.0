Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDECC433F5
	for <ath10k@archiver.kernel.org>; Fri,  7 Jan 2022 21:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wg0gOPqu4OIM5DJ72QV3JxokoeD4DOAK8VbNMXPsJpI=; b=LPs4EsKO9DkaC+
	ovFWTjYYqSEsas8/9OBV5hL6zm/AQWIkr24OzysG8V6f1Cqhn2tr7mjSuuY4ZAWhVFgOW1+Oot/iL
	mNbRIQQLCQbLVXj67GTIFuIPHc29/NMoLH3HBECkAXNA2mcxQ2kcwN6bE9XATDTIFF17OgGq8BhQh
	f9KENQ+g7lEbLZBzdAG4MrmhgT+UoqpuJZk2/pCQtwzetGdBsyKzj0foVqlnp8x4EBcShANnZReUF
	Us5L3X9NG4r/7He6T5pDr5FPNbXWji8+4iWg+uwQx8bh1QOhq3e2g29er0NUMmdIE3/1yHvMhnpux
	5m/hf6oVtG9ymuedSSOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5whV-005HLR-56; Fri, 07 Jan 2022 21:23:05 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5whS-005HKV-PJ
 for ath10k@lists.infradead.org; Fri, 07 Jan 2022 21:23:04 +0000
Received: by mail-il1-x12e.google.com with SMTP id 9so5591232ill.9
 for <ath10k@lists.infradead.org>; Fri, 07 Jan 2022 13:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gLPG68maHzuWQkm+1YT+E6wsnchCrh1nEIPBO2jLick=;
 b=ZUSjKTHkRHJvy2UfGzJr1qPKAQ9x2xc6LT2yVEJn/JlYNQ43chWeUkOVGmqJA9gSoA
 qQRsliX1Tz6To1gwCxVfxt3X3xor8NZ0fFGvpqI2zIHPUKCAUOZsdBz2gftGHoTf/CMA
 77MEFoTnyeYciVlgnsgmsQ2rQpslfmFAO5mhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gLPG68maHzuWQkm+1YT+E6wsnchCrh1nEIPBO2jLick=;
 b=bhUsrH+UVjXcFsRLX89H22s0XiyjTMY36LQzl1BlzXBVeTFq6/sGAS2SoY7JRAbza1
 Zu/jlkRQS6xYEjh+GnyDPqIAo4fRHz1hxH/jYYO3RWzExgZd2rpsMYPK5hTLzviY5ACw
 ULTot+c9jPvm1ygwpFp5Ya//DDdcAEIhbZCPNlMG0gDgzqnz7oBcchI7ngpQw5l5s5O5
 ZcI1/qM5LLWCnlWs5/eQpSg4EzmiFLW83bvsvwnYBv5ucm48q6dg1hP532g0Iiy55Dnv
 mceV6cRd+t4GS02L395+0Jt9N2Bp0lf6WY8/5Xs/InBu/epKwTmTgvV+cVaVDO/qdIpY
 5OaQ==
X-Gm-Message-State: AOAM531wS33L8iMM47mdmA/GDyVZT1JI6lTw5IiLG+Ryfs0mypfq5qZa
 myhkWz8KfDOHnT6+kIs26Ht/5OhOZ94ctw==
X-Google-Smtp-Source: ABdhPJzap0kGu1egGId0OigJHniV/DUqyPJ4lrE42XQrKGczRo2UT52upto39iOtcnOlmYGAuO0SDQ==
X-Received: by 2002:a05:6e02:1ba6:: with SMTP id
 n6mr32295674ili.296.1641590578283; 
 Fri, 07 Jan 2022 13:22:58 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id l11sm1910300ilq.74.2022.01.07.13.22.57
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 13:22:57 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id e128so8755281iof.1
 for <ath10k@lists.infradead.org>; Fri, 07 Jan 2022 13:22:57 -0800 (PST)
X-Received: by 2002:a02:c60e:: with SMTP id i14mr25520700jan.207.1641590577234; 
 Fri, 07 Jan 2022 13:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20220107200417.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
In-Reply-To: <20220107200417.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 Jan 2022 13:22:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W5fHP8K-PcoYWxYHiDWnPUVQQzOzw=REbuJSSqGeVVfg@mail.gmail.com>
Message-ID: <CAD=FV=W5fHP8K-PcoYWxYHiDWnPUVQQzOzw=REbuJSSqGeVVfg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: search for default BDF name provided in DT
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, Rakesh Pillai <pillair@codeaurora.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 ath10k <ath10k@lists.infradead.org>, netdev <netdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_132302_854276_63F10A29 
X-CRM114-Status: GOOD (  20.97  )
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

On Fri, Jan 7, 2022 at 12:05 PM Abhishek Kumar <kuabhs@chromium.org> wrote:
>
> There can be cases where the board-2.bin does not contain
> any BDF matching the chip-id+board-id+variant combination.
> This causes the wlan probe to fail and renders wifi unusable.
> For e.g. if the board-2.bin has default BDF as:
> bus=snoc,qmi-board-id=67 but for some reason the board-id
> on the wlan chip is not programmed and read 0xff as the
> default value. In such cases there won't be any matching BDF
> because the board-2.bin will be searched with following:
> bus=snoc,qmi-board-id=ff
> To address these scenarios, there can be an option to provide
> fallback default BDF name in the device tree. If none of the
> BDF names match then the board-2.bin file can be searched with
> default BDF names assigned in the device tree.
>
> The default BDF name can be set as:
> wifi@a000000 {
>         status = "okay";
>         qcom,ath10k-default-bdf = "bus=snoc,qmi-board-id=67";

Rather than add a new device tree property, wouldn't it be good enough
to leverage the existing variant? Right now I think that the board
file contains:

'bus=snoc,qmi-board-id=67.bin'
'bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_LAZOR.bin'
'bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_POMPOM.bin'
'bus=snoc,qmi-board-id=67,qmi-chip-id=4320,variant=GO_LAZOR.bin'
'bus=snoc,qmi-board-id=67,qmi-chip-id=4320,variant=GO_POMPOM.bin'

...and, on lazor for instance, we have:

qcom,ath10k-calibration-variant = "GO_LAZOR";

The problem you're trying to solve is that on some early lazor
prototype hardware we didn't have the "board-id" programmed we could
get back 0xff from the hardware. As I understand it 0xff always means
"unprogrammed".

It feels like you could just have a special case such that if the
hardware reports board ID of 0xff and you don't get a "match" that you
could just treat 0xff as a wildcard. That means that you'd see the
"variant" in the device tree and pick one of the "GO_LAZOR" entries.

Anyway, I guess it's up to the people who spend more time in this file
which they'd prefer, but that seems like it'd be simple and wouldn't
require a bindings addition...

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
