Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44731C55822
	for <ath10k@archiver.kernel.org>; Tue,  4 Aug 2026 16:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+phEtP839OmAXTAezANS2diupL0Drcp1+juhMBWBlYs=; b=n57XR6oziMwBreeOnlOjOeIoJe
	q4hS4TY8pg9ksfYPQQrNuxV1aL0fb1EzuN8s12R7y3ArS7QdVXcb/BlSEyum80etGb10vRFCpS4B4
	KzyI10ISQ/iptvs8qV0+c75H3AuJ8i+o9XBXHJTJrC/XEYpnjDN900+O2NPecnJJksHexLCmqBBe/
	hUF3UsGwdKdpg/YPrTM3rj/F4TnpVIhjxEf8aIXyHvgA9p7itM58puaXl5WHPi7iMgcwsg6GedgRI
	WspyyZuwSvqttH3O3/xYvwmA4ms7h7dz7+LM14iDjj6KCdfZXLeLWU5fhlKPI2tUpwGDNg5abn1LM
	GGs5+KSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrI7R-00000002LWb-17L2;
	Tue, 04 Aug 2026 16:35:57 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrI7Q-00000002LWG-0afw;
	Tue, 04 Aug 2026 16:35:56 +0000
Date: Tue, 4 Aug 2026 09:35:56 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	daniel@makrotopia.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v9 06/10] block: implement NVMEM provider
Message-ID: <anIU7FSBT6VMzsf3@infradead.org>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
 <20260730-block-as-nvmem-v9-6-f72935817dbf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-block-as-nvmem-v9-6-f72935817dbf@oss.qualcomm.com>
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

