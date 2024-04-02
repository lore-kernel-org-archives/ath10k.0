Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D790ACD128D
	for <ath10k@archiver.kernel.org>; Tue,  2 Apr 2024 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heR2AZ16RGjephYYk3nVkJQSU4kssIE/CVztHg4PbLw=; b=OEbbbOVD014GZ80dCKgCpnr7PX
	E4RHM629WUmXnv75tW7jqOpOmV0KEs3tb82HggcJd3tL+ZABeGDikjetdO2oWTCakV1kfblG9VFZE
	2uxdPa0BSwHg/m4rpGHFLaQ5lzUA6QygVgndPIoe8o//i/6yH7XOAalnH2L3TINh6A3sDm8Vib17d
	Sz7oBNlmWKCFGhu6g/fBLHWT23KHbpJBkxvKPOdSuqhfdWuLYkpOctGLaNHqhwgNPTizHh6leQRly
	tQyM8RB4gA4jMZjvhalj51f1z9ZBIeJwtm7BDpcruRHmxllxl96sayf1eQt+7HDnxDns9TwPUa6zB
	g9/Sqn9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrcrH-0000000AxY8-1MPy;
	Tue, 02 Apr 2024 12:03:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrbqJ-0000000AlFb-0FGD
	for ath10k@bombadil.infradead.org;
	Tue, 02 Apr 2024 10:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=heR2AZ16RGjephYYk3nVkJQSU4kssIE/CVztHg4PbLw=; b=l/WoCUEsNpqnBZQ8NxuqBBKJT8
	jBatWyz1z8f26H6ZvEsmwlQcJlOlIN6AEzTqpFuFsSIs2TcGSxW3a5j3iPxyeXxzFDaDQZc3kJ0I7
	Ow5os6LCQCJU0HrogDa6mqo3Xi1fQ/rLKqx2lloChoP/pr15jMUYIJxmvOTOkyCZSbqJ6nFyWPfcR
	POJNyUc6vpcGYi3760LQFz84T7hTCa6qVqoNBU99vywnF/m4w41tCfRrw4m+VopojJWXpZQx1Y9Y0
	fjXxg1iLba+nqJL/2Aj5PHeyR8/rFrY0yGdpIZCygxe0hSDWxP1MsJ77LGf6RBAtDTGtFVBvN1fHm
	m35xuXzw==;
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrbpt-00000003ZSo-1P81
	for ath10k@lists.infradead.org;
	Tue, 02 Apr 2024 10:57:54 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-61453963883so39600467b3.1
        for <ath10k@lists.infradead.org>; Tue, 02 Apr 2024 03:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712055466; x=1712660266; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=heR2AZ16RGjephYYk3nVkJQSU4kssIE/CVztHg4PbLw=;
        b=mXXhsJfaAwto454xs8OQj6J1x8qWT+13ojomR0g9g/HJ0Oa2C/zHxPxDluDQowOzBs
         tzNpxvMK00UsaG6pr5dJvj/p4OErFREQ/F1MTZoh5ld8wE+Uf6f7FZzPOcELBn68hxhG
         22kMWm7gHCbFwzYYooz02TLb/H3hPgqdqSxKptE39er+NBG8Xrb2OgJ7BCoFDHwGSttR
         e3QP3OokvQh+3Q/cJgEVrimVwLM/L7zEx0EIe5lRql/qoUM0UB1Yjtwh6WqOH7Sa/NCx
         +mTN3zgElpStwK0pTM+WtQTOIxpJg6jgW9o9y8KW0V9wKVaA6MD0Fo7deY1C/YCag899
         Dxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712055466; x=1712660266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heR2AZ16RGjephYYk3nVkJQSU4kssIE/CVztHg4PbLw=;
        b=Tfn4k5VLqB7B85lRS0RnO3VJUAHKTxp25cvnCWpoSkURvD9aChs9HNmv6GdEV9RG2P
         JlOG+dQZaDktyHzjF8Igwi1DNy1KQ1ulP0r5vPATefmSH3DyRuSsmAAEfuv/OOb1ZlE6
         nFVtyYEhqc5yqLb5cIA8cGDAFT89khDE+joYNds/L1clCqPH2LNXmAsKWbpi/9mRCZYy
         TMYRJpYalXPg6a1dx9tUwk1u1+XMFacBMMi3ZoQc4nktG23rgNrNKkUZkmRFwaxD7kho
         Q8RvQVEYij+XlvnUClkfL7R6DJ5oCXBHJnzSQ1jl3Z5H8wXaklYBUA44wb6zNzlE3lfZ
         2m7w==
