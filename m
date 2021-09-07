Return-Path: <SRS0=nXyc=N5=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B78C433EF
	for <ath10k@archiver.kernel.org>; Tue,  7 Sep 2021 19:48:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9086C61106
	for <ath10k@archiver.kernel.org>; Tue,  7 Sep 2021 19:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9086C61106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hUvr1ZajouAYEcJbU3iqoyXiGtBX522WXq1zM6BCWU=; b=alChHfpJbWbwEO
	hJae6l5xd3spdjwQMC7v+w3Wd6ny8ruxhGcnluiMvyjclKzx8HXG82vMdkKSxrEn9pUN1c4w1voPh
	4PfpPGf2mF09tYTuOtu7cHCkaLhrkr22cYXzSxYBQ7XCNjImjv+ly+5hllNg5zHiXV5WOZ5PNWYRX
	+Gumh9t9S3GcmuKGmOXJX+NXHcI2iF3qD7AephfwM0+LWVGHdvL8HO8T/rmwpjHTp7VRDMk8xnhXy
	uQ0rC7uh65GUqs3StQ5WCJNqlULtC8p5ri5nE6gCO0gaMKSSnAbSScBrjS9ms4dzTkWIyh8MGE/Vh
	dlYVrkPCsE/OFe5A0Vtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNh4r-004bA7-FC; Tue, 07 Sep 2021 19:48:17 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNh4o-004b9X-8A
 for ath10k@lists.infradead.org; Tue, 07 Sep 2021 19:48:15 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so485294otg.11
 for <ath10k@lists.infradead.org>; Tue, 07 Sep 2021 12:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=w+pEkVJd/h+WI+7Ik9xWqY+Z8oL6sb51sITpdGLwuE0=;
 b=ZfXkyFLoNLwSCxIt2lcXw2d4jOGw2BhBPBTFYcXhipfSjLsFGRUgNK6ftpTAP5TXWq
 ruwHEv5trPt3h2I/CyAqcbyOo83YrThS3Kjacjot2cOxAKpRgjgr1lQizsZ7yTchvihV
 ErsPeqGVBrbrrKzNFlwtX95iDjPuVYP5wRuiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=w+pEkVJd/h+WI+7Ik9xWqY+Z8oL6sb51sITpdGLwuE0=;
 b=Zb+8Rk7Czg0zUfKgxLr+GDXhl8Pj+bsPM5J8fFMepZaKWllI/lEC5K43HBz7Ri7qdS
 NYmqn1JJfr+/paKCcFfCzWmQczRskKPTWSLTGkSHwo0lr1E7DCNnF06GNm/fLDt52V+x
 XvJ7aMtPgFay7Sbhl2SZmE0fKydAcoH2NXsYS5tAg7oaO1CwFyR1eQKx3ti4c5/ue4yx
 XygjMlDKK601deakL4P5sH0oufWmZWhyYRhnfCDGiN3Fzufhioy726PG/kJdrZhNFGEc
 4wGMXm0SenC3VwCfzn1ayEec14/s1A1O9lADeaSufuXO8L0Td1rnQqJHg/g/2vlvkWUO
 e35g==
X-Gm-Message-State: AOAM533W5JJZsEuSTZpLOgWa97PCbs5f6fuMgJgYq+DETljYnGkSFKLv
 yZifFKPQwHNxhdjVzqlImCdkQLnkp9jEQ+WQ05oXUA==
X-Google-Smtp-Source: ABdhPJxksUjTUTa8Exx6uQm/t3KaU/loUjkBf+4L6i+ATrGe4465p6dpfz+D435OVm1pzqfNM6HNZXNRx4Iq1MprmqA=
X-Received: by 2002:a05:6830:1212:: with SMTP id
 r18mr58677otp.159.1631044092581; 
 Tue, 07 Sep 2021 12:48:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Sep 2021 19:48:11 +0000
MIME-Version: 1.0
In-Reply-To: <YTe+a0Gu7O6MEy2d@google.com>
References: <20210905210400.1157870-1-swboyd@chromium.org>
 <YTe+a0Gu7O6MEy2d@google.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 7 Sep 2021 19:48:11 +0000
Message-ID: <CAE-0n52d_GBh70pSDXTrVkD5S6akP4O9YcE4tVRKZcvLtLZSmg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Don't always treat modem stop events as crashes
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-kernel@vger.kernel.org, 
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 Govind Singh <govinds@codeaurora.org>,
 Youghandhar Chintala <youghand@codeaurora.org>, 
 Abhishek Kumar <kuabhs@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_124814_348879_CD95CF26 
X-CRM114-Status: GOOD (  10.37  )
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

Quoting Matthias Kaehlcke (2021-09-07 12:32:59)
> On Sun, Sep 05, 2021 at 02:04:00PM -0700, Stephen Boyd wrote:
> > @@ -1740,10 +1805,19 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
> >               goto err_fw_deinit;
> >       }
> >
> > +     ret = ath10k_modem_init(ar);
> > +     if (ret) {
> > +             ath10k_err(ar, "failed to initialize modem notifier: %d\n", ret);
>
> nit: ath10k_modem_init() encapsulates/hides the setup of the notifier,
> the error message should be inside the function, as for _deinit()

Sure. I can fix it. I was also wondering if I should drop the debug
prints for the cases that don't matter in the switch statement but I'll
just leave that alone unless someone complains about it.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
