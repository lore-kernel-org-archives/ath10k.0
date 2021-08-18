Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68FBC4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 21:09:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80FFF610A3
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 21:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80FFF610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYH2AETEIddO/xMM+8n0ZcYgDLpG2ysJiq75qJr4zU8=; b=uVjkqK8NSGWLJu
	+gu0H7SZ+zEbV0Wjo15S4cJJKfGNYs58fpLMuUonMKVixcSnvs+s7uFIrkiuCgyOiINuCBgd3ry5u
	IAUuhEiJgiYPjxzAPfO7ZMjX1h0NnEyYzSqo8eXROdOE7i5SXKXz9EBATbOLAyno4S0xEbubrCAgy
	5wP+oveUW+TROLlNeVFtCB9jpXM3jIO4twjukj1dwX5AxVcBiRjjNMmdnAFi4D2TCwIucJQryfXTj
	S9WdgEk51KT1wClpnV8WPXvbf8K1P4VACY0fjIKFXjs8WX6xIe9uDJ29FHiUIsQm5Slv2Td48MWen
	kAM/YIl+yxZ74qoy2dbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGSoG-006g6j-Uc; Wed, 18 Aug 2021 21:09:16 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGSoD-006g61-Lh
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 21:09:15 +0000
Received: by mail-lf1-x135.google.com with SMTP id d4so7519323lfk.9
 for <ath10k@lists.infradead.org>; Wed, 18 Aug 2021 14:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qjXrcIOgVKk1mPzvCDdPM89T7IRAJPhj3erq4tB0vv8=;
 b=IAGuXZNBtJmAbMdUhqC7E8KnSq78nSFb7TeRpra2h/nIwoCi4li37yOLsIAfpFhzAG
 ElR1A1zxGPsnh/weuzxoVwIypaI7o9SkS4eLUn+znPLeUpI4k8lbZLzKsuWg6XaaTnNE
 nKVr0yMeh/s+mxNcJL5VifZx0Z388DvO8d8aEgUVVRXGJzl/XGm13d4/cRLKe5KP7Ynz
 7hjo0dTJg4VdEEOyITpL5jeFeUVLpbz0UaJM8aYEoGfizl2uWC9+/A4x3TQOKdOrpy2c
 DU7JBmblBuEaxYxvrZdpmFB/EuyrFDuASnYqGIhhHvhNJVy2dVPthUGp7peZi4L9J3bn
 TqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qjXrcIOgVKk1mPzvCDdPM89T7IRAJPhj3erq4tB0vv8=;
 b=XVWG0aj1XzkKK4kaANsPmM7ZfLssqdzY7hJf4ugIJwcn6WqdgdS+VPMMzycielo9fc
 0jclPDDeTl4wxhC6HWVxLdy72JEgZlTF6uyFuTJWzzuFSMm5wgWFVpUaRKSyXQWjNEW2
 T6TC84ZtkH16XaUijch7SEDlrqkgg8TmUd+pRrFHNeVbTEa2TWXqHU7ubaQUJLslFFOX
 u5JF2paW4LIogOaMzxnctRuJK9KZonvGPJyiFU59L6d/lShxxakO7HMW3lFDGO6EkKOy
 PTeeVYA20DBx+dUdpkX86fEXhM8Cly9AzbxbZ3wCcT/pCfdOYtGoM8EXt76MT0k5AnG+
 K1kg==
X-Gm-Message-State: AOAM530sttdfYvtgKKjexEG4W3mf7QhYxYx59kEhTr/3mK/ZBZjXVLJj
 ajIyczPk5Y9U4tVKc2mR/bGz0e4vhAP8eRtEmH8=
X-Google-Smtp-Source: ABdhPJyMnPkX2OEHQPBg6pvpnH5zUk/Eiteuhlum86nkFXZ4lKjx6flrkhBXLBbliC9RkX3DvkG9kJD2G4wA30j6eqU=
X-Received: by 2002:ac2:5b46:: with SMTP id i6mr7436547lfp.500.1629320952285; 
 Wed, 18 Aug 2021 14:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210818150943.1630199-1-festevam@denx.de>
 <17b5a29d098.279b.9696ff82abe5fb6502268bdc3b0467d4@gmail.com>
 <369c1f89-df33-455b-773e-a2e0dbf582ff@eero.com>
In-Reply-To: <369c1f89-df33-455b-773e-a2e0dbf582ff@eero.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Aug 2021 18:09:01 -0300
Message-ID: <CAOMZO5DQTArbXjAdxh4cmtwPfRS9UCiAiQeRQHhjqLpEOUxsyA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Do not call dma_alloc_coherent() for SDIO and USB
To: Peter Oh <peter.oh@eero.com>
Cc: Arend van Spriel <aspriel@gmail.com>, Fabio Estevam <festevam@denx.de>, 
 Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
 erik.stromdahl@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_140913_808057_9CF032F5 
X-CRM114-Status: GOOD (  11.48  )
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

Hi Peter,

On Wed, Aug 18, 2021 at 2:35 PM Peter Oh <peter.oh@eero.com> wrote:
>
>
> >> Fix the problem by not calling dma_alloc_coherent() when the device
> >> is not DMA capable, such as SDIO and USB.
> >>
> ath10k calls dma_alloc_coherent multiple places including
> ath10k_htt_rx_alloc.
>
> Do SDIO and USB not use such data path function at all?

Now that I look closer:  no, SDIO and USB do not reach the
dma_alloc_coherent() inside
ath10k_htt_rx_alloc.

drivers/net/wireless/ath/ath10k/usb.c and
drivers/net/wireless/ath/ath10k/sdio.c both set:
bus_params.dev_type = ATH10K_DEV_TYPE_HL;

ath10k_htt_rx_alloc() has:

if (ar->bus_param.dev_type == ATH10K_DEV_TYPE_HL)
     return 0;

So it returns early in the USB and SDIO cases and does not call
dma_alloc_coherent().

Thanks

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
