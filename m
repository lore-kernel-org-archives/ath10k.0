Return-Path: <SRS0=kr8a=N7=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFE1C433F5
	for <ath10k@archiver.kernel.org>; Thu,  9 Sep 2021 00:22:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A198C610E9
	for <ath10k@archiver.kernel.org>; Thu,  9 Sep 2021 00:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A198C610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hwIRhOk4oBE28V+gE7yim/zWvpdYovklQgynyYleo/8=; b=BwM+L2MA3iytK/
	+ybw1CYwqlpd4AWEcbRXNVFrOZ+YOfrIyMFBAeE8hvT2bG7q5uFJCYPvPjLr1FH8Oxg4TnpCBB1fh
	QUnABGSmtylPhKWcff1bk73pgEVKDZJ1vYzg+BAV3jXSKMb06VSmxg5wYtMYkzgeYYc9DifD+sD29
	Swxp4n9LPirwBhP7+mXx3zLcZbs+iDiIEhQwmzG3sb5WVeMaAvnfvYn0nZB4KnEkcTmMLo0cwe7DQ
	XJ4FxoWxc9gBVbXbqdzOtijMGtSFYx5TJky8a9/L3nHGHB7q/vDzy5DSoC2Ig6/c4ElXb81+oN8i5
	daq0boYDRekzOV1A7cVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO7pJ-007qkm-MU; Thu, 09 Sep 2021 00:22:01 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO7pH-007qkL-9v
 for ath10k@lists.infradead.org; Thu, 09 Sep 2021 00:22:00 +0000
Received: by mail-oo1-xc36.google.com with SMTP id
 b5-20020a4ac285000000b0029038344c3dso1374603ooq.8
 for <ath10k@lists.infradead.org>; Wed, 08 Sep 2021 17:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=KrKQVNDq3/5gBSCRZh6fTEr0lGsTWylg4ncaoymesVE=;
 b=l2zLirahIdKfjSNP4/FhmOaIxi6RGKTtg2W5yfzqga9z8DM7mF8KKLqdVBbe3EVQU8
 B2mAb8Kiyg3jGUGCmKchEE2FUCQe8mgtNYWYqjHacr6zdJiQlA/FSaPoBXi+Hveldzji
 yG8fvl3sD+03w4y0+gHlZYwwEFTawa1SZd9SM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=KrKQVNDq3/5gBSCRZh6fTEr0lGsTWylg4ncaoymesVE=;
 b=LmiFzmTBVynoht1ROa09L8Cm8mAwy2hNgjq257IuL8RQvAqLjxQKCJbsJ3tHp3Y5GY
 ENkvmtKUmMAXvSDnBVwANljBlmX7h+wWHxnscbRmMJ9P3qm7NIxw7gp84BMK7N+DCZiI
 sTLqhCNvLzFnUcmwYMWN8RJMy+8rX39NeDPTgWv9LaWxNjqJhxVyKVqXge7O4MD/1oD1
 /bOGBtz0hwgj9iZ8gPJAPag0uzPDQAKDmic7+S4/USTawMB6mnBrR+nW+QUnNMRP+qFz
 B0f3NY5DDRlGeKypyBMSaB4b6HvopplQXrJ0e3l2miJ3KCy7tzJuCDUPlCevvu+sk+XM
 zx3Q==
X-Gm-Message-State: AOAM530Q0RPWzD68C+s1FnjKJVLeTrkEIx3Cd5i3DCTfbL+Hbv7UgAFU
 TbleUxyfJc51d7uVHdGcbFCQaoroSSXMKYmvz3KC+Q==
X-Google-Smtp-Source: ABdhPJxgF39MsLPy0LWbZeXGBUy3CFp7gIIfxNlCUhObTVORlW5XPn7pdgoxLbPwwQ0fUMnQfRUlseqsLjVZ7A4RYec=
X-Received: by 2002:a4a:9211:: with SMTP id f17mr259723ooh.25.1631146917250;
 Wed, 08 Sep 2021 17:21:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Sep 2021 17:21:56 -0700
MIME-Version: 1.0
In-Reply-To: <CACTWRwsRLrKHRWVoHHyrU2DEc_VkhqSi66tdD2OBWs_y8J2LPw@mail.gmail.com>
References: <20210905210400.1157870-1-swboyd@chromium.org>
 <YTe+a0Gu7O6MEy2d@google.com>
 <CAE-0n52d_GBh70pSDXTrVkD5S6akP4O9YcE4tVRKZcvLtLZSmg@mail.gmail.com>
 <CACTWRwsRLrKHRWVoHHyrU2DEc_VkhqSi66tdD2OBWs_y8J2LPw@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 8 Sep 2021 17:21:56 -0700
Message-ID: <CAE-0n50RUGTA8sfK52YWXRkoi31XYnJkahy_MydRZ0zM1QXRQg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Don't always treat modem stop events as crashes
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, Kalle Valo <kvalo@codeaurora.org>, 
 LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 netdev <netdev@vger.kernel.org>, Youghandhar Chintala <youghand@codeaurora.org>,
 Rakesh Pillai <pillair@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_172159_402264_201D9860 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

Quoting Abhishek Kumar (2021-09-08 15:37:07)
>
> Overall this change should fix the issue, additionally I have one
> comment below and would like other reviewers views.
>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/remoteproc/qcom_rproc.h>
> >  #include <linux/of_address.h>
> We are adding an external dependency here but since this is added in
> snoc.c (which is for integrated solution only), I can expect if SNOC
> is enabled, remote proc will be enabled as well, so it should be fine.

There are stubs so that if it isn't enabled it won't do anything. But as
you say SNOC relies on the modem to boot, so maybe CONFIG_ATH10K_SNOC
should depend on some remoteproc config anyway? I'm not clear how probe
ordering works but I think we'll want to make sure that we only register
the notifier once the remoteproc driver for the modem adds itself to the
list of available strings to look for.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
