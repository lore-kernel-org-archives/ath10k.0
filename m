Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350EFC87FD2
	for <ath10k@archiver.kernel.org>; Fri,  8 Aug 2025 15:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6iz0wVZOo4SxKMIws7qLgIMTqX8BufahwL1VlpRpEeo=; b=UKdWFV21JK58sJez5hX6r8HFBK
	s31N1hR/EURAQKJsiqUcm/aBu0ggiyXKmodjVLFQjSAR+MssmQkiaR41O2SHi8KTTeKOBBFqVx8dm
	F3iwcEAORNT1X4ek05NgZ7eHvXlont+rftHz+k/tuol3fWvz0juaQh628uUk+gF/qGiUJd5o3oVmO
	G93k1hQe4B8/pqKKr6FZL8Whh9XX7Ys936Y9J0QJuso8QxU3rBmFnn2fwuSbsIc9UpA1j0hVfDq/U
	dvtv5CFt1HHuHjV4Bas9d6gXIH0Nf7LBIjNnlD0fIAqSPXXZ8QZwjjmc0HxffMUGRcHVQVDxPEuzS
	MjNCGN8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukOsC-000000038nx-1Bb5;
	Fri, 08 Aug 2025 15:19:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukOsB-000000038nE-0d11;
	Fri, 08 Aug 2025 15:19:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42B52601E5;
	Fri,  8 Aug 2025 15:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA27C4CEED;
	Fri,  8 Aug 2025 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666350;
	bh=tsdeCPIPkX+wdlJnsaj55GinnOFi+s4xef6Bgzt4ay4=;
	h=From:To:Cc:Subject:Date:From;
	b=jEKu1+QacMpqQYXBXccohR6zFIE5s3psXsmyHRGVtrVZ0pnr1KmEtw/7ur1/cNOIW
	 7yaC0tT7pE/PEjOsCREluDbIOYElxV91R5zU3GXDduQNPG8iQNtdKgQXXVLW71gXl5
	 fRmW8W+WmqtOuYX/bt+7acRqoQOvMWs/tb/l9dLqifK5e8D6y8omqS0IUDwTvWnmUF
	 1F33T1JsWwfXSls+ht4OCwM/ynfr2/txGMl1BZG+D42MTMRH6wjt8FtNVLI5StDKkm
	 cyfFCwSelTNh5o5BUDnQ68xW+NwKXbG9KE6xPzchGCg1TuE5BEY10KBkXbjn1Yy2DL
	 MtO6m2yoXCqug==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-media@vger.kernel.org,
	patches@opensource.cirrus.com,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 00/21] gpiolib: fence off legacy interfaces
Date: Fri,  8 Aug 2025 17:17:44 +0200
Message-Id: <20250808151822.536879-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

Commit 678bae2eaa81 ("gpiolib: make legacy interfaces optional") was
merged for linux-6.17, so now it is possible to use the legacy interfaces
conditionally and eventually have the support left out of the kernel
whenever it is not needed.

I created six patches to force-enable CONFIG_GPIOLIB_LEGACY on the
few (mostly ancient) platforms that still require this, plus a set of
patches to either add the corresponding Kconfig dependencies that make
the device drivers conditional on that symbol, or change them to no
longer require it.

The final patch ends up turning the Kconfig symbol off by default,
which of course depends on everything else getting merged first to avoid
build errors.

I would suggest that patches 1-20 can just get merged through the
respective maintainer trees independently when they are deemed ready,
and the final patch can wait another merge window.

     Arnd

