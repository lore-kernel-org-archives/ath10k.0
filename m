Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD3CC7618D
	for <ath10k@archiver.kernel.org>; Thu,  6 Apr 2023 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLKP9iYILB10f5AKD02I/OCcMSb8UTPsMKKYg9yX3qo=; b=XQpWiuOY6g6HeE
	OobS/nx7BH6DdGwZji6hkGwZ0CsTB9488W6tZfprEumAINr8JiCe6Dpz9TayDsMuMnHDd1BuaIAEI
	U90OYTu0SKXz5qWDTPPcyJwBSETswZxzj9Q/Z+ZvdJCFaugLVt9QwsVvmWWgNEa9UZfL24l7ZYvn/
	u08BxYw/q/hNwOVF4eNyx9YEWQRPtAAFWzdEEGp4dFaiu9uVxqVAxWy7nDryFcza3k7lFl+xTiGEs
	Vx+kOmlRfEeD9hFPJtBRFNKBJGtA8xgrgLn/5Fj7eR0PK8Uw51hrfcvWxibIZaSJpPd4hG/jfaPDU
	3MbjNegN/ykLEoCIReSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkT7d-0085eO-0s;
	Thu, 06 Apr 2023 17:10:05 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkT7a-0085co-1X
	for ath10k@lists.infradead.org;
	Thu, 06 Apr 2023 17:10:03 +0000
Received: by mail-oi1-f178.google.com with SMTP id r14so23869896oiw.12
        for <ath10k@lists.infradead.org>; Thu, 06 Apr 2023 10:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680801000; x=1683393000;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aznOVjaPJTvuXKx1gmzX1wmBBoPOixwVKU/ceJyrGsk=;
        b=ePawrpN+GDXd0/i5sQsRR28Uq2oJU7aLsD8v3Ftu08xML/8EwcDuQqMXZ/FStVC+s2
         Tn0/L9njLmjtynTvB0L7Ir96p39inzcKIMEDdBBmwhKI9rYPkZhC4qSxEihxLedU6/Up
         DmbwtTF34H7soOqdCzeLp1xtUbeAYLaNOzcT09Z75lYvg6MBYoDHKy+mtiI/vUQc6OPB
         ZEHS+OqidVH3C58a0ep5bHLcNj/+9qErnfIpCodcHpC8saIV/yGSIYQ82hfZ6uiNrG3h
         Jmr/6nqY8QkAPB0nJCNbN2pqjUGK5DHNYWm6SEf44eEnQJAXkSQ+gtGTGGnQfxAfJ4LW
         vf0g==
X-Gm-Message-State: AAQBX9eaAlptTnKzb+Z2oWz8HIWrPPABOJH4baZeuGgDNVJYVvjImbgD
	9XBaXAK6yFJpLtVRwvWtYQ==
X-Google-Smtp-Source: AKy350aJ6h65ENKDGuv6javi5hpdIYx3FtFdawgKK8IQG5QLN2+FWPP1Sks4yTp40K/P+Ldr/TLnNQ==
X-Received: by 2002:aca:1a09:0:b0:387:3239:61fa with SMTP id a9-20020aca1a09000000b00387323961famr4415278oia.30.1680800998716;
        Thu, 06 Apr 2023 10:09:58 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k9-20020acaba09000000b00387367989d7sm878253oif.23.2023.04.06.10.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 10:09:58 -0700 (PDT)
Received: (nullmailer pid 3363580 invoked by uid 1000);
	Thu, 06 Apr 2023 17:09:57 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>, linux-wireless@vger.kernel.org, Andy Gross <agross@kernel.org>, Kalle Valo <kvalo@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, ath10k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20230406-topic-ath10k_bindings-v3-1-00895afc7764@linaro.org>
References: <20230406-topic-ath10k_bindings-v3-0-00895afc7764@linaro.org>
 <20230406-topic-ath10k_bindings-v3-1-00895afc7764@linaro.org>
Message-Id: <168080086267.3336076.3393733023108971913.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: net: Convert ATH10K to YAML
Date: Thu, 06 Apr 2023 12:09:57 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_101002_520557_C09AF840 
X-CRM114-Status: GOOD (  12.75  )
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


On Thu, 06 Apr 2023 14:55:44 +0200, Konrad Dybcio wrote:
> Convert the ATH10K bindings to YAML.
> 
> Dropped properties that are absent at the current state of mainline:
> - qcom,msi_addr
> - qcom,msi_base
> 
> qcom,coexist-support and qcom,coexist-gpio-pin do very little and should
> be reconsidered on the driver side, especially the latter one.
> 
> Somewhat based on the ath11k bindings.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/net/wireless/qcom,ath10k.txt          | 215 -------------
>  .../bindings/net/wireless/qcom,ath10k.yaml         | 357 +++++++++++++++++++++
>  2 files changed, 357 insertions(+), 215 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230406-topic-ath10k_bindings-v3-1-00895afc7764@linaro.org


wifi@0,0: reg: [[65536, 0, 0, 0, 0], [50397200, 0, 0, 0, 2097152]] is too long
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb

wifi@18800000: 'qcom,snoc-host-cap-skip-quirk' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
