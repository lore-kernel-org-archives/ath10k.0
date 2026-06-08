Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F892CD8C9F
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 11:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JS7UICwqoceyTJ7x6+zt9hPHx1tUVGLh3IUeEbiEO/E=; b=fI6RxLS1fYFtcmZM9XEtadLKDF
	WYeEy/9RUOty+3c8aD206jMg7deGQjsjF1RJTR7rVClgJC/WI7MFo+3Ycm18HdBz5TQ+hpIcKjlRM
	AaYKyuz1nuvd4mDcEgc6uQBosiw3zAABu7hb8erSUC0yL9dI7l8ZKc3q4IJDd9kXqKNDdIqOyD7Ae
	JVwrAD4yjFhme64h4tUJEXwWxWoycGFEjvzqzCQ4mY+DRHrFsgouequ8onmqvFcBiRdn9t+tVale3
	18j41nH9hG8YPQQec+hCQgORlfdCbhw/o1BQnPJQn5AmcVY6tYE1yqR384XcZBtCoHsHx4czXYEIc
	JFiz56XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXyg-00000003PJ1-3kGi;
	Mon, 08 Jun 2026 11:17:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXyf-00000003PId-1yC5
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 11:17:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F15C04395D
	for <ath10k@lists.infradead.org>; Mon,  8 Jun 2026 11:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31A91F00898
	for <ath10k@lists.infradead.org>; Mon,  8 Jun 2026 11:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780917428;
	bh=JS7UICwqoceyTJ7x6+zt9hPHx1tUVGLh3IUeEbiEO/E=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Ndm6peKp0/oM2vQjaiN4z/ae9Z2txjjt10yQm79ZbJT5ms2qoGhDxmxafiP5M2rpw
	 /AsebPD1vQxWFqGDEeGFobqVh1lVwVoHSeSxzGbEAaO/ulhT33tjJXMNlizJ9k0eO5
	 UZQc8nl/GHD/qnIhLtfI91bqU83GgzBmkpwEB3ayW9tTgyw01TewL9m1GUhKz+vwjA
	 9c3jkFTBwCfb4rbRJ/h5/xy4IQcJifXPgw53yOFZJPQUIcWXxrV0HXnGGej9pwrTMU
	 79/KHf0mqKq9TaAHevgwxVwbxdns/J0FqxuZhaplgFC9H/3PMOEcjVCi1eK0IviuPF
	 N2eVTXKJHhZkA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa68e66128so4223392e87.2
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 04:17:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9kXEYgDMxsyg0bYCYpwT3EW6INePcm8sLFPxUL9si9wYoTJxeYZWJip2HoB4URm6g2TOw6HLo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpC6XWo+4KDLLXN/6XVuH8mtysbZSNAG2Y4ffjp3WcEExZldG5
	dHU3DPZA/2zB817U0kxQZu1xw2CiBsmVPQ4+HT9YlHmyFk2H8w3cPY6pCpRI52BApcBKSdOXdqB
	AKksUxmAyU0l/Z2lHN54IuP/JSqBXR1IV50gMbYZV1Q==
X-Received: by 2002:a05:6512:1114:b0:5a8:8222:7fc9 with SMTP id
 2adb3069b0e04-5aa87ba35c2mr3672220e87.13.1780917427508; Mon, 08 Jun 2026
 04:17:07 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:17:05 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:17:05 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260608-block-as-nvmem-v3-4-82681f50aa35@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com> <20260608-block-as-nvmem-v3-4-82681f50aa35@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 04:17:05 -0700
X-Gmail-Original-Message-ID: <CAMRc=McmoWvezeH05_5AR7ZbAyg1L567HsKWbuD7711LwnjV0Q@mail.gmail.com>
X-Gm-Features: AVVi8Cesm3odc32Z-SPOxn8Wmr5vbPlz43scUvzgQJv_WkuDGH2g_rYPFhE9BsE
Message-ID: <CAMRc=McmoWvezeH05_5AR7ZbAyg1L567HsKWbuD7711LwnjV0Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] block: implement NVMEM provider
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

