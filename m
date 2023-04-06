Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D39C7618D
	for <ath10k@archiver.kernel.org>; Thu,  6 Apr 2023 12:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Thgha4FjEMeZadEncX0D/RMBfQ+z/fg/VQMovDW+1Og=; b=arpkuwXKD/77xp
	ApaMpnU1k1twreFgCKBqBTTGyG3zhElP1bCcmrsFCN77/aSYdZOVveNrxuK+Sg7BYefxnWBsuQrlG
	5ALAPYXdBr1vE9IZ/t7ohLWYPAH/A5yuIYu6ppdt+lmUd2moECxXY7dxeMHlL8fKM1lho7BTWDUXo
	42dPe9TAmy/QdOCm2aFdFyq895XSeCDbjuVvdEnRgtIbn3ex7JTiW1b2cBag7zNNRl1IRl5YjFsHd
	R2/pbBljM8XK8ytA16jJXi2/0mJ+qzsVQGe6ZkF8uWardmulOt0oNamJWaZdeh9vtiIl5bRm9nRA6
	DctMf1ly/NfUwS+zu97Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkP6y-007KWq-0R;
	Thu, 06 Apr 2023 12:53:08 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkP6t-007KTZ-2t
	for ath10k@lists.infradead.org;
	Thu, 06 Apr 2023 12:53:05 +0000
Received: by mail-lf1-x12a.google.com with SMTP id j11so50635790lfg.13
        for <ath10k@lists.infradead.org>; Thu, 06 Apr 2023 05:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680785579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lbC+iDQolRLSwOunJ/j7FQP3aZrBUa7C2T5gWVYhv6I=;
        b=zvpzUfUNH0GaukXLBpAPf+hyShEdxGxtOyRluKQdxEtL4QovW/AkW/ylzw1ZaXMDtA
         k/3W7Pick4ECwKGVjnf06RQCkdb0mN2xE5IeE5sv9Gw2IIutccQwQx/++EOHPlzdMsH6
         GsjLFOKt7NNvQhsfj8bEYMC27jBNpDMUcg91xXE1rK0VCaBb+iA0U8R/0NIO1JRQKZ2m
         LPtPSJirHSB05LBpEne3q/R8NhgqnwbqW+Plwu7B8Bst4cKi8Sd/lyZiZVytq/9e9P70
         kPjQK++aERFwC1g5gXjSODs39UIli3d8luM642smqM6GgAauZWGZh+n0ekiDfxoBeyrW
         TNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680785579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lbC+iDQolRLSwOunJ/j7FQP3aZrBUa7C2T5gWVYhv6I=;
        b=FVKij3zU5Kc9uloFswvXDwFtKujUaZSlj9sWMA7J7C0AQQkg+oW7S0XJY8h3PUsqjg
         k2n4NcSEwwSXTdN+TghDYjDPa7QaMMGdt45sniymWJOjEHmLHqjOJ6hJ0sRr9tp5nR33
         bD3nhFFOZt0EpCl1fwArkO/gnrgnO85Vka3NyeS6LM/1c1541d7HAs5X9DuQYfe3r07m
         a49AE8fe/kx8/latOiAdJsIukqIJ+/l9YyH84HBpnhXinIp/bAbhl2pkSPJ6JsifKovJ
         4gBzUxwAnL87ZnvjPYq7358ateH63DdDEAJSOT3YWHSo6lm+FX8I9DJw/zlrNtOLnPQn
         ta5g==
X-Gm-Message-State: AAQBX9dwsS8huleSgnNNKKX0hAo0TtcRs1VlxCZwwfEoGfMzELqj2u83
	3zSz+yYz0MiJ4wNUMZsqJ5KBAg==
X-Google-Smtp-Source: AKy350b/+CKd1ZodmBJD15FdPa3PXTOhvJljgBnSb42oOTa4LlbkXPdGlX4ifOYVKBresOlnli8ugA==
X-Received: by 2002:a19:ae03:0:b0:4ec:5648:70e4 with SMTP id f3-20020a19ae03000000b004ec564870e4mr158178lfc.12.1680785578924;
        Thu, 06 Apr 2023 05:52:58 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id y2-20020ac24462000000b004db1a7e6decsm249856lfl.205.2023.04.06.05.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 05:52:58 -0700 (PDT)
Message-ID: <857aa6c9-3dcb-d5f7-14bb-6c69c9167b09@linaro.org>
Date: Thu, 6 Apr 2023 14:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: net: Convert ATH10K to YAML
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, linux-wireless@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 ath10k@lists.infradead.org
References: <20230406-topic-ath10k_bindings-v2-0-557f884a65d1@linaro.org>
 <20230406-topic-ath10k_bindings-v2-1-557f884a65d1@linaro.org>
 <168078494959.2736424.13312532374051031538.robh@kernel.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <168078494959.2736424.13312532374051031538.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_055303_934440_577EF31C 
X-CRM114-Status: GOOD (  20.85  )
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



On 6.04.2023 14:47, Rob Herring wrote:
> 
> On Thu, 06 Apr 2023 13:54:04 +0200, Konrad Dybcio wrote:
>> Convert the ATH10K bindings to YAML.
>>
>> Dropped properties that are absent at the current state of mainline:
>> - qcom,msi_addr
>> - qcom,msi_base
>>
>> qcom,coexist-support and qcom,coexist-gpio-pin do very little and should
>> be reconsidered on the driver side, especially the latter one.
>>
>> Somewhat based on the ath11k bindings.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../bindings/net/wireless/qcom,ath10k.txt          | 215 ------------
>>  .../bindings/net/wireless/qcom,ath10k.yaml         | 359 +++++++++++++++++++++
>>  2 files changed, 359 insertions(+), 215 deletions(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.example.dtb: wifi@18800000: wifi-firmware: 'wifi-firmware' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.example.dtb: wifi@18800000: wifi-firmware: 'iommus' is a required property
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> 
> doc reference errors (make refcheckdocs):
> MAINTAINERS: Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230406-topic-ath10k_bindings-v2-1-557f884a65d1@linaro.org
Oh, CHECK_DTBS=1 doesn't run dt_binding_check and I didn't run that
explicitly before resending.. my bad..

Konrad
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
