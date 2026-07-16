Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E072C44514
	for <ath10k@archiver.kernel.org>; Thu, 16 Jul 2026 19:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usR4FsGWwyujnpLuckLUoYL0cDU6hXmHk5b1uovpKno=; b=JY3k1KCvD/3BNUJB7ereaPJaFV
	rnTtvSPBUGEQdIK68FB4FKbMStGnkOGaUsXbPZuczPFaM1GFaXOwz4vtuJPdYvABULWYH4eaJQU1l
	epuuR3Y129KzFeS8ZvivFQN4hGzK6TxvB/DSZnbKcoa0DeYWPhER7Y5hIUDv6OjFWiwH/ek+Q7DNM
	4aPqZk85+O7qBoypA4PjndehioVw3EuaURDAxpI5QwMYvY0IhOHjbZtUKXUSvkQ3h/jwGZM2DRbMJ
	Y8yf/z3Ms8uk0HVZtzJ5LLQwS7qHcP+W7N4kNqh7xg8g2FfyGJ9dM9GjhUJ/ffRMx4dyme0l+Gqps
	0Lb/6AUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkRyj-00000000ThJ-2EuX;
	Thu, 16 Jul 2026 19:42:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkRyh-00000000ThB-3Q5s
	for ath10k@lists.infradead.org;
	Thu, 16 Jul 2026 19:42:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F3D3F4130F;
	Thu, 16 Jul 2026 19:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51D21F000E9;
	Thu, 16 Jul 2026 19:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784230956;
	bh=usR4FsGWwyujnpLuckLUoYL0cDU6hXmHk5b1uovpKno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WHHnrgriO+KrWCsVg+TwAvkOfNWs/YkXkGQ1U3xxZ9mhjMX3Lr0Grm7vAzXVHIJn9
	 ctA9QM3HGp2Ze1NRWtDy+wSs4UuXRVpkGjl53T2V9mNgDburjmXXR24tRt7uTBUPcZ
	 gvfyaboifn0XGp/WKn7chqa5qTHjN/l/ohrNaoCX8v1PPDHA27mbyj3jg0NA9n1W5r
	 V6FqBhqa44TF2LcNoN0AlORsEzAkH2F6DUDbbVsbisfdmubF9TrArc3v/RikOrhMsQ
	 c3OZAX2Pcba9r7LV5Ibx4dxMN7aD1XwfuHYJK2o3rEXm01PWu3oy44quzApuD+uemy
	 elvvQxD+O5t8g==
Date: Thu, 16 Jul 2026 14:42:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Bjorn Andersson <andersson@kernel.org>,
	linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>, daniel@makrotopia.org,
	linux-block@vger.kernel.org, linux-mmc@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Simon Horman <horms@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Jens Axboe <axboe@kernel.dk>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Saravana Kannan <saravanak@kernel.org>,
	linux-bluetooth@vger.kernel.org,
	Rocky Liao <quic_rjliao@quicinc.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	ath10k@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v8 1/9] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
Message-ID: <178423095566.1177840.10999909737617285520.robh@kernel.org>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
 <20260703-block-as-nvmem-v8-1-98ae32bfc49a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-block-as-nvmem-v8-1-98ae32bfc49a@oss.qualcomm.com>
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


On Fri, 03 Jul 2026 15:45:14 +0200, Loic Poulain wrote:
> Allow an eMMC hardware partition node to describe an NVMEM layout so the
> partition can be exposed as an NVMEM provider. This lets a partition
> (e.g. an eMMC boot partition) store device-specific information such as a
> WiFi MAC address or a Bluetooth BD address and reference it through NVMEM
> cells.
> 
> Accept "fixed-layout" as the partition node compatible, in addition to
> "fixed-partitions", so the layout can be described directly on the
> partition node.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/mmc/mmc-card.yaml          | 23 +++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


