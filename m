Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBCFC4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 09:35:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 027B760462
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 09:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 027B760462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6QBfRmlN0K1K5utPlPyg8gX0fgxritYbXlvjwTZeEw=; b=Q+mRb/Nfq/zvFX
	w0J/MEI59UYGbVdmpPEYLscj9sKRE1AG6l69q3Tms5hS8QS3nv/Zj5rcFOYd/sMguWVKWp0a5XFdj
	iZrbLEgtI2de25lhy8XgKiHhQBUq/37DWgInLU1NJVcswhyl24xXxWkSv87AfNptPJWE9kShC6Woi
	2BmRI/58VCZYJUuR+Kg4EQcR5tc/gdw2LSpZJzYANHL0eWEvl/zBme8lPoRHfnVzqx8nzyp4N7ydl
	Vz5+TELIt0PqY0tAvDXSrNRXdIhL1O/MB8y5XUK1CWILkpy/CJxNojAU/cjJiRzgN1tkzRu1JK4so
	/TvBorn0WbPJzrwZJb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGHxk-004w1e-EQ; Wed, 18 Aug 2021 09:34:21 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGHv3-004urz-SS
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 09:31:39 +0000
Received: by mail-lf1-x131.google.com with SMTP id i9so3247680lfg.10
 for <ath10k@lists.infradead.org>; Wed, 18 Aug 2021 02:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9wmQN792uFgFwDPkYKICfghT+PGaqiPbjvKiK6teih0=;
 b=J3ffQfSz815Sl/K2kVpavtqXUgSJMbtn45l+4vReQpa373AEvxxu60Wtzj9pA5pXnL
 qHzgSA5qXvtbXpJPbLkgZ1VWB5CrlI87UYCrXvuQHkitf2JT27wLHrZkrJvrbcnyuels
 dHrA/3gkXXMLard7viT9yVXv5qV9iZPXAFne66qnjV0mtSz8HMeDmUg6y9oBtDtucKHJ
 vpPdYPQ9OSBtIgTta7Hecmzhf+0/6iTZxBfNXuBleAnSZVC39D9ZsbeOh4Q6HBw8qsrf
 8g5IaE2yNRQ6sj4bQPjRAqM3hS8z7eM6BauqazauNEwiRG8y2dOAc/yM13vIG0whE8om
 uDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9wmQN792uFgFwDPkYKICfghT+PGaqiPbjvKiK6teih0=;
 b=fNC48d9OERk477BMlnaeiRi09nLHhKWtSVD+VQ9swSNHj2OYSWwxA3Jkb2EtRAU6jn
 lcyxAIt335h60FbJt6nAQUhJjCCUXZOjFgAMWLWWMqPv1NFhSrRvkLjI4vdAYL2c3nWB
 2MiE5Zudh2OFfAG0AWqWQF1hHx3zbM6kBk8GQ81ucM/ZNSQzfbLpNiYjA+fdoJkhD1Kd
 hvA1mExUm1m9IY9RXbrAbT4F//d7zD7JtiiggtfFA/3bjwuqqqz+TmdLY2VepM1V//15
 rP/jhjBjcNStcqiZ5gBXDw10krSdvWWsjlRuxpZgGHDn+E23K6pbNYJLaG4qboxeFlRi
 g9+w==
X-Gm-Message-State: AOAM530FxFxilVTq2jGlAGNnladfICopRui9HS4pfhpYbJlIGKGG58R6
 0eql9pQcdI557sv8e9V4F/SHfteMoU46hGSdhlc=
X-Google-Smtp-Source: ABdhPJyikDtMGvKyVnc45taFTfJj1oEPhPKdNlXutYXnPrZDkPCod8zxHsvhQuvl010X7S2A7Ny7lB+Yx5D9xnVNkmg=
X-Received: by 2002:ac2:4143:: with SMTP id c3mr3056876lfi.295.1629279090855; 
 Wed, 18 Aug 2021 02:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DEAMMKHwDkXxqWxg6uj_GQjBUQ5jV+4AzxAr2DCrgTVg@mail.gmail.com>
 <20210818051128.GA8550@lst.de>
In-Reply-To: <20210818051128.GA8550@lst.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Aug 2021 06:31:19 -0300
Message-ID: <CAOMZO5APotsBKPkN6tFDNnK0C7w7pzJ8zTWKUx6P=Rhd9_81mQ@mail.gmail.com>
Subject: Re: imx7: dev->coherent_dma_mask NULL warning
To: Christoph Hellwig <hch@lst.de>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, Bough Chen <haibo.chen@nxp.com>, 
 linux-mmc <linux-mmc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_023134_033381_E59CE059 
X-CRM114-Status: GOOD (  18.03  )
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

Hi Christoph,

On Wed, Aug 18, 2021 at 2:11 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Aug 17, 2021 at 09:23:26PM -0300, Fabio Estevam wrote:
> >
> > void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
> > ....
> > WARN_ON_ONCE(!dev->coherent_dma_mask);
> >
> > Where should the coherent_dma_mask be set to avoid this problem?
>
> Looking at the ath10k code ar->dev is set by ath10k_core_create, which
> has multiple callers.
>
> For ath10k_pci_probe it is a pci_dev, whoch should always have a
> dma_mask.
> For ath10k_ahb_probe is is a device tree probed platform_device,
> which should have a dma mask.
> For ath10k_sdio_probe it is a sdio_func, which from my understanding is
> a virtual device can't do DMA itself.
> For ath10k_snoc_probe it is a platform device wit an explicit
> dma_set_mask_and_coherent and above so the dma_mask is set.
> For ath10k_usb_probe it is an usb device which can't do USB
>
> So unless I misred the driver you're using the SDIO or USB variant,
> and those are not allowed to just call dma_* functions on their
> respective devices.

Correct, on i.MX7 the ath10k Wifi chip connects via SDIO.

Is there a way to avoid the WARN_ON_ONCE(!dev->coherent_dma_mask)
to happen in this case?

Thanks

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
