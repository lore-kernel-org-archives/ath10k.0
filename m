Return-Path: <SRS0=CzWf=F2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC55C433E0
	for <ath10k@archiver.kernel.org>; Tue, 22 Dec 2020 18:30:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD9E322571
	for <ath10k@archiver.kernel.org>; Tue, 22 Dec 2020 18:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD9E322571
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tBApTxhoPXZT4dTqiBTi/RY1kUEuRgnMLfbkAhQHcqw=; b=f7kOS3yBhYCeN1ugc2cUufIaO
	eSee+/4Lmm3p7zFOaAOD+Y9B7makMntyvVfKseh8BoLNf6Rcn5ugs0EeZrHcLD67SMZL5e4es49fD
	/6GD05V7/Cl8wHojFvwKlrCQYPdfIiOi8XIwKQ/XfAbvQJw3A9Q9hZ3cy45zSooKCQAgZ2LBK5IjM
	rC9HDIVNsz/WjPCWX1J9U0GfPW0eYLAyfIAxa+9vzhhvrAM7sXu6KinJgvSdTkOD9sYPA4hxdvXDZ
	DuA9DwtPZhPqoEOdD/+yKLKgWScEJru76xApwfU4uQq0YWF6xxYZBHv7S50hHnksEA/xIMADgkKek
	Q8gF1YkEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krmQr-0003f0-G8; Tue, 22 Dec 2020 18:30:49 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krmQn-0003dn-JQ
 for ath10k@lists.infradead.org; Tue, 22 Dec 2020 18:30:48 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id x23so3159038oop.1
 for <ath10k@lists.infradead.org>; Tue, 22 Dec 2020 10:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0itLImR3OXMMEO2nMZUnHsaK34n3vqmctKRF6DxZOeo=;
 b=DzHTGwBJRfcMldoTOE3/ZKKys4VH2XmEJGt+7pASBis0udsyrXyTv+lcFS+cdZQt3y
 6uqvEF4rRnQR42e25e/gthsHU9Z/+13t35HSDh6tgf2dMMTkrQJYmlJlUQw7thJ3YD2d
 SGbNxlThuxbV5IkqoXYSYODaJuWYvrUR5aZy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0itLImR3OXMMEO2nMZUnHsaK34n3vqmctKRF6DxZOeo=;
 b=nX3MrFZZ/oTQa+GKnd4kaaRMZqzoYfvUdVF09bR3Z4gRlI3SYyrm/KVEdCM4Ojkwh7
 I7L2zfet5W6nMjVJ2QtyzZ6ts7Yg/ZNjAl1WV0ZkQQXB81cztpB3FTZI5spsM0kK7Cvx
 7HIWVvY7X4dSFOsVPRTOKIRSqpu+/g74NFkBAPgIhsgf0M24ZqBpa8En0JGUQaNOnNUn
 CR7xWy9kB1n9lssw6z53KeMjFxyd2XUZcib1H3C5BppgEJ3IARHhkOMP52/mWnZYyr1x
 8BrqbNT7jnQsGUk0wYNnS12u0pltHT3Fao67kEIiuJKr/1ibj+O9yt9CO0XugpoQE1T9
 wWzw==
X-Gm-Message-State: AOAM531Y1iLtP81OYzaAOOXhAsQWN8mPTlWarlsyn1QSUn2V0lwP6y/9
 03BZCOQ+Jm2dYWEZ6wO7hbGTj0/iJwH7Zw==
X-Google-Smtp-Source: ABdhPJx/bRXp63ka9FXPMq2jK6TxuCn3WGi+wviPX6wL/hVOhiBOFwSKeuEH7yxqjhDvvZoe5DsIOw==
X-Received: by 2002:a4a:d126:: with SMTP id n6mr15605553oor.47.1608661843551; 
 Tue, 22 Dec 2020 10:30:43 -0800 (PST)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com.
 [209.85.210.46])
 by smtp.gmail.com with ESMTPSA id a18sm1775879otf.33.2020.12.22.10.30.42
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 10:30:42 -0800 (PST)
Received: by mail-ot1-f46.google.com with SMTP id j20so12756281otq.5
 for <ath10k@lists.infradead.org>; Tue, 22 Dec 2020 10:30:42 -0800 (PST)
X-Received: by 2002:a05:6830:1c2d:: with SMTP id
 f13mr16912875ote.365.1608661842057; 
 Tue, 22 Dec 2020 10:30:42 -0800 (PST)
MIME-Version: 1.0
References: <0BEB3EB4-E3AF-4236-BACC-E42CE2D094B7@adcubum.com>
 <3a3815a68576f1715fcc6db590099b84@codeaurora.org>
In-Reply-To: <3a3815a68576f1715fcc6db590099b84@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 22 Dec 2020 10:30:29 -0800
X-Gmail-Original-Message-ID: <CA+ASDXP8NoGACT4OBEwMvj9B6KsBYBAwMhxSApb7D-fCvfxwTg@mail.gmail.com>
Message-ID: <CA+ASDXP8NoGACT4OBEwMvj9B6KsBYBAwMhxSApb7D-fCvfxwTg@mail.gmail.com>
Subject: Re: [PATCH] ath: add support for special 0x0 regulatory domain
To: Wen Gong <wgong@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_133045_661645_0996A669 
X-CRM114-Status: GOOD (  12.66  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: Sustek Goran <goran.sustek@adcubum.com>,
 ath10k <ath10k@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Mon, Dec 21, 2020 at 7:43 PM Wen Gong <wgong@codeaurora.org> wrote:
>
> On 2020-12-21 05:06, Sustek Goran wrote:
> > Hi, on my ath10k Chipset,
> > QCA9984(https://compex.com.sg/shop/wifi-module/802-11ac-wave-2/wle1216v5-20-2/)
> > afetr this patch i can not longer to initialize my card.
> >
> > my dmesg log: So i need to revert this patch! Is my card need
> > aditional support? Can you please guide what to do for my card to ahve
> > OOB support in streamline kernels?
> >
>
> If this patch introduce issue to you,
> I think you can try to revert this patch.

Kalle is still planning on applying my revert patch someday, I think:

https://patchwork.kernel.org/project/linux-wireless/patch/20200527165718.129307-1-briannorris@chromium.org/

We just have to wait.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
