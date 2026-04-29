Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA24AFF8867
	for <ath10k@archiver.kernel.org>; Wed, 29 Apr 2026 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJw0cqLkYrPfWmxwpz5gJ+Hg/xhQpokAFPoJSwnJrOs=; b=bQLV7s1UkxtiwSVlbz7c2ywKTV
	TjHLVhKFaqGBDkpUBrp58zqkJ2JsQ3GCjKyhl/jYopaVdOln1pbpVYdgNFu9viAInUzYpTwzPxR5M
	+013YG4Q+HCUlY8qD8Lg8ShB237OCS46+AmFcd1j6DEU+40Q1lY0GoNv1183SlxE+ofTtP5L4I6Hx
	5V5TOINbK6fkqJNSbkDaSYqgzqiGseDkB1JDCvFudW+p326YUNe/HAeAep5LLTffu7e1ITOtQEFHF
	nMUakbW5WmSyAqiDAORtGftAHwckGaCu3NzIrePBgpALyEFEIJwGb+7F2n150coeIMKvVnUffeI9C
	m19N4elw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0fi-00000003GKb-1pyi;
	Wed, 29 Apr 2026 08:53:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0fg-00000003GKB-37Jq
	for ath10k@lists.infradead.org;
	Wed, 29 Apr 2026 08:53:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DE9D441AE
	for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 08:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FE3C2BCF4
	for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 08:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777452808;
	bh=OJw0cqLkYrPfWmxwpz5gJ+Hg/xhQpokAFPoJSwnJrOs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y3UWQnzrugN9g7H9n39KSSumKtrAVIdasAppLHzAlH98NZkxwIQz2dEqFdm+0df1W
	 nb+rlwCt7e+lTtWWFXouOLexr04e7b7VqoYMY+vrlNjtRYIQMy5/ihOgrMObbCxrUy
	 vzs/cqUMvxmgr6U87O9FjjAwe3huAVPGxywkpcRpDyslgiwKHty6inVTVwN5MT1YoS
	 slP/fC9hAONh4xPfd/JmQgv+0BiiJvf43VIUHyOXKpTf4Nd94qgRkCxESRMmu3v40h
	 yKOBB/8fwhJvYz385/Y41mkLaA8qOpejbv3ED0KmtWvFIsAV0JtNNBsnZy2JWSLz5B
	 64hwJtq4rBNzw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a2b636b944so17193285e87.1
        for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 01:53:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/DffHxBre+Unhi6X0oPSB8uoAbXihIRIYZMhy9/mpdHWmLgOdRFwt2IfCZRffkG2DSQLygDGc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnAm56U97D4hvhD4FIbXurX8HOIInW93jVU41I/3CfiOnhffaR
	XHo6KcbTFLgfY+VUjsOZYd6NgI4eEKBZTuu3IXfAsz+4fqWq0MrnSf1+42K/T0gooezRTaQs4vp
	SHo8fzas1xDnvfmAYjfdrWY/Hdm0vqCGBLF5VWqUOCQ==
X-Received: by 2002:a05:6512:2256:b0:5a4:2cf:601e with SMTP id
 2adb3069b0e04-5a749cf3d3amr1183325e87.12.1777452806809; Wed, 29 Apr 2026
 01:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com> <20260428-block-as-nvmem-v1-7-6ad23e75190a@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-7-6ad23e75190a@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 29 Apr 2026 10:53:13 +0200
X-Gmail-Original-Message-ID: <CAMRc=Me9G9vd06a39vi_UrXCTkUtJQRogm2MqgnwLS_r3Thyzg@mail.gmail.com>
X-Gm-Features: AVHnY4K2fPfnriRCC1GlEFUQD6V4mQElLKoEhFKcWJOmHGXZy_EUPGrUvrMD7WI
Message-ID: <CAMRc=Me9G9vd06a39vi_UrXCTkUtJQRogm2MqgnwLS_r3Thyzg@mail.gmail.com>
Subject: Re: [PATCH 7/9] Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, daniel@makrotopia.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_015328_842644_7A93AB3E 
X-CRM114-Status: GOOD (  13.40  )
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

On Tue, Apr 28, 2026 at 4:23=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Some devices store the Bluetooth BD address in non-volatile
> memory, which can be accessed through the NVMEM framework.
> Similar to Ethernet or WiFi MAC addresses, add support for
> reading the BD address from a 'local-bd-address' NVMEM cell.
>
> As with the device-tree provided BD address, add a quirk to
> indicate whether a device or platform should attempt to read
> the address from NVMEM when no valid in-chip address is present.
> Also add a quirk to indicate if the address is stored in
> big-endian byte order.
>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Is there any reason why we can't extend the existing
of_get_mac_address() with another property name and use it here? It
already has support for mac addresses from nvmem.

Bart