Arnd Bergmann (21):
  ARM: select legacy gpiolib interfaces where used
  m68k: coldfire: select legacy gpiolib interface for mcfqspi
  mips: select legacy gpiolib interfaces where used
  sh: select legacy gpiolib interface
  x86/platform: select legacy gpiolib interfaces where used
  x86/olpc: select GPIOLIB_LEGACY
  mfd: wm8994: remove dead legacy-gpio code
  ASoC: add GPIOLIB_LEGACY dependency where needed
  input: gpio-keys: make legacy gpiolib optional
  leds: gpio: make legacy gpiolib interface optional
  media: em28xx: add special case for legacy gpiolib interface
  mfd: arizona: make legacy gpiolib interface optional
  mfd: si476x: add GPIOLIB_LEGACY dependency
  mfd: aat2870: add GPIOLIB_LEGACY dependency
  dsa: b53: hide legacy gpiolib usage on non-mips
  ath10k: remove gpio number assignment
  nfc: marvell: convert to gpio descriptors
  nfc: s3fwrn5: convert to gpio descriptors
  usb: udc: pxa: remove unused platform_data
  ASoC: pxa: add GPIOLIB_LEGACY dependency
  gpiolib: turn off legacy interface by default

 arch/arm/mach-mv78xx0/Kconfig                 |  1 +
 arch/arm/mach-orion5x/Kconfig                 |  1 +
 arch/arm/mach-pxa/Kconfig                     |  1 +
 arch/arm/mach-pxa/devices.c                   |  7 --
 arch/arm/mach-pxa/gumstix.c                   |  1 -
 arch/arm/mach-pxa/udc.h                       |  8 --
 arch/arm/mach-s3c/Kconfig.s3c64xx             |  1 +
 arch/arm/mach-sa1100/Kconfig                  |  1 +
 arch/m68k/Kconfig.cpu                         |  1 +
 arch/mips/Kconfig                             |  5 +
 arch/mips/alchemy/Kconfig                     |  1 -
 arch/mips/txx9/Kconfig                        |  1 +
 arch/sh/Kconfig                               |  1 +
 arch/sh/boards/Kconfig                        |  8 ++
 arch/sh/boards/mach-highlander/Kconfig        |  1 +
 arch/sh/boards/mach-rsk/Kconfig               |  3 +
 arch/x86/Kconfig                              |  1 +
 drivers/gpio/Kconfig                          | 11 ++-
 drivers/input/keyboard/gpio_keys.c            |  5 +-
 drivers/input/keyboard/gpio_keys_polled.c     |  2 +
 drivers/input/misc/Kconfig                    |  3 +
 drivers/leds/leds-gpio.c                      |  8 +-
 drivers/media/usb/em28xx/Kconfig              |  1 +
 drivers/media/usb/em28xx/em28xx-dvb.c         |  4 +-
 drivers/mfd/Kconfig                           |  2 +
 drivers/mfd/arizona-irq.c                     |  5 +-
 drivers/mfd/rohm-bd71828.c                    |  2 +
 drivers/mfd/rohm-bd718x7.c                    |  2 +
 drivers/mfd/wm8994-irq.c                      | 94 +------------------
 drivers/net/dsa/b53/b53_common.c              | 17 +---
 drivers/net/dsa/b53/b53_priv.h                | 24 +++--
 drivers/net/wireless/ath/ath10k/leds.c        |  3 +-
 drivers/nfc/nfcmrvl/main.c                    | 47 +++-------
 drivers/nfc/nfcmrvl/nfcmrvl.h                 |  5 +-
 drivers/nfc/nfcmrvl/uart.c                    |  5 -
 drivers/nfc/nfcmrvl/usb.c                     |  1 -
 drivers/nfc/s3fwrn5/i2c.c                     | 42 +++------
 drivers/nfc/s3fwrn5/phy_common.c              | 12 +--
 drivers/nfc/s3fwrn5/phy_common.h              |  4 +-
 drivers/nfc/s3fwrn5/uart.c                    | 30 ++----
 drivers/platform/x86/Kconfig                  |  3 +
 .../platform/x86/x86-android-tablets/Kconfig  |  1 +
 drivers/usb/gadget/udc/pxa25x_udc.c           | 41 +++-----
 drivers/usb/gadget/udc/pxa25x_udc.h           |  2 +-
 drivers/usb/gadget/udc/pxa27x_udc.c           | 35 +------
 drivers/usb/gadget/udc/pxa27x_udc.h           |  2 -
 include/linux/gpio_keys.h                     |  2 +
 include/linux/leds.h                          |  2 +
 include/linux/mfd/arizona/pdata.h             |  6 ++
 include/linux/mfd/wm8994/pdata.h              |  5 -
 include/linux/platform_data/pxa2xx_udc.h      | 15 ---
 sound/pci/Kconfig                             |  1 +
 sound/soc/codecs/Kconfig                      |  4 +
 sound/soc/codecs/arizona-jack.c               | 17 +++-
 sound/soc/pxa/Kconfig                         |  4 +-
 55 files changed, 192 insertions(+), 320 deletions(-)
 delete mode 100644 arch/arm/mach-pxa/udc.h

-- 
2.39.5

Cc: Linus Walleij <linus.walleij@linaro.org> (maintainer:GPIO SUBSYSTEM,commit_signer:1/2=50%)
Cc: Bartosz Golaszewski <brgl@bgdev.pl> (maintainer:GPIO SUBSYSTEM,commit_signer:1/7=14%,commit_signer:1/2=50%)
Cc: linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM)

