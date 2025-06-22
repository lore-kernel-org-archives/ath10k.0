Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BF0C77B7C
	for <ath10k@archiver.kernel.org>; Sun, 22 Jun 2025 21:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IdW5b/ilQ2wpV5HyTgBGLknyissGVZ99awUBdPrUHEw=; b=bhx/L+fdJCLz82BYdKbk5FnbKM
	BbfoyF1kd5v5od0WqzjXe/Fld4OWoyo9De0g34K/bK/VloYBBLfuGDav6K8K01Vy5BvrX3O9tzy/h
	DmlDb0/sG/x8rVjI/umXgC2nI3qCOiQSd3msbhgSudjJP9LHDDv8Tn2ke2dsNHdQ1XXS/Exwy3oKh
	x+p/oT/34M8w65+Lq+VN9oGjnJRj8SltDfNtIARu4yUpKQXQlM5uVdIoT5LsRB4RZAQVh1NoOG001
	pCi/VtHiCTDyAsjKIPjmHjAJjgkKurIuaBdb3ConxABht1Db46BZswhT/YcbbyC99OCkoSKi2OhiK
	lObfQLXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTSHf-00000001EhD-3XBX;
	Sun, 22 Jun 2025 21:31:27 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTSHZ-00000001EgL-0GYM
	for ath10k@lists.infradead.org;
	Sun, 22 Jun 2025 21:31:26 +0000
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso2720931a12.2
        for <ath10k@lists.infradead.org>; Sun, 22 Jun 2025 14:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750627879; x=1751232679; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IdW5b/ilQ2wpV5HyTgBGLknyissGVZ99awUBdPrUHEw=;
        b=SwKKj02EMu4EAT2w4C0asVwRtMEJkBnTRy6JM/el0E5d6sj3GhsK0VFt1Ee2s+cBoK
         SMDbMV3ZL488SW9dDruO8qlLQEJZYqZIOcAB4Qs3VWYlx0fvwt+OojUbgGbY/m9zr6B0
         QgkgN80iF6cjlBmGHy7IT+aQ3nbtF8rPew9a0RjebsdYcc1fVCLCoDNemo+y39sj44ng
         LMe+qBbX/jSYdcCpV6gDMouv3g5pdioX/nnxAHNrmjZOWHf15m2rpL2o3aEbiawnQXof
         mwyDGGBM/lLKXP+yPWxxzoWLE/1hgJlwdhrP0/v5B9O+inhlnZiN+9CoHl1LVH6A+5NA
         c/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750627879; x=1751232679;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IdW5b/ilQ2wpV5HyTgBGLknyissGVZ99awUBdPrUHEw=;
        b=mQg3xXHHKNmCAffP1FmWjaVjYhB0TlolMSkvx8+GjG7LoyRaZnpy6Gm1uyKg+GjN+Y
         ZMaLBGQ16IgNSrFZjEBKgjopoR8RUPIwLQmEA03S9aG/2q/I0Eiv9TtytANm7yGxYyin
         z6P1SlNkudABpaBvw2IFQqdKVC/mPHu4KSnKfxaFyFh9oOtlnLWBAJvaY99SzSQq6Ooe
         a2vbk9njJ0IF5f9RNaDfEpvKngcVGrX9L33Iix4reL0N5BQNE8ep8HPXn3933EcT99S9
         8tIjRjhm8r7t4NikCyAS1kWN7zpNgRC8yXNksgaE003O7QFbwIZpwGpoyvOufRoOWgf7
         krOw==
X-Gm-Message-State: AOJu0YxnoJhve9Iapia0SpIepE+HmBLxl6DJPtsK5p2TAKyiqJ4rGRbC
	2tDy2v/51K6VMRvzc1V4AXUPvhRm8X0uvQf14Hl2WpVTStbwozoLnvnK8YGeWSiVFtS6vt2lfYG
	/m64dB4WupAlMbrdtuCf0TC0pcXQjt/x/lpt8UieYV4IY
