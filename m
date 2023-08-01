Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DEFC001DF
	for <ath10k@archiver.kernel.org>; Tue,  1 Aug 2023 14:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhLGDftqN2bdD4c2A4sSnkBFCaOtJMvNQbhzWZPWqIk=; b=FeocGWmaav956W
	Jsu+/VZ6SH0XgmUQ5/2R5DCe5H5MYobhWiSfjP4chpjZbq0fEUzN/8UlLH6fpqPEJ0sFJPIUKviHU
	0hWaQWQmINrzplPPTJFzf1hfGppGQqg0aWmR8XA0qvczTQtZQMn/FmKP7y2gYVBnNDuKJ8ZpevD1c
	4Guitjv47ASd+46//niCQskfxkgTciB5dOHnm8ypXQZ1mJEWCbwH7lN/y87WFBvu4LY6SSlmPyz+u
	DL0kGunr3SG8RDtOpgZTIK7Gbye5l3cpfQBOyiGTBKBuiQzAw+YPANieUEIhLZNL2XQjpX/WViyVM
	2tnbXRgMcZZsfB90S0Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqg9-002dq6-2b;
	Tue, 01 Aug 2023 14:48:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqg6-002dpT-2i;
	Tue, 01 Aug 2023 14:48:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B2588615A9;
	Tue,  1 Aug 2023 14:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADCAC433C7;
	Tue,  1 Aug 2023 14:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690901329;
	bh=nT8gUQ6qDAmcesueSE4m0Nz7EwpMx5l0NtHDJ0UaUKc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=YNcdFczYzaieRuS9r1BQyiKUAmTILRQLhyy9Bdhw4fY7U6RKJHISLOpTIpTQTWOWG
	 qjpntf0uj4YT8FUENS/vE151qxVlzro8RDEMDu3Ix/i6u5DPhWQS9yj019zH+5dmb/
	 dQbhnMlk26ZEVpJ7+Y2i5OLH8a12tjJ5q2SlvL4X1sZDHXiKzmBz0v/QRCwyzVe5T+
	 x7I2LFOvRrXEnxy2C+T1eaqmUhXbDmAb/NbeM5Rm+XpOP+q9wJkDeq84xVWyYyrmWb
	 gihdh3gxke8iWCdpm108MZ2XHbsc385uwa0Ejgod2lvTOgHWmCQUgT5bRbBdsmFX41
	 IeBO6cPajX/6w==
MIME-Version: 1.0
Subject: Re: [v2] wifi: drivers: Explicitly include correct DT includes
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230724211914.805876-1-robh@kernel.org>
References: <20230724211914.805876-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno  <angelogioacchino.delregno@collabora.com>,
 =?utf-8?b?SsOpcsO0bWUgUG91aWxsZXI=?=  <jerome.pouiller@silabs.com>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 wcn36xx@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169090132389.212423.4907787613050355047.kvalo@kernel.org>
Date: Tue,  1 Aug 2023 14:48:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_074850_964932_837041F0 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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

Rob Herring <robh@kernel.org> wrote:

> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied to wireless-next.git, thanks.

e7899a90cebe wifi: drivers: Explicitly include correct DT includes

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230724211914.805876-1-robh@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
