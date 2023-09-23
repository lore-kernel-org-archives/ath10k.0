Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70514CE7A81
	for <ath10k@archiver.kernel.org>; Sat, 23 Sep 2023 00:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FE1gIgdCAkvanlamYrpxorRFxc/7ubkKbj+QBchEh/U=; b=g+roBDPVIMZguzH/qW3mvfZiZc
	uA+8bnHqzbLJbMWcJteHlWRpU5ZfrvYUyJLGAOM2RCwwex/neA2HpFqFR6QS7GSahAygknjYP0dBO
	9bCxHZBlv4b0rzdtT5dHhkPGZoZtFlNgp8hRdE3ALUPUVUJS2SdyP8rw2uiFAx8Ln7gN2fNwEX8CS
	iTsJhUKTYHQDdZIcgz1npgASJPazS8q67UgMZLlUbzS2jTcF6px9z3gWbbihOoofKvWD+s5f6yL0L
	d5qQ3dMFSlFqpxmYVZr/DyGNobbOlBhDjzr0lZnVSJ0iAqOjh8kMuXlkVA4qwx3pbPJDR58YrBqR/
	WuJJPgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjqNo-00A29d-2i;
	Sat, 23 Sep 2023 00:20:28 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjqNj-00A28u-32
	for ath10k@lists.infradead.org;
	Sat, 23 Sep 2023 00:20:26 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c328b53aeaso27569615ad.2
        for <ath10k@lists.infradead.org>; Fri, 22 Sep 2023 17:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695428420; x=1696033220; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8NVR9veAaqzrADVHcY/0WZEoNSHI3mJUk3GO8SCf+Q4=;
        b=XUr7gMEUva/AF/mWSULZC0qYpjlbENbH5PrXCsbG0Pg+zZfFZEq+ryRP8z/SVqkz5U
         s48mrERnDqb5rehr2ftjptnKVVbP5Wj+UlypoRNjF7EVd6mqyrm6vEs/OIEHH+btYWNi
         PtCHlqobfwgcCt4AyRMygzpFhNKY71eWs00l2abnmIQh2dM8BVWLiMiRVO6/P3pHgWsk
         63LsVA5aVf8XZGtbYI0TUSJ5RXb1G4nw32kgDNnIRfKJJbtvdTu0DwRocxaXN+xVBHQs
         6osqDcsGhwJDcsewMViOGsEevQuWEBKtQTYt6NqNBnO+5b5G8ZjT1p26ZQTR1OtzGG/X
         jfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695428420; x=1696033220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NVR9veAaqzrADVHcY/0WZEoNSHI3mJUk3GO8SCf+Q4=;
        b=cAjDp8aZ4yk46j0iLWhFJWr367CmGMAdASqrrRP6h2dZVg/R50L7h/WeBd/iKF91kT
         XuMrYNDiH/a5d8SPjzrR0aDsIHMyi/RGJG6278PD8sM1+CxsFUBbGsltBzg+7+25BJ8V
         5cn8Yowhi+H2VwoNI0jWaZH/HCVRwvr237BfL6v9hJr2s6U9t8W0Smd6Hhbov44l+D3v
         WkO4x9TdBCAUvPJV6QRkOELq/Yw/lC5DD/Kh4w26PX+eO7noE/hWZgkKRw2FCxFmEmgH
         XvncolYOdIfsxrh986hwjx+sGYHmwnoqkWsrP7IStJPjoPPVBNaPx70MkqY/VplLGfft
         u/tw==
X-Gm-Message-State: AOJu0Yw5a1U8VvJklI6oNdbIltE/OYD8exKGYyAZHcUjF3MZH4mQbgNW
	Inwslc/meqwEJPNyJmDrFf24+60gz/4=
X-Google-Smtp-Source: AGHT+IHZZCX7Thrif+CVBWaYNRyr95EXqcYj1jhyuVZrdxZiUoqwftI/kqZQh4p7d7LvRieTUStuCQ==
X-Received: by 2002:a17:902:bc4a:b0:1bd:aeb3:9504 with SMTP id t10-20020a170902bc4a00b001bdaeb39504mr1056894plz.15.1695428420097;
        Fri, 22 Sep 2023 17:20:20 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id x18-20020a170902ec9200b001c1f0b3e900sm4094537plg.229.2023.09.22.17.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 17:20:19 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id A1968819448C; Sat, 23 Sep 2023 07:20:16 +0700 (WIB)
