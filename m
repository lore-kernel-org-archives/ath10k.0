Return-Path: <SRS0=uCW8=PA=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7A0C433F5
	for <ath10k@archiver.kernel.org>; Tue, 12 Oct 2021 03:11:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75E8060EE5
	for <ath10k@archiver.kernel.org>; Tue, 12 Oct 2021 03:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75E8060EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZQMtg4g2tZQAin6kGO6OHzwOC5pUnj8kfBDJpZuBwk=; b=yWLoiVr9mqYpod
	qKyPd0t7oa8LsRgvEsdWwtm+Yr/X9HBjzxpZYIvZZo5aIKq90v9k5fXTZhKNoexzqtytMNNbIaZmk
	qLZCgfYz8reS6ZX+xSvQDKHZV8mXyK5u8/JhRfICei3eYLa37QcH5PJJE9IK3JfEixU/ZP5oeP/tf
	JEWzHsFlXMxAs6d9Y2tSVEKKjaeNaMuXCxUjd0bOs3A8JqLbValC9WOQ65M106h+j0IZLvTVMLMcy
	64hOrbHkjDIla8vJFYermpI0xLEUxWCTgppCsvhWt2NSjKBled9qRw0nfVSZOJsYjd2p61aFdfkTi
	NHy3bAeCz6uzbm/y1Z7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma8Cc-00BJBN-AX; Tue, 12 Oct 2021 03:11:42 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma8CX-00BJ9z-NW
 for ath10k@lists.infradead.org; Tue, 12 Oct 2021 03:11:39 +0000
Received: by mail-lf1-x132.google.com with SMTP id j5so81767006lfg.8
 for <ath10k@lists.infradead.org>; Mon, 11 Oct 2021 20:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w2FJM5xq0hHLOwYkxQq9HjtkvFRksFK+c9CUBnhMlUA=;
 b=ECxgpBAgFN57M9Muv6HgPW+2gsbKzFTgbdkbk/wcoXHhkLozGpRLLlOMDYegVvygHN
 2py0lXASeUR5ykVbr81UL/hPafzHt+NJHhyIvmIYcmytMQ6GdAJ8dUABYBTqcJvXUoDk
 df377gxkJR4hl2XnoHq6H5fg1PhPosrjlO+vw06vz95++L7FV4HiYbwq2J1WFfNnN/jf
 Mx2ogkRKfRgA5smJ82Ca1+NvpsHAbDGCT+LpTXs64ymH6okmPAuVxvDsTmmJO9KVLgUG
 pZxdks765lI2PhK8KGoyJxBi3yRR/GHoeDDoq3qeWcq50tyooD3LpiVGlx8t8P9OlzUu
 Hbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w2FJM5xq0hHLOwYkxQq9HjtkvFRksFK+c9CUBnhMlUA=;
 b=zRoI8b8uLysT76QBVa2XbBo4MVgkTSYEr28bTXplq3Alc+wIgrHIv3NdtiGe2ZRlpz
 ZWEXjLY70ZmznCHCziUv7kLPUtDZfqr5wAtCw8fIm9gdxfMTMkyyuJpgoanKlQVIA3KX
 xAyW87nH408StobFky+DDfK9mqH8+Mi8gLJKupnz6gtb4q3rSFpSKpzEW20Pb5xPEG6l
 VkGW9nOp6TFWSmurj8RVJ/neO3phiHk9usAnPX1ieFoyKM69Uz87h7XjCYZMx4/gYURJ
 x6JyH0EN/uaPrTZ6FyrhrUUUlXYPYfpBtKDQAZhip8mm8VAXkr/3L5/MCAxXItD1zD7D
 Y1Cw==
X-Gm-Message-State: AOAM532ODATqkjXYFdKmocb0otiVtfla5B6TmRXsFkChsqCjn0882b3n
 nkV/IwKC0vOAozs1ysD6XkwAZT3tnn3sdHFChkoE8Q==
X-Google-Smtp-Source: ABdhPJyrNsMKS3+CiKmx5Tie0/Y10h5OgwLQcjWxqMC9cxgYiRdOXIj2B1esdvuIxFjjlUZ3q1gGQg9rDQ/7FbCROq4=
X-Received: by 2002:a05:651c:b21:: with SMTP id
 b33mr25766490ljr.515.1634008293091; 
 Mon, 11 Oct 2021 20:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211007151010.333516-1-arnd@kernel.org>
 <20211007151010.333516-2-arnd@kernel.org>
