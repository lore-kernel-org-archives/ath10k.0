Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3991CD8CA4
	for <ath10k@archiver.kernel.org>; Tue,  9 Jun 2026 08:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLHsoW9IY4xTW+mqNcT4Ks1Lq68OrUZPn+tOTIXDiGY=; b=cJoc0AMKDg/BQ+SdxcYsMyg1lr
	taVysRfJLrymRQNoMcPdh8/zjtmiqprLSzNI2EDhuOvXDEmSn7OKKv6y99b4BSgXJqPdgpJylZYeD
	0KhdHPehFfs/ETGd7eNfS7Ksn5EOgVg4ThATQeL/zO2OiFdixJjlcq+GDw6sOhh2daOa0bbIcShtr
	3ZSUIe1UMcrxdvm9AtMh2ZDB7v6MO8UhNX5CN0gZdnykPKdpQY5atz9LETnFRnu2XqrM1ajLBU3OH
	sX0AQULw1/2vQmSQ5XXfFDSE3vjDADTHliHGbPWO/YBVgckwDlfxffv4JvivrS1Xo4mIKvZXI9led
	i5Mq3bug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsCT-000000056o9-32wU;
	Tue, 09 Jun 2026 08:52:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsCS-000000056o2-1LWs
	for ath10k@lists.infradead.org;
	Tue, 09 Jun 2026 08:52:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD741445DE
	for <ath10k@lists.infradead.org>; Tue,  9 Jun 2026 08:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43FB1F0089D
	for <ath10k@lists.infradead.org>; Tue,  9 Jun 2026 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780995163;
	bh=gLHsoW9IY4xTW+mqNcT4Ks1Lq68OrUZPn+tOTIXDiGY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=oYJ1zHnfDT4YMGvOCplutT1L7Qnic4h6qdEHQ2918TlyaHHWETJHhLcljdD+ILriU
	 LRh3S+Q4NZnIKNscajWc5RPP2v4dT4VUTBGa032eEpaTnpkw1DgaM7bGg9leIL1wRr
	 YGqXacLAyXAiunRI1OK8mkcxfZhnTmSKjlErwFyR8SP7jmgWE2MWg/k8mB7WCNWBSR
	 UDSUD48yDp1tgJSnGqABYEtrnWDrhJiIfinMK9qolWW/C86DFAK6HwvhvzZs5GqpFq
	 zIslg3cZk6Qw8MMo16UWTBlDi3nBMRaGEUFvIsAKA65xiVe7oSErO9sZaRGvGfzUQC
	 MPn4KRBLy3BTA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39677c80386so55809241fa.3
        for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 01:52:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/r1SAkDl8BQ0C4vdCvZ0pQfR3uv8jsiQgYXz6J2RZjGtX1GempLtOaP1lC0v7JL4Bn4UXpEm8=@lists.infradead.org
X-Gm-Message-State: AOJu0YySVQR3SNCQLxrX5TuUU1+3MzJ0pd5pkz25N7e7Og+WZN5KoD+/
	EW4EOlVcKjSaznWoqDF8e3xihydTj8AEkHRYeELYJ5SqvnkifuehoUdaaY0Ya1amJo7St+EeJs3
	vLiPOkKtDjgIU42koGMmnRbcXNB7VOeIxkhqQ2rvCfA==
X-Received: by 2002:a05:6512:4885:b0:5aa:66a5:66cb with SMTP id
 2adb3069b0e04-5aa87bc2726mr3742484e87.25.1780995161909; Tue, 09 Jun 2026
 01:52:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jun 2026 04:52:39 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jun 2026 04:52:39 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260609-block-as-nvmem-v4-4-45712e6b22c6@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com> <20260609-block-as-nvmem-v4-4-45712e6b22c6@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 04:52:39 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfuiPMkSm=-G6VEJpqKhos0TD_pf0ScBGqfwLHT0uk8yQ@mail.gmail.com>
X-Gm-Features: AVVi8CdMNP5sFIeAEVbUoYuLWXzUgm0hg-3EmseMekoB0Smn-0P2VeLQzdselx8
Message-ID: <CAMRc=MfuiPMkSm=-G6VEJpqKhos0TD_pf0ScBGqfwLHT0uk8yQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] block: implement NVMEM provider
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

