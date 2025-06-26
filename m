Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213A7C7EE31
	for <ath10k@archiver.kernel.org>; Thu, 26 Jun 2025 18:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DW+isIgbcOam9K3su8rrNYApBVcaHJL5UXxTcvoqeA=; b=ev2U330fvZnXsfra/Ux3cOUeq6
	XcnciibJlp1aZJPn1v14Ib/lByN3OjJbsWBUkqo9I76nEwyGQtmU8Lf2Dgi2cnKfXo2+x5whWtIJA
	oawFVOM0ifV2FvlIxxevTc2TMOXMO0I+yyZxmR7ieH/119RCpquFFWOs4PWlOZUiD/qwEf7efuhmq
	uaXWPD4q5w2h+9RdeP51QLiS4A3LrgjZzm+lzmftfN2uWrwo3UbaL13hRbUqxa8mqvHsUb9haWiuK
	TK13VKwgZk1N5bxcbeVEG2MciLfCelnlIhxWXw8e+/RTrgUqJybJduyVugSYiU179T3pvZ2neWHUu
	U8T2bRgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrjU-0000000CVxS-0RRe;
	Thu, 26 Jun 2025 18:54:00 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUqmx-0000000CPMB-1uwu
	for ath10k@lists.infradead.org;
	Thu, 26 Jun 2025 17:53:32 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-235f9e87f78so17485915ad.2
        for <ath10k@lists.infradead.org>; Thu, 26 Jun 2025 10:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750960411; x=1751565211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3DW+isIgbcOam9K3su8rrNYApBVcaHJL5UXxTcvoqeA=;
        b=TU2XFMjravEHcX4TdkALYuDSmBS4eBQMWE1V5M/octzFZhnkqWja9Xc7ZOl98jquTm
         HlZjcFhszNUxkWY6ZJt4eyVJ5hNOfvTm9FIV2kn9qZjfZ6mAU4mbJgMfNfYiAFWb5xGt
         51D4xxR/QP6xtvOu9EDK6GPz473kBY1MQG9d1njq3sEZ1kBwzkt9cL8hAwmiErfnINnT
         ir6zmypHepVtuAmhQleuL93dFMtRAUO9gNU/fiTPC548DtLqmN5Wp1/2vgdYX1NfI2+g
         E7OZdCDvLfRq4ISPSlbsb6nlvO7a6DCr+DPiw5tINg2AygjidwTKuZybmIXMDq2RnSvp
         smnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750960411; x=1751565211;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3DW+isIgbcOam9K3su8rrNYApBVcaHJL5UXxTcvoqeA=;
        b=XPOjdq31dUTz/8rnFo4hqCkBsb180mhtCG4FcCzl2QHCv77KAIvFr21l/GoyBvpQo9
         RdHDX/ZnHfI1rUrRIR5ZusCxEvHJ/thCzupfy+NEWMc3JIjgDl7r8PSxM5UzyQ0KGB6Q
         UvLcCtcKRYVLtjS53aLs7kA+tIlDy4VQVwGz41TmZXuPKM8cD0alP8W84AqqbRFsZFIy
         iOkK4nedrrD0kEbuWZoPW8bdoi3CfTXVJ4cSZmn6T3NYrRzNql8btUm8qwP7vOzlXxza
         Ux0k1L+//+9uo/HYKw5rTcgA5LJezhEpGWRzqSPxuUxh5S3yS2bTmo0u3B0E/et/lgKY
         laAg==
X-Forwarded-Encrypted: i=1; AJvYcCUsTLwLz9sp8KdcTZ3cx4geUdEQ8t7QM7aEsjoBkUIgPTxT1rdF5mW+SCarGcH+Bi+sVSnXT0s=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzSTkBO6NscZLMyU1x++gbua7DRvtxJyqze9tv/6ztBtD7gXwm
	VFob3CjlCMaMlGbsdv15BXuI5cwiZ7IKpbIE/sY/Dlk5HOfLxTv28FnX
X-Gm-Gg: ASbGncuL8GkLFPC/N+8gfuxU+YmZPyJGOY7qZSm5K5j2We6k9vZybLi2TPaBOkOhlFI
	xEkUjtZu71xFbF/MLU5gRWQyIdPNYy3cOJ1jWqLwc3cTS2jiMW12nB6U2FclHARb4PvrgkhBriH
	Yiw22xwqJZG6GlBeB++2dN1c+w4pmMZFF03CMHUKlIHpBPJTLceMq+gFnvgS/c3oLfeyRo//sQm
	y+waCz3mDhSXAcD8qpSjxEDEskHPc459V1ATyBLrDjPZvG22EL0L1rtb11yjzTJakQQd32zzzkd
	Pean3L9EWNWYwa7/gQEhbIrc0KjPTNffa0rKBPqZ/CAL2nEZFGFW6uWRafQMKnJqhFGxJunVLOr
	9p+w=
