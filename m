Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B1CC44501
	for <ath10k@archiver.kernel.org>; Wed, 15 Jul 2026 12:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKCD7udqW/dT/0NFTWMaszCBVogtz2n64C25G28PPzI=; b=Vz2O/kZ6OkddXyi9K6hsdlxtkT
	xMtq6jAgqhuVQMjuax16xAX+lP9xZdjrwGlkMBOSrIEuViYd4si5xuLym4yEP1/9jH8TLW4zySMim
	DFtybUFKiRALQxQH/j4FlRv+2DAPsTEXzMRsC/YJfKaqbblNuksh1HRz4GjIU4GSNqRfaOTQftuc9
	INaSibHKAOe7y5hL3A4n6gFo9UF2YZBIDvBcl5JTJ0KejUoJFmGK/c5yvhRxd3mz12ySSgLnrQInS
	7Lo6EZmbuIDA7rewh4RxcdHr5UCW0m3yIivhh/wL+mzS1QGWs2tJw2QiBCRLJDO5vg5OlUNN3B2f7
	f8wbVI+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyOf-0000000Ehyg-2aAk;
	Wed, 15 Jul 2026 12:07:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyOe-0000000EhyZ-2Qdk
	for ath10k@lists.infradead.org;
	Wed, 15 Jul 2026 12:07:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F362406E0
	for <ath10k@lists.infradead.org>; Wed, 15 Jul 2026 12:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81081F00ACA
	for <ath10k@lists.infradead.org>; Wed, 15 Jul 2026 12:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784117247;
	bh=WKCD7udqW/dT/0NFTWMaszCBVogtz2n64C25G28PPzI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=jUPtO4TmXWvKD6eVqarB6nND7C9CbCfqI4DZilWUuQsXs58IY2LKHAYW/9/UftPlG
	 5NnY474P1UpxEq8iAuriDwq823SdNxpFYSDmYFwRa0+eJUditjoelUarTs/syRL1tW
	 mDnk1MW5/W5GThHqnEiQMY5kG2nUKu+T/tFeK+0/ou6SZ0u+41PnpucAD8tvGaa3G4
	 PUNVF2lQa2PNcMMjH9fYApkcUb1jSjkwpOs6TforYx5dKcyWPD35GnGgH9kV7tXRPO
	 8cbXrrlltHhmsAFIiWULbWzrOucd6kDYcPfq+8KuqLE5qzNJVAy5+AOebFE0CltSmQ
	 UBTeKSn9OFmmg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b00d1e7082so4066241e87.1
        for <ath10k@lists.infradead.org>; Wed, 15 Jul 2026 05:07:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqvpDEEW/Hw02Gjk+1t6qOazeHlx1s0fm3MwBfdU1C8uwQRMEv107YRteFwTz4/Md3+VnnKajE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yydv0yfUmoS0bMXPMilH90pMXjWHdMZIhs/D0c0VBLtaCRDCbSP
	BOoqCQopwV4FirKjvDiZbFvhFmhWFRMDSTpqPyT3GHIDwIze2X5wK2BoExT+KCfOE2gMIRXnsi5
	tm86BEfAEvBSG9v8kReQArAabulP2L/RongP140bhAA==
X-Received: by 2002:a05:6512:3ca1:b0:5ae:bb4b:9357 with SMTP id
 2adb3069b0e04-5b159b76543mr1504606e87.27.1784117246567; Wed, 15 Jul 2026
 05:07:26 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 05:07:24 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 05:07:24 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703-block-as-nvmem-v8-4-98ae32bfc49a@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com> <20260703-block-as-nvmem-v8-4-98ae32bfc49a@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 05:07:24 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdNehSRQT3MUs+QtbZsHcUCS8YjyZchTgHCVv-HaLQkeA@mail.gmail.com>
X-Gm-Features: AUfX_mzq1KbXpXfl_bzC2i2_CZOvOZaRAVu5gjRfir9Gou3fViKyrxWRMFDDFs8
Message-ID: <CAMRc=MdNehSRQT3MUs+QtbZsHcUCS8YjyZchTgHCVv-HaLQkeA@mail.gmail.com>
Subject: Re: [PATCH v8 4/9] nvmem: layouts: Support fixed-layout as the nvmem
 device node itself
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
	Saravana Kannan <saravanak@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>
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

On Fri, 3 Jul 2026 15:45:17 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
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
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/nvmem/layouts.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
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
> --
> 2.34.1
>
>

I have it on my TODO list to convert nvmem layouts to be fwnode-agnostic. While
I'm not sure when I'll have the time to look into it, I think it makes sense
to not introduce any new OF-specific interfaces. Can you make it into:

  struct fwnode_handle *nvmem_layout_get_container_node(struct
nvmem_device *nvmem);

by replacing of_get_child_by_name() with fwnode_get_name_child_node() and
of_device_is_compatible() with device_is_compatible()? That would mean less
churn in the future.

Other than that, it looks good.

Bart

