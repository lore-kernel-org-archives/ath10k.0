Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956AAC433EF
	for <ath10k@archiver.kernel.org>; Fri,  8 Apr 2022 08:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMkEWZWI76Ejs3tSymESi34vRThQgZaFNIjiW21Y6dU=; b=mud4msRiyT9TcC
	QYolH9WpdtaISHpGYxbPxxmP2C8mWJPkAZiLIFfFhl7Fh/SWKohej+gRZQX2D0otKnUJTj6Eye07+
	tuyox2IMd/9dXZq/fhI7CRhxnx72+oql0gQjRSf3FZe+DXxepanw3aKCr8RiZVX2EZgRmCkjIgGdk
	pQKCXVX5RNKAjtQQZMtx4eoq+e80k5AXYFTGWsMpHaNsTej9FxtG//lhIL881uKu5ERkOfB8SDGbu
	0JStwB9L72YnTOBFSKBoubEz/FB0ePvzPed9N0mF/hyf3Uby4GHpvATCUjmk83eTEXxtQZOhB/R/t
	S4UnfjiyT47ZwZB9XZNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncjm8-00FmuI-6I; Fri, 08 Apr 2022 08:15:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncjlP-00FmaM-4Q
 for ath10k@lists.infradead.org; Fri, 08 Apr 2022 08:14:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96953615AC;
 Fri,  8 Apr 2022 08:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BDFC385A1;
 Fri,  8 Apr 2022 08:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649405678;
 bh=DXntX2Jz7Nztnd1dMcRMCaGMy0UPIH0WJlp5HA4774s=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Qu+tD/xH27JIeXTaUKCquAn5fQayD4kxRqf9nIEs5/Z/nJRRkNrYMgZhuJZXKt8Al
 NkLhsVjHZOQo7GV7TnXxgY/OhKOkJU3Osmzr9x7wxOTEUJqNBpdfoz4FPDWMUGX/64
 u5jSI6cp8wrTBzl12n2nao2HO36tXUvV7ocDKe08fD9PBw+bB24wUGrlfy8Po3axfC
 48EribHBfxK/csfTD4gSi23AoDNCMmpAeki/n+TADylKpJEf3htCMIfhNEuUqVJq8e
 vepktCqnHgHTjfdLOMttvcbqtGvHV3pvfSY79LhuYzJ1SgqriOd3dpsluPlBAmvsnT
 YOSlmsHLEDPGA==
From: Kalle Valo <kvalo@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 Amitkumar Karwar <amitkarwar@gmail.com>,
 Ganapathi Bhat <ganapathi017@gmail.com>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>,
 Xinming Hu <huxinming820@gmail.com>, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 SHA-cyfmac-dev-list@infineon.com
Subject: Re: [PATCH 1/3] mmc: core: improve API to make clear mmc_hw_reset is
 for cards
References: <20220408080045.6497-1-wsa+renesas@sang-engineering.com>
 <20220408080045.6497-2-wsa+renesas@sang-engineering.com>
Date: Fri, 08 Apr 2022 11:14:31 +0300
In-Reply-To: <20220408080045.6497-2-wsa+renesas@sang-engineering.com> (Wolfram
 Sang's message of "Fri, 8 Apr 2022 10:00:42 +0200")
Message-ID: <87bkxcouu0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_011439_274985_DD342E69 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

> To make it unambiguous that mmc_hw_reset() is for cards and not for
> controllers, we make the function argument mmc_card instead of mmc_host.
> Also, all users are converted.
>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Ulf prefers one cross-subsystem patch to have all users converted. So,
> we are looking for ACKs from the maintainers of the wireless drivers.
> Thank you!
>
> Changes since RFC:
> * don't rename the function but only change the argument type
> * remove fallback and convert all users in one go
> * remove comment as suggested by Ulf
>
>  drivers/mmc/core/block.c                                | 2 +-
>  drivers/mmc/core/core.c                                 | 5 +++--
>  drivers/mmc/core/mmc_test.c                             | 3 +--
>  drivers/net/wireless/ath/ath10k/sdio.c                  | 2 +-
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 2 +-
>  drivers/net/wireless/marvell/mwifiex/sdio.c             | 2 +-
>  drivers/net/wireless/ti/wlcore/sdio.c                   | 2 +-

For wireless:

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
