Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C703C87FD2
	for <ath10k@archiver.kernel.org>; Mon, 11 Aug 2025 13:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdcvZYKwitUcECgcbI2UhLZ6metpTwEak9n/5y6m0SA=; b=Ur++ik44PygO1YOQph3vqzqNAt
	523vbEQVeUqqCo+9TPXLLPua1OpNVfovWpiVjN3nhfiks7fB2N2+rOdZeimLRl4l1mdyMxWeMUCOG
	Iy9AwU523T5yu2nGN2VoH+8zFPljH0Ogl7t+EPnVUA8SOMAEAK4MOTQUH5kK4MpKVu0soyGTu/8vq
	tOcPcpZdSFuU30ICNiIVKBBpRP0TaSlCDJM793KpgxZa8HTh/0+pxIeYiY8xCwsypaAufrG4jfDFm
	B6SzCei5zKEn8kqlTmwFmLCoaOKsx9WbiLbq1clsF9dTLZmfTcErlDkdxw28OsWXSZiepVNmZ61dV
	OcYuq4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSS3-00000007nRQ-3TeJ;
	Mon, 11 Aug 2025 13:20:35 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSIQ-00000007lte-0uuo
	for ath10k@lists.infradead.org;
	Mon, 11 Aug 2025 13:10:39 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-76bd041c431so3681557b3a.2
        for <ath10k@lists.infradead.org>; Mon, 11 Aug 2025 06:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754917837; x=1755522637; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YdcvZYKwitUcECgcbI2UhLZ6metpTwEak9n/5y6m0SA=;
        b=lBOo069dArx3KJqFRMFcVKict1vLA0qOfoUSVHsl7cO3fp7ovSivqEUsK6PVvrdUfA
         /Kixr9xHDySuNKuBQh9Zy6ByzVYXDOUghFnr2mATsNlO5jaWTaZlr4f+yB0eqpLUWXrZ
         SFT1xtLukkeDSI7aE5DCqW2pu/o1FnGDd+o70y/hbDQc68gJ1CpZubhotYOuqSlr1/YE
         r4uqcJatG+k3ttg6qqTVxKAMsdPrxNoDrlR+yM2HdqCnZerEtnVJKlKpuXZf21Djxx9d
         cAvFJeAMxAM5+hL9VA3Le+cVlauudU/GPdZduBvND9XGDDXfuE+INSQLgTh5q+5q4fVX
         TvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754917837; x=1755522637;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YdcvZYKwitUcECgcbI2UhLZ6metpTwEak9n/5y6m0SA=;
        b=N+p2fZq6E2YcS9DSPyseziyQ9OZxkaYQBBF3XLdL58p2G5OLa0CFOD8QDfqgsmLz1y
         9WquoUQdJOc4Q7KBZGGo6X8iXjHXa+XO8bf1FLIvpORMZJ+upxuNY5gs7xKgqhf4Z4Zt
         LsbPhqTPakmUXgcnf6Dc19Ems61TtWxm0AunAa5Q5hsgqKk2PSE9NB2TlZawNSOFyj15
         5NekDIi9Qdeg7/uTQj7vMfqBFdfTlYQlMqzR4iP5rPrm8CCGKBWsRx6x8WnjW0E3t7oC
         S6xisLxBNwakmqOto/+wtkXkE2IT257R2y+YdjVR4Ff+zXz8wZQmTcChy6yXBLCrM2ol
         n/SA==
X-Forwarded-Encrypted: i=1; AJvYcCUDBckUuwn/sxt6EoGAbj7vMbrY0FKAUelz8TbTWGMqKbmcj2DVQIdqBmz79oKTKR//+oKuHWI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3bdtv7x6/L43gu7UpJogTJ/oYWrWZlqTZoWlwi4C0XjNNJCql
	8EjaJ55/HTm1MxNxK24sjODgDylFTZ34WfCyBG/nJv3pqxoKv5+4duOYxCLjctrnJglWc5F9f00
	R7BSnscOaU5lpSaZ9femUAW7gni0yIbQoR2P3Mya/bQ==
X-Gm-Gg: ASbGnctSJjJuU5MPRsVTRpm6STeGKVSlVYINq3glJsTHFTD/NOuig1cGYbi7GQoOGcY
	zAkw6oya4h3S8/OyBSJsWNJ/mVFLiojQMkcNb7a8zwWyvhvf+RkBqzWQCLsUi/Cn5cVqx5GTErK
	xjUn/IsSiS5qPAidYMtXLJltxPwsR+jNJnQ3gY7DOQB+h5UtqZ6JqSlIhHdOB45ZaFpWcZNSJAv
	nWmR5LqKz008TYltdtrWuffUmN44Ueyi7leJQk=
X-Google-Smtp-Source: AGHT+IEgMvtsNpCEbzm+bQO3Dq6oVeggGu7qnt+f1HYUPfLnzNmxpfjIx2ohdBUK5XJ+fhQGIjFsq0lNMPvywZaOZwE=
X-Received: by 2002:a17:903:32cb:b0:240:96a:b812 with SMTP id
 d9443c01a7336-242c203d030mr203994295ad.24.1754917837398; Mon, 11 Aug 2025
 06:10:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 Aug 2025 06:10:31 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 Aug 2025 06:10:31 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
MIME-Version: 1.0
References: <20250808151822.536879-1-arnd@kernel.org>
Date: Mon, 11 Aug 2025 06:10:31 -0700
X-Gm-Features: Ac12FXxi-t7kK_6HIDwsxWJsHZcp5BcOM26Y8X32Zi2av6pcVu6UuipKim4OtEQ
Message-ID: <CAMRc=MeyW8gtG_hsLWytCpufQRmg3s5QZenxCvP3MNGmaoo2cA@mail.gmail.com>
Subject: Re: [PATCH 00/21] gpiolib: fence off legacy interfaces
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
	patches@opensource.cirrus.com, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-sound@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_061038_262015_E893440C 
X-CRM114-Status: GOOD (  20.11  )
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

On Fri, 8 Aug 2025 17:17:44 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Commit 678bae2eaa81 ("gpiolib: make legacy interfaces optional") was
> merged for linux-6.17, so now it is possible to use the legacy interfaces
> conditionally and eventually have the support left out of the kernel
> whenever it is not needed.
>
> I created six patches to force-enable CONFIG_GPIOLIB_LEGACY on the
> few (mostly ancient) platforms that still require this, plus a set of
> patches to either add the corresponding Kconfig dependencies that make
> the device drivers conditional on that symbol, or change them to no
> longer require it.
>
> The final patch ends up turning the Kconfig symbol off by default,
> which of course depends on everything else getting merged first to avoid
> build errors.
>
> I would suggest that patches 1-20 can just get merged through the
> respective maintainer trees independently when they are deemed ready,
> and the final patch can wait another merge window.
>

Oh, not at all, I'm fine sending a second PR late into the merge window to
get that done in a single cycle.

Thanks for doing this, awesome work!

Bartosz

