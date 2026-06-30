Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C04C43458
	for <ath10k@archiver.kernel.org>; Tue, 30 Jun 2026 07:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/k1ZrhAw36H5Vuxbx4bV+2suHUP71UeTdDWtXeQdEA=; b=xHcqUEhV+RiVpZOCbpiwGuy7UW
	m4WMhWO0C/TKRiM/0iGvQmreGk/YP+gP49GlA1TXEz85cfEYtnCKYzHwdUwk6aMDPAbV/u9iORMig
	oV7WAlalIhFkwFaskBg3KiCy+rcqfmHqi9KG53l8HKGpFA9I0MunINqj70XmOqK65POSJp7yDOg8V
	mWNcMpCuJB9XSyB9H+gALBL5sb2z9VUXc+q5xtgE0tFeUVShVE+cxC+al8603MB/i6TlJo2At8SGn
	aFgbY545Sz0JQJElNtKcKwTjmtPikcXZf0AtbQQarQF5paeZLoFoq+fHMpXHvr0J6ajsIQy41prDA
	AzlZAe0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSh4-0000000G57v-0WGA;
	Tue, 30 Jun 2026 07:15:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSh3-0000000G57p-1g1G
	for ath10k@lists.infradead.org;
	Tue, 30 Jun 2026 07:15:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF3A843574;
	Tue, 30 Jun 2026 07:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560DB1F000E9;
	Tue, 30 Jun 2026 07:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782803740;
	bh=T/k1ZrhAw36H5Vuxbx4bV+2suHUP71UeTdDWtXeQdEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FKDSuYv8LBMXE0Ju2uHUAG/jaiVWAXPk8pD0DsIIhY3WtzVnnUdlumGDmGIMs9yiO
	 ErpJA7PYwfcvJaBAaZmlB/EXjHGZo/SSmuVVtQanZsX82xmmD1A6/lFION2yxIbnQ0
	 pRMcqLXNr8wi+tm3eqP00ZPVsAhOenjTrw7ovz9xzPo6XjFTHvIJW3Eo1ZBjmDjIxG
	 dLa8CJJ14GULWVrvz+7M8WZnRoBg64yQ5fTQJtfuS8JeSqnV0Ykj/TSXo+X2xGDVeG
	 w0pgjz+F+h+4ebkQO2sDnVPRPbtGkSQ27dMKF3Dr9bY4CPK47zqdlDLaR750f2oCDF
	 u8pPSHN/GrzQg==
Date: Tue, 30 Jun 2026 09:15:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Saravana Kannan <saravanak@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: net: bluetooth: Document Qualcomm
 IPQ5018 Bluetooth controller
Message-ID: <20260630-wondrous-lean-stoat-be0b9a@quoll>
References: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com>
 <20260629-ipq5018-bluetooth-v2-1-02770f03b6bb@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629-ipq5018-bluetooth-v2-1-02770f03b6bb@outlook.com>
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

On Mon, Jun 29, 2026 at 05:01:44PM +0400, George Moussalem wrote:
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-ipq5018.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
> +
> +    bluetooth {

Don't send new versions while discussion is still going. I need to
repeat my question - what bus does that sit on?

Device nodes represent real devices. Real devices sit on a bus, usually.
Do you have here a bus?

> +      compatible = "qcom,ipq5018-bt";

Best regards,
Krzysztof