On Tue, 9 Jun 2026 09:52:29 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> From: Daniel Golle <daniel@makrotopia.org>
>
> On embedded devices using an eMMC it is common that one or more partitions
> on the eMMC are used to store MAC addresses and Wi-Fi calibration EEPROM
> data. Allow referencing the partition in device tree for the kernel and
> Wi-Fi drivers accessing it via the NVMEM layer.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  block/Kconfig     |   9 +++++
>  block/Makefile    |   1 +
>  block/blk-nvmem.c | 114 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 124 insertions(+)
>
> diff --git a/block/Kconfig b/block/Kconfig
> index 15027963472d7b40e27b9097a5993c457b5b3054..0b33747e16dc33473683706f75c92bdf8b648f7c 100644
> --- a/block/Kconfig
> +++ b/block/Kconfig
> @@ -209,6 +209,15 @@ config BLK_INLINE_ENCRYPTION_FALLBACK
>  	  by falling back to the kernel crypto API when inline
>  	  encryption hardware is not present.
>
> +config BLK_NVMEM
> +	bool "Block device NVMEM provider"
> +	depends on OF
> +	depends on NVMEM
> +	help
> +	  Allow block devices (or partitions) to act as NVMEM providers,
> +	  typically used with eMMC to store MAC addresses or Wi-Fi
> +	  calibration data on embedded devices.
> +
>  source "block/partitions/Kconfig"
>
>  config BLK_PM
> diff --git a/block/Makefile b/block/Makefile
> index 7dce2e44276c4274c11a0a61121c83d9c43d6e0c..d7ac389e71902bc091a8800ea266190a43b3e63d 100644
> --- a/block/Makefile
> +++ b/block/Makefile
> @@ -36,3 +36,4 @@ obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= blk-crypto.o blk-crypto-profile.o \
>  					   blk-crypto-sysfs.o
>  obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK)	+= blk-crypto-fallback.o
>  obj-$(CONFIG_BLOCK_HOLDER_DEPRECATED)	+= holder.o
> +obj-$(CONFIG_BLK_NVMEM)                += blk-nvmem.o
> diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..a6e62fa98675ee9bcb9c7035a611b5a573ab9091
> --- /dev/null
> +++ b/block/blk-nvmem.c
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * block device NVMEM provider
> + *
> + * Copyright (c) 2024 Daniel Golle <daniel@makrotopia.org>
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Useful on devices using a partition on an eMMC for MAC addresses or
> + * Wi-Fi calibration EEPROM data.
> + */
> +
> +#include <linux/file.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/of.h>
> +#include <linux/pagemap.h>
> +#include <linux/property.h>
> +
> +#include "blk.h"
> +
> +static int blk_nvmem_reg_read(void *priv, unsigned int from,
> +			      void *val, size_t bytes)
> +{
> +	blk_mode_t mode = BLK_OPEN_READ | BLK_OPEN_RESTRICT_WRITES;
> +	dev_t devt = (dev_t)(uintptr_t)priv;
> +	size_t bytes_left = bytes;
> +	loff_t pos = from;
> +	int ret = 0;
> +
> +	struct file *bdev_file __free(fput) = bdev_file_open_by_dev(devt, mode, priv, NULL);
> +	if (IS_ERR(bdev_file))
> +		return PTR_ERR(bdev_file);
> +
> +	while (bytes_left) {
> +		pgoff_t f_index = pos >> PAGE_SHIFT;
> +		struct folio *folio;
> +		size_t folio_off;
> +		size_t to_read;
> +
> +		folio = read_mapping_folio(bdev_file->f_mapping, f_index, NULL);
> +		if (IS_ERR(folio)) {
> +			ret = PTR_ERR(folio);
> +			break;
> +		}
> +
> +		folio_off = offset_in_folio(folio, pos);
> +		to_read = min(bytes_left, folio_size(folio) - folio_off);
> +		memcpy_from_folio(val, folio, folio_off, to_read);
> +		pos += to_read;
> +		bytes_left -= to_read;
> +		val += to_read;
> +		folio_put(folio);
> +	}
> +
> +	return ret;
> +}
> +
> +static int blk_nvmem_register(struct device *dev)
> +{
> +	struct block_device *bdev = dev_to_bdev(dev);
> +	struct nvmem_config config = {};
> +
> +	/* skip devices which do not have a device tree node */
> +	if (!dev_of_node(dev))
> +		return 0;
> +
> +	/* skip devices without an nvmem layout defined */
> +	struct device_node *child __free(device_node) =
> +		of_get_child_by_name(dev_of_node(dev), "nvmem-layout");
> +	if (!child)
> +		return 0;
> +
> +	/*
> +	 * skip block device too large to be represented as NVMEM devices,
> +	 * the NVMEM reg_read callback uses an unsigned int offset
> +	 */
> +	if (bdev_nr_bytes(bdev) > UINT_MAX) {
> +		dev_warn(dev, "block device too large to be an NVMEM provider\n");
> +		return -ENODEV;

Wait, I must have suggested -ENODEV here on too little coffee. This callback
is called from device_add(), not when the device is bound so it's not the same
thing as returning -ENODEV from probe().

On the other hand, we don't want to not provide the block device just because
someone added a DT property on one that's too big. I'd say: warn, but return 0.
Does it make sense?

> +	}
> +
> +	config.id = NVMEM_DEVID_NONE;
> +	config.dev = dev;
> +	config.name = dev_name(dev);
> +	config.owner = THIS_MODULE;
> +	config.priv = (void *)(uintptr_t)dev->devt;
> +	config.reg_read = blk_nvmem_reg_read;
> +	config.size = bdev_nr_bytes(bdev);
> +	config.word_size = 1;
> +	config.stride = 1;
> +	config.read_only = true;
> +	config.root_only = true;
> +	config.ignore_wp = true;
> +	config.of_node = to_of_node(dev->fwnode);
> +
> +	return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &config));

And that was a wrong suggestion on my part too because I was under the
impression that we're in the probe() path, not device_add(). You can't use
devres here as the device at this point is not yet bound and may never be.

Which leads me to the second point: this is not the moment to add the nvmem
provider. This should happen at or after probe(). Once nvmem_register()
returns, you have a visible nvmem resource but nothing backing it in the block
layer.

Either do this in block core when registering a new device or schedule
a notifier here for the BUS_NOTIFY_BOUND_DRIVER event and do it in the notifier
callback.

Sorry, I should have paid more attention, I forgot how the class interface
works.

> +}
> +
> +static struct class_interface blk_nvmem_bus_interface __refdata = {
> +	.class = &block_class,
> +	.add_dev = &blk_nvmem_register,
> +};
> +
> +static int __init blk_nvmem_init(void)
> +{
> +	int ret;
> +
> +	ret = class_interface_register(&blk_nvmem_bus_interface);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +device_initcall(blk_nvmem_init);
>
> --
> 2.34.1
>
>

Bart

