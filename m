Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E80C433F5
	for <ath10k@archiver.kernel.org>; Wed, 20 Apr 2022 00:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Js8KridzV6ph2vzx2UdJBMxJK6MlYW+0Hjd5Cyxkny4=; b=yJd6h1IE7B1e2p
	XZyhNcg6ksXXxhBPVO2W7/YI67jL9xvODSLnezy/E8rs3+k3r+DMH9S9zL+u1p9zRA0siNlFU9Ox/
	xy04JkBi1BYdbT7XIMvZQOKLzlo0bPM8wsvBCEircMHG2/GP473DnZWzX4cyAwrGjSPudOyPHjIaF
	87lZufPicvtONKAIwH9wZPG+o1puMQeTJAsGUnsBYOQsRkSIX0qVwVd/RSdoI9REohmBEMLHuhE6V
	HOP+Y/85AtqRF5YeAiGeXDXzhbf3Wt4rX68U/bRZIt/KtEsWwXxLgY3N22pnvVfhbUNC2BSblLEZT
	gKartAqOKKiqDhIb+n4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngyRE-006ikO-HX; Wed, 20 Apr 2022 00:43:20 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngyRB-006ijJ-KT
 for ath10k@lists.infradead.org; Wed, 20 Apr 2022 00:43:19 +0000
Received: by mail-il1-x12a.google.com with SMTP id t4so34276ilo.12
 for <ath10k@lists.infradead.org>; Tue, 19 Apr 2022 17:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l+ByOqKk3aTPDxOgi+MMXPoJaKvFYjmLHvE3XekD1Uk=;
 b=JmR0pcqjjI6YzateDyGtk1MhYbDzRKG/FbmqtGeN/mQoa5eGagsWoTWt7YHJ19A7yw
 IZvnTcD8zmglvHiaKtcUbQmYYQjwRPW4/B/maJVyPt69Vn+Df/Esf+QK+aBi8OOsffB2
 2ShP+sI29u2/BwgQ3bxIIHDCYwBU4J3ovXjSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l+ByOqKk3aTPDxOgi+MMXPoJaKvFYjmLHvE3XekD1Uk=;
 b=Shc4hJ2aPZZwAT88/AfXFoQRbpcKLuTZDS+8P2IeeG9iJ2lJ60CsZr7J5tQDwxfzDa
 CdUWBpHOwzeon6QjB47oB7NIR9KePLg0KrNkjawqnpQbUc5rlpHUKD1XEesDkAx2WGw7
 GXbjvbYFohiqfltg9Zxoss6sJqZlaDpUM+EPQG6NSc3GiSSCS8o0NR6shj388GP0n2At
 QxIpaKffR1HpIhpl59+X4sTSFZ0DO+2mBch8EBXsFrTOklI6RMvwzLkQ6wPTPOJfkZJ0
 uLzJVDAcZVJ7PlcMq2mWKArCtH7LI2SAyEXPlNqECVlw4JolTb/XbbCDFcT0smXOcs9o
 Xhpw==
X-Gm-Message-State: AOAM530mATDTNjGg38JUmBhTCxWiFDGBFDODzq6k3iRNQyGwEDad7Oxf
 Qtgst6VrdgwFdvn3BLEdSjVPhwwwIDwWCG5Yai2fcg==
X-Google-Smtp-Source: ABdhPJxMZ9q71p23gnlmfhB955TXqLup+J9rvIv9OISue1PbZHuQDASslHqoDgDuQs/O6ZnxgiievLi/4a2/HhwYXRc=
X-Received: by 2002:a05:6e02:2184:b0:2cc:56e0:1686 with SMTP id
 j4-20020a056e02218400b002cc56e01686mr1048598ila.28.1650415395243; Tue, 19 Apr
 2022 17:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220107200417.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
 <CAD=FV=W5fHP8K-PcoYWxYHiDWnPUVQQzOzw=REbuJSSqGeVVfg@mail.gmail.com>
 <87sfrqqfzy.fsf@kernel.org>
 <CAD=FV=U0Qw-OnKJg8SWk9=e=B0qgqnaTHpuR0cRA0WCmSHSJYQ@mail.gmail.com>
 <CACTWRwtpYBokTehRE0_zSdSjio6Ga1yqdCfj1TNck7SqOT8o_Q@mail.gmail.com>
 <87fsmio9y8.fsf@kernel.org>
