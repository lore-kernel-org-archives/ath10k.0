Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFBDCD1284
	for <ath10k@archiver.kernel.org>; Sun, 31 Mar 2024 20:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jhCHaUlKtQAHxBedBly8GQUjQboC4x/vhqiptxebnA=; b=gt96k4sTfAzI5LE+VHtwnffPxJ
	GieWNBrdrgZxOABEpta62CZPXbz936HzRLDep7unl1BVu7dlgTOF6snJfUu3ClqrmUGoFnM+Mcmk2
	H4YyG5yxXm0Xmyuga/FnP8WuMOQZhr6Zq7BMHhjX9ZQf/K5/QGqhV/snGWBbPhZ3zfNTy5VlRCWWt
	lGbJFazKFtx2GSjC2DQ3UzUqeluS5nMhOKP5u2GWYGrrY3zd/FTOCMsa9o+VFw58NYB0XZYMqFUWe
	62vyrVKuBqCMntREadfoEdqmDh81v+XXsteNZAeah4BoIJsVHpp2VPJYI6KagMJepuIGHQg+lS/S9
	CYvH44Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr1kz-00000006FUv-3dK7;
	Sun, 31 Mar 2024 20:26:21 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr1kr-00000006FUG-1REj
	for ath10k@lists.infradead.org;
	Sun, 31 Mar 2024 20:26:18 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id EC7931FA4F;
	Sun, 31 Mar 2024 22:26:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1711916765;
	bh=5jhCHaUlKtQAHxBedBly8GQUjQboC4x/vhqiptxebnA=; h=From:To:Subject;
	b=ASpYmpIygRIj2YpPIHsE169JqVKv/sLb1BN9WtDewBm1mXqYGqXaUXb+QYbEKflUe
	 FJDLj1rUy0yfqASBExeku4LhuavN4WgWfg4GTdDD0UsoAYeX2N6jIORvxgNG5TvmH4
	 yPB2B10ul8wW4vA6i+QsJaJh8xNJndknbatXfMOj/1T6veKX6CMKKQ7fd6WpvHffPL
	 xrB0knVifYPueBtF/j8q5qKXiLpLrhYLCYT9bHp97r8ddd8AgMXAHwSkTJuzjhGU9i
	 LtvwHoWBqI+X+R5XeRZfzeLIAOg35wugDdEXm8uJYp+s+hGq219bh/eTOvKSwsudWb
	 0xKxRFcT4UIDw==
Date: Sun, 31 Mar 2024 22:26:00 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Ajay Singh <ajay.kathat@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] wifi: marvell: mwifiex: replace open-coded
 module_sdio_driver()
Message-ID: <20240331202600.GA4116@francesco-nb>
References: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
 <20240329171019.63836-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329171019.63836-6-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_132614_444330_7F73F9D6 
X-CRM114-Status: UNSURE (   4.19  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Fri, Mar 29, 2024 at 06:10:19PM +0100, Krzysztof Kozlowski wrote:
> Use module_sdio_driver() instead of open-coding it.  No functional
> difference.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


