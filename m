Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDA1C6FD1D
	for <ath10k@archiver.kernel.org>; Fri,  7 Apr 2023 18:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQ5gpziN+usMnU8j2LmHb5XFtl9DCTbsmWRppU2uGKo=; b=08DKxFTJqKcEXr
	zcQ3LUS7zXwfIYeEGe4CnBKDxggtyOqCVWc7IIwEpkqAQ1YHi0eJdvtf7cUVJT/yyu9mNU1iggBLm
	0KjN+t8JOt86lx1iLIqMBfIVU2ILc3fzMJWSrA0h3j2p8A81m5slUdFGntHsPVWQQ3p07AoYlY4Gk
	+1DgvORKkSuM9hExZUX5xsqvm/mLqx1uW9dfoWIBOGBq80TveqCpSKqbWEvAIWuO6sgLKUQAsxR9P
	G2ohQBQDfrzv5sni2ZsuQcUTZnZ70qwYwMys5ANUR04cjKeVfIjlNBuhjlJBL3yb5W2Q85Nrkke4B
	/Hx+Typa+wjWoiVCxu8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkquT-00Au5b-0n;
	Fri, 07 Apr 2023 18:34:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkquQ-00Au4e-2N
	for ath10k@lists.infradead.org;
	Fri, 07 Apr 2023 18:34:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2022F6538F;
	Fri,  7 Apr 2023 18:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D14C433D2;
	Fri,  7 Apr 2023 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680892441;
	bh=hfcFjImYkaoNK57mAMP077eellND4IKRA635mra2rE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OZJcgklmTtlVvE5nhA3PKL4+tVnFI7COhkarip5Hrg5yjnjMg0+svTfWGpf9XolRc
	 G2fVjLxXihgg0xYu1STx8JkuXSdAm2pFEx5/h7izadsOA9IMpwZPoab4ueJyeGDeud
	 b9ngJL86HhCA9rR3pw1LzanUp8j+f/V0Qc8Ix+JMIvBiwiSJZVlf/LsbCeD176bvpl
	 xvgh6JhvaALvy9hSYdedIEY2H35Qui9k3CHA4IttHJwojY2Zbiv6xBXeK9yx3QpHwN
	 4mVhtnRmiqAdorgsdmhcgmGDxokOQDWW5yhc11ZjRFV2CWEtc30sh1ELxjvwx1MGy5
	 drK+a1Jwet56Q==
From: Bjorn Andersson <andersson@kernel.org>
To: "David S. Miller" <davem@davemloft.net>,
	Andy Gross <agross@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: ath10k@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/2] ATH10K YAML conversion
Date: Fri,  7 Apr 2023 11:36:46 -0700
Message-Id: <168089260339.2666024.1798307335025317148.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406-topic-ath10k_bindings-v3-0-00895afc7764@linaro.org>
References: <20230406-topic-ath10k_bindings-v3-0-00895afc7764@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_113402_813325_AD6F92A7 
X-CRM114-Status: GOOD (  10.01  )
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

On Thu, 06 Apr 2023 14:55:43 +0200, Konrad Dybcio wrote:
> v2 -> v3:
> - Ran dt_binding_check explicitly to uncover an issue with the
>   example - I had 2 levels of wifi-firmware{}.. Fixed that..
> 
> I hope you folks don't mind me resending so quickly, but it was a
> trivial issue. Patch 2 unchanged.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: sdm845-polaris: Drop inexistent properties
      commit: fbc3a1df2866608ca43e7e6d602f66208a5afd88

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