In-Reply-To: <87fsmio9y8.fsf@kernel.org>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Tue, 19 Apr 2022 17:43:02 -0700
Message-ID: <CACTWRwvQNswu1nYNHS-Y580QqDV6MHiS56NwyRXm3cLN2que=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: search for default BDF name provided in DT
To: Kalle Valo <kvalo@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>,
 Rakesh Pillai <pillair@codeaurora.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, ath10k <ath10k@lists.infradead.org>, 
 netdev <netdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_174317_727210_DEEEC407 
X-CRM114-Status: GOOD (  32.03  )
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

On Tue, Apr 12, 2022 at 3:47 AM Kalle Valo <kvalo@kernel.org> wrote:
>
> Abhishek Kumar <kuabhs@chromium.org> writes:
>
> > Hi All,
> >
> > Apologies for the late reply, too many things at the same time.
>
> Trust me, I know the feeling :)
>
> > Just a quick note, Qcomm provided a new BDF file with support for
> > 'bus=snoc,qmi-board-id=ff' as well, so even without this patch, the
> > non-programmed devices(with board-id=0xff) would work. However, for
> > optimization of the BDF search strategy, the above mentioned strategy
> > would still not work: - The stripping of full Board name would not
> > work if board-id itself is not programmed i.e. =0xff e.g. for
> > 'bus=snoc,qmi-board-id=ff,qmi-chip-id=320,variant=GO_LAZOR' => no
> > match 'bus=snoc,qmi-board-id=ff,qmi-chip-id=320' => no match
> > 'bus=snoc,qmi-board-id=ff' => no match 'bus=snoc' => no match because
> > all the BDFs contains board-id=67
>
> Sorry, not fully following your here. Are you saying that the problem is
> that WCN3990/hw1.0/board-2.bin is missing board file for 'bus=snoc'?
Ya, that is what I meant here, the board-2.bin file does not contain
an entry for 'bus=snoc' and so if board-id=oxff then still there
cannot be any BDF that matches. So adding BDF for 'bus=snoc' would
simplify the approach.
> That's easy to add, each board file within board-2.bin has multiple
> names so we can easily select one board file for which we add
> 'bus=snoc'.
>
> > So with this DT patch specifically for case 'bus=snoc,qmi-board-id=ff'
> > => no match, we fallback to default case ( the one provided in DT)
> > i.e. 'bus=snoc,qmi-board-id=67' => match . I do not see how exactly
> > the driver can know that it should check for a board-id of 67.
>
> Sorry, not following you here either. Why would the driver need to use
> board-id 67?
>
> > However, to still remove dependency on the DT, we can make the
> > board-id as no-op if it is not programmed i.e. if the board-id=ff then
> > we would pick any BDF that match 'bus=snoc,qmi-board-id=<XX>' where XX
> > can be any arbitrary number. Thoughts ?
>
> To me using just 'bus=snoc' is more logical than picking up an arbitrary
> number. But I might be missing something here.
The reason I mentioned that if the board-id=oxff then pick any
available BDF entry which matches
'bus=snoc,qmi-board-id=<XX>' is because:
- This will atleast let the wlan chip to boot.
- There is no BDF for 'bus=snoc' , so further stripping of boardname
will not find any match, but as you mentioned that BDF for 'bus=snoc'
can be added, then this will make the logic simpler and we don't have
to pick 'bus=snoc,qmi-board-id=<XX>' with any arbitrary board-id.
I will rollout a patch with this approach.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

Thanks
Abhishek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
