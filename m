Return-Path: <SRS0=4y1J=OS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71665C433F5
	for <ath10k@archiver.kernel.org>; Tue, 28 Sep 2021 07:04:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22864611CA
	for <ath10k@archiver.kernel.org>; Tue, 28 Sep 2021 07:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22864611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPSq+joVZHF2TfxrZdYAtKZIiZzRVNSOVH76BJlX/wQ=; b=v2RvZ23jU/O+p5
	2jsLDp0ts4N036m2Zw5nTrnm0VwQGL+y6YZVB6Dn3bi1fLIMCqrXzK9r3IMCVzTGdJFo4K2lVzfs1
	S9voYCuxOnGcybAqDQPvLPu/dQpvRuR8euMWgeTQyu6LSmCgwLpHGmreXBn/BjcM9I1hcD4U9nehU
	y4AD6Aojby9aoyUmqVOG9ooEbNdHfaaYwPM7ygsQN3uHpCHll37HlyAOkugDQiw/mjPi/7CcSJcBa
	xcwngJ4+oVUDWuifJvmYsw2yjgr3M4EqaVCR0Rf1aNp5cXhqDwCT4ShoGh2qUdPsKb74ULJolJTaC
	0lU4c2Z61Y78HkBRV7Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV7A0-005wNl-Ju; Tue, 28 Sep 2021 07:04:16 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV79w-005wMc-MY
 for ath10k@lists.infradead.org; Tue, 28 Sep 2021 07:04:14 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632812653; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=mcC+NI9lbMYVHDFKxEvKMLG3JdbT8e+is/T3jV6QeT8=;
 b=JQ3z9SSjCqF/DU0FtNY2R0eNcouYZdrAyzA5s/bmi4s+Tfs9yaiCmmCTv8nPBeGl9txBCFmb
 0ziXvAmNSCKQaTPQvRj9/w+1zfq0pc0CKnId0WCazaPFyZrkTDq6PDbH0VM6380TaIxhK4qG
 XNiuXUv0gqd7KiJnCmDMSGWpnSo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6152be4b713d5d6f96206c8a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 07:03:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2AC69C43618; Tue, 28 Sep 2021 07:03:38 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9DA53C4338F;
 Tue, 28 Sep 2021 07:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9DA53C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,  Arnd Bergmann
 <arnd@arndb.de>,  Rob Clark <robdclark@gmail.com>,  Sean Paul
 <sean@poorly.run>,  David Airlie <airlied@linux.ie>,  Daniel Vetter
 <daniel@ffwll.ch>,  Joerg Roedel <joro@8bytes.org>,  Will Deacon
 <will@kernel.org>,  Mauro Carvalho Chehab <mchehab@kernel.org>,  Ulf
 Hansson <ulf.hansson@linaro.org>,  Alex Elder <elder@kernel.org>,  "David
 S. Miller" <davem@davemloft.net>,  Jakub Kicinski <kuba@kernel.org>,  Andy
 Gross <agross@kernel.org>,  Linus Walleij <linus.walleij@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,  Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,  Mark Rutland
 <mark.rutland@arm.com>,  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,  linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,  dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,  iommu@lists.linux-foundation.org,
 linux-media@vger.kernel.org,  linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org,  ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org,  linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] [RFC] qcom_scm: hide Kconfig symbol
References: <20210927152412.2900928-1-arnd@kernel.org>
Date: Tue, 28 Sep 2021 10:03:25 +0300
In-Reply-To: <20210927152412.2900928-1-arnd@kernel.org> (Arnd Bergmann's
 message of "Mon, 27 Sep 2021 17:22:13 +0200")
Message-ID: <87k0j1qj0i.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_000413_480219_FBBF7E13 
X-CRM114-Status: GOOD (  27.52  )
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

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Now that SCM can be a loadable module, we have to add another
> dependency to avoid link failures when ipa or adreno-gpu are
> built-in:
>
> aarch64-linux-ld: drivers/net/ipa/ipa_main.o: in function `ipa_probe':
> ipa_main.c:(.text+0xfc4): undefined reference to `qcom_scm_is_available'
>
> ld.lld: error: undefined symbol: qcom_scm_is_available
>>>> referenced by adreno_gpu.c
>>>>               gpu/drm/msm/adreno/adreno_gpu.o:(adreno_zap_shader_load)
>>>> in archive drivers/built-in.a
>
> This can happen when CONFIG_ARCH_QCOM is disabled and we don't select
> QCOM_MDT_LOADER, but some other module selects QCOM_SCM. Ideally we'd
> use a similar dependency here to what we have for QCOM_RPROC_COMMON,
> but that causes dependency loops from other things selecting QCOM_SCM.
>
> This appears to be an endless problem, so try something different this
> time:
>
>  - CONFIG_QCOM_SCM becomes a hidden symbol that nothing 'depends on'
>    but that is simply selected by all of its users
>
>  - All the stubs in include/linux/qcom_scm.h can go away
>
>  - arm-smccc.h needs to provide a stub for __arm_smccc_smc() to
>    allow compile-testing QCOM_SCM on all architectures.
>
>  - To avoid a circular dependency chain involving RESET_CONTROLLER
>    and PINCTRL_SUNXI, change the 'depends on RESET_CONTROLLER' in
>    the latter one to 'select'.
>
> The last bit is rather annoying, as drivers should generally never
> 'select' another subsystem, and about half the users of the reset
> controller interface do this anyway.
>
> Nevertheless, this version seems to pass all my randconfig tests
> and is more robust than any of the prior versions.
>
> Comments?
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

[...]

> diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
> index 741289e385d5..ca007b800f75 100644
> --- a/drivers/net/wireless/ath/ath10k/Kconfig
> +++ b/drivers/net/wireless/ath/ath10k/Kconfig
> @@ -44,7 +44,7 @@ config ATH10K_SNOC
>  	tristate "Qualcomm ath10k SNOC support"
>  	depends on ATH10K
>  	depends on ARCH_QCOM || COMPILE_TEST
> -	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
> +	select QCOM_SCM
>  	select QCOM_QMI_HELPERS
>  	help
>  	  This module adds support for integrated WCN3990 chip connected

I assume I can continue to build test ATH10K_SNOC with x86 as before?
That's important for me. If yes, then:

Acked-by: Kalle Valo <kvalo@codeaurora.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
