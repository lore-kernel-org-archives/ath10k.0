Return-Path: <SRS0=TZpM=PV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9939BC433F5
	for <ath10k@archiver.kernel.org>; Tue,  2 Nov 2021 22:08:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FEBA60E98
	for <ath10k@archiver.kernel.org>; Tue,  2 Nov 2021 22:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FEBA60E98
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kresin.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQQlmMTIR8zpeiwfOs+qjtLPtgKmCWTBqlcoL1HhvL0=; b=cSHTmmHTmnnXA1xPETCkb5JJi9
	dOAO0M6ff+/bAUJ9nGiUZc9cC1pzn/0S86TEfnIGfPNSQ34g+xx+lwbp1WKw1WIOlm3xNHh1DwCgT
	UilnrwRCZ76JKmzoixCCJV2v4aa8n86Wubon8q5qpBTW3scgWK05wQ+930ouYi8exbUufOVygFrJO
	1jDH2M5JdzZQUmaXVDoJklGWFf8v7k3Rytbr7Yv9lH6q61m1goWZsc5kPT/w2kNUBGYir5xSzIa7z
	LUOumeg0exXx+r3ZY1KXcksnOaAtAIM9Cae9IbwYq32O0FIm0AE7k8ZdnWeruET7W5a7Chd6Z3beO
	EQfWD5Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi1xb-0037YG-3H; Tue, 02 Nov 2021 22:08:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi1xY-0037Wp-GF
 for ath10k@lists.infradead.org; Tue, 02 Nov 2021 22:08:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id u1so613129wru.13
 for <ath10k@lists.infradead.org>; Tue, 02 Nov 2021 15:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kresin-me.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QQtsdMBTYCrx4ZIdrwpM406mJ59MqUemBaN1hkUC/SQ=;
 b=h9YP238PcOXtz7wky3z+3DTOyYTZQKzPCN3N5rN6iMGWmpLjFBznmW5wgRIS+2TjeQ
 wQ5PhXn+DvfpDYtJv2K/uuSP3Tv8Pq2ATyXDGohJxl4mSFtTY0LrzW7flJhSSHAn6NRY
 5TfHOQn5gFnsWo7Jlts1+IDVQMXHnS5XeUwKE8s3il7yzbYuWybDbf9W4zAMB22MBYct
 P+B4+iDUJV7sZ7izhB+3TCcnq63zyjih0gAgbcCjiq+SETdmD5g+mzDXhdA5259AtLLZ
 3KLhBJL3bljuqYlr93ryn1B/4kD7ZDfYC9Mm/FF9GkCSZqs8IlnivToAq0GXT3l8C/ZT
 /IBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QQtsdMBTYCrx4ZIdrwpM406mJ59MqUemBaN1hkUC/SQ=;
 b=Es5imHVEECV1CZKshKRxGlx0FnW6wruVpYdIivOlXLnkEiUw2Do4L0BE5qWqbD3JLc
 y9nt8IFtlTwf5CNHBMjogs2THjj+BrzIFVHJmH7vtcCKtIK3JaYWMt6RMhZseXDD8trK
 sKMxqoR+atTTVO3wxQttI/PKxjIaXjjqVna71Q3F4WaC8ctnzo92lHx2GuDVM7WlvyqB
 1podI1gCkXyxARSsbYb3jvVtvApybKxYKW+mth7abg2/4WyNhtsmA43R9VlRDSgUMKy5
 KN3DCRG6bsq7WwKwvFhI49H6RgebxM2fWOWeb6ObgGZv6E8wtBqACBRiFTOTsN6XSiZI
 5mtw==
X-Gm-Message-State: AOAM533BqEsJtTgf+C/0iy+yz/aPnT/RbsovB3f0oyc16syksFGR+CRV
 N4mzidCxYusryH4eUN2mMg4T2Q==
X-Google-Smtp-Source: ABdhPJxUvC2/L/kChoDWTaNu+8S1bSxZ9jfOV9n1fXrshS6RY3O71hlhviL+BXHtA7AQ41UCBSrEHA==
X-Received: by 2002:adf:f209:: with SMTP id p9mr47842973wro.191.1635890924929; 
 Tue, 02 Nov 2021 15:08:44 -0700 (PDT)
