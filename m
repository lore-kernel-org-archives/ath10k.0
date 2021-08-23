Return-Path: <SRS0=+t3W=NO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EDCC4338F
	for <ath10k@archiver.kernel.org>; Mon, 23 Aug 2021 20:20:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA868613DA
	for <ath10k@archiver.kernel.org>; Mon, 23 Aug 2021 20:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA868613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0kO/1MlzbWcRGsD1hnZNBzlvsjjUMj+Dot6ojLeRCA=; b=NdlOZ5ndjP7vrX
	kAnNxCII637iMqNM4mTZdGg6a9r8iXzVLSUAv3gs7OQuypxDjQV6kQeGBOUrSfmGKT9K0GRYlsyR0
	N6KYb3Z5BAhnQhuvMKFeNYyOGstrz8aiFdVtzODDQ+PxckJ/qXfe36DHG6DzAbHsVslJ4jentndj9
	MLGZn3E7eRt/psQvJLI4F5g/FLPzT8x3UGgDxbOR4/2MRDOxiXayzk8IERNVE55VbP26lrYrDEjK+
	Ep0stDA1dygtnw2z2nkeuAfM3tls3kCzZefz1/rZoTGojW0hbYWKgZEPd90W9Pavt/IrkTiiZxnej
	oO0Apq0zVZBWOgHT0ZRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIGQD-000YUH-GF; Mon, 23 Aug 2021 20:19:53 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIGQ8-000YSS-P0
 for ath10k@lists.infradead.org; Mon, 23 Aug 2021 20:19:51 +0000
Received: by mail-lj1-x232.google.com with SMTP id h1so5387801ljl.9
 for <ath10k@lists.infradead.org>; Mon, 23 Aug 2021 13:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0vaj0uznqYe2FBJmFOITTJ3IqWEuG169317oUglvcEY=;
 b=OtuDeDNUrV3Rzk/bqFdRCFW++lG/hxojlu0nhwhJ+N6MH8Klju7+XzQ4GPEvbEJj4s
 7jPo+P/J8AfRNOswbzuSfWcDQQvLnWoomlHvoxKoOiSbO6EKb8LLGgQBU2rrlB8g96RT
 fhvZ7uBvosEEGqt5o0FGOMsBvQOjsXMOuifN/lXC/kcZPuNb1fYBIggHBfejJ5s7z0V9
 811Dm6zLSqT06sb8jU9V6cNet5dOOHnmxTjyuW7Nm6s3YoRN5D9VhRpJfAoteBwZNUsH
 GTqk15EYOdCGz/vtnXMZnvP7M2dhWcwXSPio/StYPE2C9SkSib0ckhpH4NZ/XSmzhDS7
 EUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0vaj0uznqYe2FBJmFOITTJ3IqWEuG169317oUglvcEY=;
 b=aleZkpPlq3ck1gFMgcR/kRr0ri9yP75fnCK3AEBGlKA/moXUAxzzcCy3n/H7n7zQ8A
 w2zYwtbYjfvngcqLFzfQ8lP9hVJPJFOvlkT2mQCBPy6swyEGGHprTdIoJNadeI1z3/yv
 mOLG+C14lzI+qlplAbQu6TJ6wXA0/tLrq2WSiYHC5dZoz2UjMQamNdQmOoNXa3InrEvH
 pP2T3BVSzOM4e+1ji/0Q7X1o1kGHF3YLhvbiFXFq+JVxf1GJ9D4A/pQZTLaoYKPzPWmT
 TpvfJnfp4PMJGYEbTMicVB6qtKxF04p+X9PEpR2zaRVDFKGBUcZ153h9Uf0BjZKubCyE
 KAhQ==
X-Gm-Message-State: AOAM531eKG91FNJTi+1Yx8R97EZb7N7UEtLQrKdejTJJdGymf3KaP5wW
 Uny5HgCVmAERfN2vLr6jFgk=
X-Google-Smtp-Source: ABdhPJwVfQcHNGRhsCMeMkAJgni0sp5/uJ0FX2VPazA3Al25tmUcQGNsQu0/6f7rxszKJFFH5QcSBA==
X-Received: by 2002:a2e:b5d0:: with SMTP id g16mr29323870ljn.349.1629749985913; 
 Mon, 23 Aug 2021 13:19:45 -0700 (PDT)
Received: from localhost ([94.19.228.143])
 by smtp.gmail.com with ESMTPSA id j20sm1288275lji.41.2021.08.23.13.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 13:19:44 -0700 (PDT)
Date: Mon, 23 Aug 2021 23:19:43 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Brian Norris <briannorris@chromium.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>,
 Wen Gong <wgong@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>,
 Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Julian Calaby <julian.calaby@gmail.com>, svp <svpm@yandex.ru>,
 felix+debian@gueux.org, Massimo Maggi <me@massimo-maggi.eu>
Subject: Re: Revert: ath: add support for special 0x0 regulatory domain
Message-ID: <YSQC32TygIq2SHJR@skv.local>
References: <YSJ//ki/A1EgfLga@skv.local>
 <CA+ASDXNzv6D1PthjUU-CVw6amT+JHmJP2mNSL=LVJKGm0zkEXw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+ASDXNzv6D1PthjUU-CVw6amT+JHmJP2mNSL=LVJKGm0zkEXw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_131948_984506_A1EF6D50 
X-CRM114-Status: GOOD (  16.35  )
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

On 21-08-23 10:23, Brian Norris wrote:
> On Sun, Aug 22, 2021 at 9:49 AM Andrey Skvortsov
> <andrej.skvortzov@gmail.com> wrote:
> > 4) As many users are affected by this problem and maintainers don't really
> > want to revert the problematic patch,
> 
> I'm not totally sure that's true. So far, it looks like an oversight.
> 
> Over a year ago, Kalle said he "just need[ed] to check something
> internally first":
> https://lore.kernel.org/linux-wireless/87r1rsbdnx.fsf@codeaurora.org/
> 
> I don't see the result of that, except that this is marked Superseded:
> https://patchwork.kernel.org/project/linux-wireless/patch/20200730124923.271429-1-alsi@bang-olufsen.dk/
> and this is marked Rejected:
> https://patchwork.kernel.org/project/linux-wireless/patch/20200527165718.129307-1-briannorris@chromium.org/
> I'm not sure if the Rejected was before or after the last reply above...
> 
> Maybe it needs an Nth person to submit a revert?

Later (Dec 23, 2020) said "Actually I don't see how I could apply the
revert due to the regulatory problems explained by Jouni". [1]
I think this could be the date when your patch was marked as Rejected.

1. http://lists.infradead.org/pipermail/ath10k/2020-December/012370.html

-- 
Best regards,
Andrey Skvortsov

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
