Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C2DC55196
	for <ath10k@archiver.kernel.org>; Mon,  3 Aug 2026 22:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLU6AvVAmTV2ZbC3IT+O0inRa1mJRdKCmd2hcYx6gBI=; b=N2+3USBPtJg/6VtevcSt4z9k26
	MBYQXx61TWJuq7FmZkSBsqJAoNL+gqOutD3aBwCXjxSl9+eagpAE53WKSmvCX7xcce1kCu5D9FkXj
	fcrijtoyUXO1tYH/+mHhNPdVJH9o8dUUfyQbGKWfCzxL95k9mGG+kNMahpld5ddIua3UdMc4AP48w
	Bd6lTlnXuj6vOfvIMTFyNww8t8SVk8URTKt+Jghrr2apFvnIf9hRRZFMxfCpNYWDdserHdzDi1w1I
	mBsQf1vC7dYmOOQwWShkPgzPcD1lZxiCaNcRs7LmoU/VYAxba3BC6FpKNPyx8qfNcqBkzK8FvkCgf
	q4iStH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr19x-00000000bD7-0eER;
	Mon, 03 Aug 2026 22:29:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr19w-00000000bCU-0JzM;
	Mon, 03 Aug 2026 22:29:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 70C7143707;
	Mon,  3 Aug 2026 22:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293B21F000E9;
	Mon,  3 Aug 2026 22:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785796163;
	bh=oLU6AvVAmTV2ZbC3IT+O0inRa1mJRdKCmd2hcYx6gBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DmKJiF5i+Dfn7N3QvT8zUoxcutcqjN7pUT5d+Wik/cBCviAK4LQniuFMsTgQWn+fj
	 zuyLSLmwLlp9X8MftTFYCdCowTuBQAGeJCgc2k2cbLebPEKduXBPV/l9jvXsOzV4Mf
	 /5cuVInqu1m+Mw1pqRNm8WYLvzZ4W1D25R+PnQOCg4ON8t9IFPfa3n80DFMifwLI6q
	 juq06h7PtZgnS/E75ewvu4NA+W5GYYbv0OpO6kWjvcvDpKPmxP9GSGv9NGdxHLWHW9
	 h0QBhf+2j23nHj4p0tiymkluxKk7GYFn3QnRsPdMpVK9+ztCKRw8Z082N6q8JFVtik
	 WPFmBUNSlo/Sg==
Date: Mon, 3 Aug 2026 17:29:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
	Sean Wang <sean.wang@kernel.org>, Nishanth Menon <nm@ti.com>,
	Conor Dooley <conor+dt@kernel.org>, YC Hung <yc.hung@mediatek.com>,
	Yangbo Lu <yangbo.lu@nxp.com>, Maxime Ripard <mripard@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jyri Sarha <jyri.sarha@iki.fi>, Lee Jones <lee@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>, linux-wireless@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-usb@vger.kernel.org, David Airlie <airlied@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-ide@vger.kernel.org, ath10k@lists.infradead.org,
	Richard Cochran <richardcochran@gmail.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Niklas Cassel <cassel@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <pjw@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mike Leach <mike.leach@arm.com>, linux-arm-msm@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	coresight@lists.linaro.org, devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	mfd@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Jens Wiklander <jenswi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-i2c@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH] dt-bindings: Correct white-space style
Message-ID: <178579615849.757032.17209099883451822613.robh@kernel.org>
References: <20260801195613.235430-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801195613.235430-2-krzysztof.kozlowski@oss.qualcomm.com>
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


On Sat, 01 Aug 2026 21:56:14 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Patch applies on Rob's for-next branch.
> ---
>  .../arm/firmware/linaro,optee-tz.yaml         |  8 +-
>  .../devicetree/bindings/arm/psci.yaml         | 18 ++--
>  .../bindings/arm/qcom,coresight-tnoc.yaml     |  2 +-
>  .../devicetree/bindings/ata/st,ahci.yaml      | 22 ++---
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 12 +--
>  .../bindings/display/ti/ti,j721e-dss.yaml     | 96 +++++++++----------
>  .../bindings/display/ti/ti,k2g-dss.yaml       | 36 +++----
>  .../bindings/dsp/mediatek,mt8195-dsp.yaml     |  2 +-
>  .../bindings/gpio/st,nomadik-gpio.yaml        |  2 +-
>  .../devicetree/bindings/i2c/st,sti-i2c.yaml   |  2 +-
>  .../bindings/mailbox/st,sti-mailbox.yaml      |  2 +-
>  .../bindings/mfd/maxim,max77620.yaml          |  2 +-
>  .../bindings/net/wireless/qcom,ath10k.yaml    | 34 +++----
>  .../devicetree/bindings/opp/opp-v2.yaml       | 28 +++---
>  .../pinctrl/mediatek,mt7988-pinctrl.yaml      |  2 +-
>  .../devicetree/bindings/ptp/fsl,ptp.yaml      | 12 +--
>  .../devicetree/bindings/pwm/pwm-sifive.yaml   |  2 +-
>  .../bindings/usb/ti,twl4030-usb.yaml          |  2 +-
>  18 files changed, 142 insertions(+), 142 deletions(-)
> 

Applied, thanks!