On Mon, 8 Jun 2026 12:50:41 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> From: Daniel Golle <daniel@makrotopia.org>
>
> On embedded devices using an eMMC it is common that one or more partitions
> on the eMMC are used to store MAC addresses and Wi-Fi calibration EEPROM
> data. Allow referencing the partition in device tree for the kernel and
> Wi-Fi drivers accessing it via the NVMEM layer.
>
> To safely defer the freeing of the provider private data until all
> consumers have released their cells, a nvmem_dev() accessor is added to
> the NVMEM core to expose the struct device embedded in struct nvmem_device.
> This allows registering a devm action on the nvmem device itself, ensuring
> the private data outlives any active cell references.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  block/Kconfig                  |   9 +++
>  block/Makefile                 |   1 +
>  block/blk-nvmem.c              | 171 +++++++++++++++++++++++++++++++++++++++++
>  drivers/nvmem/core.c           |  13 ++++
>  include/linux/nvmem-consumer.h |   6 ++
>  5 files changed, 200 insertions(+)
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
> index 0000000000000000000000000000000000000000..99c7728fb7bccdc2216780a73a89a9210f925049
> --- /dev/null
> +++ b/block/blk-nvmem.c
> @@ -0,0 +1,171 @@
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
> +#include <linux/cleanup.h>
> +#include <linux/mutex.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/of.h>
> +#include <linux/pagemap.h>
> +#include <linux/property.h>
> +
> +#include "blk.h"
> +
> +

Stray newline?

