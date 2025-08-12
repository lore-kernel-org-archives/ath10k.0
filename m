Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088F6CA0EDB
	for <ath10k@archiver.kernel.org>; Tue, 12 Aug 2025 19:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGfJ+5VGgJ63ybwlcSukXABcToAGmvAizWD5hXKaowM=; b=1ofReOUOZTS1WTkxq4k2ID/O1v
	QE3MNiAfz4SQiKdd9bW1UI4EsHgZ2ciyu05+kk1mQGwVCQxfk/eB0gHmVUgBE8jCRdAFhf+FRbIuz
	vjPpydhfv9PmMcveyY6qMDCDC9CHS3Q5mtefLW+AA2UHhaQtpI6ohtus8jzY3EwS7N5Glg4iGk0SD
	tFnXejPolsTfuquJMTtVb0q7MZi65W6/Y+GEioCLEGDKYWglBWpAl+ggpFC/BS2muFiRSIcgbG/xP
	wLxi1n3pJ11L0NmxdpOeZigw4jGFud4JprlOHN67dmTGtIE/arQ6/l6okIBpTv/1oTetMdW5SEFzb
	WVedWDcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulubb-0000000BoPj-2IAs;
	Tue, 12 Aug 2025 19:24:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrnE-0000000BOvb-2HUG;
	Tue, 12 Aug 2025 16:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eGfJ+5VGgJ63ybwlcSukXABcToAGmvAizWD5hXKaowM=; b=ip34CXcpMjpdIaHQIYSBZ/SV2i
	M/afdHPWBf8UmpiO1dMKBIl5gErFt//akhtzDXiBLy04Ch6p6CmUqwsEoR/Zl5/7cOwlvrL7mSFMz
	EpUhAlpe2yaW2/BUEuoRTSk4UK3aTaCNH2BOWO44WsQ8XaeJh01T6eG3cOkDFJrTBRet9GaKEO3gR
	IIXRQXVQigW5OgFzV/E4OptZcXqUbkplKSw8JggdZ4n6XIqsz5/vJvAM7KmMA6/z1XxDOrdFFBcAb
	cCCNVOyyFV+5f9QSG9nhk9vGxdUQDuQbD1DwPnxi3KP5BhiriRC/bGkOnSeIqM/NF8XZv0/0zgs22
	cIhIIu+Q==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrn8-0000000FquD-3HZe;
	Tue, 12 Aug 2025 16:24:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F18F5C695D;
	Tue, 12 Aug 2025 16:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58270C4CEF6;
	Tue, 12 Aug 2025 16:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755015838;
	bh=DX/a/5+B4C5HgtQc829srmgZngPbuyntkKppc+GEAp4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TUc1N2T8TbtzPU7YHakEEQGtQWIy/0cxkndUmUoUoYyBPJnec8Qeecaa3FYjGPqXU
	 0hRy0dOCtkiN6geGXdcQu084ZA3CqeMRvV/ZNJA9/XBh5noIoAUAQ0DQWHzW5Wqp2a
	 sL/nXMBTC6PtZ3Yp4MzWPzScAq5+GwmFF4F/KIAzFsPijQ9BmpGGaqglT12Om22K5l
	 IukZHX0AMZOFvl/jAuwISbexWGd0F8HooIRbCFqdb4FDMlRmnBka+3HmX8MYbr2ScI
	 5T00COSasqF4+8FBfCUz+YIveYu4rSNYVl+hzJO+2PkDwAkvJCdaZP6Pyrh0ljhIcl
	 KR+rDDyLCWlMg==
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Jeff Johnson <jjohnson@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 "Dr. David Alan Gilbert" <linux@treblig.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-media@vger.kernel.org, patches@opensource.cirrus.com, 
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH 00/21] gpiolib: fence off legacy interfaces
Message-Id: <175501582810.192378.6304989017593161369.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 17:23:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_172403_231136_D97E3E1B 
X-CRM114-Status: GOOD (  21.00  )
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

On Fri, 08 Aug 2025 17:17:44 +0200, Arnd Bergmann wrote:
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
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[08/21] ASoC: add GPIOLIB_LEGACY dependency where needed
        commit: 5383d67e2430822fa7bd20dcbbebbd8ae808e386
[20/21] ASoC: pxa: add GPIOLIB_LEGACY dependency
        commit: 2d86d2585ab929a143d1e6f8963da1499e33bf13

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