Date: Sat, 23 Sep 2023 07:20:16 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Cool Goose <coolgoose54@yahoo.in>,
	Linux ath10k <ath10k@lists.infradead.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: Atheros QCA6174 ath10k_pci fimware crashing
Message-ID: <ZQ4vQNe3XsArwWQT@debian.me>
References: <1209906123.2716993.1695416371605.ref@mail.yahoo.com>
 <1209906123.2716993.1695416371605@mail.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <1209906123.2716993.1695416371605@mail.yahoo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_172024_010587_A847CDEC 
X-CRM114-Status: UNSURE (   8.29  )
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
Content-Type: multipart/mixed; boundary="===============2251602339657140509=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


--===============2251602339657140509==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q4A1k7I0McsXj8EB"
Content-Disposition: inline


--q4A1k7I0McsXj8EB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 08:59:31PM +0000, Cool Goose wrote:
> Reference and more details https://bbs.archlinux.org/viewtopic.php?id=3D2=
88991
>=20
> $ sudo journalctl -b | grep ath10k | more
> Sep 19 07:43:58 hostname kernel: ath10k_pci 0000:03:00.0: pci irq msi ope=
r_irq_mode 2 irq_mode 0 reset_mode 0
> Sep 19 07:43:58 hostname kernel: ath10k_pci 0000:03:00.0: qca6174 hw3.2 t=
arget 0x05030000 chip_id 0x00340aff sub 17aa:0827
> Sep 19 07:43:58 hostname kernel: ath10k_pci 0000:03:00.0: kconfig debug 1=
 debugfs 1 tracing 1 dfs 0 testmode 0
> Sep 19 07:43:58 hostname kernel: ath10k_pci 0000:03:00.0: firmware ver WL=
AN.RM.4.4.1-00157-QCARMSWPZ-1 api 6 features wowlan,ignore-otp,mfp crc32 90=
eebefb
> Sep 19 07:43:59 hostname kernel: ath10k_pci 0000:03:00.0: board_file api =
2 bmi_id N/A crc32 706c395e
> Sep 19 07:43:59 hostname kernel: ath10k_pci 0000:03:00.0: htt-ver 3.60 wm=
i-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
> Sep 19 07:43:59 hostname kernel: ath10k_pci 0000:03:00.0 wlp3s0: renamed =
=66rom wlan0
> Sep 19 07:43:59 hostname NetworkManager[640]: <info>=C2=A0=C2=A0[16951238=
39.8991] rfkill2: found Wi-Fi radio killswitch (at /sys/devices/pci0000:00/=
0000:00:1c.5/0000:03:00.0/ieee80211/phy0/rfkill2) (driver ath10k_pci)
> Sep 19 08:11:42 hostname kernel: ath10k_pci 0000:03:00.0: timed out waiti=
ng peer stats info
> Sep 19 08:11:47 hostname kernel: ath10k_pci 0000:03:00.0: wmi command 901=
13 timeout, restarting hardware
> Sep 19 08:11:47 hostname kernel: ath10k_pci 0000:03:00.0: could not reque=
st stats (-11)
> Sep 19 08:11:47 hostname kernel: ath10k_pci 0000:03:00.0: could not reque=
st peer stats info: -108
> Sep 19 08:11:47 hostname kernel: ath10k_pci 0000:03:00.0: device successf=
ully recovered
> Sep 19 08:15:54 hostname kernel: ath10k_pci 0000:03:00.0: timed out waiti=
ng peer stats info
> Sep 19 08:15:59 hostname kernel: ath10k_pci 0000:03:00.0: wmi command 901=
13 timeout, restarting hardware
> Sep 19 08:15:59 hostname kernel: ath10k_pci 0000:03:00.0: could not reque=
st stats (-11)
> Sep 19 08:15:59 hostname kernel: ath10k_pci 0000:03:00.0: could not reque=
st peer stats info: -108
> Sep 19 08:15:59 hostname kernel: ath10k_pci 0000:03:00.0: failed to read =
hi_board_data address: -16
> Sep 19 08:16:02 hostname kernel: ath10k_pci 0000:03:00.0: failed to recei=
ve initialized event from target: 00000000
> Sep 19 08:16:05 hostname kernel: ath10k_pci 0000:03:00.0: failed to recei=
ve initialized event from target: 00000000
> Sep 19 08:16:05 hostname kernel: ath10k_pci 0000:03:00.0: failed to wait =
for target init: -110
> Sep 19 08:16:05 hostname kernel: ath10k_pci 0000:03:00.0: could not reque=
st stats (-108)
> Sep 19 08:16:05 hostname kernel: ath10k_pci 0000:03:00.0: device successf=
ully recovered
> Sep 19 08:20:30 hostname kernel: ath10k_pci 0000:03:00.0: failed to recei=
ve scan abortion completion: timed out
> Sep 19 08:20:30 hostname kernel: ath10k_pci 0000:03:00.0: failed to abort=
 scan: -110
