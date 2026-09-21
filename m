Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAE2C982ED
	for <ath10k@archiver.kernel.org>; Mon, 21 Sep 2026 09:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o76WD5ueuIS8jiqhDq6tTGlPIaeopmRdrnTuiB1O1Jw=; b=nPaiO85vC/LIOoTV9gBTaLgnYK
	X+CmDW7TnhToRW2LosWGiZ2fV7zOxnZ80sm5o7ZIpYPAwdbjxsITmkpF32VfQvkJYC3nUKHWWdUHB
	HzHeUoNGOdWnnP9KEy0QOPzUUi3BinjfkQdXTyebOsNzzOAohzfmU3vq26ACWX4WgP0t//oo0LUqC
	cOFvrnyj6Q/MBFYM2xxHhC2spOuqsFCnzUpXNS/VBR44+0NAFl6RCob1YgG79RTJ7fD1C8vNUJweW
	G9uFnjpI66nK/BKP/HL7EKdLepuEu1sPTAyrDcUVf1GAGHnvZZJMq6mnHTFtZcXgfKzFvIdqGzQOI
	DS84KH2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aJe-00000001VYC-3iXs;
	Mon, 21 Sep 2026 09:28:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aJc-00000001VWb-1tjV
	for ath10k@lists.infradead.org;
	Mon, 21 Sep 2026 09:28:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E043560220;
	Mon, 21 Sep 2026 09:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351D31F0089A;
	Mon, 21 Sep 2026 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982879;
	bh=o76WD5ueuIS8jiqhDq6tTGlPIaeopmRdrnTuiB1O1Jw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FUllEETnTB2JnIVZt3TLVIWq1oKTCl1xomKsGGP0wQYPT+/AE+PrcIA9/ACJjfoGM
	 gJoRrMQ8TVCOFPcf4oj41aXQa/VRfEprHkAbJP9Sc7jzW+Lv57XdulivgW31eMZENp
	 gfhs0x0wnwa4SGs5jdq5/iNTCdy65tdjUx2DEypdchChmERfShYqZ48f0L+nh4Awqr
	 pLFb8p91m+btLZdfx4NsohAz7712TD6VoMXTo4D65p0bSpCRiNgJn7/QW2U5kfshOh
	 EgwcJmXr6mFgYvYkWbzq5h39vRSsCG+k2wkx3mt9j8pqQQlyK9kmAgvi1VOHeZNbhK
	 Z3EWpbU62nWqA==
Message-ID: <94b19730-b08e-4495-8233-71fe21a6d42f@kernel.org>
Date: Mon, 21 Sep 2026 10:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 04/10] nvmem: layouts: Support fixed-layout as the
 nvmem device node itself
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson
 <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
 Rocky Liao <quic_rjliao@quicinc.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Saravana Kannan
 <saravanak@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org, daniel@makrotopia.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
 <20260806-block-as-nvmem-v10-4-be598b2a5606@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260806-block-as-nvmem-v10-4-be598b2a5606@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 8/6/26 3:38 PM, Loic Poulain wrote:
> of_nvmem_layout_get_container() only looks for a child node named
> "nvmem-layout" to locate the cell definitions. This does not cover
> providers whose device tree node is itself the fixed-layout container,
> such as an eMMC boot partition block device whose fwnode points directly
> at a "fixed-layout" compatible partitions node.
> 
> When no "nvmem-layout" child is present, fall back to returning the nvmem
> device node itself if it is compatible with "fixed-layout", so that its
> cells are parsed by nvmem_add_cells_from_fixed_layout().
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/nvmem/layouts.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 

This change looks independent, applied to nvmem-next.

--srini
> diff --git a/drivers/nvmem/layouts.c b/drivers/nvmem/layouts.c
> index b90584e1b99eab4217cbe7ec48373e18a7caf0dc..efa631ce7283bdd6c8ecda75915911b5e3a33c99 100644
> --- a/drivers/nvmem/layouts.c
> +++ b/drivers/nvmem/layouts.c
> @@ -167,7 +167,18 @@ static int nvmem_layout_bus_populate(struct nvmem_device *nvmem,
>  
>  struct device_node *of_nvmem_layout_get_container(struct nvmem_device *nvmem)
>  {
> -	return of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
> +	struct device_node *np;
> +
> +	/* Search for nvmem-layout child */
> +	np = of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
> +	if (np)
> +		return np;
> +
> +	/* The nvmem of_node is itself a fixed-layout node */
> +	if (of_device_is_compatible(nvmem->dev.of_node, "fixed-layout"))
> +		return of_node_get(nvmem->dev.of_node);
> +
> +	return NULL;
>  }
>  EXPORT_SYMBOL_GPL(of_nvmem_layout_get_container);
>  
> 


