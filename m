Return-Path: <SRS0=UCLz=OT=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C974C433EF
	for <ath10k@archiver.kernel.org>; Wed, 29 Sep 2021 14:47:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EDFB613CE
	for <ath10k@archiver.kernel.org>; Wed, 29 Sep 2021 14:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EDFB613CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/H/wzeEdP3e0q9wiaxDmnUzKjMXVz8juAYDFnNb0hM=; b=sQM98kIiHoqRyB
	7SIdeBaNHy4ttKOnCk8YSjQkBMPHKDTeY6R3aRx4T1SGsseJYdJ//NplyOiRMKu/1Mpcy1PhohIUy
	WK2yRK/Lu2S5zFR/JtQGkXpg4sGBlm+R7T8fGmp2wqlv5YJTfuHWUHYS2YZMCqtPrX1JeuU4w9Cby
	RRqdadYpA49C9C2UVi6uL0l0H62FrqP91NYruuLF1KUau1XFOd2wy5De2K2XBeYR36FeQx3z7Luvt
	lLUYeNta6J/P8+tJfNZHs6WLAzxoF+6nF2tN+3dc1rtyeB9d4sVoeKJ6dOVme1UaQ9bFlgPTvGOHW
	erxK07D+n293kTBDWdHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVarC-00BMiX-H1; Wed, 29 Sep 2021 14:46:50 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVaqt-00BMXd-Ca
 for ath10k@lists.infradead.org; Wed, 29 Sep 2021 14:46:33 +0000
Received: by mail-ot1-x335.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so3176005otb.1
 for <ath10k@lists.infradead.org>; Wed, 29 Sep 2021 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JgcoX77LyqJgFfCrFyyxOmmlaV13zT4pyPZ6+xdzSpA=;
 b=spTZQ2DbWP0psTWqELtDKdf3ctbS0vkigNQvxkRIwhOKUH8KugD69eFtioiLkoK3Gy
 wtqV+fvcjNiD9+cDbUIXJF+qCw7Y3d8YdkSsHI7IVobxU9CSf3vqhqyWu/Oq2SRFBdHo
 neDrQGuVYezgzLNIKMm1q/0+ChFeu07DQsXdVBLPC5Qj84WxDssil2uJW+0l+TPuEHxn
 Ll6FKrKdGbGmGBGxLGRQmQdKBljtf5QtFgK2eTl3cDvLsBHoaJmId4Ifl7rnnbvBhn0D
 LTj441MSq8B+PPi3TmUJ+3vz8OX7s4Ovl41Aj0dWJafRLB3UbpVpcLmdU8ARwxFqFRiP
 nSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JgcoX77LyqJgFfCrFyyxOmmlaV13zT4pyPZ6+xdzSpA=;
 b=z3Nl3RJzOtahpzczHpXtzwwGQu5TYn52d/I80ikPYlJljuLajvNMLFzf79l3o9JoRP
 9EPuFk1Glh1nS9ts9F8DNPEwp8yOazC9w9KBqrX7n+yxeKRVpBloOOk0Tdrrzf019DF/
 QcN01raVRd2J5S0kLr8s0CT0bf4MSBRnVblaIR7GnKSpSBMw7RvLl7mRZ2c46vnF/N5J
 NEv7msW1pux8st1iQl3VdbY+BDBVQRtLZJYXDjwz+HzXL3UDufP+Gs4QaSXr89b+E2en
 wffkE2v1oLT80e2dywrrMhH/42kjGJ1XdrE3uB6ZLm0M1rfFt9fpOGgl4pBeI5LB8ymB
 RJQQ==
X-Gm-Message-State: AOAM533mPH32PUFyYJHBul2ZS9sRZQ5WrXxNff887rkfGomRaJqtT4Tb
 /3ktiWFO7KUKhox5Nxk4YGtKjQ==