> Sep 19 08:20:36 hostname kernel: ath10k_pci 0000:03:00.0: wmi command 901=
24 timeout, restarting hardware
> Sep 19 08:20:36 hostname kernel: ath10k_pci 0000:03:00.0: could not reque=
st peer stats info: -11
> Sep 19 08:20:36 hostname kernel: ath10k_pci 0000:03:00.0: device successf=
ully recovered
> Sep 19 08:25:55 hostname kernel: ath10k_pci 0000:03:00.0: failed to recei=
ve scan abortion completion: timed out
> Sep 19 08:25:55 hostname kernel: ath10k_pci 0000:03:00.0: failed to abort=
 scan: -110
> Sep 19 08:26:00 hostname kernel: ath10k_pci 0000:03:00.0: wmi command 901=
24 timeout, restarting hardware
> Sep 19 08:26:00 hostname kernel: ath10k_pci 0000:03:00.0: could not reque=
st peer stats info: -11
> Sep 19 08:26:00 hostname kernel: ath10k_pci 0000:03:00.0: device successf=
ully recovered
> Sep 19 08:28:24 hostname kernel: ath10k_pci 0000:03:00.0: timed out waiti=
ng peer stats info
> Sep 19 08:28:29 hostname kernel: ath10k_pci 0000:03:00.0: wmi command 901=
13 timeout, restarting hardware
> Sep 19 08:28:29 hostname kernel: ath10k_pci 0000:03:00.0: could not reque=
st stats (-11)
> Sep 19 08:28:29 hostname kernel: ath10k_pci 0000:03:00.0: could not reque=
st peer stats info: -108
> Sep 19 08:28:29 hostname kernel: ath10k_pci 0000:03:00.0: failed to read =
hi_board_data address: -16
> Sep 19 08:28:32 hostname kernel: ath10k_pci 0000:03:00.0: failed to recei=
ve initialized event from target: 00000000
> Sep 19 08:28:35 hostname kernel: ath10k_pci 0000:03:00.0: failed to recei=
ve initialized event from target: 00000000
> Sep 19 08:28:35 hostname kernel: ath10k_pci 0000:03:00.0: failed to wait =
for target init: -110
> Sep 19 08:28:35 hostname kernel: ath10k_pci 0000:03:00.0: could not reque=
st stats (-108)
> Sep 19 08:28:35 hostname kernel: ath10k_pci 0000:03:00.0: device successf=
ully recovered
> Sep 19 08:35:24 hostname kernel: ath10k_pci 0000:03:00.0: timed out waiti=
ng peer stats info
> Sep 19 08:35:29 hostname kernel: ath10k_pci 0000:03:00.0: wmi command 901=
13 timeout, restarting hardware
> Sep 19 08:35:29 hostname kernel: ath10k_pci 0000:03:00.0: could not reque=
st stats (-11)
> Sep 19 08:35:29 hostname kernel: ath10k_pci 0000:03:00.0: could not reque=
st peer stats info: -108
> Sep 19 08:35:29 hostname kernel: ath10k_pci 0000:03:00.0: device successf=
ully recovered
> Sep 19 08:39:42 hostname kernel: ath10k_pci 0000:03:00.0: timed out waiti=
ng peer stats info
> Sep 19 08:39:47 hostname kernel: ath10k_pci 0000:03:00.0: wmi command 901=
13 timeout, restarting hardware
> Sep 19 08:39:47 hostname kernel: ath10k_pci 0000:03:00.0: could not reque=
st stats (-11)
> Sep 19 08:39:47 hostname kernel: ath10k_pci 0000:03:00.0: could not reque=
st peer stats info: -108
> Sep 19 08:39:47 hostname kernel: ath10k_pci 0000:03:00.0: device successf=
ully recovered
> Sep 19 09:00:31 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:00:32 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for write32 of 0x0000000e at 0x0003503c: -110
> Sep 19 09:00:32 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:00:33 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for write32 of 0x0000000f at 0x0003503c: -110
> Sep 19 09:00:36 hostname kernel: ath10k_pci 0000:03:00.0: timed out waiti=
ng peer stats info
> Sep 19 09:00:41 hostname kernel: ath10k_pci 0000:03:00.0: wmi command 901=
13 timeout, restarting hardware
> Sep 19 09:00:41 hostname kernel: ath10k_pci 0000:03:00.0: could not reque=
st stats (-11)
> Sep 19 09:00:41 hostname kernel: ath10k_pci 0000:03:00.0: could not reque=
st peer stats info: -108
> Sep 19 09:00:41 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a000: -110
> Sep 19 09:00:41 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for write32 of 0x00000000 at 0x00036040: -110
> Sep 19 09:00:41 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for write32 of 0x00000000 at 0x0003603c: -110
> Sep 19 09:00:41 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00036044: -110
> Sep 19 09:00:41 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00036044: -110
> Sep 19 09:00:41 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00036044: -110
> Sep 19 09:00:41 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00036044: -110
> Sep 19 09:00:46 hostname kernel: ath10k_warn: 137 callbacks suppressed
> Sep 19 09:00:46 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00036044: -110
> Sep 19 09:00:46 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00036044: -110
> Sep 19 09:00:46 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00036044: -110
> Sep 19 09:00:46 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00036044: -110
> Sep 19 09:00:46 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00036044: -110
> Sep 19 09:00:46 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00036044: -110
> Sep 19 09:00:46 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00036044: -110
> Sep 19 09:00:46 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00036044: -110
> Sep 19 09:00:46 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00036044: -110
> Sep 19 09:00:51 hostname kernel: ath10k_warn: 135 callbacks suppressed
> Sep 19 09:00:51 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for write32 of 0xfffffffe at 0x00035c2c: -110
> Sep 19 09:00:51 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00035c34: -110
> Sep 19 09:00:51 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for write32 of 0xfffff81f at 0x00035c34: -110
> Sep 19 09:00:51 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00035c2c: -110
> Sep 19 09:00:51 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for write32 of 0xffffffe1 at 0x00035c2c: -110
> Sep 19 09:00:51 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for write32 of 0x00000000 at 0x0003a008: -110
> Sep 19 09:00:51 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for write32 of 0x0007fc00 at 0x0003a014: -110
> Sep 19 09:00:51 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a008: -110
> Sep 19 09:00:51 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a000: -110
> Sep 19 09:00:51 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for write32 of 0xfffff7ff at 0x0003a000: -110
> Sep 19 09:00:56 hostname kernel: ath10k_warn: 136 callbacks suppressed
> Sep 19 09:00:56 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:00:56 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:00:56 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:00:56 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:00:56 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:00:56 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:00:56 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:00:56 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:00:56 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:00:56 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:00:57 hostname kernel: ath10k_pci 0000:03:00.0: failed to read =
device register, device is gone
> Sep 19 09:01:01 hostname kernel: ath10k_warn: 136 callbacks suppressed
> Sep 19 09:01:01 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:01 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:01 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:01 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:01 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:01 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:01 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:01 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:01 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:01 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:03 hostname kernel: ath10k_pci 0000:03:00.0: failed to read =
device register, device is gone
> Sep 19 09:01:06 hostname kernel: ath10k_warn: 142 callbacks suppressed
> Sep 19 09:01:06 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:06 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:06 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:06 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:06 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:06 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:06 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:06 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:06 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:06 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x0003a028: -110
> Sep 19 09:01:07 hostname kernel: ath10k_pci 0000:03:00.0: failed to read =
device register, device is gone
> Sep 19 09:01:07 hostname kernel: ath10k_pci 0000:03:00.0: failed to reset=
 chip: -5
