Return-Path: <SRS0=Mq3L=OR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7667C433F5
	for <ath10k@archiver.kernel.org>; Mon, 27 Sep 2021 20:16:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DA3E600CC
	for <ath10k@archiver.kernel.org>; Mon, 27 Sep 2021 20:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DA3E600CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7liCE1p4/aQyc5zRqpxThbzip2HKHlZ7y/LCrB8p9c=; b=dy+8XrU+EB9Rj5
	59mgkVwaYglfDvNpyh84soAX7fUlkc15f/STU0tNnXNePH++WjyB1epgK0iyYx1m62DFdR4wffmjX
	ZQoF1dXIXkCYxiLFuJ3jBq+DE1b31s1q0lLk8tlON4MbdNlLAvna28WmkDx9y7pDXAywnzjXVFOEr
	ZSUKQ1bymP+w/s6ZbJ4iVvCM8OMa8yPRfm6KwAF96qoYV9NpHTlGyYwt9kzf6T9vgoFWl18IGAFah
	WisMaENscWXO+UcE0IrY3lLyds5Ii07xokHdwoW7mHxIiJF40xwZRpswy4B9qW4+6Zoq5/XW65h7e
	j0z/7aJfe97XkvXx8Oxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUx2k-0049AT-GH; Mon, 27 Sep 2021 20:16:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUx2h-004999-Hq; Mon, 27 Sep 2021 20:16:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30FDF60FF2;
 Mon, 27 Sep 2021 20:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632773763;
 bh=Lb3LIgfAEjVXdf1vE2V7OoMMbogeWMravjEabJ1Nxyg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aoqynUkGyB6ZPUI0PZbhRVWrRQEh4dUFl+HnGRbJEjz36swl07OI+waO5juXrxZEL
 jHlAKLJtp7vLEn53dGPq9ybdvqoV7skp3bnJ2v0dt7b3LCLaWszZoJwfgXGV5CewIZ
 EeT9Puax/p5vO3xFfjNQpP/s5z+vV6IucH/tDVc9OrhV9apJ4xfqmWfbZVQ6mT6zds
 T7V/1iyHvtmaHFbCozBGLs87R9buQKkqhGe1GFJbwuhVxRAw/14pw6aQABaZ9IXQ/3
 OdqLZFHV5ZJBQxWkAwNJ0thZGMxGk74lNv+sDueBnQKqvqp7vbKRWok7c77AtHcBAs
 PL2/kpsfVk1jA==
Received: by mail-wr1-f53.google.com with SMTP id d21so53879558wra.12;
 Mon, 27 Sep 2021 13:16:03 -0700 (PDT)
X-Gm-Message-State: AOAM533CKX1QH7JJDcvs9LRsm1U2JirhNelc/BiNif8xIXHfcNXdk/h6
 n2/d4jHPeSyYfyo++U775ute4RyN1W/1VaXDpjQ=
X-Google-Smtp-Source: ABdhPJxhSUG+xfsMcnYBJG/aU9zQ/jW83Rbf6e2ezlqzSM1qdDuC1ur8sa8pPTTU3lbMghJJfkyUaLecI/p3sCcMSis=
X-Received: by 2002:a5d:6cb4:: with SMTP id a20mr1431020wra.428.1632773761805; 
 Mon, 27 Sep 2021 13:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210927152412.2900928-1-arnd@kernel.org>
 <YVIg9CxJGaJr1vpp@ripper>
In-Reply-To: <YVIg9CxJGaJr1vpp@ripper>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 27 Sep 2021 22:15:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1fEuFsQVY9b1oGdTOHzr8pu9wvrSBCMn2iOvgWqtHNnA@mail.gmail.com>
Message-ID: <CAK8P3a1fEuFsQVY9b1oGdTOHzr8pu9wvrSBCMn2iOvgWqtHNnA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210927_131603_641979_62B48F2D 
X-CRM114-Status: GOOD (  18.50  )
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

On Mon, Sep 27, 2021 at 9:52 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Mon 27 Sep 08:22 PDT 2021, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> >  - To avoid a circular dependency chain involving RESET_CONTROLLER
> >    and PINCTRL_SUNXI, change the 'depends on RESET_CONTROLLER' in
> >    the latter one to 'select'.
>
> Can you please help me understand why this is part of the same patch?

This can be done as a preparatory patch if we decide to do it this way,
for the review it seemed better to spell out that this is required.

I still hope that we can avoid adding another 'select RESET_CONTROLLER'
if someone can figure out what to do instead.

The problem here is that QCOM_SCM selects RESET_CONTROLLER,
and turning that into 'depends on' would in turn mean that any driver that
wants to select QCOM_SCM would have to have the same RESET_CONTROLLER
dependency.

An easier option might be to find a way to build QCOM_SCM without
RESET_CONTROLLER for compile testing purposes. I don't know
what would break from that.

     Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
