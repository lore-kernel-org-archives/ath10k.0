Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C24C7EE30
	for <ath10k@archiver.kernel.org>; Fri, 27 Jun 2025 00:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhGLtqLzXEo4D9aPX6yevO8SSkLzLzne+BivULMO8DE=; b=2gJrGMxOamE4IpDXyIcsrxwAdb
	I/Kid+LKaIU9hL44uZzxODoMLapYeZZMnvOoW4T4OEhHgjYqDZO4tsXq77di1uGVxnBdc6hiGwGDR
	qrYkX6178i67z9ApadiANjP/mwR3SWMwWP0UQJcl1qHOsSkEeCaJP+o2WOxIGBx8XlkBWTrYiwzPg
	LERsffbfoBARGvdHSne2N0Y6YFV9T2l72G/62KzeSwI2dQoz/0oAisLe2V6lkrIdfU9RJ9t1OkCHr
	Fe71gfceA8XMX7EhlwceUC95DhdNx0jiAmDn3n4QH+us4QoUVV7N+t8zmPXEqwJS6x+XEVdTP/kPR
	OQ7GtleA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwuW-0000000DCUm-1bc3;
	Fri, 27 Jun 2025 00:25:44 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvuI-0000000D2sE-3phs
	for ath10k@lists.infradead.org;
	Thu, 26 Jun 2025 23:21:27 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-748f54dfa5fso1289974b3a.2
        for <ath10k@lists.infradead.org>; Thu, 26 Jun 2025 16:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750980086; x=1751584886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NhGLtqLzXEo4D9aPX6yevO8SSkLzLzne+BivULMO8DE=;
        b=K3FsADLPpru76D0Yimci3dIV8fh619ePEHBAwEhj4GNqzJr3BXNR118fOxH1uQaoID
         VTkHDuvsCNdxayZzY7NWWxcwmNVq0b23udNeNoNIIK0Y72pkWUPHhiE+y5ePxnrjY7fi
         Yb6/IYo2rdkI3NEh/zibEMlEGlqpzCqRK7fNarsLr9ELyekHtojxszND7gIZBtOav6L6
         amEErZI8mUzFOcqtNb3BbWJ4EbAJzgwLT/Q3zyBp2q26gb32UhDwh0aqHvW5yluy6RfG
         cudEe3ieOVrkWqVQbCt9kecsjA0WkJC4HO0i449ei/emM6K8FFVmHPRJF/4/cwdXx/1F
         qsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750980086; x=1751584886;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NhGLtqLzXEo4D9aPX6yevO8SSkLzLzne+BivULMO8DE=;
        b=sabgbruQXnC/xxnzhcN/22lT1TzxyCIGp8f9QYaOzgzedIv5MvpyXKJwkR2u+k9zcI
         RI8iK/NNBgSqaEYu+TomNKTUSyGd6mBY8rcqSleHanwZu6e5pFjQU6BE9WfMTg6nQCyP
         8MnZOhDYYPGF2Y/1LwKxf7Dy4+INP/ygmUVPC9bYLj0YfeNgdOPvtHlwT8q58XkVoVEr
         g8goGqpk2vrdxYvJY617RWItufZAtxKPhJnHSdOo/7rW4qgX37hujQVoi0xfbeH1OEsv
         lLafeoOdaB+m89w82bG9COEcAvBB12eLIFRCu7u77mLn2PKa7MM/OiicDB3dtzwui2QQ
         gGng==
X-Forwarded-Encrypted: i=1; AJvYcCUUN7t8Q75V+n1duq2uwP+oqtSSDudbI3FK3y28e3EtAa3AXz0JoD+WqjllLKRhV7Y9t8XeiOc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTqQ4Bdhnd+sLTcSWdPJby2ztqeDBCPsytsUMbMF1j8wUx3vJd
	2znX4KUjXpP3mrTwlAaDryqeMZPO30d8GleSh/rb9GhJf2+BhayDHRHLtf0HbtIXOos=
X-Gm-Gg: ASbGnctNqw637ipZs9Ar3k5Io9WAAu334pcXH0oXfKc0veqOJlfmmRGwW6FRZ+3hWV0
	mlTGC8tf09AwAhG/bp7j/YUG/VquK0u6shNYOTUUKOVX3gaU0/YjNWcWY5ampE0lx3sDlKFryTs
	TN5LLegSnmI4XLxUY+2QJOtt1Ui/V12DoZFa+NwnK6OCGswJXtKorBJlm5lMHiz8etvnCea7dvA
	ikOK3eIN0bQu21Qv3Y06BXMVi8RW6GYyhJWWMI9DKl/8TQCUvNxgmlqSsk06a5dy76n8gVz47yG
	2p5GvXm3Hg1dNQ30b6V2ZjTfsipUkaHCGpRXpMdqLGI9YXmx8v6ZKgt5cDHBOt+Jtbhmf2fcXmf
	wmSI=
X-Google-Smtp-Source: AGHT+IEgVBxLC8ftPFFqIGaEQHG0r/elOwjK2mBDxK14ymVCHywbe6l17EqzlRJKqihZM0Hp26HcUQ==
X-Received: by 2002:a05:6a00:9a3:b0:742:aecc:c47c with SMTP id d2e1a72fcca58-74af6e8bb5cmr1409468b3a.7.1750980085736;
        Thu, 26 Jun 2025 16:21:25 -0700 (PDT)
Received: from [127.0.0.1] ([116.206.223.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557b27dsm714099b3a.84.2025.06.26.16.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 16:21:24 -0700 (PDT)
Date: Fri, 27 Jun 2025 04:51:19 +0530
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
In-Reply-To: <E8A26FD9-13E3-474A-87FF-ED8D27A1F27B@gmail.com>
References: <CAEmM+Qi-Waxk5qcR+nfip-QGXaKk0-Kq7QSq890e9oYOPjW+bA@mail.gmail.com> <20250625202014.GA1585022@bhelgaas> <CAEmM+Qg+xxMfXb=704OfwYLou7Mh_BNaTevLaGfiG2peZotJoA@mail.gmail.com> <E8A26FD9-13E3-474A-87FF-ED8D27A1F27B@gmail.com>
Message-ID: <3214E8BE-0A5D-40E7-A4DC-C1027CD052EC@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_162126_949947_C7DEC19F 
X-CRM114-Status: UNSURE (   8.76  )
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

Just a small update: it's not the fix=2E Back to square 1=2E=20

On 26 June 2025 11:23:14=E2=80=AFpm IST, Bandhan Pramanik <bandhanpramanik=
06=2Efoss@gmail=2Ecom> wrote:
> Hello everyone,
>=20
> I think I found it=2E I used irqpoll and I didn't experience any hiccups=
 with my mouse performance=2E But the Wi-Fi was still malfunctioning=2E
>=20
> To linux-pci and linux-acpi:
>=20
> It's an ath10k problem, sure, but there's something definitely problemat=
ic happening if, in the normal state, these Wi-Fi bugs hamper the touchpad =
movement=2E
>=20
> To ath10k and linux-wireless:
>=20
> I tried out "options ath10k_core rawmode =3D 0" along with "skip_otp=3Dy=
' and the Wi-Fi seems to work perfectly as of now=2E It might be the fix, i=
t might not be either=2E But I think there's something more important to as=
k: Are there any good resources/documentation on referring to what the diff=
erent key-value pairs mean? Like, what's the exact documentation through wh=
ich people arrive at "rawmode=3D0" or "skip_otp=3Dy"?
>=20
>=20
>=20
> Bandhan
>=20
> 

