Return-Path: <SRS0=Mq3L=OR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D57C4167B
	for <ath10k@archiver.kernel.org>; Mon, 27 Sep 2021 20:48:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA11461058
	for <ath10k@archiver.kernel.org>; Mon, 27 Sep 2021 20:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA11461058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JQNEWJbqRZvUfDHilo5qMoUjjyrrxyczeKm4jfc+S/s=; b=LPAj2MCrHQiEJu
	H+NsuFOh2eQNJKiQGeS6EBc+4CFDcegQCQCMhFwJu+2fHHWgVW6/0g4D/+lL1XxwQO8MNC+PQE+p6
	CbswMWPW3hYSyPR0Xmy8+s2I8rCaGx8t21PRQDfiewXHajgAgezSMHKr6ZQSusT9lB59YGIj+uk+g
	q3uA1Wy0PesXsfxpktF3QkBWggrInuxKazJOU8wzuGtdv4pz6qfzYcYZLI3e5geLhfvs+OVtNHfLn
	SGYGOOeC9tyG+zR+UJxLIcBOWud3Tl4vBBs15oixDQVFp0n0Cvh6m026PukwI2ha+jZAYrXCwRGAb
	xcSx+kk4fc6nC+Y6TzzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUxXk-004EiD-Li; Mon, 27 Sep 2021 20:48:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUxXh-004EgW-Jp; Mon, 27 Sep 2021 20:48:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36031611C2;
 Mon, 27 Sep 2021 20:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632775685;
 bh=GHCCCNNGDh7j8AzsSAwR+7WjFwTTkZQkWzBp4yf5Anw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EtTYXuV99xHvDuCezChTC1fYR0ncVq3Rk1GokwMu8SQwpY+EmUiFM+RJIajTO8jW3
 VrmnSOnx8ztK/horbiFLR4Q1ZWDBNyvy7tKy9OeuG4ddMCv7tR6NZWpZqi+5myOFRZ
 fUlC6Cg5AZEODAOrfOLYA3DADysDTM/85vB/lrkAnFddU4ZJYrY9Qs93uwL2IgXWp2
 ShOzsV013bF2pbhJUOsUOYV7NBfbitxpmzxjeFzmgMdmeTIB3GqmWBkk202+UoozT6
 QbwxnW2Yp/G+PD6grSc1VyWUP3kS05HQi/kIejRv/Gb69g5//VZRJWFOBSMsttdGMH
 imsrWEit+NvGQ==
Received: by mail-wr1-f46.google.com with SMTP id d6so53978205wrc.11;
 Mon, 27 Sep 2021 13:48:05 -0700 (PDT)
X-Gm-Message-State: AOAM530opOxwbfcmX9N80x1f5RBeUs1gPnW0Yubq2Tb6KmQkq7DAFGLS
 ljqF/9tH+YdBgIRvW/nGrDFRs4rYjbca/RnebD0=
X-Google-Smtp-Source: ABdhPJyr//9nG+qcYuFmIIHo02EBLzzoRAIp7o7Kc5vnLIs/c/42qbXfOQSeIjG8WR8ZxK+L1GxrgnNIqE5zvhpeDJ8=
X-Received: by 2002:a5d:6a08:: with SMTP id m8mr2207127wru.336.1632775683762; 
 Mon, 27 Sep 2021 13:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210927152412.2900928-1-arnd@kernel.org>
 <YVIg9CxJGaJr1vpp@ripper>
 <CAK8P3a1fEuFsQVY9b1oGdTOHzr8pu9wvrSBCMn2iOvgWqtHNnA@mail.gmail.com>
 <YVIsrgKiOG/gFVdT@ripper>
In-Reply-To: <YVIsrgKiOG/gFVdT@ripper>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 27 Sep 2021 22:47:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1WRBA4mP691fO82ZhYdPhHLGjLH=VhcUxGNeGRMX8knw@mail.gmail.com>
Message-ID: <CAK8P3a1WRBA4mP691fO82ZhYdPhHLGjLH=VhcUxGNeGRMX8knw@mail.gmail.com>
Subject: Re: [PATCH] [RFC] qcom_scm: hide Kconfig symbol
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Alex Elder <elder@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, 
 Kalle Valo <kvalo@codeaurora.org>, Andy Gross <agross@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_134805_724941_8A5ADD35 
X-CRM114-Status: GOOD (  19.21  )
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

On Mon, Sep 27, 2021 at 10:42 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Mon 27 Sep 13:15 PDT 2021, Arnd Bergmann wrote:
> > On Mon, Sep 27, 2021 at 9:52 PM Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> >
> > An easier option might be to find a way to build QCOM_SCM without
> > RESET_CONTROLLER for compile testing purposes. I don't know
> > what would break from that.
> >
>
> Afaict the reset API is properly stubbed and RESET_CONTROLLER is a bool,
> so I think we can simply drop the "select" and the kernel will still
> compile fine in all combinations.
>
> When it comes to runtime, we currently select RESET_CONTROLLER from the
> Qualcomm common clocks. If that is dropped (why would it...) it seems
> possible to build a custom kernel for msm8916 that we can boot and miss
> the stubbed out "mss restart" reset line from the SCM.
>
>
> So, let's just drop the select RESET_CONTROLLER from SCM for now.

Ok, I've made that change locally, giving it more time on the randconfig
build box now.

       Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
