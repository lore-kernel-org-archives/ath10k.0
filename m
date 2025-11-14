Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B35ECE7AF9
	for <ath10k@archiver.kernel.org>; Fri, 14 Nov 2025 12:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTWUPlyyxRRJs6HJe8sGuSoAq6EtBhc0ixMPZ20Ciag=; b=A6l6GL0Vx70ngicJzUNqyuW1Kf
	FmyHCKDP7lQBwiXW7BgMj3pPk3egOIDbpJMFmBxwrE0iYhvnMvxk6iKJwiWBbIGClewbSG5Vmn60q
	NRH54r3uaPqVsKIoInHWQMFsk3K6ac2FSn0VnjXWyAD+ikLNdgx1OEUvZ7JDRRLyzZMcKMoQDZZ5X
	5i5pdHbqJ1HPQodq6vsih3R0eGyz5JQSaE7ovqrebUcpEwi3P12PifgL3mWhZoOXr6vnsXsZevbGw
	t7238YA1WoH7N5dLG/1GOClhrwbtDlVkkbMEwtliGFhW6nVFGW1/4eRKF1LqlF55mhExCpdRpGioB
	F4EVk2rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsgE-0000000CB0j-47ba;
	Fri, 14 Nov 2025 12:13:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsgC-0000000CAzN-0ZC5
	for ath10k@lists.infradead.org;
	Fri, 14 Nov 2025 12:13:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CB4944595
	for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 12:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F246C2BCB6
	for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 12:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763122406;
	bh=5I0F7Lk270HlfQS3v6Sw31jwqLfCir/VQOrCBc5zdi4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BsWlX86ilnv+s4j4wTsSqTeDNAnnYOHyVINcw+Wvj3HVT6JuHuIMXwapCyNfmUql6
	 US9CQzkUfqLAE4BbtJm5v3YZQr2wkup+OY5id52TMlj0plHw/jXmlJmvLrVEOioqwz
	 hNgv8M980glqCzQD1KBPZB6yUw+FZeR6fb5ODDW/8FqmrZBPNvks30TTHR4PBa1hZ1
	 Y2MCpPZmVqD7A09k1SMUmE/QJDoP1ykx7WHAmqOmkW2hmR6dRiWVwbE44vnjCtb4DL
	 eUyRqN+tMHzw3mSGyz2bjhTVrntWx2rcDUwpY8X8XJBDv5k9pZ/rOvxS8FcuXgcpFE
	 bivBIZyjejpnQ==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-3d3ed0c9f49so462747fac.3
        for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 04:13:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVrIaVPD7I0GILUMvPODATn48lJt2I6Q57nlkudUSX0cOw2nqjAet3FkvldH8KzCuw1XyGLHI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGulnVM1L/K73ObE2bPtLieeROBofjDMU15lqBqjRv1SYDSWY2
	MMNw4xMvmrgSOoaP87GKTB6YEtzwlKuC8xy5Xz6H9FLulOFTXbnyiuUNPdaZKOVZIrABUUJh0i+
	G+yZ6eh0pvo3nPc9KUrXCHAzEXMT4XRA=
X-Google-Smtp-Source: AGHT+IGrNkWHSVx3CmYADKr0S6TGq/XxOF6zay1uOoUOn8a60tpM1BgphUydUyCNyc9Vh0GmlV+21RabCzXA2tdcTXs=
X-Received: by 2002:a05:6870:30f:b0:375:db59:20e4 with SMTP id
 586e51a60fabf-3e868ef8743mr1267901fac.13.1763122404195; Fri, 14 Nov 2025
 04:13:24 -0800 (PST)
MIME-Version: 1.0
References: <20251114-thermal-device-v1-0-d8b442aae38b@gmx.de>
In-Reply-To: <20251114-thermal-device-v1-0-d8b442aae38b@gmx.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 14 Nov 2025 13:13:12 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gZ7+i+irhaq2jQpTt++HuVRjqz8==Ov9VmQ9Q1J1TM0w@mail.gmail.com>
X-Gm-Features: AWmQ_bm6idj_L4n1xVkRGWkVqmFdJz-PXS5UU4gyN5tQNhsjMISGTiEJyqtTR8w
Message-ID: <CAJZ5v0gZ7+i+irhaq2jQpTt++HuVRjqz8==Ov9VmQ9Q1J1TM0w@mail.gmail.com>
Subject: Re: [PATCH RFC 0/8] thermal: core: Allow setting the parent device of
 thermal zone/cooling devices
To: Armin Wolf <W_Armin@gmx.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
	Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Amit Daniel Kachhap <amit.kachhap@gmail.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Peter Kaestle <peter@piie.net>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Potnuri Bharat Teja <bharat@chelsio.com>, Sebastian Reichel <sre@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	ath11k@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
	linux-pci@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_041328_216080_14B9750B 
X-CRM114-Status: GOOD (  22.81  )
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

On Fri, Nov 14, 2025 at 4:24=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Drivers registering thermal zone/cooling devices are currently unable
> to tell the thermal core what parent device the new thermal zone/
> cooling device should have, potentially causing issues with suspend
> ordering

Do you have any examples of this?

> and making it impossible for user space appications to
> associate a given thermal zone device with its parent device.
>
> This patch series aims to fix this issue by extending the functions
> used to register thermal zone/cooling devices to also accept a parent
> device pointer. The first six patches convert all functions used for
> registering cooling devices, while the functions used for registering
> thermal zone devices are converted by the remaining two patches.
>
> I tested this series on various devices containing (among others):
> - ACPI thermal zones
> - ACPI processor devices
> - PCIe cooling devices
> - Intel Wifi card
> - Intel powerclamp
> - Intel TCC cooling
>
> I also compile-tested the remaining affected drivers, however i would
> still be happy if the relevant maintainers (especially those of the
> mellanox ethernet switch driver) could take a quick glance at the
> code and verify that i am using the correct device as the parent
> device.
>
> This work is also necessary for extending the ACPI thermal zone driver
> to support the _TZD ACPI object in the future.

Can you please elaborate a bit here?

_TZD is a list of devices that belong to the given thermal zone, so
how is it connected to the thermal zone parent?

> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
> Armin Wolf (8):
>       thermal: core: Allow setting the parent device of cooling devices
>       thermal: core: Set parent device in thermal_of_cooling_device_regis=
ter()
>       ACPI: processor: Stop creating "device" sysfs link
>       ACPI: fan: Stop creating "device" sysfs link
>       ACPI: video: Stop creating "device" sysfs link
>       thermal: core: Set parent device in thermal_cooling_device_register=
()
>       ACPI: thermal: Stop creating "device" sysfs link
>       thermal: core: Allow setting the parent device of thermal zone devi=
ces

I can only see the first three patches in the series ATM as per

https://lore.kernel.org/linux-pm/20251114-thermal-device-v1-0-d8b442aae38b@=
gmx.de/T/#r605b23f2e27e751d8406e7949dad6f5b5b112067

