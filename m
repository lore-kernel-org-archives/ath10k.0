Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168C8C76196
	for <ath10k@archiver.kernel.org>; Thu,  6 Apr 2023 18:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dL5aufgE0MQKAYHee3oYPMKWdnDs/Qu8k9ry8dYddO0=; b=i/Y9xtL49q7htV
	B3L99W40F/GTcBsP/aY+/o64NV4YAQ2QMA7RCPx4XP0Rhy0HOECPMkbW1dA1vjCE8nqptNvcMpIHw
	Y5MWnGh/hwRXUeBKsYR9YDgeGRR9Y7p3DaqiDAxfhDmPcmJGadZFs9HOCuIwW7McEMWV4356NN1pA
	/aJqFsiCnpu9PugfvfxP+75Xb+Oe9yfnYKCyFeD0iTsmo6GIkrK9CRjPqjRdI14U+bhSvNFnJsaJl
	Z8UHuNTt4MTfXl++yL0ZATBPz//ZHzQ30twuVoUPkVqGWv0PaYBhsEECLHsxY5e7nBCclsB4Jgxss
	Ko0Fq0gJ9wy+qAngqtbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUJe-008Fg3-22;
	Thu, 06 Apr 2023 18:26:34 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUJc-008FeJ-07
	for ath10k@lists.infradead.org;
	Thu, 06 Apr 2023 18:26:33 +0000
Received: by mail-lf1-x133.google.com with SMTP id br6so51947385lfb.11
        for <ath10k@lists.infradead.org>; Thu, 06 Apr 2023 11:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680805588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VrPZiBBEPnTeAG4ijDo3nsObeCJTrwIJDTUCNITg5iI=;
        b=CqY6xF+cOM6sbxvjz1Ff7fcQTniOYKz25DBG6qwejTmMEtsmz5R30IcQ4sXU09agqz
         P2PmuH6Zw2bKIlZNN6pfWhu8qqUxSJLAvzstuk0VDd9a90kRfEe2y3Ik22OCGmhp2uHV
         qModnBJcJBhDhgSwuY5jGg+eLZ4iDFenf1vxh/bGXh9z+V8icUiD9i5qAT/VXwbu7flL
         0KZIFha7SMukx/q98vET3mn+TYaju71P93US6xA8xhFUfIfhX8gZPoiCqVs9APcBPung
         hX3ctOJ+/HYMko8xKotKi0hFQXT2S9ekgcGnI/ptduyfF+3ahLqbNXocC5t04IHUe9Me
         q0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680805588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VrPZiBBEPnTeAG4ijDo3nsObeCJTrwIJDTUCNITg5iI=;
        b=DOPxPSHcKuFC4YDmX2l40sxr+8UvoVLPuAmcFq3+oURhaR2WlDyVAkqvQnCuBs0iNK
         OTKOMTVXcoWggCVnBXLiw5KSew9iinSYhWRCy+t4gFs8bFN/5PicgGohsVfDa1khR3q2
         DtBmECGMhTbNq98ZT4P9cLsDUxg8Ih5h/7XoBTAIu14ahOW9yT+D//G7tqAfbNvT31i0
         /wmVEzabWsFHyx3fTPicTJTGAvGzxZklyPMnGW2+M+bypvGFioORGEelmcU0cQyZ8+zl
         ITBZMplW2UIx9Jx6Z3HX7vHTP1isbYmJCT5ifXK0EopxOTSWhwu/3/IeJnt9Jwb3OS9o
         Ag1Q==
X-Gm-Message-State: AAQBX9dsvoELCG9vBteFDI6REeAp6QS32UZzAUEweUSgN//wgxpMvs3t
	9koFn3yNC7fdI6If+WSwq1bMRg==
X-Google-Smtp-Source: AKy350Zoz7gSPFtYZOf28QyZRifSrImimrPXqKp3I11ff3EWM5EclgyEAjZIR1qhjTDNBFSIbmszqQ==
X-Received: by 2002:ac2:43d7:0:b0:4eb:3b7c:233 with SMTP id u23-20020ac243d7000000b004eb3b7c0233mr18951lfl.16.1680805587873;
        Thu, 06 Apr 2023 11:26:27 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651204da00b004e88a166eb6sm368106lfq.46.2023.04.06.11.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 11:26:27 -0700 (PDT)
Message-ID: <8c818f95-b4a4-658f-701d-3151afdd5179@linaro.org>
Date: Thu, 6 Apr 2023 20:26:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/2] dt-bindings: net: Convert ATH10K to YAML
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230406-topic-ath10k_bindings-v3-0-00895afc7764@linaro.org>
 <20230406-topic-ath10k_bindings-v3-1-00895afc7764@linaro.org>
 <223892d0-9b1b-9459-dec1-574875f7c1c6@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <223892d0-9b1b-9459-dec1-574875f7c1c6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_112632_072695_69F7ED7E 
X-CRM114-Status: GOOD (  14.87  )
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



On 6.04.2023 19:15, Krzysztof Kozlowski wrote:
> On 06/04/2023 14:55, Konrad Dybcio wrote:
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
> 
> 
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,ipq4019-wifi
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          minItems: 17
>> +          maxItems: 17
>> +
>> +        interrupt-names:
>> +          minItems: 17
> 
> Drop minItems (the number of items is defined by listing them below, as
> you did).
OK

> 
>> +          items:
>> +            - const: msi0
>> +            - const: msi1
>> +            - const: msi2
>> +            - const: msi3
>> +            - const: msi4
>> +            - const: msi5
>> +            - const: msi6
>> +            - const: msi7
>> +            - const: msi8
>> +            - const: msi9
>> +            - const: msi10
>> +            - const: msi11
>> +            - const: msi12
>> +            - const: msi13
>> +            - const: msi14
>> +            - const: msi15
>> +            - const: legacy
>> +
>> +        clocks:
>> +          items:
>> +            - description: Wi-Fi command clock
>> +            - description: Wi-Fi reference clock
>> +            - description: Wi-Fi RTC clock
>> +
>> +        clock-names:
>> +          items:
>> +            - const: wifi_wcss_cmd
>> +            - const: wifi_wcss_ref
>> +            - const: wifi_wcss_rtc
>> +
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +        - interrupts
>> +        - interrupt-names
>> +        - resets
>> +        - reset-names
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,wcn3990-wifi
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 1
>> +          items:
>> +            - description: XO reference clock
>> +            - description: Qualcomm Debug Subsystem clock
>> +
>> +        clock-names:
>> +          minItems: 1
>> +          items:
>> +            - const: cxo_ref_clk_pin
>> +            - const: qdss
>> +
>> +        interrupts:
>> +          items:
>> +            - description: CE0
>> +            - description: CE1
>> +            - description: CE2
>> +            - description: CE3
>> +            - description: CE4
>> +            - description: CE5
>> +            - description: CE6
>> +            - description: CE7
>> +            - description: CE8
>> +            - description: CE9
>> +            - description: CE10
>> +            - description: CE11
> 
> What about interrupt-names here? If they are not expected, then just
> interrupt-names: false
They obviously wouldn't hurt, but they're unused on the driver side:

for (i = 0; i < CE_COUNT; i++) {
		ret = platform_get_irq(ar_snoc->dev, i);

So I will forbid them.

Konrad
> 
> 
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