On Thu, Jul 30, 2026 at 06:00:36PM +0200, Loic Poulain wrote:
> On embedded devices using an eMMC it is common that one or more partitions
> on the eMMC are used to store MAC addresses and Wi-Fi calibration EEPROM
> data. Allow referencing the partition in device tree for the kernel and
> Wi-Fi drivers accessing it via the NVMEM layer.
> 
> NVMEM is registered for a block device whose OF node describes an NVMEM
> layout, either via an "nvmem-layout" child or by being a "fixed-layout"
> node itself (e.g. an eMMC boot partition associated through its mmc-card
> node).
> 
> The NVMEM device is a read-only side channel: the block device stays
> fully usable, reads are performed with a non-exclusive BLK_OPEN_READ
> open, and no synchronization is done against concurrent writes to the
> same region. This is acceptable for the intended use case of write-once,
> factory-provisioned data.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  block/Kconfig             |  11 +++++
>  block/Makefile            |   1 +
>  block/blk-nvmem.c         | 104 ++++++++++++++++++++++++++++++++++++++++++++++
>  block/blk.h               |   8 ++++
>  block/genhd.c             |   4 ++
>  block/partitions/core.c   |   5 +++
>  include/linux/blk_types.h |   4 ++
>  7 files changed, 137 insertions(+)
> 
> diff --git a/block/Kconfig b/block/Kconfig
> index 70e4a66d941ff66ecb0ec34f4f7eff7fd1e4be40..4899ad572c71ffdbb62460d57623216254893ddc 100644
> --- a/block/Kconfig
> +++ b/block/Kconfig
> @@ -209,6 +209,17 @@ config BLK_INLINE_ENCRYPTION_FALLBACK
>  	  by falling back to the kernel crypto API when inline
>  	  encryption hardware is not present.
>  
> +config BLK_NVMEM
> +	bool "Block device NVMEM provider"
> +	depends on OF
> +	depends on NVMEM
> +	help
> +	  Allow block devices (or partitions) to act as NVMEM providers,
> +	  exposing factory-provisioned data such as MAC addresses or Wi-Fi
> +	  calibration blobs to the drivers that consume them. This is
> +	  typically used on embedded devices where such data is stored in a
> +	  dedicated area of an eMMC, instead of a separate EEPROM or OTP.
> +
>  source "block/partitions/Kconfig"
>  
>  config BLK_PM
> diff --git a/block/Makefile b/block/Makefile
> index e7bd320e3d6971a8abf584f5de42776bb54e8216..8200297fbcbab304beb4239d0c33da07011c3ed9 100644
> --- a/block/Makefile
> +++ b/block/Makefile
> @@ -39,3 +39,4 @@ obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= blk-crypto.o blk-crypto-profile.o \
>  					   blk-crypto-sysfs.o
>  obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK)	+= blk-crypto-fallback.o
>  obj-$(CONFIG_BLOCK_HOLDER_DEPRECATED)	+= holder.o
> +obj-$(CONFIG_BLK_NVMEM)                += blk-nvmem.o
> diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..05bc35b9b8f373ccb606bdca35d211c41d2764fe
> --- /dev/null
> +++ b/block/blk-nvmem.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * block device NVMEM provider
> + *
> + * Copyright (c) 2024 Daniel Golle <daniel@makrotopia.org>
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Useful on devices using a whole disk or a partition (e.g. an eMMC boot
> + * partition) to store MAC addresses, Bluetooth addresses or Wi-Fi
> + * calibration EEPROM data.
> + *
> + * The NVMEM device is a side channel onto a block device that stays fully
> + * usable. This is somewhat mitigated by opening the device exclusively.
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/file.h>
> +#include <linux/fs.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/of.h>
> +#include <linux/property.h>
> +
> +#include "blk.h"
> +
> +static int blk_nvmem_reg_read(void *priv, unsigned int from,
> +			      void *val, size_t bytes)
> +{
> +	struct block_device *bdev = priv;
> +	struct file *bdev_file;
> +	loff_t pos = from;
> +	ssize_t ret;
> +
> +	/* open and prevent other exclusive openers */
> +	bdev_file = bdev_file_open_by_dev(bdev->bd_dev,
> +					  BLK_OPEN_READ | BLK_OPEN_EXCL,
> +					  blk_nvmem_reg_read, NULL);
> +	if (IS_ERR(bdev_file))
> +		return PTR_ERR(bdev_file);
> +
> +	ret = kernel_read(bdev_file, val, bytes, &pos);
> +	if (ret >= 0 && ret != bytes)
> +		ret = -EIO;
> +
> +	fput(bdev_file);
> +
> +	return ret < 0 ? ret : 0;

The error handling here is a bit weird as you seem to handle the
positive/negative values twice.  What about something like this instead?

	bdev_file = bdev_file_open_by_dev(bdev->bd_dev,
					  BLK_OPEN_READ | BLK_OPEN_EXCL,
					  blk_nvmem_reg_read, NULL);
	if (IS_ERR(bdev_file))
		return PTR_ERR(bdev_file);
	ret = kernel_read(bdev_file, val, bytes, &pos);
	fput(bdev_file);

	if (ret < 0)
		return ret;
	if (ret != bytes)
		return -EIO;
	return 0;

?

> +	struct device_node *child __free(device_node) =
> +			of_get_child_by_name(np, "nvmem-layout");

Please avoid the __cleanups stuff as it doesn't interact well with
the goto basd cleanups usually used in block drivers.

> +	config.id = NVMEM_DEVID_NONE;
> +	config.dev = dev;
> +	config.name = dev_name(dev);
> +	config.owner = THIS_MODULE;
> +	config.priv = bdev;
> +	config.reg_read = blk_nvmem_reg_read;
> +	config.size = bdev_nr_bytes(bdev);
> +	config.word_size = 1;
> +	config.stride = 1;
> +	config.read_only = true;
> +	config.root_only = true;
> +	config.ignore_wp = true;
> +	config.of_node = np;

Maybe initialize all the static information at declaration time
here?

> +	bdev->bd_nvmem = nvmem;

What guards access to this pointer?


