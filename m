Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C73CDE001
	for <ath10k@archiver.kernel.org>; Thu, 25 Jun 2026 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0pMy8Sn/yuFoc4V1m1fe7I9TTbEePf9c0jZVrr8tzo=; b=VPj9K8MnKzCFF1RuK9KqJ8yApW
	zKKiYekec/4HN3OWDZB0+AxAIbGgePTbMDRA4jgVjXJms87sowqi0JWik/yQqII0LvPbHVN4gsDUI
	If+Cw8WlXzQXA29woXB5BHYbY4AeOd2vECQgimSpcMUg2CLihMdq6/3lT0DLIFE2RskCIG7agJcF7
	yGIAVrbITUCC44b8oB8QCCt8JnsI+1lfsqRe5zMEnLP2MiZ1fi5o8kptpyyFHLOUD+v2Y0jUF8Muv
	ivLRr9Bb8QJY1J9AwvqXmVUDeWjSi1o92cledLUfpsWk9ZwEbMf9wA38JT8UQomp3MqYoipT6NbCb
	hI4nThXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckuL-00000009KF6-3ejK;
	Thu, 25 Jun 2026 14:18:21 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckuI-00000009KCN-1EcX
	for ath10k@lists.infradead.org;
	Thu, 25 Jun 2026 14:18:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id F13B320007B;
	Thu, 25 Jun 2026 16:18:14 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wckuE-004bXk-2s;
	Thu, 25 Jun 2026 16:18:14 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wckuE-00000000DcK-3Bh1;
	Thu, 25 Jun 2026 16:18:14 +0200
Message-ID: <439f76c3fcafdfb91cca426fcae17ef776776eab.camel@pengutronix.de>
Subject: Re: [PATCH 2/6] remoteproc: qcom: Add M0 BTSS secure PIL driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: george.moussalem@outlook.com, Jens Axboe <axboe@kernel.dk>, Ulf Hansson	
 <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Johannes Berg	
 <johannes@sipsolutions.net>, Jeff Johnson <jjohnson@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Luiz
 Augusto von Dentz	 <luiz.dentz@gmail.com>, Balakrishna Godavarthi
 <quic_bgodavar@quicinc.com>,  Rocky Liao <quic_rjliao@quicinc.com>,
 Saravana Kannan <saravanak@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller"	 <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski	 <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman	 <horms@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio	 <konradybcio@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org
Date: Thu, 25 Jun 2026 16:18:14 +0200
In-Reply-To: <20260625-ipq5018-bluetooth-v1-2-d999be0e04f7@outlook.com>
References: <20260625-ipq5018-bluetooth-v1-0-d999be0e04f7@outlook.com>
	 <20260625-ipq5018-bluetooth-v1-2-d999be0e04f7@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_071818_487074_562D4813 
X-CRM114-Status: GOOD (  21.21  )
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

On Do, 2026-06-25 at 18:10 +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
>=20
> Add support to bring up the M0 core of the bluetooth subsystem found in
> the IPQ5018 SoC.
>=20
> The signed firmware loaded is authenticated by TrustZone. If successful,
> the M0 core boots the firmware and the peripheral is taken out of reset
> using a Secure Channel Manager call to TrustZone.
>=20
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/remoteproc/Kconfig            |  12 ++
>  drivers/remoteproc/Makefile           |   1 +
>  drivers/remoteproc/qcom_m0_btss_pil.c | 261 ++++++++++++++++++++++++++++=
++++++
>  3 files changed, 274 insertions(+)
>=20
[...]
> diff --git a/drivers/remoteproc/qcom_m0_btss_pil.c b/drivers/remoteproc/q=
com_m0_btss_pil.c
> new file mode 100644
> index 000000000000..7168e270e4d4
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_m0_btss_pil.c
> @@ -0,0 +1,261 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/elf.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/soc/qcom/mdt_loader.h>
> +
> +#include "qcom_common.h"
> +
> +#define BTSS_PAS_ID	0xc
> +
> +struct m0_btss {
> +	struct device *dev;
> +	phys_addr_t mem_phys;
> +	phys_addr_t mem_reloc;
> +	void __iomem *mem_region;
> +	size_t mem_size;
> +	struct reset_control *btss_reset;

Why is this stored here? It doesn't seem to be used.

[...]
> +static int m0_btss_pil_probe(struct platform_device *pdev)
> +{
> +	// struct reset_control *btss_reset;

It looks like this shouldn't be commented out.

> +	struct device *dev =3D &pdev->dev;
> +	const char *fw_name =3D NULL;
> +	struct m0_btss *desc;
> +	struct clk *lpo_clk;
> +	struct rproc *rproc;
> +	int ret;
> +
> +	ret =3D of_property_read_string(dev->of_node, "firmware-name",
> +				      &fw_name);
> +	if (ret < 0)
> +		return ret;
> +
> +	rproc =3D devm_rproc_alloc(dev, "m0btss", &m0_btss_ops,
> +				 fw_name, sizeof(*desc));
> +	if (!rproc) {
> +		dev_err(dev, "failed to allocate rproc\n");
> +		return -ENOMEM;
> +	}
> +
> +	desc =3D rproc->priv;
> +	desc->dev =3D dev;
> +
> +	ret =3D m0_btss_alloc_memory_region(desc);
> +	if (ret)
> +		return ret;
> +
> +	lpo_clk =3D devm_clk_get_enabled(dev, "btss_lpo_clk");
> +	if (IS_ERR(lpo_clk))
> +		return dev_err_probe(dev, PTR_ERR(lpo_clk),
> +				     "Failed to get lpo clock\n");
> +
> +	desc->btss_reset =3D devm_reset_control_get(dev, "btss_reset");

Please use devm_reset_control_get_exclusive() directly.

> +	if (IS_ERR_OR_NULL(desc->btss_reset))
> +		return dev_err_probe(dev, PTR_ERR(desc->btss_reset),
> +				     "unable to acquire btss_reset\n");
> +
> +	ret =3D reset_control_deassert(desc->btss_reset);
> +	if (ret)
> +		return dev_err_probe(rproc->dev.parent, ret,
> +				     "Failed to deassert reset\n");

Shouldn't this be asserted on remove? Otherwise after an unbind/bind
cycle probe will enable the clock with reset already deasserted.
That may or may not be problematic.

Consider using devm_reset_control_get_exclusive_deasserted().


regards
Philipp

