Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F425CD98C5
	for <ath10k@archiver.kernel.org>; Mon, 15 Jun 2026 13:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iw06VSTSd13id9KhZoBja5SU9senPz0GmL/KsFWNhgg=; b=RWnulUYIoXdak+/KXJXfK1hf+6
	9iVuMszqvLbSE7k7cj9g2zM/ESZcnC3KNRuIUB9lDMfVNXrbxoi7wCcHz+fdPK0Z2H+bQw+Y2kQ3n
	slriQzt5XAIqS4ETmHeTU3sl3PBoPDOoVrN+Lh+PRDp51MNNSTz8I79tJtPnoxJAf8CPPwIhx5WkI
	Q7MGPu9btts6U3/KvU1CbnmrQ6XcdQrSNyifl2+Jr74OhK+U10QYdLz5j9y1FHZSNihtFqKydiYWq
	PF/z+lkRy57/wdagC35hoZOI4bYvsSLTEznXxkcD+h1esL7Zk8SB7KTRCOBB5M8l642Kk5TljvB2C
	8DXlvvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ71S-0000000EG9L-25pH;
	Mon, 15 Jun 2026 13:06:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ71Q-0000000EG8s-3XV4
	for ath10k@lists.infradead.org;
	Mon, 15 Jun 2026 13:06:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CCD8F445CC
	for <ath10k@lists.infradead.org>; Mon, 15 Jun 2026 13:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3EB41F00ADB
	for <ath10k@lists.infradead.org>; Mon, 15 Jun 2026 13:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781528795;
	bh=Iw06VSTSd13id9KhZoBja5SU9senPz0GmL/KsFWNhgg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=grHea4+O3St7FBU0cs2OI9uzNPZgGZPxcObx9I+gJxmajatBm4NosYYUeDhu3B7mh
	 SThH3AYk1Iq/pLqVzviUgtscm34PjekuBu94uAES8FaHxsrVzgBqLuvEKIeNoF9Kbh
	 otjHGfPuoDhbEY4e9b2+EmZzT/2pmISeY4bN6AENECIMU/RbkHETWgQe7Mt45sa3w5
	 EKOKQb62G5t5fa5MtT0oIRMbeCccKrPyS4qthZ4/emPMKYT1p2Evf8lzfZwh1NnKJq
	 Li/wtDWeDwFddzd9PLU9wMocFWDV5MZm5MHApJWD7EvqwooPMeQaWiGyhLYJhFGM+j
	 7ISY9CaW5ZLug==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39676d82b7fso29909851fa.0
        for <ath10k@lists.infradead.org>; Mon, 15 Jun 2026 06:06:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ928l5QtVoPWyZOLXckpnKrQIFv5nUajnoHxaZN3d10sc922rfkzscGssG4eN+Rjk/j1EmUmuk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyokSj/U3OfDz/sbmtNaqT4irCooZtLZDyXvXvWBk7eUkVVMipn
	OedFvzNz3agqnMKcluaHTeuUNvB6Ft0wkWFCZ68wEFaOh9OomGLyu+WwpllKQETEX47bWOIfzmE
	TYN6sRl1V+fAJ44gKoKxikm2sjuCRlbcYSPTFjBQw4A==
X-Received: by 2002:a05:6512:8016:10b0:5aa:62d3:3833 with SMTP id
 2adb3069b0e04-5ad2db2c528mr2887597e87.5.1781528794189; Mon, 15 Jun 2026
 06:06:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 06:06:32 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 06:06:32 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAFEp6-0oxBEdfH-fqhdM18pt4JewLwrMOON9qpQgLFh8KS0hDg@mail.gmail.com>
MIME-Version: 1.0
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
 <20260612-block-as-nvmem-v5-5-95e0b30fff90@oss.qualcomm.com>
 <CAMRc=McQkLnz2OS2RREAbcrsp47cL-W3bCduq8LwPBBUcVNyJw@mail.gmail.com>
 <CAFEp6-0qsqhcwnSjm3=bG21jsCktzn5-L5sk2pNTZcGuVXaiNA@mail.gmail.com> <CAFEp6-0oxBEdfH-fqhdM18pt4JewLwrMOON9qpQgLFh8KS0hDg@mail.gmail.com>
Date: Mon, 15 Jun 2026 06:06:32 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc6rMwXvo+phxhjioFWwi_kN+yMiEjVwU6Zvu0bgfEaeQ@mail.gmail.com>
X-Gm-Features: AVVi8CcYELXBpxe6-PKRsGQxMXLfew6V8MDcv_4EHem5JqYjvyy5fE7tXsAHiMU
Message-ID: <CAMRc=Mc6rMwXvo+phxhjioFWwi_kN+yMiEjVwU6Zvu0bgfEaeQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] block: implement NVMEM provider
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, daniel@makrotopia.org, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, 15 Jun 2026 11:33:22 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> On Mon, Jun 15, 2026 at 11:28=E2=80=AFAM Loic Poulain
> <loic.poulain@oss.qualcomm.com> wrote:
>>
>
> Also we cannot safely return -EPROBE_DEFER from add_disk_final()
> either. The NVMEM registration point is late in the sequence, too much
> has already happened to easily unwind. The easiest is that the NVMEM
> simply won't be available if registration fails, which looks
> acceptable?
>

I'd argue that it's a problem with subsystem code then as unwinding should
work fine no matter the point in the sequence when it's initiated but I gue=
ss
this isn't really an issue in your patches.

I suppose we shouldn't typically run into probe deferral here so I'm fine j=
ust
ignoring the return value.

Bart

