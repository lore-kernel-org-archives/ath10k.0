Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA891ECAAA1
	for <ath10k@archiver.kernel.org>; Tue, 30 Aug 2022 21:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hTWvlVG16xGAMiD6UW9jMXd6XYPAjBqC1zYtJO2ljd8=; b=aH8ySyYee4tyTF
	cCguhIZ69W0KZuI41S+MXkmRqEUwCdRwspTzu4Nxviq2lWtkSUJqGW/4IVhd3kL/xBMcojoI3ij09
	Y/ywjnE1osJXEBeUIgM1tRWgB1ybasvMAr2giGJAU1iX2f+SPIJwliLjmH6J7eDfkMYMM15r1HP9c
	xiGDC47YYxQb3tgMQtYBDdkPE3ctX4CuqmYjwZK8s6coh8EgRhDsLgut8ni7XG0V3H3lphVseu+DS
	rkpyY50HUIr8vzxt+/ApG5vKw1gj/HKIRl49MdC7QF2fl1HBd2yQRt8koj/9p2Cgf1vQ5e3TET7kU
	A2GGO2grt5+3GYJ/UbOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT9EO-002A4q-AZ; Tue, 30 Aug 2022 21:57:12 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT9EJ-002A3j-Ta
	for ath10k@lists.infradead.org; Tue, 30 Aug 2022 21:57:11 +0000
Received: by mail-lj1-x22a.google.com with SMTP id bn9so12761799ljb.6
        for <ath10k@lists.infradead.org>; Tue, 30 Aug 2022 14:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=1fa8H+/zqrg4rLek0JWMSXHGxEPhsU7TtoF+0YlZ8IY=;
        b=c06NVwVMTCHcZQzC0mXtuVOLzYez/z0qCP+KjabYfFBW4cLFDPX8svVAFfy/H73v6C
         9SfRL3nSJwQ/kb+BAFQK+M8w7sBcvpxd/njeFI6eX6V1aIEnFh9ZKirX/lVBG0okGhZP
         uvrFqHWmpkewfeJwC/5EB7ICVB2g/EzZ9KD1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=1fa8H+/zqrg4rLek0JWMSXHGxEPhsU7TtoF+0YlZ8IY=;
        b=uTu2mK8qYzfVIUU47Q5+BFpX3uOYgVN90auS9HvRKYxqTgt6s9kM6CZGw93cL8VE3p
         fn0rJVYJibMeWwJVv+jMQh5ZFCpML5AzEDyrW+AME/2H8ppDc9zmLmqNxVazgoMkCgXD
         BAv0XMQOE+xRVDSvgYimmoAwt0ScW3pXJi4it0ZUwwWxv34w8PQZaZdGYCpcYHtTDwvE
         8cjjdNZgLKX6vi4eh1QnaGYwg0cPXFFZQffZpMlVC4Craa1AjEVP+veIDSTCdy1VIqiH
         /svHHtnBXrjftHk9DuicmYj8AhSthNifjBT9JUD5dJtj9Cy+xUn9ZOIsM0JZGGTFL+Og
         1zow==
X-Gm-Message-State: ACgBeo3Mx4X1PWed1tb5VDhq0iUjZ89tfktWGX8BtQVUHU8jh6XzhvuY
	BtuZXNN7H9ATX8XJSsZUnjA+rLkxk9jG9mqi
X-Google-Smtp-Source: AA6agR5VA/qA0Cz10exRhMPbH9WQhCHHdP1ylletAsaKXBT2e54pNALCFoE1gxKJBlKFBw5AFLkn2w==
X-Received: by 2002:a05:651c:105b:b0:265:ca48:d445 with SMTP id x27-20020a05651c105b00b00265ca48d445mr2684701ljm.300.1661896624957;
        Tue, 30 Aug 2022 14:57:04 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id v4-20020ac258e4000000b004946c3cf53fsm834926lfo.59.2022.08.30.14.57.03
        for <ath10k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 14:57:04 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id bt10so17397432lfb.1
        for <ath10k@lists.infradead.org>; Tue, 30 Aug 2022 14:57:03 -0700 (PDT)
X-Received: by 2002:a05:6512:1308:b0:492:a402:ce64 with SMTP id
 x8-20020a056512130800b00492a402ce64mr7699025lfu.607.1661896623331; Tue, 30
 Aug 2022 14:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200527165718.129307-1-briannorris@chromium.org>
 <YmPadTu8CfEARfWs@xps> <CA+ASDXPeJ6fD9hvc0Nq_RY05YRdSP77U_96vUZcTYgkQKY9Bvg@mail.gmail.com>
 <CAG2Q2vXce2V3Y6MnPhV6obcNWyQzyusMTL=5oCQLRNh2_ffNYA@mail.gmail.com> <CAG2Q2vXFcSVwF4CbU5o3VP1MWwrdqrZjTHgfBj_Q0t3nNipJRw@mail.gmail.com>
