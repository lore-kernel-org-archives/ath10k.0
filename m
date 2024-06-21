Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325E1C27C4F
	for <ath10k@archiver.kernel.org>; Fri, 21 Jun 2024 08:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDMu00mV1qaVpBkrHZ5jMnVpkSyXptp2t4w1GNmg9GE=; b=nllw45PKuElyucjQo2oJESQNuE
	ijlz+YS9xNsnvftuWYmD83RL/EORkBkEVYagR2kxQV/zq3+eU6adUP++r9zZUyYVtA1dym1m3dFuG
	7yWGurfeQP5uhkypsvnu/VznMNg8Q1j9Lo+tj+5ncZGFFBRbf4+lJsEnGBaV1vCXP8tvjwn01DMD5
	fsV2xmQn2JZvzx1QwdwO2S6rAx/apVLVBECFQhog5tRK5gWLwlC0RBvOmiq4qhfmgZUoUlr1BIviR
	jby2LlBh5aJlNV61lne2tuXdW3nm31mRVugFNvJM3MyVtYux+8C+IJTrR+CFTm7MdPDI8trBpZ4xy
	N1V9o+2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZvs-00000008PS8-2Jav;
	Fri, 21 Jun 2024 08:47:44 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZvo-00000008PRZ-2eAc
	for ath10k@lists.infradead.org;
	Fri, 21 Jun 2024 08:47:43 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-57cfe600cbeso1997935a12.2
        for <ath10k@lists.infradead.org>; Fri, 21 Jun 2024 01:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citymesh.com; s=google; t=1718959659; x=1719564459; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDMu00mV1qaVpBkrHZ5jMnVpkSyXptp2t4w1GNmg9GE=;
        b=bK6JcLEBg+ve0vrKdMLofj7ip/Wael0PYXJscySeIjKtPjWVUJ+67dC800j/avhtof
         qOCoDKCdAX0FlcKStjlA0CrYxlfX1Wt9VLk07elAJzLGwogmCfor5PwlqfwGzfnO6UnE
         YA9yP3RAO5lXoO/wTs3SchgesxRcezJpFoojE9Bs8LlGOUUPWc6b4KlOnmQg8VCvYe17
         /zYCdf4UUv8UwxLNJxwpDECK/jUG/oPPf6mwtP02eewfJNjPF77jVcKi3hKdfLUj1+Jf
         KDku+f9tZUWpw0FKeHFoR+65q8GwwKOfjRF1r7KB1iE874VVl5uz1wJo1Vy7djuoX3PH
         I2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718959659; x=1719564459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDMu00mV1qaVpBkrHZ5jMnVpkSyXptp2t4w1GNmg9GE=;
        b=DKMhKBuvODT5ttUVWUbTf+KQyWMlTypEUapFJIAnrov+0z7R7vbsi6RyBe2CO2REMc
         sU1z1+Rjqzq8BOr/di5NI2IS0oVjZD3kOKHxB7+CrW1L6/T6K4W7dDXqOsU0hMAbG1yL
         V4UhB/VuAhAFLjWpgSOBdr0ASOHVHnLASDSmvvgO90JjIe3e1tzCTufF9RhsmP2D4htA
         3K8j8WVJuYKLaFHEOKpiI44JXMSkhauXCWFyPQ1tuvrY5qbIF44UUxM1HYLNkUtbSSd6
         OOr+0TDkI8grO6GDmt0tggxywyErmpuh1lCI6Ff15cyWZWd/cW+7M3OsnionAhoIeNHu
         ZmDQ==
X-Gm-Message-State: AOJu0Yxe2LgiNMA5nfH2U8jTksGMgfrFEqp0AbDTiIa++oK85FAYdKox
	G7EgIB4a4CL80hWMk5WYqDD8kGFzZiiSysDRC/luMO0KFbaJlrOlK9QleBPiZ5jZKyiRZ7fq5au
	izhKM5nlZ5vfJdub6Lj9tX6wTuJADd4RJoPqaQw==
X-Google-Smtp-Source: AGHT+IFbHYh8icaOhJudVrdY/YTgZkwzGJ1/e/hmi87432nITQ8twIZwgr0tJr4hZwSyjkLTGFiZ6JIyQ80ckbc3C/w=
X-Received: by 2002:a50:8d14:0:b0:57c:78fb:1a32 with SMTP id
 4fb4d7f45d1cf-57d07e82ab3mr4394205a12.19.1718959658908; Fri, 21 Jun 2024
 01:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com>
 <efc8cdc0853a921ce4dad1a36b084608fe0b01a8.camel@sipsolutions.net>
In-Reply-To: <efc8cdc0853a921ce4dad1a36b084608fe0b01a8.camel@sipsolutions.net>
From: Koen Vandeputte <koen.vandeputte@citymesh.com>
Date: Fri, 21 Jun 2024 10:47:28 +0200
Message-ID: <CAPh3n834eg1_+gmh_LMTQnc95aLBWNVOANjZsMap=_szOY2nHQ@mail.gmail.com>
Subject: Re: ieee80211.h virtual_map splat
To: Johannes Berg <johannes@sipsolutions.net>, quic_jjohnson@quicinc.com
Cc: ath10k@lists.infradead.org, 
	linux-wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_014740_697864_F75DE077 
X-CRM114-Status: UNSURE (   8.12  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Fri, Jun 21, 2024 at 10:21=E2=80=AFAM Johannes Berg
<johannes@sipsolutions.net> wrote:
>
> On Fri, 2024-06-21 at 10:04 +0200, Koen Vandeputte wrote:
> >
> > memcpy: detected field-spanning write (size 64) of single field
> > "tim->virtual_map" at
> > ../ath10k-ct-smallbuffers/ath10k-ct-2024.03.02~eb3f488a/ath10k-6.7/wmi.=
c:4043
> > (size 1)
> >
>
> Check out commit 2ae5c9248e06 ("wifi: mac80211: Use flexible array in
> struct ieee80211_tim_ie") ... :)
>
> johannes

Ooh .. fixed already :-)
Thanks a lot for the pointer

Jeff,
will this one get backported also?

Thanks!

Koen