X-Forwarded-Encrypted: i=1; AJvYcCWjthSLO0EpFncxv/2hLIonsXnOq8sxYroSudzMBv1KXleShCmpz+/at+fYmiFjiY1KdvINgJhrijc2GRnL47KLY/+IrDVMY4rK0w==
X-Gm-Message-State: AOJu0Yzfo97x23PeWLw01gcHF9wlVUiTdNjQsY0DY0pI3PA0uJZD/f8S
	1uqHBPBiIBfdBF/e5FR1IjeqBdJPGSF8CDoH+JmY4w0Syzj4Zo6HAVDqcnOwmNqRKJfkdenY6BX
	qadmOJlxZ7s4sDCcBCBIu44uiK3jB3PP0yLKWDg==
X-Google-Smtp-Source: AGHT+IG0hl043sikYSStWfJMtXPIZPLFFTefeWAq9LsJotUVsTuh5FFEl/udwTnzeyfi+7Th8cC2dNNikPb4b1WN2ok=
X-Received: by 2002:a81:5d45:0:b0:608:e133:7ece with SMTP id
 r66-20020a815d45000000b00608e1337ecemr11694233ywb.36.1712055465511; Tue, 02
 Apr 2024 03:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
In-Reply-To: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 2 Apr 2024 12:57:09 +0200
Message-ID: <CAPDyKFqct4ZV3UbTzWKO08MzDTm_BX6K02kefV26mEain0SXqA@mail.gmail.com>
Subject: Re: [PATCH 0/7] mmc/wifi/bluetooth: store owner from modules with sdio_register_driver()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Arend van Spriel <arend.vanspriel@broadcom.com>, 
	Brian Norris <briannorris@chromium.org>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_115752_843044_1FA0324C 
X-CRM114-Status: GOOD (  14.67  )
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

On Fri, 29 Mar 2024 at 18:24, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Merging
> =======
> All further patches depend on the first patch.  Everything could go via
> one tree, e.g. MMC, or the cleanup patches removing owner would wait a
> cycle.

Patch 1 applied for next, thanks!

I can certainly pick the remaining in the series through my mmc tree,
but waiting a bit to queue them up to allow some more acks to be
received.

Kind regards
Uffe


>
> Description
> ===========
> Modules registering driver with sdio_register_driver() might
> forget to set .owner field.
>
> Solve the problem by moving this task away from the drivers to the core
> code, just like we did for platform_driver in commit 9447057eaff8
> ("platform_device: use a macro instead of platform_driver_register").
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (7):
>       mmc: sdio: store owner from modules with sdio_register_driver()
>       bluetooth: btmrvl_sdio: drop driver owner initialization
>       bluetooth: btmtksdio: drop driver owner initialization
>       wifi: ath10k: sdio: drop driver owner initialization
>       wifi: brcm80211: drop driver owner initialization
>       wifi: marvell: mwifiex: drop driver owner initialization
>       wifi: silabs: wfx: drop driver owner initialization
>
>  drivers/bluetooth/btmrvl_sdio.c                           | 1 -
>  drivers/bluetooth/btmtksdio.c                             | 1 -
>  drivers/mmc/core/sdio_bus.c                               | 9 ++++++---
>  drivers/net/wireless/ath/ath10k/sdio.c                    | 1 -
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 1 -
>  drivers/net/wireless/marvell/mwifiex/sdio.c               | 1 -
>  drivers/net/wireless/silabs/wfx/bus_sdio.c                | 1 -
>  include/linux/mmc/sdio_func.h                             | 5 ++++-
>  8 files changed, 10 insertions(+), 10 deletions(-)
> ---
> base-commit: 087c142b2b04898c897aa77938d05a93907150e5
> change-id: 20240329-module-owner-sdio-abd5de3f1d74
>
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>

