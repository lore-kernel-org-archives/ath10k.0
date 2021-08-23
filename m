Return-Path: <SRS0=+t3W=NO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF4BC4338F
	for <ath10k@archiver.kernel.org>; Mon, 23 Aug 2021 17:24:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4771761378
	for <ath10k@archiver.kernel.org>; Mon, 23 Aug 2021 17:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4771761378
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4niEj7PozLrZloPaZHU6KAYvlA45jKyoxY3i70ONz1o=; b=C4MD/1fTEWSDS/
	4FR7PGGwC4VRwRBf/20fNsvFuyr2NiYp5TgOS+n8wsQB7J3x8bixE9ZyJOwnDl8KrebN2Ky82VCkd
	o0VuypDo0wQC60UuMZ46PZzFEBaaS0EH+bMYAIyAm2BiBI73pvTvT5G01MtgKTumyz/5Eam5yKg59
	CyTkvQoicc+DMSzjiF7N3rNQJ4uq25czi9wMJHbRsPkOmf9DdkG+7AviqySpefWmGTycrC+hUNeEl
	J9+69CwR+UvrPuDY6X+ve34jZRFZmPj7BWAufc1TGWyMBBWLd5BulzKbgcOXeMymXuDRCNLeCckRP
	uMF4+McL1pdz1+9Jd9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIDfv-00096c-T0; Mon, 23 Aug 2021 17:23:55 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIDfq-00094H-Fc
 for ath10k@lists.infradead.org; Mon, 23 Aug 2021 17:23:54 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso6575472otv.12
 for <ath10k@lists.infradead.org>; Mon, 23 Aug 2021 10:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j39JGa4+/JoPd7jWAo3EsnacOlycl0dd9VYa1paZWZw=;
 b=aML2ZoYwbJUyZY3T5viLxlIzeL7kZupQ2VWoUC/61msAkwKvU+DTV44Fi9VqicYt/M
 8CspSsZi+q9BdRGJhNzzIrZIRL1y4SJAclOnSI21k/2qlYFIAvAGm6x6Gik8hu+dsWa8
 KQ+eLhQzY0EZgW8ARS11Byr73RZLag/vw+Z08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j39JGa4+/JoPd7jWAo3EsnacOlycl0dd9VYa1paZWZw=;
 b=evLkHkNJLpv7x546cMFTTsIELlLaEAvFShoUoT8HYBDC9nbFDnJMLIXuPo9X4Wg9rn
 sC8jj8rKd0+Sh6i5G9hQnfLl2qEMCLj0dN1iFywTU/10BJP1atbP6Fj4Ee9fTN95/lYS
 4wErxiT8g0ElkwpE5/tqUKm0Mc5zlZ8B2tyMNKziclL7fFlU3rjAgP+xdaQ0l8iqBrfR
 8HT0fedA63Fw75BlASNgn4/4DQgUOIf6b2YefZi4g+eGWCVGBJjBHU7fLu6ZKzetrWSI
 7rZXT4tM9wl3Nv14b9rtTIHiuucNykuielDB8pasEt24iyj9pXrGgiFOr9aAIR8ixW5j
 SwVw==
X-Gm-Message-State: AOAM532l/pih0XBsK8gHKeDfnMpRU1j7BMroxFcfzNRako9ZtcwfxZ3v
 X5nlPyRHcHpfISJ2f1L6wdgpeOQdwO5SaQ==
X-Google-Smtp-Source: ABdhPJwgQbT2MldP/UWQK6tT6rZBXJFXivLbbgsef4QoHkta7X8c6zqaRafZCHcutVxPPycwLiJKUQ==
X-Received: by 2002:a9d:3e16:: with SMTP id a22mr29496076otd.101.1629739427986; 
 Mon, 23 Aug 2021 10:23:47 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
 [209.85.210.52])
 by smtp.gmail.com with ESMTPSA id x8sm2890351ooq.41.2021.08.23.10.23.47
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:23:47 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso27023291ots.5
 for <ath10k@lists.infradead.org>; Mon, 23 Aug 2021 10:23:47 -0700 (PDT)
X-Received: by 2002:a9d:6310:: with SMTP id q16mr28892267otk.203.1629739426626; 
 Mon, 23 Aug 2021 10:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <YSJ//ki/A1EgfLga@skv.local>
In-Reply-To: <YSJ//ki/A1EgfLga@skv.local>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 23 Aug 2021 10:23:35 -0700
X-Gmail-Original-Message-ID: <CA+ASDXNzv6D1PthjUU-CVw6amT+JHmJP2mNSL=LVJKGm0zkEXw@mail.gmail.com>
Message-ID: <CA+ASDXNzv6D1PthjUU-CVw6amT+JHmJP2mNSL=LVJKGm0zkEXw@mail.gmail.com>
Subject: Re: Revert: ath: add support for special 0x0 regulatory domain
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>, 
 Wen Gong <wgong@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>, 
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Julian Calaby <julian.calaby@gmail.com>, svp <svpm@yandex.ru>,
 felix+debian@gueux.org, Massimo Maggi <me@massimo-maggi.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_102350_584130_1F557226 
X-CRM114-Status: GOOD (  10.55  )
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

On Sun, Aug 22, 2021 at 9:49 AM Andrey Skvortsov
<andrej.skvortzov@gmail.com> wrote:
> 4) As many users are affected by this problem and maintainers don't really
> want to revert the problematic patch,

I'm not totally sure that's true. So far, it looks like an oversight.

Over a year ago, Kalle said he "just need[ed] to check something
internally first":
https://lore.kernel.org/linux-wireless/87r1rsbdnx.fsf@codeaurora.org/

I don't see the result of that, except that this is marked Superseded:
https://patchwork.kernel.org/project/linux-wireless/patch/20200730124923.271429-1-alsi@bang-olufsen.dk/
and this is marked Rejected:
https://patchwork.kernel.org/project/linux-wireless/patch/20200527165718.129307-1-briannorris@chromium.org/
I'm not sure if the Rejected was before or after the last reply above...

Maybe it needs an Nth person to submit a revert?

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
