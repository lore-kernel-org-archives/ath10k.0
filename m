Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79004C77B7C
	for <ath10k@archiver.kernel.org>; Mon, 23 Jun 2025 18:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rnP6cA4XpkCV+nk1j1HPQAk1FnLLZr1V8SkkJgMTz4=; b=Os/j2gixKxwe9WFF7luXZwdriQ
	dghZDnFTS2gwazYDFr8qLHzELubVkSEc+K6cDkSS95EYn6jBjCBWDF74nFssVXYeTLQKIj/CGEzGh
	j1PiS1MGZ7wj86yiv+UUWiW/QdpvmmLMN9dixQBX7hyRBqxsZhFsHdkvJnOPZUkBHJVlag1dCrV9J
	pJxXVEDRZpKp0CLHzqK6XqFJNxw6iuZX4TeA4W3HsY/uQJBV30hBUej7JFntCyVB274GRLdyR0Ow0
	miTsdOw1TPXNQrD1pDLsacguUaIo7X9K5AfY/C+rJdlc92ij7fg4DoW/aXIBiCbze8jxwTHuHuRE+
	VfAbyQ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTm1z-00000003hwA-34mj;
	Mon, 23 Jun 2025 18:36:35 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiXg-000000037ym-2KE9
	for ath10k@lists.infradead.org;
	Mon, 23 Jun 2025 14:53:05 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-234d3261631so29238855ad.1
        for <ath10k@lists.infradead.org>; Mon, 23 Jun 2025 07:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750690383; x=1751295183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6rnP6cA4XpkCV+nk1j1HPQAk1FnLLZr1V8SkkJgMTz4=;
        b=LhdNgYbDeFKb0nj6Ic/2/H3qr2svrmPRa+a4elTTsPMAQ5iK9CJ/U7FyJLviyDRS8c
         8D2Otex7MHh4pf9QKwuEq7T6xuhjf/LQDZ9vjREzl5dEfiIVw3xo2EbScdeMhXsT4s92
         ECtx95DqGR4GRTpEoQbKIilbz9Zyp0kb2Wbcl0Wy+ab4u13kZpkDThibtdBGkqdD6ynn
         QFes1iULd1NDCuFBUYsf8jatRUj76BW0e41sQmeLItcgoTQN6KPXzIbRFZOq+dGZzHSI
         ZXllJ4tviR1qaTFO85aZE6R1smdOItodUEi5o4wEZx/EOM5wE9Wkul8fy8ifhgKRCYz2
         EtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690383; x=1751295183;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6rnP6cA4XpkCV+nk1j1HPQAk1FnLLZr1V8SkkJgMTz4=;
        b=iBiEBuKtD1vnCDEqh5o0FsytuZ2ZwQ6GkwWrYSne0nXlqzaVhHoGZYWVo9VrnqNoT7
         a+i/MuCE1Ei015dpgQaWgUvC1BliMT3azamADY94TSCeajt6reCwJYpHQKYaesRfPzuR
         qa1SP+rH4SiqTc1bjO41ddU5Aqs1J95f8HMnP5mxmOVsQxOUVLUi+8ZF7I7+lL2KlfWB
         mrE8/QrMvkz9UKpfgmKQPb8ve/r7Z2xxJJhMQ5q9JmG9WSPDvniCU1R/lQweXXOaMthz
         lm6zGqCvO+102gZZLmU073uYYV0U1t50DanS10Yv8tlfUjFPZcb1ENGgTkkGjl4delBO
         M1Ag==
X-Gm-Message-State: AOJu0YzFMPYe8enu5jG53ahVQGV7k2rcT5hoVpwZbzDM6CeTykInn2XA
	f+orEIFJMXUnIw5utzLv+gvLf134kIc23lJtyO97Aq1SUpZEAmGVzoMpb6AnPK5c730dcQ==
X-Gm-Gg: ASbGncv8Izz5dPaFK5ZoCsLnpBTWMcXgGlVNbGdNVCaIja+EweWv613tgAhMwwmHT/s
	NY9jTs4TbgFpprDFdz5xx8KJhS0bX25e/yQSzbBK+6Oz3zSJuUnyHySQmLkEa+kcD+JlhX5oeW6
	ux3y7m5tyl4VR1mTizoN0RQzIv+4kjtLmplVZQOQgg5At7AHlQ5tFhz1fFlCez+qmVslbt/TAWF
	euWyqPnW/GbbTq9ZtBhoLjYalp+tk+dtCyD7IoEYx2BNu9cdx5AXebNVmYGbxyGteCWcdsaaqUe
	3qcIp7/lpq9LH/Iw2dhvDwf+4TAowXA3ovF6h0XSI2KeNd+W9bRtnX1v+1QUkN+ooVdjl4GDPZY
	Bdw==
X-Google-Smtp-Source: AGHT+IEpofGO1rB/8THZSo27dmHyR0/onH+VJ5lhvs94WqBArO7vFA8MObxLSVNA5KrNdZ+XBMOaAg==
X-Received: by 2002:a17:903:1aa7:b0:234:8a4a:adad with SMTP id d9443c01a7336-237d98f9968mr203103975ad.26.1750690383294;
        Mon, 23 Jun 2025 07:53:03 -0700 (PDT)