X-Gm-Gg: ASbGncsn9F893/w96QUHm9iUSNYx7/89rdjzxv5SaV0R2I09iHnewRPd7UqRycxUiX4
	cV/faKC68w4/UXES1Pd8rvKmhfYymYs+HKYDaGU+/IyUQcVJnulB9qdebhammMWzOe1cNIdx9fY
	M2byRCfMP+ZtqQ9NWGujQ0tgZTo2nhrcai1jKVjn15+IDa
X-Google-Smtp-Source: AGHT+IFZWKTvXxbH3G7bLqTtzvIEx7H67Au/OCzCNxls/aVYC/EQxcLNtVDi0fCMPkkqWWhWpADdtxZfBDjg7529qc0=
X-Received: by 2002:a17:90b:3d0b:b0:311:b413:f5e1 with SMTP id
 98e67ed59e1d1-3159d8ffc0amr14898875a91.32.1750627879479; Sun, 22 Jun 2025
 14:31:19 -0700 (PDT)
MIME-Version: 1.0
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
Date: Mon, 23 Jun 2025 03:01:08 +0530
X-Gm-Features: AX0GCFv-PIdhMtiuqEmBSJhBAx3V8LVajpf5wYth2A1G7mmD97Qg2BPG5kV2AXg
Message-ID: <CAEmM+Qh=8tm55Ypa2w3ZtOFFrGXTpKqxue59mVAo_5TVy0RJ6g@mail.gmail.com>
Subject: [ath10k][QCA9377] Firmware crashes on Dell Inspiron 5567 (IRQ #16,
 all modern distro kernels)
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_143121_107070_1ECC1ABA 
X-CRM114-Status: UNSURE (   8.50  )
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

Hello,

This is to inform all that constant firmware crashes have been seen in
the "Qualcomm Atheros QCA9377 802.11ac Wireless Network Adapter",
which was shipped with the Dell Inspiron 5567 laptops. This affects
every kernel release, including the stable and the longterm ones.

All the logs have been taken after livebooting an Arch Linux ISO.

Every distro has been tried, and it has been confirmed that some error
of this kind is shown in every distro.

## Steps to reproduce the issue

1. Boot/liveboot any Linux ISO through this card (and possibly, this laptop).
2. Wi-Fi network interface appears.
3. Connect the Wi-Fi router to the computer.
4. A few moments/minutes after that, the touchpad stops working, and
the network interface cannot even access the Internet anymore (BUT,
the network interface might disappear, might not disappear).

## Affected distros and the necessary workarounds

This has been the pattern on every distro and their corresponding
kernels (LMDE, Linux Mint, Pop!_OS, Zorin, Kubuntu, KDE Neon,
elementaryOS, Fedora, and even Arch). The fix which made these distros
usable is to add two things:

- Adding "options ath10k_core skip_otp=y" to a new conf file in /etc/modprobe.d.
- Adding "pci=noaer" in GRUB kernel parameters so that the logs are
not flooded with Multiple Correctable Errors.

To defend my case (that it occurs in the other models of Inspiron 5567
too), I have recently contacted someone running Linux Mint on the same
model. The answer was the same: the touchpad and the Wi-Fi stop
simultaneously.

## Some of the limitations

The kernel was tainted, but the other things have been properly noted
in case they might provide some useful details. As stated,
investigating why IRQ #16 is disabled will probably give us the
answer.

## Logs provided

All the logs in a combined manner can be found here:
https://gist.github.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180

- Full dmesg: https://gist.github.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180#file-dmesg-log
- Hostnamectl: https://gist.github.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180#file-hostnamectl-log
- lspci: https://gist.github.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180#file-lspci-log
- Modinfo of the driver:
https://gist.github.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180#file-modinfo-log
- Ping command:
https://gist.github.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180#file-ping-log
- /proc/interrupts:
https://gist.github.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180#file-proc_interrupts-log
- IP addr command (Heavily Redacted):
https://gist.github.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180#file-ip_addr-log

Lastly, this issue on the GitHub repository of Pop!_OS 'might' be
relevant: https://github.com/pop-os/pop/issues/1470

It would be highly appreciated if the matter were looked into.

Thanks,

Bandhan Pramanik

