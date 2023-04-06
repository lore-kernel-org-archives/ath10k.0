Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FACC7618D
	for <ath10k@archiver.kernel.org>; Thu,  6 Apr 2023 18:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GY9jU+PsFwD3NOjq6CDXr6CCzOBeK83FSKr7UgXpkyo=; b=DlJcZTNQeCRq8s
	FSYKHI1bWEsC3EhSBhK3wmCK7Wks4TWBe9AiNroiiaJMGJBDIr46W/UxDxSPsbCFva69ZE81Y6nGh
	AMRi7QezIpvYLGzxHDAOnA+Pf99IcS+MYOtr3m1grFegOTnhyo4y9F5RWhsI0JXSdtONM+ucV+apM
	CUuBpOAo44hebLu2/sf48zmFotSZZBbdrhdi9IAIm4D6R2viJ5sL0RrDwSbB0Y6TRnntsM2c2Qa4n
	zRLjgy+Dw2wjm5Qpjqwd2MParMgwXEqv7JksV8CbdXtG7eRLHAklpthJF6dQrGPaZ0qVx4poODQov
	7YvQ1SQWADGESgSGBQfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUNs-008GZg-0N;
	Thu, 06 Apr 2023 18:30:56 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUNp-008GYH-0F
	for ath10k@lists.infradead.org;
	Thu, 06 Apr 2023 18:30:54 +0000
Received: by mail-ej1-x635.google.com with SMTP id cw23so3578048ejb.12
        for <ath10k@lists.infradead.org>; Thu, 06 Apr 2023 11:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680805852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x/9T8X0aJGHx3fxYyKXLVBxSn1+GBp9A84npgBtxwpQ=;
        b=rTJAZMeAk8kQps82Fl2QjyfHxMfDmnwPODIiNEWQF04PsneOdC7VSCbZ4UexBAQ6js
         SwPlM7FXnVBx1GyrIpIAskjllZGuoN1u8WayX9TrPXS9y3CaPQpbKY5CxTtjDzs+Pk/D
         Uhkg/Wr/ZOl7A4PIY4qgY6FPv1RRG2G8lhG5iRVBSEnqE5p9qmSREBHupbthnA6MYsWC
         KcAwmVzgeXUi7XfDE6EVTPY3elVw2K/wGcP/paiCYepU1smywjlhxlUEZFAb/8cKBiNF
         ki8BK9tOVsU6/T1pEKBNjYxilS7F/8wVv3lNhNZ6iSVh6Dv9WFI3o1eyslRjXj3/GPcM
         7bRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680805852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/9T8X0aJGHx3fxYyKXLVBxSn1+GBp9A84npgBtxwpQ=;
        b=o1pK5DWEEAOniL/k+8YIpD4a4O8TDpLedwvlqRlyTsVi2d2gWbnkSkpnn7IFcBCGCy
         SDSMW+Pi4VOvUF2fe4c64pZZSOOBD9vNR9PvotxfzLUfHO0qIWxRR+j9cv2MDm5IgHLH
         aCYlBm+gsTlzfGu1ga7pdU76924shc4j3R3xIrbzTIOkIcfmuekJV375/yxepmdifXR2
         LZJbdMXM/KfMSWzR/+3zNIkSQvFKz+sraH4VufGaJGgFZ5Lqqjt5Ii81xf+ZF7kTjxMe
         tqDD/egN48M9GIpy5e66e8WjgzfyCSpGLtS2jTKv4XzNSFIoMHuNUQ8HkvNDKvnTOwJI
         PCXQ==
X-Gm-Message-State: AAQBX9cPmB8JguaQehB64KmDbfbySv9Yf1tjTCYS2Zr4mvDmxQAE9wFc
	Ri2Wk8UfT0IQJf6rdIsbx7Dmnw==
X-Google-Smtp-Source: AKy350bDMKSCylnIPj1Ksoj4IJGQIYTiAs8Q2jfaOhuGPgSR8H22JsRbXfT+Le5UTWJl6pi5F11lzg==
X-Received: by 2002:a17:907:9870:b0:944:18e0:6ef2 with SMTP id ko16-20020a170907987000b0094418e06ef2mr6970633ejc.73.1680805851773;
        Thu, 06 Apr 2023 11:30:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id i18-20020a170906251200b009447277c2aasm1124481ejb.39.2023.04.06.11.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 11:30:51 -0700 (PDT)
Message-ID: <6720f61e-550f-6e16-8860-54233a3ea069@linaro.org>
Date: Thu, 6 Apr 2023 20:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/2] dt-bindings: net: Convert ATH10K to YAML
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230406-topic-ath10k_bindings-v3-0-00895afc7764@linaro.org>
 <20230406-topic-ath10k_bindings-v3-1-00895afc7764@linaro.org>
 <223892d0-9b1b-9459-dec1-574875f7c1c6@linaro.org>
 <8c818f95-b4a4-658f-701d-3151afdd5179@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8c818f95-b4a4-658f-701d-3151afdd5179@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_113053_113245_3B31D753 
X-CRM114-Status: UNSURE (   9.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 06/04/2023 20:26, Konrad Dybcio wrote:

>>> +        interrupts:
>>> +          items:
>>> +            - description: CE0
>>> +            - description: CE1
>>> +            - description: CE2
>>> +            - description: CE3
>>> +            - description: CE4
>>> +            - description: CE5
>>> +            - description: CE6
>>> +            - description: CE7
>>> +            - description: CE8
>>> +            - description: CE9
>>> +            - description: CE10
>>> +            - description: CE11
>>
>> What about interrupt-names here? If they are not expected, then just
>> interrupt-names: false
> They obviously wouldn't hurt, but they're unused on the driver side:
> 
> for (i = 0; i < CE_COUNT; i++) {
> 		ret = platform_get_irq(ar_snoc->dev, i);
> 
> So I will forbid them.

Assuming DTS does not have them.

Best regards,
Krzysztof


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
