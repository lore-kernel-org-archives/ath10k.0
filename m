Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17C7C531F9
	for <ath10k@archiver.kernel.org>; Fri, 24 Jul 2026 04:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pO6hUB0iIxD4TyXUYlqc7LrnsyhEtYUcjdZrQrosCo=; b=OV4mh5RzVkOyjrtzQxsNyTHyUK
	cShslNqCiRT3PFuNmbO1lh9fPhLMJXKGQ75vUbaTCDYzjgPWCWbbRzgnVNGH3J89sm6CKcwfgkkDG
	AWcDcUjd6ukolc+Z2yM2VSHG+r1VUNzWIflCEml8yLv1opUA/HjN1rAVjYLS3erebOFzSWP1Dzmfe
	5lEMm3MO2iDLX5WLucqW5ReUF3B+0ChUCsgPNZ+i2yYjGH9PnfWbRf0QuuSyzXXGiGgu2Ztug7c12
	J6TIr8jWtzedIQji7bGiVuBDG0qHxfjRK0a3/ERRCTI7RNOLmPBFB/aA/E0lwjr75bLZvlLrcQNqj
	uLEOHs+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn7yt-0000000FTxE-0EV4;
	Fri, 24 Jul 2026 04:57:55 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn7yp-0000000FTwy-42lv;
	Fri, 24 Jul 2026 04:57:51 +0000
Date: Thu, 23 Jul 2026 21:57:51 -0700
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
Subject: Re: [PATCH v8 5/9] block: implement NVMEM provider
Message-ID: <amLwz6WuHYUwKKJo@infradead.org>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
 <20260703-block-as-nvmem-v8-5-98ae32bfc49a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-block-as-nvmem-v8-5-98ae32bfc49a@oss.qualcomm.com>
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

On Fri, Jul 03, 2026 at 03:45:18PM +0200, Loic Poulain wrote:
> +	  Allow block devices (or partitions) to act as NVMEM providers,

Based on the code below I don't think you actually support partitions.

> +static int blk_nvmem_reg_read(void *priv, unsigned int from, void *val, size_t bytes)

Overly long line.

> +{
> +	dev_t devt = (dev_t)(uintptr_t)priv;
> +	size_t bytes_left = bytes;
> +	loff_t pos = from;
> +	int ret = 0;
> +
> +	struct file *bdev_file __free(fput) =
> +		bdev_file_open_by_dev(devt, BLK_OPEN_READ, NULL, NULL);

Please try to avoid all that magic autfree stuff that makes the code
impossible to read about.

> +	if (IS_ERR(bdev_file))
> +		return PTR_ERR(bdev_file);
> +
> +	while (bytes_left) {

.. and just use __kernel_read instead of badly reimplementing it.

> +	config.name = dev_name(dev);
> +	config.owner = THIS_MODULE;
> +	config.priv = (void *)(uintptr_t)dev->devt;

Why is this storing the dev_t and not the block device itself?

> +
> +		blk_nvmem_add(disk->part0);

Hmm, and you're always doing it for the whole device.  So the intefaces
really should be based on a gendisk, not a block_device.

Also once you register the whole devices as nvmem provider, we really
should keep it from being used a block device, shouldn't we?

