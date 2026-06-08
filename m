Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D47CD8C9D
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 11:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ad7d5mr4CwYQO8iltfUUgJ+AAb4ROP3d+z77mZ0aNzU=; b=ujL2qGR04D41hC6AvM1XMcPeME
	Z7krMxPjETsbj1DesSo6jMYnXAMXleoyQ7LkzFN5rV26aB0Ktt4gS3w5u4/Q+nfdo3abh/HeSzxQD
	uKqF5x3xItdOeSrwldMK5FvEEPHa8Thm+ygaD/ZZpVn55+aBNGYmvF5/Q/cm3FKu/dYrU6XxeqlYb
	fkXCouJmgyJfpljhhnjNzi0C/OMeAj7kmsOhUvUpY8TChc9NugBwK0+sJD15nIPfXvVODTd8QkAaa
	5pwNVJDyvE8SRfrjQouHcQn0+OOMCpfdCoKFgPjAuxZmEtXnUdFd/QTEv6Gjx3qzl4+xpepEzurII
	XMJgz+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXys-00000003PMk-00Hc;
	Mon, 08 Jun 2026 11:17:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXyq-00000003PMD-1wye
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 11:17:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 403254450A
	for <ath10k@lists.infradead.org>; Mon,  8 Jun 2026 11:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1477A1F00A09
	for <ath10k@lists.infradead.org>; Mon,  8 Jun 2026 11:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780917440;
	bh=ad7d5mr4CwYQO8iltfUUgJ+AAb4ROP3d+z77mZ0aNzU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=SA+ykTYg2FGHFGXDTW96O+0oJN2T39LKOCvP/a9mVkcYo9EuhSugk8zd7wMz/KYIu
	 vRgRAgJ4mSmrU742iRt4tJQJXNOA3zJ6SIvAE27AeLEu1WgQNrqMfghsMvRCFeSkBC
	 HMXQ8l1LN5U1eGW0xfgqTg2a03Zno6ALDmjtIsEgb6gEsIC5yKYw3pf0UqcIqgcTB4
	 usBsWS6UgaFUr1KmQrE0uYcm0g2quObfR9Kn+SiJZmxY8bakLmCfAiCkNgrGmdbHIE
	 1+4LASfTOXhMG+Z8AwRk95hILKkQMjpSDVvHl0H/DzglyhaRUYco1OVFKiB3oIqdx7
	 IgRhW/g6BX2Dg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa5be9ab1aso3853633e87.1
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 04:17:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/wFUWp1B+r4h25zoydmgtkgWG8trigIdimztleGtmx8dnxfE/wJkl2Fzrl0xAjW+DE7MYw60E=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ2gHBl1I/mTfNythOm7dfAIw8g4iNiJP6HbbPYCNHsHp4JZ8O
	4MsQtCvecLcbPs5Z0Te/dLfhSfn2xoGN9oqvpTUYm7VHoiX5k/pT/Dyh6ofYopGseQjrxEDKx31
	vVlb02QO59NRxMVRuMPeKh4YU0TSR61oo4YZV9Dhnww==
X-Received: by 2002:a05:6512:6482:b0:5aa:7078:49ee with SMTP id
 2adb3069b0e04-5aa87bf444cmr3733378e87.43.1780917438653; Mon, 08 Jun 2026
 04:17:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:17:17 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:17:17 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260608-block-as-nvmem-v3-3-82681f50aa35@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com> <20260608-block-as-nvmem-v3-3-82681f50aa35@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 04:17:17 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc46R=VqCp-eQcy8DP1yvyco=E43eup6NpkZjAR+rY=OQ@mail.gmail.com>
X-Gm-Features: AVVi8CdkJtXpApBPRw2hv_xTVbemR0DzCSGvL77XwK4W0RDjW4XvcGcsiQ8sLHk
Message-ID: <CAMRc=Mc46R=VqCp-eQcy8DP1yvyco=E43eup6NpkZjAR+rY=OQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: bluetooth: qcom: Add NVMEM BD address cell
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

On Mon, 8 Jun 2026 12:50:40 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> Add support for an NVMEM cell provider for "local-bd-address",
> allowing the Bluetooth stack to retrieve controller's BD address
> from non-volatile storage such as an EEPROM or an eMMC partition.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
> index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..7cb28f30c9af032082f23311f2fc89a32f266f17 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
> @@ -22,4 +22,13 @@ properties:
>      description:
>        boot firmware is incorrectly passing the address in big-endian order
>
> +  nvmem-cells:
> +    maxItems: 1
> +    description:
> +      Nvmem data cell that contains a 6 byte BD address with the most
> +      significant byte first (big-endian).
> +
> +  nvmem-cell-names:
> +    const: local-bd-address
> +
>  additionalProperties: true
>
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

