Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B3FC7EE30
	for <ath10k@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjGxbIXYgtou/2N9dnExwJU6eiqD4x/SaqWx1BAYUcc=; b=eKSGRSm/sidtGW3Uo77bdf/JM2
	vxaUYywH5waYlivuvvLHACluXWH3O572ZT2JJlfIcoNNG5DVyRkyv6erTAD50fXwjkDjMFAuWIB/m
	EY3YnAsh3X8AMif0+NHe/DWI57/cFs3/42LJXMbgQQiE15if2LOEv1oXiz6+t+tBxuaZZXnyouva6
	m2gEE4NnX3867uDBPvbR77sfb2e9dcC1B8BmmJ7XWRXCalaqEW8aI8kTrLoXnZWdC/WK7fP24GjEu
	7n5I2eiNsMF2I+o/WuDkluWr28PEtMFFmrnxAkvhyqs4zXkDOZ+/jMXVq39ysuMniJlEZFUTy+8pD
	r6kb9e7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscF-00000004Nal-07Hd;
	Tue, 24 Jun 2025 01:38:27 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTn1M-00000003oos-33Fl
	for ath10k@lists.infradead.org;
	Mon, 23 Jun 2025 19:40:02 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-236377f00easo53371885ad.1
        for <ath10k@lists.infradead.org>; Mon, 23 Jun 2025 12:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750707600; x=1751312400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YjGxbIXYgtou/2N9dnExwJU6eiqD4x/SaqWx1BAYUcc=;
        b=UB7BtA28vyY6gdvgjfJ9tlcyJk4vMlneTec+xWbDLAODZM1KilSNmJlJgy/55BnvrU
         VNZ1kwJjHOVl7guthaQ3ySxM80xvrBt5n5vW77TUcRe7mAXJCl+VMZyVVUyRMmF9rchA
         cziic/vjte6YOs2KrqXpie5zMEnN+SjD45BeEqlRvmUdrGWRUrWk8YB2Z0KPnmphVcL/
         EWJqJlRZgcJUldRWbhtJ/4KeosIKttGI0IIGBTVEAiBxVkzsxaAoM9zDEiqqQtQpIQi7
         NLR+p1rdd71wI77jyNMwB98Es78D+E3s4kyYm5fh9EcTvUXQTS4lsZOV8SVADRb2wCYW
         eoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750707600; x=1751312400;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YjGxbIXYgtou/2N9dnExwJU6eiqD4x/SaqWx1BAYUcc=;
        b=k1lXMK+sKB0VWP9Srd4+Y1YqgPNP5RKrRN78yyo0jiksw2h5vkhqYKky9eNieNIk/L
         d4PAdKEVEz3/H7mUa9j9GQUqSiV34rHdLwwwIupchZ0YtH2euiAkzKaqA4JoZr3xzhfw
         VO4MXusH2VAISB7wbGa+SorfTWIyEvaTpnMmkSjoRROy+jP4JwJEZmvg1JCrjvq1A7da
         Lsncof+2/0KV1qoui8NgJvweLVtJzTLaY9hSw/5r2vl5MHpbYp3Pv6V8hE2ZRRptGpVD
         VWImbe6ua/dEdCchQ9KkIV9fAtFRckW108t34f6ufSehDOqBUbYlTUOXdMgR8VqETCP2
         JKLw==
X-Gm-Message-State: AOJu0YzIP9wonvwKOaRCafrzzoVxYWYLiODF0HbClJFqtLQL7tgNBuBY
	MfSmlAPF8gyI5A2jeryl0D153EekfsqWcmAILNIklhkCx7qBdX8uMp7h25twzmDKU8hU7Q==
X-Gm-Gg: ASbGncuBfVW10mEivUv/CiPKvk7Tvl1VARFg3zpPrziHhIYxVbaOPpCyMqoKmEguMOs
	TXMbcoLR/J22Mjy/J+pkoKIEffLZpWOdWTCl2ux3b1VLjV3IBz3Grjt8/zrODJOtW16y1pYa8I/
	vxh887KMz8tsQ/QFpJaVWYHHtDqsIgBTOqFIPRcDed2kaliauSXVFWbZEJ5jdFKjErhoyu4mFd8
	fbo1A2X0kGQ6669yqLaBP94sXfS8erHw76hcKYni2YVI5ZmQT1Le6z/0/B3+2e2Kl1N7NlEAkJj
	25PUsi5X6gxSqfZ/s0dMMQp7DeUwssp7tqr45+FmeSzkOv8oI6UVPIrx41UwuPNL9jePIJk3XYZ
	2RQ==
X-Google-Smtp-Source: AGHT+IFz4YvLG07mimiQgwKZPZoghEEezyT2BnEsvi6aWF8kiYYOdo4a1M9ViO9A648E8FlyqHklig==
X-Received: by 2002:a17:902:c404:b0:234:a139:11fa with SMTP id d9443c01a7336-237d980c3f8mr184292145ad.3.1750707599736;
        Mon, 23 Jun 2025 12:39:59 -0700 (PDT)
