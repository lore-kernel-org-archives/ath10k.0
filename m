Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C857CC433EF
	for <ath10k@archiver.kernel.org>; Fri, 14 Jan 2022 06:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O0j673I+DdNVn97FbXXm4tADZaqfS1karY0g/gqVD6M=; b=rY7egCOpfZWq9s
	xInGrwmMI+N4EvXCtVFHwH5LZHOkJ8cOlXVKtjdIUlRqLjKEVN6Bk5FQNtZqkgiJopFG8qJ9jiIbG
	U5BuAMOaP+De8atYOKIfFy4HNG8w8lBgvnLVjgt03+hlnOOrkzqlomZc2U2o2I3AUcKPkcKMg4shw
	bINsiMTV/UsIafznNLLYASa8VML69m4uLXHxmzzJY1JHFcwWg0CHJw4L8SG1XLo1oy8qohptneu7U
	0ybMyN6/meOywBhIYB7BAUK14dAZAI0r9cwvRdbpTBL3TKNE5HxCEo/EjBt+oGSZxGOQDMOvygQs+
	MmeVsyiEg1CTvTNHSM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8GQQ-007yDi-Id; Fri, 14 Jan 2022 06:51:02 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8GQO-007yBb-27
 for ath10k@lists.infradead.org; Fri, 14 Jan 2022 06:51:01 +0000
Received: by mail-io1-xd36.google.com with SMTP id i82so11324735ioa.8
 for <ath10k@lists.infradead.org>; Thu, 13 Jan 2022 22:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UEqQjSYXkfyW+68nPj0FYib/sLZbBqjDvvEW6pUXEMs=;
 b=MTvLBGb93y4NG3HP9hsj6GJqaPMSV5rCLAODCbScflUq8wqXmhWkGvSnteNIbDp2Ov
 coqxkkfYDIS8/h8F430CX9H5E5Y/GMaNX0hpGuCQwkg9CUPnIOxgENXGSwuJYziPbJgb
 3c6yzf7rGFekQ11xeLKb60r8J6I7i786ywQEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UEqQjSYXkfyW+68nPj0FYib/sLZbBqjDvvEW6pUXEMs=;
 b=W86ivdorF+XUoRQqF776j60/uk/xEVaJf2JsqK/JifET+DrfPs5NIBZQkfoe0AyTeA
 haA8wkpdr5BeBeE7MhkwngAR6i6JcFul8pb6JexU1pVZ8pE8Gp6cMUg655LLMnKTy+Nh
 78juuWgj8M0Qb/Zar/YLsCrhE8jl1sEm+b3BY9AvEeiwtkBtbiaXZA9uaw1y7i0vlzFD
 UQar4DhUo/vzAnvTe8HAUKN88suFTSi46WTIOSiAjRoPsucdpmAFBDA1cCdjmIsFPBvZ
 EmXyb+lm2eBCjI8QDYmkEyp+wOfS9epV476FSIplLZSrHmfLVPEEAQhFzPc2FHyGEySp
 9fdw==
X-Gm-Message-State: AOAM532RQuTHcQq7gPz8FMlQUn/u8XQWSvp8TvFq/KuVad6kFPTbTpiC
 iOaUJ6/guhQbEjNbDygQWh2N1tZ3zE+5qw9AdhKd/A==
X-Google-Smtp-Source: ABdhPJyRmwBj5vq9rUMU2RWBrfxr/D+hLST7MYzyT0aeXbJX1WVZ0xmbvVIY3hMwgMkjwXWAVzENoDU07Qg/NLr6AIk=
X-Received: by 2002:a05:6602:2b83:: with SMTP id
 r3mr3812667iov.93.1642143056574; 
 Thu, 13 Jan 2022 22:50:56 -0800 (PST)
MIME-Version: 1.0
References: <20220110231255.v2.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
 <CAD=FV=VVzQFK_PwnCXkJ6OK3DcgBnoxmvNG3WXFn30ncdY-E_w@mail.gmail.com>
In-Reply-To: <CAD=FV=VVzQFK_PwnCXkJ6OK3DcgBnoxmvNG3WXFn30ncdY-E_w@mail.gmail.com>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Thu, 13 Jan 2022 22:50:45 -0800
Message-ID: <CACTWRwsT8dEPiVkvk_=FPSAwuN2oti27p8Vb-mVjWE7iJuTNrw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ath10k: search for default BDF name provided in DT
To: Doug Anderson <dianders@chromium.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k <ath10k@lists.infradead.org>, 
 Rakesh Pillai <pillair@codeaurora.org>,
 linux-wireless <linux-wireless@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 netdev <netdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_225100_146971_FFFF5152 
X-CRM114-Status: GOOD (  19.05  )
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

On Mon, Jan 10, 2022 at 4:51 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Jan 10, 2022 at 3:15 PM Abhishek Kumar <kuabhs@chromium.org> wrote:
> >
> > +int ath10k_core_parse_default_bdf_dt(struct ath10k *ar)
> > +{
> > +       struct device_node *node;
> > +       const char *board_name = NULL;
> > +
> > +       ar->id.default_bdf[0] = '\0';
> > +
> > +       node = ar->dev->of_node;
> > +       if (!node)
> > +               return -ENOENT;
> > +
> > +       of_property_read_string(node, "qcom,ath10k-default-bdf",
> > +                               &board_name);
> > +       if (!board_name)
> > +               return -ENODATA;
> > +
> > +       if (strscpy(ar->id.default_bdf,
> > +                   board_name, sizeof(ar->id.default_bdf)) < 0)
> > +               ath10k_warn(ar,
> > +                           "default board name is longer than allocated buffer, board_name: %s; allocated size: %ld\n",
> > +                           board_name, sizeof(ar->id.default_bdf));
>
> I suspect, but don't know for sure, that you're going to get another
> builder splat here. Just like sizeof() isn't guaranteed to return an
> "unsigned int", it's also not guaranteed to return an "unsigned long".
> I believe you want %zu. See Documentation/core-api/printk-formats.rst
Thanks for the tip, I will make this fix in V3.
>
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL(ath10k_core_parse_default_bdf_dt);
>
> Boy, that function seems like overkill for something that you need
> once at init time. ...and I also suspect that the lifetime of the
> string returned by of_property_read_string() is valid for as long as
> your "of_node" is held and thus probably you could use it directly (it
> likely has a longer lifetime than the location you're storing it).
>
> ...but I guess it matches the ath10k_core_check_dt() function above
> it, so I guess it's fine?
Ya, that was my idea to match it with ath10k_core_check_dt, initially,
I was planning to remodify ath10k_core_check_dt to parse the new
property, but looks it is used it multiple places, so I thought having
a separate parser function would be cleaner, however, I am open to new
ideas.

- Abhishek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
