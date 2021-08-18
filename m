Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2AFC4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 05:12:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2798B606A5
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 05:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2798B606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RtkknBZfqIoeE/ZLzDYz889TfB9SZl95oZ+SOC9928=; b=mYqcqBkfUfSnRz
	MbDrMOXhwwyPUbTEx9ljzouNyaw0aKz3ElFaSWxTvRwMNsBYk4xC2kU8EthUv+bJEIRotdj1hhhm+
	O1/qS2OH36TwgbGwwtKATz7GMISLTzecih+yrTpadz44dqJuWUhjhMCXHN8NGDdXUrasKVZGxpztb
	8xynSVqJHFRW+unx1ayMCi/haxgKgOOiQQn4HWRWmSHpwM3+G3qElTu8dVvRAaERjKsdEOtStHvNN
	Y6FmevkcNsTvg/T31Lvwl6LC77WTek1vcacTG+2pAH0zCr7s+orYFE/XAlVTwliQQfBC8/amwpU57
	ww02S5/hLEUwf2hxMdNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGDrT-004DRs-SU; Wed, 18 Aug 2021 05:11:35 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGDrQ-004DRD-8r
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 05:11:33 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 847C467357; Wed, 18 Aug 2021 07:11:28 +0200 (CEST)
Date: Wed, 18 Aug 2021 07:11:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Bough Chen <haibo.chen@nxp.com>,
 linux-mmc <linux-mmc@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: imx7: dev->coherent_dma_mask NULL warning
Message-ID: <20210818051128.GA8550@lst.de>
References: <CAOMZO5DEAMMKHwDkXxqWxg6uj_GQjBUQ5jV+4AzxAr2DCrgTVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5DEAMMKHwDkXxqWxg6uj_GQjBUQ5jV+4AzxAr2DCrgTVg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_221132_502456_7A30F408 
X-CRM114-Status: GOOD (  12.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Tue, Aug 17, 2021 at 09:23:26PM -0300, Fabio Estevam wrote:
> 
> void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
> ....
> WARN_ON_ONCE(!dev->coherent_dma_mask);
> 
> Where should the coherent_dma_mask be set to avoid this problem?

Looking at the ath10k code ar->dev is set by ath10k_core_create, which
has multiple callers.

For ath10k_pci_probe it is a pci_dev, whoch should always have a
dma_mask.
For ath10k_ahb_probe is is a device tree probed platform_device,
which should have a dma mask.
For ath10k_sdio_probe it is a sdio_func, which from my understanding is
a virtual device can't do DMA itself.
For ath10k_snoc_probe it is a platform device wit an explicit
dma_set_mask_and_coherent and above so the dma_mask is set.
For ath10k_usb_probe it is an usb device which can't do USB

So unless I misred the driver you're using the SDIO or USB variant,
and those are not allowed to just call dma_* functions on their
respective devices.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
