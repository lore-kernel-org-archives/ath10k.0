Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D94CD8C9F
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 11:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFMAGQPvDoEOfbv6xk4LPNtyK0BZmw1e8x0Y/MFQuBY=; b=l9N+Rl9AdLu07Hvgl4mpV/p19f
	59T16vyY6HE2RYY0LZ80RCxB7QVNVV2+MQsxF1UmDwoh9/X688hB7JXoLXlsI0CGUVcfcQIJ/JWyb
	7/nmrP6jZmpKLSX9eGuheGYQNQp151bebHqJSbDgwF4g8dlM3eCQeT2kqwZH5II+hFweFZU4PS/nm
	UAqmeAFm9HtIxKZl6H0B62CEfLeS4o37fgmErmqnjLfGrCfaMZ7UrLbDPGhHc9VZIiyuP9KMHrBdZ
	kf2WhMewx6OcRmKjissc9PfGI0+UIo8t7IZEGzg4uDhSMg5Z1E9jn43s/kwT/HU1f2QbIF5vdC4QK
	LXdyAMWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWY0D-00000003Pdo-1YFq;
	Mon, 08 Jun 2026 11:18:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWY0B-00000003Pdi-1TmG
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 11:18:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2359E43F6F
	for <ath10k@lists.infradead.org>; Mon,  8 Jun 2026 11:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F014A1F008A0
	for <ath10k@lists.infradead.org>; Mon,  8 Jun 2026 11:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780917523;
	bh=pFMAGQPvDoEOfbv6xk4LPNtyK0BZmw1e8x0Y/MFQuBY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=h/erb8Xt0IiBnt5uzTjO6qSZh/4cdyjspm9xTnppXWhOAYs1EE8YVBvDK+ldNqakT
	 c6uSakP62TFkAIRhg9NlSBU9w3g2xjLlmUL0t/TXf3ov7jpxrQkM0AoB82zgoh7idT
	 RFA+u9DWZQ7q13474f4nFuQJBqaH/zXaBzXb1c/cLISKlPynpMiHeRuLG2nSOI3SH6
	 LwGh4JQuLLPjJ5zc0jAFOwzsU1jyGtdNRoj7ZnlNNEBj55GfJWqGrXuwRqyCOeadYE
	 7IJYVGMvtyEaWVlwKzc2Gl8axhPa/I0ioRnKxM/mnoqOORek77220U7fvRzlmDSiKj
	 ci7eNvKgI7zGg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3965d76090bso37354071fa.2
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 04:18:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Qi96Q+o3CDHY20LtqDED/SP0EyK1UXeZC2Y8WZGqc+UDx4S3++Kyr253KO6o9R05soX8Usys=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjkq884dUKnDPN053TldxsJTWA6vp7Ws6GdMuz6i7Scw9RY+RH
	S7cnMfSNqX/uDqEp4Qr375OGD4zZJCzkdg+l7Ckn+vdmUFvYd7XXBh68rfHrKG3uowPbimzlJgw
	yrF/pOSEMC/y+Cp1lsXzpIezcEvbSwE/rU7rpRZfGow==
X-Received: by 2002:a05:651c:1583:b0:396:9dde:b5e6 with SMTP id
 38308e7fff4ca-396d0752a58mr36949311fa.5.1780917521671; Mon, 08 Jun 2026
 04:18:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:18:40 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:18:40 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260608-block-as-nvmem-v3-1-82681f50aa35@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com> <20260608-block-as-nvmem-v3-1-82681f50aa35@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 04:18:40 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeHJMKuEm-aAqwoaq_vGcQm-oOX+9dFrp1kijZYWFnX5A@mail.gmail.com>
X-Gm-Features: AVVi8CektcE6gMbY10cEVnuX6KgxnarlC2iBfMp83fSayBsh06aH5Rgenq9H1t4
Message-ID: <CAMRc=MeHJMKuEm-aAqwoaq_vGcQm-oOX+9dFrp1kijZYWFnX5A@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: mmc: Document support for nvmem-layout
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, daniel@makrotopia.org, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 8 Jun 2026 12:50:38 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> Add support for an nvmem-layout subnode under an eMMC hardware
> partition. This allows the partition to be exposed as an NVMEM
> provider and its internal layout to be described. For example,
> an eMMC boot partition can be used to store device-specific
> information such as a WiFi MAC address.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

