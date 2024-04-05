Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB18ACD11C2
	for <ath10k@archiver.kernel.org>; Fri,  5 Apr 2024 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgdH5RgF8JE0MBK8gscRrh2GPwPpz/MfH6m5MgnN42Q=; b=JfcOpgGe3E9CtAzjugazHdE6Qc
	jZ0GWWGo8KfnIkFeJcnmunmtcWpEEYh0cD9ael9rNpH/0orwcKVt3URhgzUn41iXk3OWrtW+1wTaE
	XgoMgG08sC7ZGjtJ6q2NhBlGhrM88oyr7m0/loewteH9fatH9/Qw1oQ3bErQf05u1kzTgxEEgaP5j
	TI7h7QUtHHJ4NmvK7ewuVJEDUM8uq6Z4csngPRtNn7fwaF+w2MjqKLzuhrOQbFOf8Mp+3zDVq/jW3
	iI4uO6JsL9OKFpjvTxEfl6OSC/vb3l2vTJP+mqkU7dcRt98nBNjnfLCtR9Jn8TFXbcZNTBdYKNeiJ
	LhUtn3Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsfQk-000000064LF-0Yll;
	Fri, 05 Apr 2024 09:00:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsfQf-000000064Ji-4AnV
	for ath10k@lists.infradead.org;
	Fri, 05 Apr 2024 09:00:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 473B1CE366D;
	Fri,  5 Apr 2024 09:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBCEC433C7;
	Fri,  5 Apr 2024 09:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712307607;
	bh=+ALxXjaOWiaYOCohjxMrJ7edua6qjaGmpEgfgzxGPdE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=D6cUJsJ6ptGjtgJGSycHeBM1LR2HUz+dnED6ytP9tYH1OrBpwha3jsN/vHTMXrJ88
	 dS0Nhp+nvabnbGdik387gQ9D6WbYMQ1xv94g2lJq6J1sLyLNdx+X+SpgOoRJmsPzES
	 9qCTxTkfWtqzlGA4WLYvNvFkFtu+P7np93x9pSu0FcZNMXVK6JTdS1zxTqvdLmTu8+
	 Ws3DXzbcba35hxIleKyvAtBuJbxTyBWbdh1seJBSOWsK/ktAbGtogLEh5YTuR2IEiL
	 RZfY8kUoNyqqvbvr8/1T7GLbEX4nnRTq0plzA7r0l+TAzhc7KGtX6/6W8wipNCizDp
	 lYPeKefs6bpJA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [3/6] wifi: rsi: sdio: simplify module initialization
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240329171019.63836-3-krzysztof.kozlowski@linaro.org>
References: <20240329171019.63836-3-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
 Brian Norris <briannorris@chromium.org>,
 Ajay Singh <ajay.kathat@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171230760246.2149729.1844900006480308481.kvalo@kernel.org>
Date: Fri,  5 Apr 2024 09:00:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_020010_471362_C0C4D5D7 
X-CRM114-Status: UNSURE (   6.19  )
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

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> This driver's initialization functions do not perform any custom code,
> except printing messages.  Printing messages on modules
> loading/unloading is discouraged because it pollutes the dmesg
> regardless whether user actually has this device.  Core kernel code
> already gives tools to investigate whether module was loaded or not.
> 
> Drop the printing messages which allows to replace open-coded
> module_sdio_driver().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

4 patches applied to wireless-next.git, thanks.

73ec84df3469 wifi: rsi: sdio: simplify module initialization
718fcb7d7b3f wifi: wl1251: simplify module initialization
c33c93e9e96a wifi: wilc1000: replace open-coded module_sdio_driver()
170861bc0044 wifi: mwifiex: replace open-coded module_sdio_driver()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240329171019.63836-3-krzysztof.kozlowski@linaro.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