> +/* List of all NVMEM devices */
> +static LIST_HEAD(nvmem_devices);
> +static DEFINE_MUTEX(devices_mutex);
> +
> +struct blk_nvmem {
> +	struct nvmem_device	*nvmem;
> +	dev_t			devt;
> +	struct list_head	list;
> +};
> +
> +static int blk_nvmem_reg_read(void *priv, unsigned int from,
> +			      void *val, size_t bytes)
> +{
> +	blk_mode_t mode = BLK_OPEN_READ | BLK_OPEN_RESTRICT_WRITES;
> +	struct blk_nvmem *bnv = priv;
> +	size_t bytes_left = bytes;
> +	struct file *bdev_file;
> +	loff_t pos = from;
> +	int ret = 0;
> +
> +	bdev_file = bdev_file_open_by_dev(bnv->devt, mode, priv, NULL);
> +	if (!bdev_file)
> +		return -ENODEV;
> +
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
> +			goto err_release_bdev;
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
> +err_release_bdev:
> +	fput(bdev_file);

There's a __free() action defined in linux/file.h so you can use:

	struct file *bdev_file __free(fput) = ...

and avoid this label.

> +
> +	return ret;
> +}
> +
> +static int blk_nvmem_register(struct device *dev)
> +{
> +	struct device_node *child, *np = dev_of_node(dev);
> +	struct block_device *bdev = dev_to_bdev(dev);
> +	struct nvmem_config config = {};
> +	struct blk_nvmem *bnv;
> +
> +	/* skip devices which do not have a device tree node */
> +	if (!np)
> +		return 0;
> +
> +	/* skip devices without an nvmem layout defined */
> +	child = of_get_child_by_name(np, "nvmem-layout");
> +	if (!child)
> +		return 0;
> +	of_node_put(child);

Same as above, can be:

	struct device_node *child __free(device_node) == ...

> +
> +	/*
> +	 * skip block device too large to be represented as NVMEM devices,
> +	 * the NVMEM reg_read callback uses an unsigned int offset
> +	 */
> +	if (bdev_nr_bytes(bdev) > UINT_MAX)
> +		return -EFBIG;

This will mean a failed probe. Wouldn't it be better to use -ENODEV?

> +
> +	bnv = kzalloc_obj(*bnv);
> +	if (!bnv)
> +		return -ENOMEM;
> +
> +	config.id = NVMEM_DEVID_NONE;
> +	config.dev = &bdev->bd_device;
> +	config.name = dev_name(&bdev->bd_device);
> +	config.owner = THIS_MODULE;
> +	config.priv = bnv;
> +	config.reg_read = blk_nvmem_reg_read;
> +	config.size = bdev_nr_bytes(bdev);
> +	config.word_size = 1;
> +	config.stride = 1;
> +	config.read_only = true;
> +	config.root_only = true;
> +	config.ignore_wp = true;
> +	config.of_node = to_of_node(dev->fwnode);
> +
> +	bnv->devt = bdev->bd_device.devt;
> +	bnv->nvmem = nvmem_register(&config);
> +	if (IS_ERR(bnv->nvmem)) {
> +		dev_err_probe(&bdev->bd_device, PTR_ERR(bnv->nvmem),
> +			      "Failed to register NVMEM device\n");
> +		kfree(bnv);
> +		return PTR_ERR(bnv->nvmem);
> +	}
> +
> +	scoped_guard(mutex, &devices_mutex)
> +		list_add_tail(&bnv->list, &nvmem_devices);

I'm not sure I understand the need to store these? Whatever you need to do in
remove() can be scheduled in a devres action here.

> +
> +	return 0;
> +}
> +
> +static void blk_nvmem_unregister(struct device *dev)
> +{
> +	struct blk_nvmem *bnv_c, *bnv_t, *bnv = NULL;
> +
> +	scoped_guard(mutex, &devices_mutex) {
> +		list_for_each_entry_safe(bnv_c, bnv_t, &nvmem_devices, list) {
> +			if (bnv_c->devt == dev_to_bdev(dev)->bd_device.devt) {
> +				bnv = bnv_c;
> +				list_del(&bnv->list);
> +				break;
> +			}
> +		}
> +
> +		if (!bnv)
> +			return;
> +	}
> +
> +	nvmem_unregister(bnv->nvmem);
> +	kfree(bnv);
> +}
> +
> +static struct class_interface blk_nvmem_bus_interface __refdata = {
> +	.class = &block_class,
> +	.add_dev = &blk_nvmem_register,
> +	.remove_dev = &blk_nvmem_unregister,
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
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 311cb2e5a5c02d2c6979d7c9bbb7f94abdfbdad1..ee3481229c20b3063c86d0dd66aabbf6b5e29169 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -2154,6 +2154,19 @@ const char *nvmem_dev_name(struct nvmem_device *nvmem)
>  }
>  EXPORT_SYMBOL_GPL(nvmem_dev_name);
>
> +/**
> + * nvmem_dev() - Get the struct device of a given nvmem device.
> + *
> + * @nvmem: nvmem device.
> + *
> + * Return: pointer to the struct device of the nvmem device.
> + */
> +struct device *nvmem_dev(struct nvmem_device *nvmem)
> +{
> +	return &nvmem->dev;
> +}
> +EXPORT_SYMBOL_GPL(nvmem_dev);

This should still be a separate patch.

> +
>  /**
>   * nvmem_dev_size() - Get the size of a given nvmem device.
>   *
> diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
> index 34c0e58dfa26636d2804fcc7e0bc4a875ee73dae..ce387c89dc8e4bc1241f3b6f36be8c6c95e282ed 100644
> --- a/include/linux/nvmem-consumer.h
> +++ b/include/linux/nvmem-consumer.h
> @@ -82,6 +82,7 @@ int nvmem_device_cell_write(struct nvmem_device *nvmem,
>
>  const char *nvmem_dev_name(struct nvmem_device *nvmem);
>  size_t nvmem_dev_size(struct nvmem_device *nvmem);
> +struct device *nvmem_dev(struct nvmem_device *nvmem);
>
>  void nvmem_add_cell_lookups(struct nvmem_cell_lookup *entries,
>  			    size_t nentries);
> @@ -220,6 +221,11 @@ static inline const char *nvmem_dev_name(struct nvmem_device *nvmem)
>  	return NULL;
>  }
>
> +static inline struct device *nvmem_dev(struct nvmem_device *nvmem)
> +{
> +	return NULL;
> +}
> +
>  static inline void
>  nvmem_add_cell_lookups(struct nvmem_cell_lookup *entries, size_t nentries) {}
>  static inline void
>
> --
> 2.34.1
>
>

Bart

