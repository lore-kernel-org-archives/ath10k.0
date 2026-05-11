Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC3ECD37AC
	for <ath10k@archiver.kernel.org>; Mon, 11 May 2026 11:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqeusD7M1GeDYISR0gEebUtKpnVGG12mdh36BE5ONCI=; b=FvNrNyXg224rzSsTfErI3RzsCd
	PsvFhXOXQUjVvNctdOi/rKeW3K6YdCId7EZ7kGWCi9GkJSBRRvBvHEHiL8EVV3hbbweEfAqpfaoBz
	AQjM+8NtRgOQC0oSowOzFWAUcaR/DWDCZCs66YFxfW1fSp6LzuqyQdzkvWLFoGOjhclppsgKlGP51
	3WjlBo7lFvGf7+47rnIo3cPhYuFxr0oIHZI7DS9PVdG3T1B3AfMuuMaQyUj5g32P0Y2cUnfchzdnP
	fiRUYjchhWks2thAejwMSiwVfDm83gdHEv0zMMPyb2LYBS42NYhSXUAh9k3bYha5bksqaJjbmVaCc
	Oj44ReOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOpt-0000000DKA6-3Qoq;
	Mon, 11 May 2026 11:30:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOpq-0000000DK9S-44UQ
	for ath10k@lists.infradead.org;
	Mon, 11 May 2026 11:30:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4061A4454F
	for <ath10k@lists.infradead.org>; Mon, 11 May 2026 11:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159EEC2BD05
	for <ath10k@lists.infradead.org>; Mon, 11 May 2026 11:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778499006;
	bh=IqeusD7M1GeDYISR0gEebUtKpnVGG12mdh36BE5ONCI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=UQCdmNsA2HNRZi618Ti6Qgj7Eu2mu+CjUBP6v8fQlfk0MiE639MxL8eWXPHwelqmg
	 9s8fwULbVpjE1SEqsNZ+1yE4RTDr+DPLjtlChVqZoRyMcRrjgnHr0K95KzeidjVFwo
	 w/faNuiTciWBxTuAz3FiBcOsfbXOa9oYRzb5QLzhlV8ek504pFwt6ksLN6OJCC/N2J
	 CAq+9d9Zv2jkQFfX5RXz5/NCue3ECTlzZLKbdQ2PqxWLhsk5fKPSz+SBFR918eIGyN
	 CjsRmLQ+Kwaipq2MHQ7oPADPMBGKHgSAhkHEimGMc+1kpphIuC4IkzsVT5zFB+2voP
	 kjP61TSkHblcA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3938cc204a7so33466791fa.1
        for <ath10k@lists.infradead.org>; Mon, 11 May 2026 04:30:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8oGW7VDxbmbm/csyue4um0jLzjiiTo4t1a25LVD+Y/oLu+HWQ8tFUMVGkqU+tqXcnT64E0XwQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/WXd2zs/esALIXxO31YVQse7/jrAAVLsN93fauEsoxc3HtVSO
	9OziYw0hxprpy9dheDtS7VCJGaHHDV8GpeApcYlqVOsshipQJtPOMg8w3UxOfJ1V7ZsbVxhloxo
	KjI27XYhNCfZpeIikpNm34bQ3uZc5ZyU8QpDKUESJDg==
X-Received: by 2002:a05:651c:897:b0:394:5b8:485a with SMTP id
 38308e7fff4ca-39405b84da4mr33981821fa.14.1778499004642; Mon, 11 May 2026
 04:30:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 04:30:02 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 04:30:02 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260507-block-as-nvmem-v2-8-bf17edd5134e@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com> <20260507-block-as-nvmem-v2-8-bf17edd5134e@oss.qualcomm.com>
Date: Mon, 11 May 2026 04:30:02 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfM7cTRA7fMG_ej2v1e=6aQDMz3t9TxvwXeJ0mR1VY2dw@mail.gmail.com>
X-Gm-Features: AVHnY4J57m614VXHB1gG4Q2Qt_nwp6rzOp-nMalUaxmsHemzFoQ6bUJPlO5KxfQ
Message-ID: <CAMRc=MfM7cTRA7fMG_ej2v1e=6aQDMz3t9TxvwXeJ0mR1VY2dw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, daniel@makrotopia.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_043007_051032_AD3C6433 
X-CRM114-Status: UNSURE (   9.69  )
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

On Thu, 7 May 2026 17:24:43 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> On Arduino Uno-Q, the eMMC boot1 partition is factory provisioned
> with device-specific information such as the WiFi MAC address
> and the Bluetooth BD address. This partition can serve as an
> alternative to additional non-volatile memory, such as a
> dedicated EEPROM.
>
> The eMMC boot partitions are typically good candidates, as they
> are relatively small, read-only by default (and can be enforced
> as hardware read-only), and are not affected by board reflashing
> procedures, which generally target the eMMC user or GP partitions.
>
> Describe the corresponding nvmem-layout for the WiFi and Bluetooth
> addresses, and point the WiFi and Bluetooth nodes to the appropriate
> NVMEM cells to retrieve them.
>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

