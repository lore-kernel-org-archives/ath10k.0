Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA0CCD1284
	for <ath10k@archiver.kernel.org>; Thu,  4 Apr 2024 10:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kf5fdQAo8a5tkr3LVDPMevxX+JPfaHoeszYBlngAvXA=; b=GGIYzwExZamWVdSyFx63bdS5kD
	ftLyi6vO1kjo4WrCuJIlgS39oCt1c3RY5T84yr2bgxRp5i4F7LXv/0WrCdRKi9JQ0psXJQeH7h0ze
	XdrfOkpkKBDwr1YZvmukdWoKGI8EsLL9wWL2EO8ifQzgZlhHwl48TMRsxAgYm0bLPi9zaJo20Vfwf
	r2K4tAtVzQExaAC78ww4vt5AiCJ3rAy7mbZTCbMrVnP9KG4uA6WP8CdCemTvraKd3O1CFvL4QCzki
	LeqQsbEbFH6nUTPdpV0xYm/gVhqMoGxEvtbE2qj6KxmohM/VzvJH4tN4F7fAECA98Roj4k4hwzeL7
	1fAUpBlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsK5r-000000028xt-3vee;
	Thu, 04 Apr 2024 10:13:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsK5o-000000028vm-2SNb
	for ath10k@lists.infradead.org;
	Thu, 04 Apr 2024 10:13:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C60F4CE30A3;
	Thu,  4 Apr 2024 10:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28935C433C7;
	Thu,  4 Apr 2024 10:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712225590;
	bh=ov/eEmo4hI8DNy7UxuewIgS81uubOwPI939mMAuO5Sk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=MfDQu68wdj0+Gt+hGh32IxxTl+2WxdimEZwggEOKt4TcerYqgIs/eEf1y6z++L3NR
	 Nodp/ttcxthuQywCuam2suW5SiThDG1zKQBP+68eojlP7PLA77Gy9zrjVHLGWHVxqQ
	 4W/vQbgCin/d6bjG2gkHD/bBnyRZ1HOcEpfb1xOhJGvciXiuUxqtfl7BlfqjR0Xihf
	 XQ75LqUJrRxN6K9kZ3nu9ud4+y/264FVfhgJY/Vmcn1RMBY1MxgT9ytWDn0k7ZzJn0
	 tiRhyaaaQSUFklVMUIQnjSpUC2a+wuFlgmROOtCEEwSq6uj5B03jX4lBYURxCoDzbp
	 5XDjn3h1DlZ9w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/6] wifi: ath6kl: sdio: simplify module initialization
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240329171019.63836-2-krzysztof.kozlowski@linaro.org>
References: <20240329171019.63836-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
 Brian Norris <briannorris@chromium.org>,
 Ajay Singh <ajay.kathat@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171222558545.1806092.4218541650720633810.kvalo@kernel.org>
Date: Thu,  4 Apr 2024 10:13:07 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_031312_840137_C0F4FA41 
X-CRM114-Status: UNSURE (   6.60  )
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
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

565759ce814a wifi: ath6kl: sdio: simplify module initialization

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240329171019.63836-2-krzysztof.kozlowski@linaro.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


