Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94CF1C4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 16:49:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5109E610E5
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 16:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5109E610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:Date:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIOnzg9UEYhhrPXPwpKh8AURwbepNwqzH2IRL+kUtuE=; b=SF1IUSmjMbbj5L
	8UvDWrp9In8eu6qVsH/3BmEHPB8Jyy61I3sOJXwbKHfluPGy7lA+HYQGAASX/CViyH8f5YT6m85zw
	tFyunp8n7v1eNzEe9H0l7groYZ+c709ltvhKCnlhqDRCwnLhl/0gY80VEfvKkc4Xv7RY3HZUU6X54
	P11OtqjwiT6RlykizRBvjwAWDrcaMaFeCkFgcVOLa8EDqztI4ZVrh95fHIP53p4A4h6DlbzJX7mbn
	DnBi81rzjTflJlnL2L+8yqoLRbicV9orqy1N+mSF3DRDqYceuIwc3cz3gEVNnHCilTHe2puAFwwCt
	TrUqumlCOK3h2jTqYSPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGOjo-006Dgk-DY; Wed, 18 Aug 2021 16:48:24 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGOjl-006DfJ-Gv
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 16:48:23 +0000
Received: by mail-ed1-x52d.google.com with SMTP id dj8so4144029edb.2
 for <ath10k@lists.infradead.org>; Wed, 18 Aug 2021 09:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:date:message-id:in-reply-to:references:user-agent
 :subject:mime-version:content-transfer-encoding;
 bh=PMmul5AuLaq0ahSS50MkhxtuWSpwgbvmyQEcQtwJKMk=;
 b=K2+oKL6I3fi3XD7tqlWiPFza5KgDzTWjf+Aw5RyxHKg6MOltRiZWuH4XCA5Oj+GO5r
 4nw4CoDLbNFu33b4LfNMcKQudKFkFt/yRg9rVhjdtWM/tu9oyGFPlZ2l4791qt22vdPy
 kGnlSTi/qwFLrLKZyvZAfiXgywgmZslTovrR4LJb2b02Wqq6zUo8+0ohIEPPNFBB1c5J
 W01Hq3xXxfjt5qkpZ+V7P6Et0OQbMP/FTjKhyM8fEEMNqtxKQGF6ekB5AFxmrl+80LEf
 ajW+5MNrtFna+LF9np4bx0/m5XMNFpwIpwjIhT1MWc/FzZ7y5ZzxBgumCjwLLbQujNr+
 3TAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:subject:mime-version
 :content-transfer-encoding;
 bh=PMmul5AuLaq0ahSS50MkhxtuWSpwgbvmyQEcQtwJKMk=;
 b=o46bi5rHka3WiseutZfa+9uJwOCJ3yYHYq4gDekkbLwlZNzI7ahHs4Iwz9fJ5G0fZS
 TD1h15HwlOBENGv/e6+gC4UcqRTXjv1s0chU1sTqXJQcTf65k7jO+mfnQtRquUSUUYOQ
 8ak/vZERQob5WRUJWjTYY9S3VNKhdicOyvxQu7GmVneqC04ednniTpADLebc+fd+oSnU
 yR5Q7LyJUfLS2HLSlkWeMw2maxpZvToVTYIPNIYOG02eE0pGeaJtYkPg48DPtRNcoekB
 3MSVzy0hpJBAr+LFfhjja409kewnvQtpOPA/UHBjtXpXh+0UJ9ZbtAqQ5Pur6cgDabo4
 LOUQ==
X-Gm-Message-State: AOAM533VbuAAU5ybcSXxYgFeVvV2z156ALPFpncXkxguHQw26GJprBgv
 Zzo4c+qRlG1CYgWLFRdfx0c=
X-Google-Smtp-Source: ABdhPJx5EvocEVtIHmFZY0f87MFyGTVp6LOz6J4uNhbKGV70JP4eKAcKZROhbqdLClnqOF/BHMnbQw==
X-Received: by 2002:aa7:c815:: with SMTP id a21mr11234196edt.274.1629305299271; 
 Wed, 18 Aug 2021 09:48:19 -0700 (PDT)
Received: from [192.168.178.38] (f140230.upc-f.chello.nl. [80.56.140.230])
 by smtp.gmail.com with ESMTPSA id 8sm120683ejz.88.2021.08.18.09.48.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Aug 2021 09:48:18 -0700 (PDT)
