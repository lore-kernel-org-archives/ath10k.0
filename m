Return-Path: <SRS0=4y1J=OS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976ACC433F5
	for <ath10k@archiver.kernel.org>; Tue, 28 Sep 2021 07:09:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AD83611C0
	for <ath10k@archiver.kernel.org>; Tue, 28 Sep 2021 07:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AD83611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPbSVA3NM8629JfnNiUQFo/H94nnlZNzQdU9A5y2ZDM=; b=vcsYfkzG//HaJz
	FHwmPjbLm0/iXMRnsfRTRvSkFMabmkUoC6BtE5klZiz3DB9Wb0ZJEr8FNRMXYFZZWuz2pzl6jPoFs
	OA3cf2S+qRqjXEHXKxwmFWHGlF5WssmXV0IE+BgERXnf/YqyN+nZeX021ZIQY6wRq4dqAhOj5PFd/
	B4/bamF49amryFI0UbONRg4V8pgniuDQmqPgsDtkX0vZXgszI2EYyJHqYQMYT3CNzFawsqjteSQhf
	3imFDBX3LoWgDojhyR3r+zkSHCb0V7y6POcziNAlq07y30MkVP1qMo7OuJcHUgVSKwfUyiVsIdcMO
	v15CxUXbzQGHBiacJUdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV7Ee-005wxx-No; Tue, 28 Sep 2021 07:09:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV7Ec-005wxF-55; Tue, 28 Sep 2021 07:09:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7C48611C0;
 Tue, 28 Sep 2021 07:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632812941;
 bh=UL3HabPZo5poDvomfSgnMsUOXswOov4XaFV+Mhe/hPM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=peKRlRdshfCDM0WKkr1XAFZ5JA0DCpMVcB0qXm9NxkojuV08GN8y4VUWHQuL7c9ZY
 6sWn8yb6HkL33eo7lHoIpmV+16YmcV5URUsbb5ROqMLP/B2oYGO9uzYlQKzwmYIte9
 JjCrZb+8LY02VUAqdkytXO6BXCrNT6hTbVe6tjxqsCJOIcI5lKKEAFEQw+MtMj1kd9
 7TD06BzKQnK5KlREkvXV6RcZ4dYFoBhJ+Sg8NqJMxbI95VJng6XTqHy4AQImO9S4Kf
 gEL4X76N6d2P14bUwruG/Y5pIfa3QIReUn3JXZEw80+7KD8/DNNMDPScLhF7pMaSHH
 +Epm+raz+IWiQ==
Received: by mail-wm1-f46.google.com with SMTP id
 t16-20020a1c7710000000b003049690d882so1244383wmi.5; 
 Tue, 28 Sep 2021 00:09:01 -0700 (PDT)
X-Gm-Message-State: AOAM531aGJzkH4xc+pnQF6HySZc/oBuGY40ZctF3x1IwNm+OwS3PilzD
 B0Q4GQC6/du7cDRiavLWZ9ryHuhtFylorcbOUJ8=
X-Google-Smtp-Source: ABdhPJy7UdwG5CMt3vBprQtkQXDtnziSdWAdhBrxF2DYHzwuiJfWIuOu4DEBfNVS3j3HCobxe7h4te4Xc8Y+nnvjU1E=
X-Received: by 2002:a1c:7413:: with SMTP id p19mr3161995wmc.98.1632812940328; 
 Tue, 28 Sep 2021 00:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210927152412.2900928-1-arnd@kernel.org>
 <87k0j1qj0i.fsf@codeaurora.org>
In-Reply-To: <87k0j1qj0i.fsf@codeaurora.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 28 Sep 2021 09:08:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2FiMLZK7W9L9XD5h=3yS8QJ6iMr0pXHtCNrpctZG4FhQ@mail.gmail.com>
Message-ID: <CAK8P3a2FiMLZK7W9L9XD5h=3yS8QJ6iMr0pXHtCNrpctZG4FhQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC] qcom_scm: hide Kconfig symbol
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Alex Elder <elder@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, 
 Andy Gross <agross@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
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
X-CRM114-CacheID: sfid-20210928_000902_235602_8C2E3B15 
X-CRM114-Status: GOOD (  13.85  )
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

On Tue, Sep 28, 2021 at 9:05 AM Kalle Valo <kvalo@codeaurora.org> wrote:
> Arnd Bergmann <arnd@kernel.org> writes:
> > From: Arnd Bergmann <arnd@arndb.de>
> I assume I can continue to build test ATH10K_SNOC with x86 as before?
> That's important for me. If yes, then:
>
> Acked-by: Kalle Valo <kvalo@codeaurora.org>
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

Yes, the difference is that this will then also build the qcom_scm module, but
that should not cause any problems after the other changes in this patch.

      Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