> Sep 19 09:01:07 hostname kernel: ath10k_pci 0000:03:00.0: Could not init =
hif: -5
> Sep 19 09:01:07 hostname kernel: ath10k_pci 0000:03:00.0: firmware crashe=
d! (guid 181cebb0-7ef7-4f43-867d-f7c220de5e83)
> Sep 19 09:01:07 hostname kernel: ath10k_pci 0000:03:00.0: qca6174 hw3.2 t=
arget 0x05030000 chip_id 0x00340aff sub 17aa:0827
> Sep 19 09:01:07 hostname kernel: ath10k_pci 0000:03:00.0: kconfig debug 1=
 debugfs 1 tracing 1 dfs 0 testmode 0
> Sep 19 09:01:07 hostname kernel: Modules linked in: ccm dm_crypt cbc encr=
ypted_keys trusted asn1_encoder tee serpent_avx2 serpent_avx_x86_64 serpent=
_sse2_x86_64 serpent_generic xts ecb algif_skcipher af_alg snd_soc_avs snd_=
soc_hda_codec intel_rapl_msr snd_soc_skl intel_rapl_common snd_hda_codec_hd=
mi snd_soc_hdac_hda intel_tcc_cooling snd_hda_ext_core x86_pkg_temp_thermal=
 snd_soc_sst_ipc intel_powerclamp snd_soc_sst_dsp snd
