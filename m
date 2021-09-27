Return-Path: <SRS0=Mq3L=OR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7CEC433EF
	for <ath10k@archiver.kernel.org>; Mon, 27 Sep 2021 20:42:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B39ED60EFD
	for <ath10k@archiver.kernel.org>; Mon, 27 Sep 2021 20:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B39ED60EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DY724QyQrouot2MW6Ttf62fBeplnWy1HPrcMajb43J0=; b=pOXCxCg9UD9QSk
	WuMHcdViioQS9zpOnsFSrPmL/Ko+JyBwnOgVJIOu3qlZHCuiuxgPOg3JCWy5v3futqk7OJyEy1C+9
	qLWUfVdPSMN2n7pZnegxpns5Smc5+mRy3dNDAnzO4/pwUDd9CLsFqBSX165OMYl2E5bHyWmJOsfB3
	npT+Jh4TVKJfgQEzYmqT6MD5+hld4s+m+ydeHyThPqGJP2H/OdXljVBiXE9HS8wJbvWNf46XU1D2H
	g8yM0uU13I5iHYfPZjQSKigcqfhPuQTWNQTJz3nLuZiuwQeXhHlVwVHarPLkmwfxiHsKY1MpsaDXF
	glRE4tQNX3CNqOjUCgrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUxRg-004DLW-MF; Mon, 27 Sep 2021 20:41:52 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUxRc-004DJe-Sp
 for ath10k@lists.infradead.org; Mon, 27 Sep 2021 20:41:50 +0000
Received: by mail-ot1-x336.google.com with SMTP id
 h9-20020a9d2f09000000b005453f95356cso26073680otb.11
 for <ath10k@lists.infradead.org>; Mon, 27 Sep 2021 13:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pUZgLCnNelRAaV+g7H8XGqFTT9YZLErJSXLJYla4RJo=;
 b=dCoaJUF0HSoSC1tmNX6q8Fh6kJv7c6jk49XmhH2vq1ANKmz6EeVyVtD2Pcxxxh8aXz
 /W0bzAWmoH3iHlFtKt4RHhcy9v4nMv6BEyBk34D8UUa8oCh+yyJJBwKYrK5zxFL+VJ5W
 mmk25gMJbff0s4JgjQlL73M1frtzFLhhSSeKsoMfON0N7To1FwqmZevw+vpH964FuN5+
 VDs07R1JX2daPpe7GTVjL3t8b85VIkNR+VDjVjC7aEfatwsh4ieB21gaSPHVc9FrfLe4
 JK9GpMcv5K/VRzrKmX8WZg1LZAmnWcollVG6hxmBajWBFIxazJts7JTsm6AsqVhgOO/o
 pUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pUZgLCnNelRAaV+g7H8XGqFTT9YZLErJSXLJYla4RJo=;
 b=hxZikxjumleXipHHUpIIPLt1uyOXk3Dj242cAxeonXubzZFVn0HS4+xjDc+LYxFnMH
 tO86eDbfa9nZOfBbyGXzfvCoblwUWe/XOa0lDFT4ymBrbMNMLObmFtuhivdq5ejIJyS4
 Ny4kDQxtg/6+2C8of/Ssjc/OF2lFexYOe+z7x1e3Ox4jC/r3UWRXn5+6gb0NhPz8K7uC
 dG7wiDCYQR/ej65KrHM38pgGr9/HkP+hmU9Ih/2NXe00cBVMPY7r6396sWgNfQeZGb81
 aa/dLnslLqikGHGZhR2HiVb4IqfJ/TSJZymFapKRieduIK+yrw8IkxnZc9FApl5n9tsu
 M9aA==
X-Gm-Message-State: AOAM532yPxPJRcwtckyQ4yses5uMQZQlwouJzyttfHM56sqIfI8tAR5I
 Cg6dokl1Vhkxgf5CiIsP1uI9Wg==
X-Google-Smtp-Source: ABdhPJydeIzDJHtHzGeBz5+87mWnwkDNbaEe+ql2n9gGjNC+NklvZH2OYxM0vWlXO7E/L2MFCogIbA==
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr1832465otn.126.1632775307597; 
 Mon, 27 Sep 2021 13:41:47 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id a8sm4414108oos.46.2021.09.27.13.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 13:41:47 -0700 (PDT)
Date: Mon, 27 Sep 2021 13:42:22 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Message-ID: <YVIsrgKiOG/gFVdT@ripper>
References: <20210927152412.2900928-1-arnd@kernel.org>
 <YVIg9CxJGaJr1vpp@ripper>
 <CAK8P3a1fEuFsQVY9b1oGdTOHzr8pu9wvrSBCMn2iOvgWqtHNnA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1fEuFsQVY9b1oGdTOHzr8pu9wvrSBCMn2iOvgWqtHNnA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_134149_006391_D8C72721 
X-CRM114-Status: GOOD (  27.80  )
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

On Mon 27 Sep 13:15 PDT 2021, Arnd Bergmann wrote:

> On Mon, Sep 27, 2021 at 9:52 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Mon 27 Sep 08:22 PDT 2021, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > >  - To avoid a circular dependency chain involving RESET_CONTROLLER
> > >    and PINCTRL_SUNXI, change the 'depends on RESET_CONTROLLER' in
> > >    the latter one to 'select'.
> >
> > Can you please help me understand why this is part of the same patch?
> 
> This can be done as a preparatory patch if we decide to do it this way,
> for the review it seemed better to spell out that this is required.
> 
> I still hope that we can avoid adding another 'select RESET_CONTROLLER'
> if someone can figure out what to do instead.
> 

Okay, thanks.

> The problem here is that QCOM_SCM selects RESET_CONTROLLER,
> and turning that into 'depends on' would in turn mean that any driver that
> wants to select QCOM_SCM would have to have the same RESET_CONTROLLER
> dependency.
> 

Right, and that will just be another thing we'll get wrong across the
tree.

> An easier option might be to find a way to build QCOM_SCM without
> RESET_CONTROLLER for compile testing purposes. I don't know
> what would break from that.
> 

Afaict the reset API is properly stubbed and RESET_CONTROLLER is a bool,
so I think we can simply drop the "select" and the kernel will still
compile fine in all combinations.

When it comes to runtime, we currently select RESET_CONTROLLER from the
Qualcomm common clocks. If that is dropped (why would it...) it seems
possible to build a custom kernel for msm8916 that we can boot and miss
the stubbed out "mss restart" reset line from the SCM.


So, let's just drop the select RESET_CONTROLLER from SCM for now.

Regards,
Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
