Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FADC43458
	for <ath10k@archiver.kernel.org>; Sun, 28 Jun 2026 03:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mB14dzokXviAWew5o/D1323LSbv37Vmdi+prndaBPPk=; b=3s5AZWKzYFx1x7VhcS7TWZNDLZ
	ldy7T3VfL02RpTBvcT8dakbvtV8NHTNAWPOBTlgWIGiDkXZyNg1FBV7L+tkggByFENJRz1wCsla7O
	jGwLtASJyTSi8kuCexQqVlCBiRCa7J/V5kFIslzkju1wKnwCDE19apj/nDX4Vn7O208O1mRbh+0Hx
	y11IR3xoFYvYi9CgE+Aa46f2Le/QTaHgfCJVYGk4zqd3r0IW4xccfukq5Q6iF7q287d6jVpSgEIkt
	9goqnjEQ1yrW5CdIVdyVRtM1XMwa2e5UhJ+1E8CYHXN2IZUziLpTcKKR0nJuDD3N+OKujtr082Yph
	bg70rIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdft8-0000000Ct1s-3cXJ;
	Sun, 28 Jun 2026 03:08:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdft5-0000000Ct1m-2Mme
	for ath10k@lists.infradead.org;
	Sun, 28 Jun 2026 03:08:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B8BD41E54;
	Sun, 28 Jun 2026 03:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3291F000E9;
	Sun, 28 Jun 2026 03:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782616131;
	bh=mB14dzokXviAWew5o/D1323LSbv37Vmdi+prndaBPPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MOnRIRYaRdO5vvVGeU7z0bd3sUm5jr4IF5E7H3Drrc/mhZ6J38Qgq2KfeWfZdyiZF
	 MyPP0RbCyJey4DDEUnHd/WLuffNAb8sTTBthLHXIGJyqrQSSPkIx6uWA/liBTX+5lW
	 MrlHQ5wgAlRACR0pP+fZlMCwm6ZXwW2hMDDiaTArIgZesUqxLqEhUgCYnpG+5qr0Hj
	 uKSDOrLyTeD9isVpYKdNW0tZpinsYRBlVXmHhM4YAegP3rdvy1dlnWzXSqBQtEmPm3
	 0+QfU26iTUBVvK4ZJZA1rRf5Di3ctOCXGbhevxIzBFqBQWEaeaX29sq0WMzJFx/G1K
	 t0d4zembWGl2A==
Date: Sat, 27 Jun 2026 22:08:46 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: george.moussalem@outlook.com, Jens Axboe <axboe@kernel.dk>, 
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <jjohnson@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, Saravana Kannan <saravanak@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 2/6] remoteproc: qcom: Add M0 BTSS secure PIL driver
Message-ID: <akCQA-bLpp31QVGV@baldur>
References: <20260625-ipq5018-bluetooth-v1-0-d999be0e04f7@outlook.com>
 <20260625-ipq5018-bluetooth-v1-2-d999be0e04f7@outlook.com>
 <38aceb33-b28e-4994-b277-de070b6dae2b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38aceb33-b28e-4994-b277-de070b6dae2b@oss.qualcomm.com>
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

On Fri, Jun 26, 2026 at 01:20:25PM +0200, Konrad Dybcio wrote:
> On 6/25/26 4:10 PM, George Moussalem via B4 Relay wrote:
> > From: George Moussalem <george.moussalem@outlook.com>
> > 
> > Add support to bring up the M0 core of the bluetooth subsystem found in
> > the IPQ5018 SoC.
> > 
> > The signed firmware loaded is authenticated by TrustZone. If successful,
> > the M0 core boots the firmware and the peripheral is taken out of reset
> > using a Secure Channel Manager call to TrustZone.
> > 
> > Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> > ---
> 
> Can this not fit inside the existing PAS driver?
> 

While the start/stop SCM calls look the same, this doesn't follow any of
the surrounding concepts. So I think this should follow the other
non-remoteproc uses of mdt_loader and scm directly instead.

Regards,
Bjorn

> Konrad

