Return-Path: <SRS0=+t3W=NO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19861C4338F
	for <ath10k@archiver.kernel.org>; Mon, 23 Aug 2021 21:07:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFFC961037
	for <ath10k@archiver.kernel.org>; Mon, 23 Aug 2021 21:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFFC961037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s23AymJ0HVYjivRX7kYoU1TmME7e9aLlGZZNi/OzV6c=; b=dNJVmnvPOBTb+p
	vZVkj+/2YTRxlGVZvVOHIhw4Ipj7e9Snux0y5RrXd9jgIJFl6Uv5FfsPmSonpnzk5HkYXCIg7iXYd
	JqfZnJk/clWeO7zcLFt8aKjR/r2tvjs2UUASTE9O6IeI+Z1DkIfzo/rQIrg7kUwyXvUaYfyQi4W97
	O03aNk9Sub+ws7mBtDc0/FxuL18NS336926SIlpkLCJBe2XhDJcObmJE9AyChxFRAU3dW4rENlDU0
	HAMeCFa5XBHTqtlROs7qAIx1MRUXhHtxseBf1UnqiiKaMkbtnYJFmw4OyjipP9fsTNs4698VAu0LF
	OtkD9Gg7Mqz31hEFvjhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIH9o-000gzD-EX; Mon, 23 Aug 2021 21:07:00 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIH9i-000gyS-HK
 for ath10k@lists.infradead.org; Mon, 23 Aug 2021 21:06:58 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 c19-20020a9d6153000000b0051829acbfc7so39993252otk.9
 for <ath10k@lists.infradead.org>; Mon, 23 Aug 2021 14:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fLL6TsZ0p1BxQUf3mIJkFGmI1A6NCb0FMhavacPJRyg=;
 b=SIEteore6KBkjf1V/T0XrUBvgjsGHQ3CRmC/jfX6gFyKTum7UR3ll9NRZTJvK+k0cx
 +VL+anTu0sQ4h8bhc012Lty0DVtyjowmnQR8wmCf7q/YYeUj7qbvuDJXrFdcYxW6/U1a
 JjfR4fEDz4vqS4kw73NZZZh0iJ4CHLnjANXwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fLL6TsZ0p1BxQUf3mIJkFGmI1A6NCb0FMhavacPJRyg=;
 b=J7QUw1QPeg6JfxPhETAVcwpqxPD8Wnsi6ToBrKvGAo4pTJH/gsX79w0k01X2tbx+L2
 AqCZi5WOcR2aTGdZHUsIAVUufmeWe86QasKYtLg+gyLjKhJJQ/DDfHniHW/ispfTHgCp
 q/en058Z79CeEHHxfLeVvySK+KSdfwXcH+tbFf3ion5dI/bGr5rD+LJnUVxCuzmJRpkJ
 7gKZM67mkZ1LHIGcSsAzNk2npdzJARSuVMNr597lWl4maUCrrxaW/yu1dPOrGaM8Zj1f
 hSI3mFhEOXuof+GBagiVQsyeE5GvVZxi4oS00ELVeisRVQkfzjjWpN5ebMgwtr6nHWcH
 5rnw==
X-Gm-Message-State: AOAM5329gewxFevp0bmO05loa534QqrigstRz1bIs8SgQnqKQoGr4rpk
 7Cdclf4PFi4i1zO+oVLgsWCo2m4sLrv6Fw==
X-Google-Smtp-Source: ABdhPJxg0F/XSnevbAeZsYLbm9Bkl9DO7+eiIkjcXBamGJObwZdTlEYUpAZ1obxHu+4ERJ+Y18+2uA==
X-Received: by 2002:a05:6808:d53:: with SMTP id
 w19mr390837oik.135.1629752812406; 
 Mon, 23 Aug 2021 14:06:52 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com.
 [209.85.210.51])
 by smtp.gmail.com with ESMTPSA id y5sm3986068otu.27.2021.08.23.14.06.51
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 14:06:51 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id
 y14-20020a0568302a0e00b0051acbdb2869so33242703otu.2
 for <ath10k@lists.infradead.org>; Mon, 23 Aug 2021 14:06:51 -0700 (PDT)
X-Received: by 2002:a9d:2278:: with SMTP id
 o111mr16276286ota.229.1629752810696; 
 Mon, 23 Aug 2021 14:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <YSJ//ki/A1EgfLga@skv.local>
 <CA+ASDXNzv6D1PthjUU-CVw6amT+JHmJP2mNSL=LVJKGm0zkEXw@mail.gmail.com>
 <YSQC32TygIq2SHJR@skv.local>
In-Reply-To: <YSQC32TygIq2SHJR@skv.local>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 23 Aug 2021 14:06:39 -0700
X-Gmail-Original-Message-ID: <CA+ASDXPi0RRd0gFYcON=XLu8ABwKKcRXf0j0QoCRnvDwGa0VyQ@mail.gmail.com>
Message-ID: <CA+ASDXPi0RRd0gFYcON=XLu8ABwKKcRXf0j0QoCRnvDwGa0VyQ@mail.gmail.com>
Subject: Re: Revert: ath: add support for special 0x0 regulatory domain
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>, 
 Wen Gong <wgong@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>, 
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Julian Calaby <julian.calaby@gmail.com>, svp <svpm@yandex.ru>,
 felix+debian@gueux.org, Massimo Maggi <me@massimo-maggi.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_140654_638159_DD3DA37C 
X-CRM114-Status: GOOD (  11.94  )
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

On Mon, Aug 23, 2021 at 1:19 PM Andrey Skvortsov
<andrej.skvortzov@gmail.com> wrote:
> On 21-08-23 10:23, Brian Norris wrote:
> > Maybe it needs an Nth person to submit a revert?
>
> Later (Dec 23, 2020) said "Actually I don't see how I could apply the
> revert due to the regulatory problems explained by Jouni". [1]
> I think this could be the date when your patch was marked as Rejected.
>
> 1. http://lists.infradead.org/pipermail/ath10k/2020-December/012370.html

Oh wow, I almost forgot about that... Too many threads. I also forgot
that I already replied, expressing my disagreement:
http://lists.infradead.org/pipermail/ath10k/2020-December/012372.html

But I guess it's not really expected that mainline Linux really works
as-is on most products, unfortunately, and the maintainers don't have
enough time or energy to provide constructive paths forward on real
issues like this :(

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