> _soc_acpi_intel_match snd_soc_acpi coretemp snd_soc_core snd_hda_codec_re=
altek kvm_intel snd_hda_codec_generic snd_compress ac97_bus ledtrig_audio s=
nd_pcm_dmaengine kvm joydev hid_sensor_accel_3d ath10k_pci rt2800usb hid_se=
nsor_trigger snd_hda_intel industrialio_triggered_buffer irqbypass rt2x00us=
b ath10k_core mousedev snd_intel_dspcfg crct10dif_pclmul snd_intel_sdw_acpi=
 rt2800lib kfifo_buf crc32_pclmul polyval_clmulni wac
> om hid_sensor_iio_common snd_hda_codec uvcvideo rt2x00lib ath polyval_gen=
eric industrialio hid_sensor_custom gf128mul snd_hda_core usbhid videobuf2_=
vmalloc
> Sep 19 09:01:07 hostname kernel: ath10k_pci 0000:03:00.0: firmware ver WL=
AN.RM.4.4.1-00157-QCARMSWPZ-1 api 6 features wowlan,ignore-otp,mfp crc32 90=
eebefb
> Sep 19 09:01:07 hostname kernel: ath10k_pci 0000:03:00.0: board_file api =
2 bmi_id N/A crc32 706c395e
> Sep 19 09:01:07 hostname kernel: ath10k_pci 0000:03:00.0: htt-ver 3.60 wm=
i-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
> Sep 19 09:01:11 hostname kernel: Modules linked in: ccm dm_crypt cbc encr=
ypted_keys trusted asn1_encoder tee serpent_avx2 serpent_avx_x86_64 serpent=
_sse2_x86_64 serpent_generic xts ecb algif_skcipher af_alg snd_soc_avs snd_=
soc_hda_codec intel_rapl_msr snd_soc_skl intel_rapl_common snd_hda_codec_hd=
mi snd_soc_hdac_hda intel_tcc_cooling snd_hda_ext_core x86_pkg_temp_thermal=
 snd_soc_sst_ipc intel_powerclamp snd_soc_sst_dsp snd
> _soc_acpi_intel_match snd_soc_acpi coretemp snd_soc_core snd_hda_codec_re=
altek kvm_intel snd_hda_codec_generic snd_compress ac97_bus ledtrig_audio s=
nd_pcm_dmaengine kvm joydev hid_sensor_accel_3d ath10k_pci rt2800usb hid_se=
nsor_trigger snd_hda_intel industrialio_triggered_buffer irqbypass rt2x00us=
b ath10k_core mousedev snd_intel_dspcfg crct10dif_pclmul snd_intel_sdw_acpi=
 rt2800lib kfifo_buf crc32_pclmul polyval_clmulni wac
> om hid_sensor_iio_common snd_hda_codec uvcvideo rt2x00lib ath polyval_gen=
eric industrialio hid_sensor_custom gf128mul snd_hda_core usbhid videobuf2_=
vmalloc
> Sep 19 09:01:11 hostname kernel: ath10k_warn: 149 callbacks suppressed
> Sep 19 09:01:11 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00036044: -110
> Sep 19 09:01:11 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00036044: -110
> Sep 19 09:01:11 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake =
target for read32 at 0x00036044: -110
>=20

Looks like hardware issue, right?

--=20
An old man doll... just what I always wanted! - Clara

--q4A1k7I0McsXj8EB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQ4vOwAKCRD2uYlJVVFO
o/VaAQDmlbm+L/k51oqCIzFGWLPB0hLoER3gOrSxdxjPz3aMdgD/aKb3Ito06kNA
PornXw3GHqVg1BtKdBXhdHOqY5WqFQ4=
=GLGJ
-----END PGP SIGNATURE-----

--q4A1k7I0McsXj8EB--


--===============2251602339657140509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============2251602339657140509==--