Cc: Andrew Lunn <andrew@lunn.ch> (maintainer:ARM/Marvell Dove/MV78xx0/Orion SOC support)
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> (maintainer:ARM/Marvell Dove/MV78xx0/Orion SOC support)
Cc: Gregory Clement <gregory.clement@bootlin.com> (maintainer:ARM/Marvell Dove/MV78xx0/Orion SOC support)
Cc: Russell King <linux@armlinux.org.uk> (maintainer:ARM PORT)
Cc: Daniel Mack <daniel@zonque.org> (maintainer:PXA2xx/PXA3xx SUPPORT)
Cc: Haojian Zhuang <haojian.zhuang@gmail.com> (maintainer:PXA2xx/PXA3xx SUPPORT)
Cc: Robert Jarzmik <robert.jarzmik@free.fr> (maintainer:PXA2xx/PXA3xx SUPPORT)
Cc: Krzysztof Kozlowski <krzk@kernel.org> (maintainer:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES,commit_signer:1/2=50%)
Cc: Alim Akhtar <alim.akhtar@samsung.com> (reviewer:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Geert Uytterhoeven <geert@linux-m68k.org> (maintainer:M68K ARCHITECTURE,commit_signer:1/4=25%,authored:1/4=25%,added_lines:2/13=15%,removed_lines:2/6=33%)
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de> (maintainer:MIPS)
Cc: Yoshinori Sato <ysato@users.sourceforge.jp> (maintainer:SUPERH)
Cc: Rich Felker <dalias@libc.org> (maintainer:SUPERH)
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> (maintainer:SUPERH,commit_signer:2/4=50%)
Cc: Thomas Gleixner <tglx@linutronix.de> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT),added_lines:4/36=11%,removed_lines:6/49=12%)
Cc: Ingo Molnar <mingo@redhat.com> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Cc: Borislav Petkov <bp@alien8.de> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Cc: Dave Hansen <dave.hansen@linux.intel.com> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Cc: x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Cc: "H. Peter Anvin" <hpa@zytor.com> (reviewer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com> (maintainer:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...,commit_signer:5/7=71%,authored:1/7=14%,added_lines:17/36=47%,removed_lines:27/49=55%,commit_signer:1/2=50%,commit_signer:3/5=60%)
Cc: Lee Jones <lee@kernel.org> (maintainer:LED SUBSYSTEM,commit_signer:2/5=40%)
Cc: Pavel Machek <pavel@kernel.org> (maintainer:LED SUBSYSTEM)
Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (maintainer:EM28XX VIDEO4LINUX DRIVER)
Cc: Matti Vaittinen <mazziesaccount@gmail.com> (maintainer:ROHM POWER MANAGEMENT IC DEVICE DRIVERS)
Cc: Florian Fainelli <florian.fainelli@broadcom.com> (maintainer:BROADCOM B53/SF2 ETHERNET SWITCH DRIVER)
Cc: Jeff Johnson <jjohnson@kernel.org> (maintainer:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER)
Cc: Hans de Goede <hansg@kernel.org> (maintainer:X86 PLATFORM DRIVERS,commit_signer:1/7=14%)
Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com> (maintainer:X86 PLATFORM DRIVERS)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (maintainer:USB SUBSYSTEM)
Cc: Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)
Cc: Takashi Iwai <tiwai@suse.com> (maintainer:SOUND,commit_signer:1/3=33%,authored:1/3=33%,removed_lines:2/2=100%)
Cc: Liam Girdwood <lgirdwood@gmail.com> (maintainer:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...)
Cc: Mark Brown <broonie@kernel.org> (maintainer:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...,commit_signer:26/29=90%,commit_signer:1/3=33%)
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com> (authored:1/7=14%,added_lines:4/36=11%,removed_lines:6/49=12%,commit_signer:1/2=50%,authored:1/2=50%,added_lines:5/7=71%,removed_lines:7/7=100%,added_lines:7/7=100%,removed_lines:2/7=29%)
Cc: "Dr. David Alan Gilbert" <linux@treblig.org> (commit_signer:1/5=20%,authored:1/5=20%,removed_lines:7/10=70%)
Cc: linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Dove/MV78xx0/Orion SOC support)
Cc: linux-kernel@vger.kernel.org (open list)
Cc: linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: linux-m68k@lists.linux-m68k.org (open list:M68K ARCHITECTURE)
Cc: linux-mips@vger.kernel.org (open list:MIPS)
Cc: linux-sh@vger.kernel.org (open list:SUPERH)
Cc: linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...)
Cc: linux-leds@vger.kernel.org (open list:LED SUBSYSTEM)
Cc: linux-media@vger.kernel.org (open list:EM28XX VIDEO4LINUX DRIVER)
Cc: patches@opensource.cirrus.com (open list:WOLFSON MICROELECTRONICS DRIVERS)
Cc: netdev@vger.kernel.org (open list:BROADCOM B53/SF2 ETHERNET SWITCH DRIVER)
Cc: linux-wireless@vger.kernel.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER)
Cc: ath10k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER)
Cc: platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Cc: linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Cc: linux-sound@vger.kernel.org (open list:SOUND)

