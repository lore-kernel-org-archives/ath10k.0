Return-Path: <SRS0=4y1J=OS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE447C433F5
	for <ath10k@archiver.kernel.org>; Tue, 28 Sep 2021 13:30:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4CD460FC0
	for <ath10k@archiver.kernel.org>; Tue, 28 Sep 2021 13:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4CD460FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvxWeoRQXQXlad0RAlOfuPoWX7D4GfOvIrx8BIQZN0Q=; b=pUzEyBY3L6byciY+GOoVPpIM9N
	hoH/leSbud2FLuO+4fE+yx7KhaaVwx30PCS6wT/7SeEdPFOW52dTjJxTZI1cRzTAPpdU1GGIwUDLX
	Ufqyw4kdC+zb5KrXm45nDcpw2ZiwjwEKTsmS3I8jUnZ6T3XYLQTcmmPzNrkT+Tj0inExk8ApXuuoh
	5tXUyX+eHtZRe7LaGtPnQZ7fTayEPklD7eToFLBhgfd6yIiZTdlA4SP7DVNh//8T9kCIsZJcBrWHe
	A22xPvc7sU7ck2JUamGHK9jbN25hUwZdaS+mAZwjrcL1Z//TZGoeUtTCI51TOcK1A4pAFZdUUkPPr
	/1cI0HYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVDBJ-007Kjr-VS; Tue, 28 Sep 2021 13:30:02 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVDBD-007Kgd-EY
 for ath10k@lists.infradead.org; Tue, 28 Sep 2021 13:29:57 +0000
Received: by mail-il1-x12c.google.com with SMTP id q6so9356049ilm.3
 for <ath10k@lists.infradead.org>; Tue, 28 Sep 2021 06:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KV5AEITggXzrcUqW0Pn0JDUCXvtzQQd7nfX6VcyNvh0=;
 b=gsEil9aJ5ZOw0ASchzCW/AY/NlZwbg7FdvHHAbffANcuyVgNVj8F3r/I3y/OyqwIbk
 QkY/gO8vfPAMQp75rG6vgEG7NkfLO4ZNSWbXrGEOjX3dKqow4MOof9p7GrAO13Ckl/VP
 f8/C6WiPIW+rxE9R7UiZnONtD/dro2yaem2kM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KV5AEITggXzrcUqW0Pn0JDUCXvtzQQd7nfX6VcyNvh0=;
 b=CPmbyDXv9vb87pkbEtqksj/32Wbxqm8zBlPaBP1tcbReV20OCo9TgP7a7AaDsUW0W4
 xmHkEy3xf9omotK4cFiTockJqO30Ru7m4TphE20BxOLYg5ztY3fiIj30zY4Lff0KM7k5
 57Vi76eAUZqF48cVdFFts5USEGL5P6Z7DH/87WHodIIXziiujBjTJ8RFg6ZejzejCNrd
 uwe4V5LHlaR0qQV3M0Qo9X3azyusKe5G995qpHoMBhrgFhj2UPDrko48MXoLVfG5KFCD
 Utvkk3KrKVxEUoYQGcHO6UvX8cBiaRD+ZlF8O1jNzSCXo6X3X8VZoiG8QgBW4x39bXYS
 vMeg==
X-Gm-Message-State: AOAM530whOBCo+ysCpiAMIKS8SaYvkS+l96yDUedaXPpjsgF/xRBrE+h
 zYlswv08rYQsB5ZfY+V5nKR8zQ==
X-Google-Smtp-Source: ABdhPJz3qmL3tZ3U3XkVDcDl9dtP+yn06EspPEdsou0GIPYBieCdKEZlaSYFieS9Yrw1uFrX87cOuw==
X-Received: by 2002:a92:c744:: with SMTP id y4mr4108077ilp.288.1632835791399; 
 Tue, 28 Sep 2021 06:29:51 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id m13sm11831997ilh.45.2021.09.28.06.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 06:29:50 -0700 (PDT)
Subject: Re: [PATCH 2/2] [v2] qcom_scm: hide Kconfig symbol
To: Arnd Bergmann <arnd@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 Kalle Valo <kvalo@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Joerg Roedel <joro@8bytes.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Alex Elder <elder@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Andy Gross <agross@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20210928075216.4193128-1-arnd@kernel.org>
 <20210928075216.4193128-2-arnd@kernel.org>
From: Alex Elder <elder@ieee.org>
Message-ID: <19bbc40d-3f13-7e9d-72c0-5d206b016bb7@ieee.org>
Date: Tue, 28 Sep 2021 08:29:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210928075216.4193128-2-arnd@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_062955_515571_E9D21ADF 
X-CRM114-Status: GOOD (  26.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 9/28/21 2:50 AM, Arnd Bergmann wrote:
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
>>>>                gpu/drm/msm/adreno/adreno_gpu.o:(adreno_zap_shader_load) in archive drivers/built-in.a
> 
> This can happen when CONFIG_ARCH_QCOM is disabled and we don't select
> QCOM_MDT_LOADER, but some other module selects QCOM_SCM. Ideally we'd
> use a similar dependency here to what we have for QCOM_RPROC_COMMON,
> but that causes dependency loops from other things selecting QCOM_SCM.
> 
> This appears to be an endless problem, so try something different this
> time:
> 
>   - CONFIG_QCOM_SCM becomes a hidden symbol that nothing 'depends on'
>     but that is simply selected by all of its users
> 
>   - All the stubs in include/linux/qcom_scm.h can go away
> 
>   - arm-smccc.h needs to provide a stub for __arm_smccc_smc() to
>     allow compile-testing QCOM_SCM on all architectures.
> 
>   - To avoid a circular dependency chain involving RESET_CONTROLLER
>     and PINCTRL_SUNXI, drop the 'select RESET_CONTROLLER' statement.
>     According to my testing this still builds fine, and the QCOM
>     platform selects this symbol already.
> 
> Acked-by: Kalle Valo <kvalo@codeaurora.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Changes in v2:
>    - drop the 'select RESET_CONTROLLER' line, rather than adding
>      more of the same
> ---
>   drivers/firmware/Kconfig                |  5 +-
>   drivers/gpu/drm/msm/Kconfig             |  4 +-
>   drivers/iommu/Kconfig                   |  2 +-
>   drivers/media/platform/Kconfig          |  2 +-
>   drivers/mmc/host/Kconfig                |  2 +-
>   drivers/net/ipa/Kconfig                 |  1 +

For drivers/net/ipa/Kconfig, looks good to me.
Nice simplification.

Acked-by: Alex Elder <elder@linaro.org>

>   drivers/net/wireless/ath/ath10k/Kconfig |  2 +-
>   drivers/pinctrl/qcom/Kconfig            |  3 +-
>   include/linux/arm-smccc.h               | 10 ++++
>   include/linux/qcom_scm.h                | 71 -------------------------
>   10 files changed, 20 insertions(+), 82 deletions(-)
> 

. . .

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
