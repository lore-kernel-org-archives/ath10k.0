Return-Path: <SRS0=+t3W=NO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42005C4338F
	for <ath10k@archiver.kernel.org>; Mon, 23 Aug 2021 20:40:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC6D660F8F
	for <ath10k@archiver.kernel.org>; Mon, 23 Aug 2021 20:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC6D660F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4rTP6kr7BgH4mO+iq+FAxSzCIhmrPH+2PdjxQSqyzU=; b=ECru/E13NVfv8N
	3BDnTExSA7FqvCynOBP6O07qTJRPZSmHNhw9w0+VozQEMS0VaQLs7lWW0RXr+zUsmuY+19dV5myB6
	LFgbUK49W/dO6HrBe8YReN+RpeE7Zl+OCzoRTAqYLn+OtjPa9Icr/snpMrrGZAe5+sUt/9i7JjR+0
	zY4ihUsIy1dseZUZc8vJzvhzrr7cpbDL2h3D52wCkkfFDgQyIuN+hqfM0gMX5HzfmaWGakK34VSVK
	DZ94XWOzYiIdBdWk/BxziD/1+IuKAB0ijK35Fwqqw0ctCS8FQg3FzKNXn6VFVWmqtJaJ1Go6cYvnP
	+UMU5YAvpmqhBa8Psx2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIGjS-000dh9-VC; Mon, 23 Aug 2021 20:39:47 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIGjO-000deU-2o
 for ath10k@lists.infradead.org; Mon, 23 Aug 2021 20:39:44 +0000
Received: by mail-lj1-x22f.google.com with SMTP id q21so33673529ljj.6
 for <ath10k@lists.infradead.org>; Mon, 23 Aug 2021 13:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=JFZLEAhA30rNPUlpm88OHaIhK1CzHABrd7DB+Lg/9bQ=;
 b=ixsz1gejAEC+D5e0OPLB2PH3Ffo41Nu/tzUHz79iC2ZFSvtXKQnJLeHxIPz1Kn3IYH
 Sm/K0ZXxrItBBPBDNzqxxa5+SK/GW+M0KruNhaj9jw68+rADxbyQtJjGdkl/G0JcfMTs
 yau875ER8hjPTKcESljcyDCyw4AUI9+M0TZQ2fgtTW2CVxYYUHSEdbradDbUkLlV/y1k
 TJPkeMmFshyKPdroUO2yd29uTBlP2gcUfhfgnIiZNsK2aybiNe2UdxvktfB4AtBREf4U
 27ziJ0s4T3qATrDG0rdcYFRipuGYZgG3Xp7kdnd0JwPwhyuIJi2hvT66LQfubq6I3L3s
 2gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JFZLEAhA30rNPUlpm88OHaIhK1CzHABrd7DB+Lg/9bQ=;
 b=rKV2AtXRwHJXqr8YxaPv8QsF0mLXjgWb1WZ/Rcw45zACuACIZNPEZ/kA66vtIPskbD
 f9P0PZG2pB/bcfo32Xbs+VjTM3anHIIplhv5ohS3ImpiIujz7c22O1BiJHA1vP4tJZUc
 iwmj6Rx41jF2yACS905Sd2AkNvrBudjZeCSalzRLLTzgDZlUTeRyRMyAUAwA84CYYcva
 sS2dHPdOcxda/ih7zFaYMn8XJt0mnk85yW3C8lOihdAdUd4uAKH9ir6Vq5n0tz+4NQHx
 +o6u3l4A4hjTJMlO2C+6mKiWCcb+MCR7xXucpgZhAkDQdxorEG9UIBV4jYeYBECUw4CR
 a1Dg==
X-Gm-Message-State: AOAM53014ffdjAiPcSsn1FHWc92rcjcKHFm1vzQsAVtALLXbIHdndbjg
 M0xpk9aYqju9cvFuzdkzrWE=
X-Google-Smtp-Source: ABdhPJxcrkej2m+w34/8wZgqh89Nn40/n/KBhvMgoMj3eaqocRQEdySUWeXWqRjxvtBs3p4KcCMrWg==
X-Received: by 2002:a05:651c:211a:: with SMTP id
 a26mr15593430ljq.305.1629751180124; 
 Mon, 23 Aug 2021 13:39:40 -0700 (PDT)
Received: from localhost ([94.19.228.143])
 by smtp.gmail.com with ESMTPSA id u21sm790667lfc.239.2021.08.23.13.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 13:39:39 -0700 (PDT)
Date: Mon, 23 Aug 2021 23:39:38 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Peter Oh <peter.oh@eero.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 Wen Gong <wgong@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>,
 Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Brian Norris <briannorris@chromium.org>,
 Julian Calaby <julian.calaby@gmail.com>, svp <svpm@yandex.ru>,
 felix+debian@gueux.org, Massimo Maggi <me@massimo-maggi.eu>