Received: from [127.0.0.1] ([115.187.48.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d873845esm93019575ad.243.2025.06.23.12.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 12:39:59 -0700 (PDT)
Date: Tue, 24 Jun 2025 01:09:54 +0530
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
CC: stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5Bath10k=5D=5BQCA9377=5D_Firmware_crashes_on_Dell_I?=
 =?US-ASCII?Q?nspiron_5567_=28IRQ_=2316=2C_all_modern_distro_kernels=29?=
User-Agent: Thunderbird for Android
In-Reply-To: <CD81F065-CDDD-41F6-AECD-167B509F57C6@gmail.com>
References: <CAEmM+Qh=8tm55Ypa2w3ZtOFFrGXTpKqxue59mVAo_5TVy0RJ6g@mail.gmail.com> <CD81F065-CDDD-41F6-AECD-167B509F57C6@gmail.com>
Message-ID: <2DC25FD4-0EA4-41CE-BA17-BFF84C1C5F7E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_124000_793926_14715DDF 
X-CRM114-Status: GOOD (  28.32  )
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

For some reason, the Reddit link on troubleshooting the firmware leads to n=
owhere=2E

Here is the Reddit link yet again (let's see if it works): https://www=2Er=
eddit=2Ecom/r/linux/s/egXvRBYhYp

Apologies for interrupting more than once=2E

On 23 June 2025 8:22:57=E2=80=AFpm IST, Bandhan Pramanik <bandhanpramanik0=
6=2Efoss@gmail=2Ecom> wrote:
> Hello,
>=20
> An update on the situation=2E
>=20
> I installed Fedora KDE Plasma Spin, and the skip_otp option didn't work =
there=2E KDE specifically said that the Wi-Fi is still connected but it is =
not connecting to the Internet (confirming my suspicions as true, that the =
network interface is not disappearing this time and the Destination Host is=
 unreachable, because of the network card)=2E
>=20
> Only the following convoluted (and strictly step-by-step) solution seems=
 to potentially work (not tested on my own laptop yet): https://www=2Ereddi=
t=2Ecom/r/linux/s/8VKDJ6QeP
> (This solution has been taken from the GitHub Issue of the Pop!_OS repo)
>=20
> I used these exact sequence of steps before, and it worked properly=2E B=
ut this time, I simply wrote the skip_otp option to /etc/modprobe=2Ed, and =
it didn't work=2E
>=20
> Reiterating my point: this issue seriously requires urgent attention bec=
ause it affects all the stable and longterm kernels as of now=2E
>=20
> Thanks,
>=20
> Bandhan Pramanik
>=20
>=20
> On 23 June 2025 3:01:08=E2=80=AFam IST, Bandhan Pramanik <bandhanpramani=
k06=2Efoss@gmail=2Ecom> wrote:
> > Hello,
> >=20
> > This is to inform all that constant firmware crashes have been seen in
> > the "Qualcomm Atheros QCA9377 802=2E11ac Wireless Network Adapter",
> > which was shipped with the Dell Inspiron 5567 laptops=2E This affects
> > every kernel release, including the stable and the longterm ones=2E
> >=20
> > All the logs have been taken after livebooting an Arch Linux ISO=2E
> >=20
> > Every distro has been tried, and it has been confirmed that some error
> > of this kind is shown in every distro=2E
> >=20
> > ## Steps to reproduce the issue
> >=20
> > 1=2E Boot/liveboot any Linux ISO through this card (and possibly, this=
 laptop)=2E
> > 2=2E Wi-Fi network interface appears=2E
> > 3=2E Connect the Wi-Fi router to the computer=2E
> > 4=2E A few moments/minutes after that, the touchpad stops working, and
> > the network interface cannot even access the Internet anymore (BUT,
> > the network interface might disappear, might not disappear)=2E
> >=20
> > ## Affected distros and the necessary workarounds
> >=20
> > This has been the pattern on every distro and their corresponding
> > kernels (LMDE, Linux Mint, Pop!_OS, Zorin, Kubuntu, KDE Neon,
> > elementaryOS, Fedora, and even Arch)=2E The fix which made these distr=
os
> > usable is to add two things:
> >=20
> > - Adding "options ath10k_core skip_otp=3Dy" to a new conf file in /etc=
/modprobe=2Ed=2E
> > - Adding "pci=3Dnoaer" in GRUB kernel parameters so that the logs are
> > not flooded with Multiple Correctable Errors=2E
> >=20
> > To defend my case (that it occurs in the other models of Inspiron 5567
> > too), I have recently contacted someone running Linux Mint on the same
> > model=2E The answer was the same: the touchpad and the Wi-Fi stop
> > simultaneously=2E
> >=20
> > ## Some of the limitations
> >=20
> > The kernel was tainted, but the other things have been properly noted
> > in case they might provide some useful details=2E As stated,
> > investigating why IRQ #16 is disabled will probably give us the
> > answer=2E
> >=20
> > ## Logs provided
> >=20
> > All the logs in a combined manner can be found here:
> > https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832=
a16180
> >=20
> > - Full dmesg: https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca0=
3ca2ea43a1d832a16180#file-dmesg-log
> > - Hostnamectl: https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca=
03ca2ea43a1d832a16180#file-hostnamectl-log
> > - lspci: https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03ca2e=
a43a1d832a16180#file-lspci-log
> > - Modinfo of the driver:
> > https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832=
a16180#file-modinfo-log
> > - Ping command:
> > https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832=
a16180#file-ping-log
> > - /proc/interrupts:
> > https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832=
a16180#file-proc_interrupts-log
> > - IP addr command (Heavily Redacted):
> > https://gist=2Egithub=2Ecom/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832=
a16180#file-ip_addr-log
> >=20
> > Lastly, this issue on the GitHub repository of Pop!_OS 'might' be
> > relevant: https://github=2Ecom/pop-os/pop/issues/1470
> >=20
> > It would be highly appreciated if the matter were looked into=2E
> >=20
> > Thanks,
> >=20
> > Bandhan Pramanik

