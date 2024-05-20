Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1904C25B78
	for <ath10k@archiver.kernel.org>; Mon, 20 May 2024 11:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0Ec5iz9gumfwzfet9wOhb0ysPpkBmaxasJ9jxZiL3c=; b=Wdj2adY62s3RAHXpfTUbOhON+R
	0guklh0KOojLJDclgnAccLInH+lR8MsWv1ONzRAEzyTTIMo/s2mi0jpC/xsxeUde8cJhukijaogCO
	o6b+F6XT26gq7rLFQzsAR4MPGgG+WXr1SA8gribuDL/W6TVMFIg/SMo6PhEHaHv6jhZZwd9UBVid1
	nZGH0SUbD8KFLJ0DBfLrk3ts6UWc+xQtdXvFI87RQchHnflhkqUY2X3mLU7SV6uxqycCz/c2+meqX
	Gsrv+pivPvvcbdY8NMKtzQPLyy4izPca7ARpKQwMnT/P97FlI/yDPeM+naXiZDUd7MdNkK9vZbmRf
	5y5uIJzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s91aX-0000000ENMV-2B9b;
	Mon, 20 May 2024 11:53:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s91aU-0000000ENKn-2GoY
	for ath10k@lists.infradead.org;
	Mon, 20 May 2024 11:53:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FD0261C60;
	Mon, 20 May 2024 11:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585C4C32786;
	Mon, 20 May 2024 11:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716206033;
	bh=2WwHBbsRsDH0dHOTZXtm084FWAB/MmhOE+E7Q3OpKjs=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=fETqUVCPRuxgPfRzBudNAVaSdOqbxPlZfQlxuTvVBHVaa1dcu8pLOoCY1ZA3U0DBu
	 w7Gp1mhLekdmLP9UsT4dXD3YSHmSA8XD8GT0qTyzcfSOeC3L/m+L8QgORrherbCGFN
	 TVcVE14YFlQ+pr59tR6z5tjhF2MiRZbdWFdOUiCL6v0xvtDEMLcGfCu8I1SvRlc521
	 5pcoIpFJPwDFsiny3XgqIAuQs0oRZOPu91GbyszpI6ypnbSZPNk4bhl1i73cDA+NP2
	 pCRyyYevtGZO4wlM+KDUN1tf3SM9HdNx/5evmynHsjLJT8ANMJwJAhwLC2pyOhNkX6
	 /+pRS7xnOQVPw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath10k: fix QCOM_RPROC_COMMON dependency
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240511-ath10k-snoc-dep-v1-1-9666e3af5c27@linaro.org>
References: <20240511-ath10k-snoc-dep-v1-1-9666e3af5c27@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Rakesh Pillai <quic_pillair@quicinc.com>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171620602925.3753090.14163848910895303019.kvalo@kernel.org>
Date: Mon, 20 May 2024 11:53:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_045354_719963_E52EEDD0 
X-CRM114-Status: UNSURE (   8.21  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> If ath10k_snoc is built-in, while Qualcomm remoteprocs are built as
> modules, compilation fails with:
> 
> /usr/bin/aarch64-linux-gnu-ld: drivers/net/wireless/ath/ath10k/snoc.o: in function `ath10k_modem_init':
> drivers/net/wireless/ath/ath10k/snoc.c:1534: undefined reference to `qcom_register_ssr_notifier'
> /usr/bin/aarch64-linux-gnu-ld: drivers/net/wireless/ath/ath10k/snoc.o: in function `ath10k_modem_deinit':
> drivers/net/wireless/ath/ath10k/snoc.c:1551: undefined reference to `qcom_unregister_ssr_notifier'
> 
> Add corresponding dependency to ATH10K_SNOC Kconfig entry so that it's
> built as module if QCOM_RPROC_COMMON is built as module too.
> 
> Fixes: 747ff7d3d742 ("ath10k: Don't always treat modem stop events as crashes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-current branch of ath.git, thanks.

21ae74e1bf18 wifi: ath10k: fix QCOM_RPROC_COMMON dependency

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240511-ath10k-snoc-dep-v1-1-9666e3af5c27@linaro.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