Subject: Re: Revert: ath: add support for special 0x0 regulatory domain
Message-ID: <YSQHijyArNZW38Qq@skv.local>
References: <YSJ//ki/A1EgfLga@skv.local>
 <15d3d071-61a2-0847-de13-634a0c2077d5@eero.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15d3d071-61a2-0847-de13-634a0c2077d5@eero.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_133942_234655_501945B8 
X-CRM114-Status: GOOD (  22.83  )
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

On 21-08-23 11:15, Peter Oh wrote:
> 
> On 8/22/21 9:49 AM, Andrey Skvortsov wrote:
> 
> > 1) Current behaviour maps 0x0 regulatory domain to the most restrictive
> > world domain. According to the wiki (probably based on Atheros
> > documentation) 0x0 means US. Does wiki contain wrong information?
> 
> 0x0 means country section in OTP is not written yet and open to set to any
> country.
> 
> QCA sets to US in this case as a default value.

Do you mean it's set to US by code fragment described below?


> > 2) If I understand correctly, 0x0 is always replaced with 0x64 and that
> > makes the following code useless, because it will never be executed. Is it
> > ok?
> > 
> > drivers/net/wireless/ath/regd.c:703:708
> > 
> > if (reg->country_code == CTRY_DEFAULT &&
> >          regdmn == CTRY_DEFAULT) {
> >              printk(KERN_DEBUG "ath: EEPROM indicates default "
> >                  "country code should be used\n");
> >              reg->country_code = CTRY_UNITED_STATES;
> > }
> I don't think that's true. If you're seeing 0x0 is replaced with 0x64
> (CTRY_BULGARIA = 100), it could be because your device's manufacturer
> preconfigured country code with the value.

0x64 is not BULGARIA, it's not the country code in this case, but regulatory domain - WOR4_WORLD
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/regd_common.h?h=v5.14-rc7#n84

country code is still default (CTRY_DEFAULT == 0x00), but regdmn is
sanitized (set to 0x64) and is not CTRY_DEFAULT (0x00), therefore
country_code is not set to CTRY_UNITED_STATES any more.

> > 3) Previously it was possible to get regulatory information using 'iw reg
> > get', but now it doesn't work anymore. Is it expected behavior?
> > 
> > [--------------------4.19 ---------------------------------]
> > # iw reg get
> > global
> > country 98: DFS-UNSET
> > (2400 - 2483 @ 40), (N/A, 20), (N/A)
> > (5150 - 5250 @ 100), (N/A, 20), (N/A), NO-OUTDOOR
> > (5250 - 5350 @ 100), (N/A, 20), (0 ms), NO-OUTDOOR, DFS
> > (5650 - 5730 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS
> > (5730 - 5850 @ 80), (N/A, 20), (N/A), NO-OUTDOOR
> > (57240 - 66000 @ 2160), (N/A, 40), (N/A), NO-OUTDOOR
> > 
> > 
> > [--------------------- 5.10 --------------------------------]
> > #iw reg get
> > global
> > country RU: DFS-UNSET
> > (2400 - 2483 @ 40), (N/A, 20), (N/A)
> > (5150 - 5350 @ 160), (N/A, 20), (N/A), NO-OUTDOOR
> > (5650 - 5850 @ 160), (N/A, 20), (N/A), NO-OUTDOOR
> > (57000 - 66000 @ 2160), (N/A, 40), (N/A), NO-OUTDOOR
> > 
> > [-----------------------------------------------------------]
> 
> The 4.19 output tells you that country code is changed to different one from
> manufacturer is set(US).
> 
> The 5.10 output seems manufacture set country code to RU. If it's the case,
> No phy level country code looks wrong or a bug.

There hardware is the same in both cases. RU is displayed just because
I played with 'iw reg set RU/US/..'. My question is more about why on
newer kernels 'iw reg get' doesn't report regulatory information about
these cards (phy#..) any more.

I mean following lines:

phy#0
country US: DFS-FCC
(2400 - 2483 @ 40), (N/A, 30), (N/A)
(5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
(5250 - 5350 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
(5470 - 5730 @ 160), (N/A, 23), (0 ms), DFS
(5730 - 5850 @ 80), (N/A, 30), (N/A)
(57240 - 71000 @ 2160), (N/A, 40), (N/A)

phy#1
country US: DFS-FCC
(2400 - 2483 @ 40), (N/A, 30), (N/A)
(5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
(5250 - 5350 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
(5470 - 5730 @ 160), (N/A, 23), (0 ms), DFS
(5730 - 5850 @ 80), (N/A, 30), (N/A)
(57240 - 71000 @ 2160), (N/A, 40), (N/A)

-- 
Best regards,
Andrey Skvortsov

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
