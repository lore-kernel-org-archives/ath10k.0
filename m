Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E0EC76196
	for <ath10k@archiver.kernel.org>; Thu,  6 Apr 2023 12:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=804RGw/9Bvnahd+vA+M17S596jcIQCmoxWDfQE5TguU=; b=326q7J792XERMl
	lhGUaiWWIfgnwia5jd/J/XmLVROxLT3zM6dopqMljvDoBqkcnpaun4uMHwwRVC0E/5sG3fRbSMVv4
	H7fjsy00xEp6xHgolX+FNgXQsRnIcZtoLPo4aDfBvAfJSLLAP9bzvUfZXecK/P9J3LgS/xK9tBOGr
	JJrtk3tLY23A8b/J81I8aAdy7fmQ8vVKv85WlllbPK7IBVPzAXEz56RcFiOj56kkW4h4jbsW0lU9C
	hcm/nkpi1WiodJyzkfDo/+q313xSAf549Tb2aIN4znzeQq3L9lTwdHQ4su1+gZdPbNABUm1rAkZ3k
	d/vauyY560qItoHPFQ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkP1v-007J1p-1V;
	Thu, 06 Apr 2023 12:47:55 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkP1r-007J0Q-2S
	for ath10k@lists.infradead.org;
	Thu, 06 Apr 2023 12:47:53 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-17e140619fdso42161611fac.11
        for <ath10k@lists.infradead.org>; Thu, 06 Apr 2023 05:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680785269;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BszaOi3VfoZ90tN4391m9kropE1X/xTMd1Swvq/J1lE=;
        b=NtR+IZ9VcoTQgmDXPUEON3pfOgGWBArcv03NXAb0O1uDxFNrCDuc3Tk/PjQNvDSd+M
         IaipBD3XXatRfvbbdQEOThhIjQaNnNOdSjqJmcuxz8guSZ2TLc9tJnJu+C7TVDWpV4XD
         TsREpirV0IWkTCvJiuqc41lltc+XZqxbPv0a8pZMFPnbfieXrPFT5fijdxNqqTrtK6JS
         oFM4Jgk2PEWNnUCcmUcnknHKI3sZnuctwhlMY5nyqEatZN1EVGd3Pq/7YSpCqtdYiQ/Y
         oAlFEHwoBtWPCpeOuUroVIjmYjydzhtqWFjB37G09h8chdibXjka4ovGmmiw9UaOmuJC
         SuGA==
X-Gm-Message-State: AAQBX9eQH6vyuUBRjair9ZekvttNTuQ8lSKI+tgxr+WmIUg6Oclp1lCE
	zmY/kRNDs+2X6rnXKWe76g==
X-Google-Smtp-Source: AKy350aHfgyvOlHaaUubqc72VI2bWEQERiHZhcTbdnBBZy5poL7MEMeWIJ+CFh5x5h3r+lFMOjwhQQ==
X-Received: by 2002:a05:6870:9615:b0:180:3fcf:9bb6 with SMTP id d21-20020a056870961500b001803fcf9bb6mr5498408oaq.26.1680785269237;
        Thu, 06 Apr 2023 05:47:49 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f7-20020a9d6c07000000b006a205a8d5bdsm651090otq.45.2023.04.06.05.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:47:48 -0700 (PDT)
Received: (nullmailer pid 2742580 invoked by uid 1000);
	Thu, 06 Apr 2023 12:47:48 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Eric Dumazet <edumazet@google.com>, linux-wireless@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Kalle Valo <kvalo@kernel.org>, Andy Gross <agross@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, ath10k@lists.infradead.org
In-Reply-To: <20230406-topic-ath10k_bindings-v2-1-557f884a65d1@linaro.org>
References: <20230406-topic-ath10k_bindings-v2-0-557f884a65d1@linaro.org>
 <20230406-topic-ath10k_bindings-v2-1-557f884a65d1@linaro.org>
Message-Id: <168078494959.2736424.13312532374051031538.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: net: Convert ATH10K to YAML
Date: Thu, 06 Apr 2023 07:47:48 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_054751_799644_F74A2079 
X-CRM114-Status: GOOD (  14.19  )
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


On Thu, 06 Apr 2023 13:54:04 +0200, Konrad Dybcio wrote:
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
>  .../bindings/net/wireless/qcom,ath10k.txt          | 215 ------------
>  .../bindings/net/wireless/qcom,ath10k.yaml         | 359 +++++++++++++++++++++
>  2 files changed, 359 insertions(+), 215 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.example.dtb: wifi@18800000: wifi-firmware: 'wifi-firmware' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.example.dtb: wifi@18800000: wifi-firmware: 'iommus' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml

doc reference errors (make refcheckdocs):
MAINTAINERS: Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230406-topic-ath10k_bindings-v2-1-557f884a65d1@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