In-Reply-To: <CAG2Q2vXFcSVwF4CbU5o3VP1MWwrdqrZjTHgfBj_Q0t3nNipJRw@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 30 Aug 2022 14:56:51 -0700
X-Gmail-Original-Message-ID: <CA+ASDXNx30A3=BA9b-tiAQzYHP=nV_eLw1QFpJij=F=JgWZ5sg@mail.gmail.com>
Message-ID: <CA+ASDXNx30A3=BA9b-tiAQzYHP=nV_eLw1QFpJij=F=JgWZ5sg@mail.gmail.com>
Subject: Re: [PATCH] Revert "ath: add support for special 0x0 regulatory domain"
To: Cale Collins <ccollins@gateworks.com>
Cc: kvalo@kernel.org, Patrick Steinhardt <ps@pks.im>, ath10k <ath10k@lists.infradead.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	Linux Kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, 
	Tim Harvey <tharvey@gateworks.com>, Stephen McCarthy <stephen.mccarthy@pctel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_145708_000427_82FE9FFB 
X-CRM114-Status: GOOD (  22.80  )
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

Hi Cale,

I meant to respond a while back, but didn't get around to it, sorry.
In case it's still helpful:

On Wed, May 11, 2022 at 3:52 PM Cale Collins <ccollins@gateworks.com> wrote:
> On Mon, May 9, 2022 at 11:16 AM Cale Collins <ccollins@gateworks.com> wrote:
> > I'm experiencing an issue very similar to this.  The regulatory domain
> > settings wouldn't allow me to create an AP on 5ghz bands on kernels
> > newer than 5.10 when using a WLE900VX (QCA9984) radio.  I bisected the
> > kernel and ultimately landed on the regression that Brian patched.

If the revert broke you, then you were also broken before v5.6. This
patch only landed in v5.6-rc1:

2dc016599cfa ath: add support for special 0x0 regulatory domain

I'm not really an expert on the wide variety of ath-related hardware
production, but given the many people complaining about the existence
of the non-reverted patch, it seemed like a revert was the best way
forward -- don't break those that weren't already broken pre-5.6.

> > root@focal-ventana:~# iw reg get
> > global
> > country 00: DFS-UNSET
> >     (2402 - 2472 @ 40), (N/A, 20), (N/A)
> >     (2457 - 2482 @ 20), (N/A, 20), (N/A), AUTO-BW, NO-IR
> >     (2474 - 2494 @ 20), (N/A, 20), (N/A), NO-OFDM, NO-IR
> >     (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW, NO-IR
> >     (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW, NO-IR
> >     (5490 - 5730 @ 160), (N/A, 20), (0 ms), DFS, NO-IR
> >     (5735 - 5835 @ 80), (N/A, 20), (N/A), NO-IR
> >     (57240 - 63720 @ 2160), (N/A, 0), (N/A)
> >
> > phy#0
> > country 99: DFS-UNSET
> >     (2402 - 2472 @ 40), (N/A, 20), (N/A)
> >     (5140 - 5360 @ 80), (N/A, 30), (N/A), PASSIVE-SCAN
> >     (5715 - 5860 @ 80), (N/A, 30), (N/A), PASSIVE-SCAN

Unless there's some other bug hidden in here in how we're reading
EEPROM settings, it sounds like you have a badly-provisioned PCI
module, with no EEPROM country code. Thus, the driver has to
conservatively treat you as a very-limited "world roaming" regulatory
class, which mostly disables 5GHz, or at least doesn't let you
initiate much radiation on your own (which basically eliminates AP
mode).

The "fix" there would be to get a different, correctly-provisioned
(for your regulatory domain) module.

Also, I didn't notice until today: technically, you also could be
retrieving your incorrect country code info from ACPI; but if you're
using a typical ARM board like claimed, it's unlikely you're using
ACPI.

Somewhat of a sidetrack: The existence of ACPI override support does
suggest that perhaps there's some room for a Device Tree property, so
one can set their regulatory domain on a per-board basis. I've
definitely known some downstream product makers use that sort of
approach -- and that very "solution" is potentially why some devices
don't get a valid EEPROM (if the manufacturer could hack the drivers,
why bother getting the EEPROM right?), and therefore don't work
correctly with upstream kernels... Unfortunately, that kind of
solution is hard to deploy 100% correctly for upstream Linux, because
the Device Tree would need to change depending on which country the
affected system is shipped to. It's easier to get those things right
in a pre-flashed firmware or an EEPROM; it's harder to get those in a
software DTS file shipped to everyone in the mainline kernel sources.

> > #dmesg |grep ath output

In the slim chance there's something else going on in the driver, you
might try to capture logs with ATH10K_DBG_BOOT and
ATH10K_DBG_REGULATORY logging enabled. That could look something like:

echo 0x820 > /sys/module/ath10k_core/parameters/debug_mask
rmmod ath10k_pci
modprobe ath10k_pci
dmesg | grep ath

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