Received: from ?IPv6:2003:ec:2f1f:8200:b487:4c63:5540:3502?
 (p200300ec2f1f8200b4874c6355403502.dip0.t-ipconnect.de.
 [2003:ec:2f1f:8200:b487:4c63:5540:3502])
 by smtp.gmail.com with ESMTPSA id g3sm285760wri.45.2021.11.02.15.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 15:08:44 -0700 (PDT)
Subject: Re: [RFC net-next/wireless-next v1 2/2] ath10k: move
 device_get_mac_address() and pass errors up the chain
To: Christian Lamparter <chunkeey@gmail.com>, netdev@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Len Brown <lenb@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Michael Walle <michael@walle.cc>, Arnd Bergmann <arnd@arndb.de>
References: <20211030174111.1432663-1-chunkeey@gmail.com>
 <20211030174111.1432663-2-chunkeey@gmail.com>
From: Mathias Kresin <dev@kresin.me>
Message-ID: <2caec4e0-94f4-915c-60d1-c78e7bdc5364@kresin.me>
Date: Tue, 2 Nov 2021 23:08:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211030174111.1432663-2-chunkeey@gmail.com>
Content-Language: de-DE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_150848_600169_E9319DE3 
X-CRM114-Status: GOOD (  33.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hey Christian,

just a drive-by comment inline.

Mathias

10/30/21 7:41 PM, Christian Lamparter:
> device_get_mac_address() can now return -EPROBE_DEFER.
> This has to be passed back to the device subsystem so
> the driver will be probed again at a later time.
> 
> This was somewhat involved because the best place for this
> seemed in ath10k_core_create() right after allocation.
> Thing is that ath10k_core_create() was setup to either
> return a valid ath10k* instance, or NULL. So each ath10k
> implementation has to be modified to account for ERR_PTR.
> 
> This introduces a new side-effect: the returned error codes
> from ath10k_core_create() will now be passed along. It's no
> longer just -ENOMEM.
> 
> Note: If device_get_mac_address() didn't get a valid MAC from
> either the DT/ACPI, nvmem, etc... the driver will just generate
> random MAC (same as it did before).
> 
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---
> @Kalle from what I can tell, this is how nvmem-mac could be
> done with the existing device_get_mac_address() - at a
> different place. The reason for the move was that -EPROBE_DEFER
> needs to be returned by the pci/usb/snoc/ahb _probe functions().
> This wasn't possible in the old location. As ath10k deferres
> the "bring-up" process into a workqueue task which can't return
> any errors (it just printk/dev_err them at the end).
> Also, When I was asking around about this. The common consensus was
> to just post it and see. This is based on net-next + wireless-testing
> 
>   drivers/net/wireless/ath/ath10k/ahb.c  |  8 +++++---
>   drivers/net/wireless/ath/ath10k/core.c | 14 ++++++++------
>   drivers/net/wireless/ath/ath10k/pci.c  |  8 +++++---
>   drivers/net/wireless/ath/ath10k/sdio.c |  8 +++++---
>   drivers/net/wireless/ath/ath10k/snoc.c |  8 +++++---
>   drivers/net/wireless/ath/ath10k/usb.c  |  8 +++++---
>   6 files changed, 33 insertions(+), 21 deletions(-)
> 
>   
> 
> diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
> index ab8f77ae5e66..ad282a06b376 100644
> --- a/drivers/net/wireless/ath/ath10k/ahb.c
> +++ b/drivers/net/wireless/ath/ath10k/ahb.c
> @@ -745,9 +745,11 @@ static int ath10k_ahb_probe(struct platform_device *pdev)
>   	size = sizeof(*ar_pci) + sizeof(*ar_ahb);
>   	ar = ath10k_core_create(size, &pdev->dev, ATH10K_BUS_AHB,
>   				hw_rev, &ath10k_ahb_hif_ops);
> -	if (!ar) {
> -		dev_err(&pdev->dev, "failed to allocate core\n");
> -		return -ENOMEM;
> +	if (IS_ERR(ar)) {
> +		ret = PTR_ERR(ar);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "failed to allocate core: %d\n", ret);

There's a helper for that: dev_err_probe().

> +		return ret;
>   	}
>   
>   	ath10k_dbg(ar, ATH10K_DBG_BOOT, "ahb probe\n");
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 72a366aa9f60..85d2e8143101 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -3291,8 +3291,6 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
>   		ath10k_debug_print_board_info(ar);
>   	}
>   
> -	device_get_mac_address(ar->dev, ar->mac_addr);
> -
>   	ret = ath10k_core_init_firmware_features(ar);
>   	if (ret) {
>   		ath10k_err(ar, "fatal problem with firmware features: %d\n",
> @@ -3451,11 +3449,11 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
>   				  const struct ath10k_hif_ops *hif_ops)
>   {
>   	struct ath10k *ar;
> -	int ret;
> +	int ret = -ENOMEM;
>   
>   	ar = ath10k_mac_create(priv_size);
>   	if (!ar)
> -		return NULL;
> +		goto err_out;
>   
>   	ar->ath_common.priv = ar;
>   	ar->ath_common.hw = ar->hw;
> @@ -3464,6 +3462,10 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
>   	ar->hif.ops = hif_ops;
>   	ar->hif.bus = bus;
>   
> +	ret = device_get_mac_address(dev, ar->mac_addr);
> +	if (ret == -EPROBE_DEFER)
> +		goto err_free_mac;
> +
>   	switch (hw_rev) {
>   	case ATH10K_HW_QCA988X:
>   	case ATH10K_HW_QCA9887:
> @@ -3580,8 +3582,8 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
>   	destroy_workqueue(ar->workqueue);
>   err_free_mac:
>   	ath10k_mac_destroy(ar);
> -
> -	return NULL;
> +err_out:
> +	return ERR_PTR(ret);
>   }
>   EXPORT_SYMBOL(ath10k_core_create);
>   
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
> index 4d4e2f91e15c..f4736148a382 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -3602,9 +3602,11 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
>   
>   	ar = ath10k_core_create(sizeof(*ar_pci), &pdev->dev, ATH10K_BUS_PCI,
>   				hw_rev, &ath10k_pci_hif_ops);
> -	if (!ar) {
> -		dev_err(&pdev->dev, "failed to allocate core\n");
> -		return -ENOMEM;
> +	if (IS_ERR(ar)) {
> +		ret = PTR_ERR(ar);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "failed to allocate core: %d\n", ret);
> +		return ret;
>   	}
>   
>   	ath10k_dbg(ar, ATH10K_DBG_BOOT, "pci probe %04x:%04x %04x:%04x\n",
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index 63e1c2d783c5..87941e047d07 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -2526,9 +2526,11 @@ static int ath10k_sdio_probe(struct sdio_func *func,
>   
>   	ar = ath10k_core_create(sizeof(*ar_sdio), &func->dev, ATH10K_BUS_SDIO,
>   				hw_rev, &ath10k_sdio_hif_ops);
> -	if (!ar) {
> -		dev_err(&func->dev, "failed to allocate core\n");
> -		return -ENOMEM;
> +	if (IS_ERR(ar)) {
> +		ret = PTR_ERR(ar);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&func->dev, "failed to allocate core: %d\n", ret);
> +		return ret;
>   	}
>   
>   	netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_sdio_napi_poll,
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index 9513ab696fff..b9ac89e226a2 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1728,9 +1728,11 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
>   
>   	ar = ath10k_core_create(sizeof(*ar_snoc), dev, ATH10K_BUS_SNOC,
>   				drv_data->hw_rev, &ath10k_snoc_hif_ops);
> -	if (!ar) {
> -		dev_err(dev, "failed to allocate core\n");
> -		return -ENOMEM;
> +	if (IS_ERR(ar)) {
> +		ret = PTR_ERR(ar);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "failed to allocate core: %d\n", ret);
> +		return ret;
>   	}
>   
>   	ar_snoc = ath10k_snoc_priv(ar);
> diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
> index 3d98f19c6ec8..d6dc830a6fa8 100644
> --- a/drivers/net/wireless/ath/ath10k/usb.c
> +++ b/drivers/net/wireless/ath/ath10k/usb.c
> @@ -987,9 +987,11 @@ static int ath10k_usb_probe(struct usb_interface *interface,
>   
>   	ar = ath10k_core_create(sizeof(*ar_usb), &dev->dev, ATH10K_BUS_USB,
>   				hw_rev, &ath10k_usb_hif_ops);
> -	if (!ar) {
> -		dev_err(&dev->dev, "failed to allocate core\n");
> -		return -ENOMEM;
> +	if (IS_ERR(ar)) {
> +		ret = PTR_ERR(ar);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&dev->dev, "failed to allocate core: %d\n", ret);
> +		return ret;
>   	}
>   
>   	usb_get_dev(dev);
> 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