In-Reply-To: <20211007151010.333516-2-arnd@kernel.org>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 11 Oct 2021 20:11:20 -0700
Message-ID: <CALAqxLVVEi67HQbjCSvfDPmfjeeZ4ROvqa8yfYMnRmeyi34Ddw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] qcom_scm: hide Kconfig symbol
To: Arnd Bergmann <arnd@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-ia64@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>, 
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>, 
 linux-media <linux-media@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 Network Development <netdev@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>, linux-wireless@vger.kernel.org, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Kalle Valo <kvalo@codeaurora.org>, Alex Elder <elder@linaro.org>, 
 Amit Pundir <amit.pundir@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_201137_825318_C188EE40 
X-CRM114-Status: GOOD (  27.52  )
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

On Thu, Oct 7, 2021 at 8:10 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Now that SCM can be a loadable module, we have to add another
> dependency to avoid link failures when ipa or adreno-gpu are
> built-in:
>
> aarch64-linux-ld: drivers/net/ipa/ipa_main.o: in function `ipa_probe':
> ipa_main.c:(.text+0xfc4): undefined reference to `qcom_scm_is_available'
>
> ld.lld: error: undefined symbol: qcom_scm_is_available
> >>> referenced by adreno_gpu.c
> >>>               gpu/drm/msm/adreno/adreno_gpu.o:(adreno_zap_shader_load) in archive drivers/built-in.a
>
> This can happen when CONFIG_ARCH_QCOM is disabled and we don't select
> QCOM_MDT_LOADER, but some other module selects QCOM_SCM. Ideally we'd
> use a similar dependency here to what we have for QCOM_RPROC_COMMON,
> but that causes dependency loops from other things selecting QCOM_SCM.
>
> This appears to be an endless problem, so try something different this
> time:
>
>  - CONFIG_QCOM_SCM becomes a hidden symbol that nothing 'depends on'
>    but that is simply selected by all of its users
>
>  - All the stubs in include/linux/qcom_scm.h can go away
>
>  - arm-smccc.h needs to provide a stub for __arm_smccc_smc() to
>    allow compile-testing QCOM_SCM on all architectures.
>
>  - To avoid a circular dependency chain involving RESET_CONTROLLER
>    and PINCTRL_SUNXI, drop the 'select RESET_CONTROLLER' statement.
>    According to my testing this still builds fine, and the QCOM
>    platform selects this symbol already.
>
> Acked-by: Kalle Valo <kvalo@codeaurora.org>
> Acked-by: Alex Elder <elder@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Changes in v2:
> - fix the iommu dependencies

Hey Arnd,
   Thanks again so much for working out these details. Also my
apologies, as Bjorn asked for me to test this patch, but I wasn't able
to get to it before it landed.  Unfortunately I've hit an issue that
is keeping the db845c from booting with this.

> diff --git a/drivers/iommu/arm/arm-smmu/Makefile b/drivers/iommu/arm/arm-smmu/Makefile
> index e240a7bcf310..b0cc01aa20c9 100644
> --- a/drivers/iommu/arm/arm-smmu/Makefile
> +++ b/drivers/iommu/arm/arm-smmu/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_QCOM_IOMMU) += qcom_iommu.o
>  obj-$(CONFIG_ARM_SMMU) += arm_smmu.o
> -arm_smmu-objs += arm-smmu.o arm-smmu-impl.o arm-smmu-nvidia.o arm-smmu-qcom.o
> +arm_smmu-objs += arm-smmu.o arm-smmu-impl.o arm-smmu-nvidia.o
> +arm_smmu-$(CONFIG_ARM_SMMU_QCOM) += arm-smmu-qcom.o
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index 9f465e146799..2c25cce38060 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -215,7 +215,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>             of_device_is_compatible(np, "nvidia,tegra186-smmu"))
>                 return nvidia_smmu_impl_init(smmu);
>
> -       smmu = qcom_smmu_impl_init(smmu);
> +       if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM))
> +               smmu = qcom_smmu_impl_init(smmu);
>
>         if (of_device_is_compatible(np, "marvell,ap806-smmu-500"))
>                 smmu->impl = &mrvl_mmu500_impl;


The problem with these two chunks is that there is currently no
CONFIG_ARM_SMMU_QCOM option. :)

Was that something you intended to add in the patch?

I'm working up a Kconfig patch to do so, so I'll send that out in a
second here, but let me know if you already have that somewhere (I
suspect you implemented it and just forgot to add the change to the
commit), as I'm sure your Kconfig help text will be better than mine.
:)

Again, I'm so sorry I didn't get over to testing your patch before
seeing this here!

thanks
-john

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