From: Arend van Spriel <aspriel@gmail.com>
To: Fabio Estevam <festevam@denx.de>, <kvalo@codeaurora.org>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <hch@lst.de>, <erik.stromdahl@gmail.com>
Date: Wed, 18 Aug 2021 18:48:15 +0200
Message-ID: <17b5a29d098.279b.9696ff82abe5fb6502268bdc3b0467d4@gmail.com>
In-Reply-To: <20210818150943.1630199-1-festevam@denx.de>
References: <20210818150943.1630199-1-festevam@denx.de>
User-Agent: AquaMail/1.30.1-1828 (build: 103001000)
Subject: Re: [PATCH] ath10k: Do not call dma_alloc_coherent() for SDIO and USB
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_094821_628835_2BC8943D 
X-CRM114-Status: GOOD (  27.54  )
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

On August 18, 2021 5:11:10 PM Fabio Estevam <festevam@denx.de> wrote:

> When running the "hostapd" application on a i.MX7-based board with
> an ath10k device connected via SDIO, the following warning is seen:
>
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 489 at kernel/dma/mapping.c:427 dma_alloc_attrs+0xd0/0x114
> Modules linked in: ath10k_sdio ath10k_core ath
> CPU: 0 PID: 489 Comm: hostapd Not tainted 5.10.48-stable-standard #1
> Hardware name: Freescale i.MX7 Dual (Device Tree)
> [<c0111378>] (unwind_backtrace) from [<c010bc04>] (show_stack+0x10/0x14)
> [<c010bc04>] (show_stack) from [<c0e26094>] (dump_stack+0xdc/0x104)
> [<c0e26094>] (dump_stack) from [<c0125574>] (__warn+0xd8/0x114)
> [<c0125574>] (__warn) from [<c0e20ecc>] (warn_slowpath_fmt+0x60/0xbc)
> [<c0e20ecc>] (warn_slowpath_fmt) from [<c01b9eac>] (dma_alloc_attrs+0xd0/0x114)
> [<c01b9eac>] (dma_alloc_attrs) from [<bf01373c>] 
> (ath10k_add_interface+0x2f0/0x1094 [ath10k_core])
> [<bf01373c>] (ath10k_add_interface [ath10k_core]) from [<c0d94470>] 
> (drv_add_interface+0x88/0x2fc)
>
> As explained by Christoph Hellwig:
>
> "Looking at the ath10k code ar->dev is set by ath10k_core_create, which
> has multiple callers.
>
> For ath10k_pci_probe it is a pci_dev, which should always have a
> dma_mask.
>
> For ath10k_ahb_probe is a device tree probed platform_device,
> which should have a dma mask.
>
> For ath10k_sdio_probe it is a sdio_func, which from my understanding is
> a virtual device can't do DMA itself.
>
> For ath10k_snoc_probe it is a platform device with an explicit
> dma_set_mask_and_coherent and above so the dma_mask is set.
>
> For ath10k_usb_probe it is an usb device which can't do USB."
>
> Fix the problem by not calling dma_alloc_coherent() when the device
> is not DMA capable, such as SDIO and USB.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Hi,
>
> I am not certain about the proper commit to include in the Fixes tag.
>
> Any suggestions?
>
> Thanks
>
> drivers/net/wireless/ath/ath10k/mac.c | 20 +++++++++++---------
> 1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c 
> b/drivers/net/wireless/ath/ath10k/mac.c
> index c272b290fa73..e85c3f107d2e 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -5576,15 +5576,17 @@ static int ath10k_add_interface(struct ieee80211_hw 
> *hw,
>  if (vif->type == NL80211_IFTYPE_ADHOC ||
>     vif->type == NL80211_IFTYPE_MESH_POINT ||
>     vif->type == NL80211_IFTYPE_AP) {
> - arvif->beacon_buf = dma_alloc_coherent(ar->dev,
> -       IEEE80211_MAX_FRAME_LEN,
> -       &arvif->beacon_paddr,
> -       GFP_ATOMIC);
> - if (!arvif->beacon_buf) {
> - ret = -ENOMEM;
> - ath10k_warn(ar, "failed to allocate beacon buffer: %d\n",
> -    ret);
> - goto err;
> + if (!(ar->hif.bus == ATH10K_BUS_SDIO) && !(ar->hif.bus == ATH10K_BUS_USB)) {

Does this mean you can not really setup a beaconing interface type for SDIO 
and USB?

Regards,
Arend



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