X-Google-Smtp-Source: ABdhPJy1xutLgHZ1k75FBuuFr8v0/9rSKe4U8iMaiX+gLlBxKTV+rJxW6+Z2BJ3/QZooCn7GiUFhFA==
X-Received: by 2002:a9d:6254:: with SMTP id i20mr324075otk.349.1632926790406; 
 Wed, 29 Sep 2021 07:46:30 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id v14sm5473ook.2.2021.09.29.07.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 07:46:29 -0700 (PDT)
Date: Wed, 29 Sep 2021 09:46:27 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Joerg Roedel <joro@8bytes.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Alex Elder <elder@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Andy Gross <agross@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>, ath10k@lists.infradead.org,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] [RFC] qcom_scm: hide Kconfig symbol
Message-ID: <YVR8Q7LO0weiFin+@yoga>
References: <20210927152412.2900928-1-arnd@kernel.org>
 <20210929095107.GA21057@willie-the-truck>
 <CAK8P3a2QnJkYCoEWhziYYXQusb-25_wUhA5ZTGtBsyfFx3NWzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2QnJkYCoEWhziYYXQusb-25_wUhA5ZTGtBsyfFx3NWzQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_074631_548791_F0ECD52A 
X-CRM114-Status: GOOD (  28.59  )
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

On Wed 29 Sep 05:04 CDT 2021, Arnd Bergmann wrote:

> On Wed, Sep 29, 2021 at 11:51 AM Will Deacon <will@kernel.org> wrote:
> > On Mon, Sep 27, 2021 at 05:22:13PM +0200, Arnd Bergmann wrote:
> > >
> > > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > > index 124c41adeca1..989c83acbfee 100644
> > > --- a/drivers/iommu/Kconfig
> > > +++ b/drivers/iommu/Kconfig
> > > @@ -308,7 +308,7 @@ config APPLE_DART
> > >  config ARM_SMMU
> > >       tristate "ARM Ltd. System MMU (SMMU) Support"
> > >       depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
> > > -     depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
> > > +     select QCOM_SCM
> > >       select IOMMU_API
> > >       select IOMMU_IO_PGTABLE_LPAE
> > >       select ARM_DMA_USE_IOMMU if ARM
> >
> > I don't want to get in the way of this patch because I'm also tired of the
> > randconfig failures caused by QCOM_SCM. However, ARM_SMMU is applicable to
> > a wide variety of (non-qcom) SoCs and so it seems a shame to require the
> > QCOM_SCM code to be included for all of those when it's not strictly needed
> > at all.
> 
> Good point, I agree that needs to be fixed. I think this additional
> change should do the trick:
> 

ARM_SMMU and QCOM_IOMMU are two separate implementations and both uses
QCOM_SCM. So both of them should select QCOM_SCM.

"Unfortunately" the Qualcomm portion of ARM_SMMU is builtin
unconditionally, so going with something like select QCOM_SCM if
ARCH_QCOM would still require the stubs in qcom_scm.h.

Regards,
Bjorn

> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -308,7 +308,6 @@ config APPLE_DART
>  config ARM_SMMU
>         tristate "ARM Ltd. System MMU (SMMU) Support"
>         depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
> -       select QCOM_SCM
>         select IOMMU_API
>         select IOMMU_IO_PGTABLE_LPAE
>         select ARM_DMA_USE_IOMMU if ARM
> @@ -438,7 +437,7 @@ config QCOM_IOMMU
>         # Note: iommu drivers cannot (yet?) be built as modules
>         bool "Qualcomm IOMMU Support"
>         depends on ARCH_QCOM || (COMPILE_TEST && !GENERIC_ATOMIC64)
> -       depends on QCOM_SCM=y
> +       select QCOM_SCM
>         select IOMMU_API
>         select IOMMU_IO_PGTABLE_LPAE
>         select ARM_DMA_USE_IOMMU
> 
> I'll see if that causes any problems for the randconfig builds.
> 
>        Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