X-Google-Smtp-Source: AGHT+IGMAGEXF0yV0ZZzuhQSFlpR4GVzlRjXoSxE+CF+J+ar1VbxUo+RYXwsDYzu1MLVP4aLNgLoyA==
X-Received: by 2002:a17:902:c950:b0:235:799:eca5 with SMTP id d9443c01a7336-23ac463e850mr3573485ad.44.1750960410691;
        Thu, 26 Jun 2025 10:53:30 -0700 (PDT)
Received: from [127.0.0.1] ([116.206.223.154])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe312819sm3768515ad.34.2025.06.26.10.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 10:53:30 -0700 (PDT)
Date: Thu, 26 Jun 2025 23:23:14 +0530
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
 linux-acpi@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_Instability_in_ALL_stable_an?=
 =?US-ASCII?Q?d_LTS_distro_kernels_=28IRQ_=2316_be?=
 =?US-ASCII?Q?ing_disabled=2C_PCIe_bus_errors=2C_a?=
 =?US-ASCII?Q?th10k=5Fpci=29_in_Dell_Inspiron_5567?=
User-Agent: Thunderbird for Android
In-Reply-To: <CAEmM+Qg+xxMfXb=704OfwYLou7Mh_BNaTevLaGfiG2peZotJoA@mail.gmail.com>
References: <CAEmM+Qi-Waxk5qcR+nfip-QGXaKk0-Kq7QSq890e9oYOPjW+bA@mail.gmail.com> <20250625202014.GA1585022@bhelgaas> <CAEmM+Qg+xxMfXb=704OfwYLou7Mh_BNaTevLaGfiG2peZotJoA@mail.gmail.com>
Message-ID: <E8A26FD9-13E3-474A-87FF-ED8D27A1F27B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_105331_495623_30CDE495 
X-CRM114-Status: GOOD (  20.02  )
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

Hello everyone,

I think I found it=2E I used irqpoll and I didn't experience any hiccups w=
ith my mouse performance=2E But the Wi-Fi was still malfunctioning=2E

To linux-pci and linux-acpi:

It's an ath10k problem, sure, but there's something definitely problematic=
 happening if, in the normal state, these Wi-Fi bugs hamper the touchpad mo=
vement=2E

To ath10k and linux-wireless:

I tried out "options ath10k_core rawmode =3D 0" along with "skip_otp=3Dy' =
and the Wi-Fi seems to work perfectly as of now=2E It might be the fix, it =
might not be either=2E But I think there's something more important to ask:=
 Are there any good resources/documentation on referring to what the differ=
ent key-value pairs mean? Like, what's the exact documentation through whic=
h people arrive at "rawmode=3D0" or "skip_otp=3Dy"?



Bandhan


On 26 June 2025 4:20:13=E2=80=AFam IST, Bandhan Pramanik <bandhanpramanik0=
6=2Efoss@gmail=2Ecom> wrote:
> Please ignore the last email (I haven't replied to everyone)=2E Also,
> here's the actual updated dmesg (the previous one was the old one):
> https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a1=
6180/raw/78460e6931a055b6776afe756a95d467913d5ebd/updated-dmesg
>=20
> On Thu, Jun 26, 2025 at 4:16=E2=80=AFAM Bandhan Pramanik
> <bandhanpramanik06=2Efoss@gmail=2Ecom> wrote:
> >
> > Hello Bjorn,
> >
> > First of all, thanks a LOT for replying=2E
> >
> > I have included the files in my previous GitHub Gist=2E Sharing the ra=
w
> > files for easier analysis=2E
> >
> > lspci -vv: https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03ca=
2ea43a1d832a16180/raw/78460e6931a055b6776afe756a95d467913d5ebd/detailed-lsp=
ci=2Etxt
> > dmesg: https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03ca2ea4=
3a1d832a16180/raw/78460e6931a055b6776afe756a95d467913d5ebd/dmesg=2Elog
> >
> > On a different note, I had to use pci=3Dnoaer, so that the ring buffer
> > wouldn't get cleared that fast=2E
> >
> > Regarding the ath10k thing, none of the fixes worked this time=2E Only
> > irqpoll worked=2E I don't know if it's because of a disparity b/w GNOM=
E
> > and KDE (because my daily driver is Fedora 42), but I'm 300% sure that
> > it's not just the Wi-Fi that's the issue here=2E It's most probably a
> > lot of issues here, and the harder issues to fix are usually the ones
> > closer to the hardware=2E
> >
> > Anyway, if you get something, please let me know=2E
> >
> > Bandhan
> >