Received: from [127.0.0.1] ([115.187.48.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83ce31asm84459365ad.63.2025.06.23.07.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:53:02 -0700 (PDT)
Date: Mon, 23 Jun 2025 20:22:57 +0530
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
CC: stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5Bath10k=5D=5BQCA9377=5D_Firmware_crashes_on_Dell_I?=
 =?US-ASCII?Q?nspiron_5567_=28IRQ_=2316=2C_all_modern_distro_kernels=29?=
User-Agent: Thunderbird for Android
In-Reply-To: <CAEmM+Qh=8tm55Ypa2w3ZtOFFrGXTpKqxue59mVAo_5TVy0RJ6g@mail.gmail.com>
References: <CAEmM+Qh=8tm55Ypa2w3ZtOFFrGXTpKqxue59mVAo_5TVy0RJ6g@mail.gmail.com>
Message-ID: <CD81F065-CDDD-41F6-AECD-167B509F57C6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_075304_593225_DC77CFD5 
X-CRM114-Status: GOOD (  21.52  )
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

Hello,

An update on the situation=2E

I installed Fedora KDE Plasma Spin, and the skip_otp option didn't work th=
ere=2E KDE specifically said that the Wi-Fi is still connected but it is no=
t connecting to the Internet (confirming my suspicions as true, that the ne=
twork interface is not disappearing this time and the Destination Host is u=
nreachable, because of the network card)=2E

Only the following convoluted (and strictly step-by-step) solution seems t=
o potentially work (not tested on my own laptop yet): https://www=2Ereddit=
=2Ecom/r/linux/s/8VKDJ6QeP
(This solution has been taken from the GitHub Issue of the Pop!_OS repo)

I used these exact sequence of steps before, and it worked properly=2E But=
 this time, I simply wrote the skip_otp option to /etc/modprobe=2Ed, and it=
 didn't work=2E

Reiterating my point: this issue seriously requires urgent attention becau=
se it affects all the stable and longterm kernels as of now=2E

Thanks,

Bandhan Pramanik


On 23 June 2025 3:01:08=E2=80=AFam IST, Bandhan Pramanik <bandhanpramanik0=
6=2Efoss@gmail=2Ecom> wrote:
> Hello,
>=20
> This is to inform all that constant firmware crashes have been seen in
> the "Qualcomm Atheros QCA9377 802=2E11ac Wireless Network Adapter",
> which was shipped with the Dell Inspiron 5567 laptops=2E This affects
> every kernel release, including the stable and the longterm ones=2E
>=20
> All the logs have been taken after livebooting an Arch Linux ISO=2E
>=20
> Every distro has been tried, and it has been confirmed that some error
> of this kind is shown in every distro=2E
>=20
> ## Steps to reproduce the issue
>=20
> 1=2E Boot/liveboot any Linux ISO through this card (and possibly, this l=
aptop)=2E
> 2=2E Wi-Fi network interface appears=2E
> 3=2E Connect the Wi-Fi router to the computer=2E
> 4=2E A few moments/minutes after that, the touchpad stops working, and
> the network interface cannot even access the Internet anymore (BUT,
> the network interface might disappear, might not disappear)=2E
>=20
> ## Affected distros and the necessary workarounds
>=20
> This has been the pattern on every distro and their corresponding
> kernels (LMDE, Linux Mint, Pop!_OS, Zorin, Kubuntu, KDE Neon,
> elementaryOS, Fedora, and even Arch)=2E The fix which made these distros
> usable is to add two things:
>=20
> - Adding "options ath10k_core skip_otp=3Dy" to a new conf file in /etc/m=
odprobe=2Ed=2E
> - Adding "pci=3Dnoaer" in GRUB kernel parameters so that the logs are
> not flooded with Multiple Correctable Errors=2E
>=20
> To defend my case (that it occurs in the other models of Inspiron 5567
> too), I have recently contacted someone running Linux Mint on the same
> model=2E The answer was the same: the touchpad and the Wi-Fi stop
> simultaneously=2E
>=20
> ## Some of the limitations
>=20
> The kernel was tainted, but the other things have been properly noted
> in case they might provide some useful details=2E As stated,
> investigating why IRQ #16 is disabled will probably give us the
> answer=2E
>=20
> ## Logs provided
>=20
> All the logs in a combined manner can be found here:
> https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a1=
6180
>=20
> - Full dmesg: https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03c=
a2ea43a1d832a16180#file-dmesg-log
> - Hostnamectl: https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03=
ca2ea43a1d832a16180#file-hostnamectl-log
> - lspci: https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03ca2ea4=
3a1d832a16180#file-lspci-log
> - Modinfo of the driver:
> https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a1=
6180#file-modinfo-log
> - Ping command:
> https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a1=
6180#file-ping-log
> - /proc/interrupts:
> https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a1=
6180#file-proc_interrupts-log
> - IP addr command (Heavily Redacted):
> https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a1=
6180#file-ip_addr-log
>=20
> Lastly, this issue on the GitHub repository of Pop!_OS 'might' be
> relevant: https://github=2Ecom/pop-os/pop/issues/1470
>=20
> It would be highly appreciated if the matter were looked into=2E
>=20
> Thanks,
>=20
> Bandhan Pramanik

