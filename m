Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76744C77B70
	for <ath10k@archiver.kernel.org>; Mon, 17 Apr 2023 13:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ku1dBQjc8p0fixYCRQECASFoL9xl7bZBTv/PtDLNswQ=; b=vZjWKzVV87xfPe
	6Sv1Oebec4lVgDp7IoHNyypZDYugXviRHlHmIYQKHMscYdu1tQybxonTEmy7/MkOiPFEDNpLmqI2P
	mPeRtMYj8eC62pqzFo74/5MH7nK8QB/m8hd0B0GGk5cW5sfsyvXPTyfhQDTyeRj6Qh2lKQZmQuVS9
	aeeRD/lt9X/q2VvftoCQz8DppQ8GGIz2AvskYE9P2lBiqJy1UnUKUw7dmv4gsKoiGq5k/KJLCpw8y
	yt9sClFUshlzi+S+1o2mtKKHUxGcY8E2T5w8XGdjH/h/0OAXWcvmJ83rUqCI1f7jf/SEquEhLKj9U
	viljwd7vtpavynr0QsIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poP2i-00GQh4-1d;
	Mon, 17 Apr 2023 13:37:16 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poP2d-00GQdV-1H
	for ath10k@lists.infradead.org;
	Mon, 17 Apr 2023 13:37:13 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2a8b8aea230so13094171fa.0
        for <ath10k@lists.infradead.org>; Mon, 17 Apr 2023 06:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681738622; x=1684330622;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ajiTsFHjF5bEfn/T0pz497Y4T0W30EVlD5XZiWzW1G8=;
        b=k5Ai8lynqBteD3+ZaXcqgNcsEUo5d6I1KDWEBPrXfHBbhz0GPJDjV+iWgcELffFW2N
         T36YVT2Sy86NuQbvuMLTjodQ0XE3EhFULHLnHvQL09KakbwiDeB9ucZe8XqUj/CXRlSq
         y+WC08aV7bI8zAmgTCxNzlYSLx1NmTVjh80jQmF4d5iM4PYnwi07FcBdx5Rv/ZV5ChPU
         c2XTYkbs9qGVbJRcSVDiCT80JnDIQgpQvPJc49GEyYnTpSOcaJKRcMZZK49DouhhCho3
         7vYIY/lZFf8B8w3lBpnziyPT6B9YA4JVLUswFvsV6lq6RLwnoPuzLu6lhQfowSwA7gho
         WU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681738622; x=1684330622;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ajiTsFHjF5bEfn/T0pz497Y4T0W30EVlD5XZiWzW1G8=;
        b=dk6xmf+O9sf+GJz1xmXjSNi36ngMOmole4OVfQfKTSK8hDnqQhoSkoaW/y+4NHgurQ
         OEVM/2tmafLEUDEHsmvz2FFb05HMzcUHCTbCuOUjmW3QM9FkHvBt0Ajpz7bND8LZGoAQ
         uMFUbFJhP9ThPkn2gm6nBkZm/P5QQB9yLR0xSdhBdzHz75WcJ1Y8+CIBlmhCfIjo1anS
         LW421BtvuKCMWYS8CzrJVTnflHzLBkJfbLS8EhlubUsSS4AV/CSicGLZe2oGczPLRMec
         iCx9VU77vuMlP94CBQPTJcJ3QgifShjpTtZN2Z4Nuq+QAMfXA1KpAeW21HeGoWOieBMD
         /JpQ==
X-Gm-Message-State: AAQBX9d3A6VJxQFQOBziz0DhIvfYiPH1FGeNYOfIw0oAl+2p6Ur+olGu
	vA7m6Bylj+bQ1mQTj/yDBj+z1Q==
X-Google-Smtp-Source: AKy350bqpmBwO7pT6gTJyyulqIMk2WplO3I3p5A9atMkIk4oS8bLgIA8QDfDyLRF7NBH71KIU62zxQ==
X-Received: by 2002:ac2:4c2f:0:b0:4ec:b1bf:a55b with SMTP id u15-20020ac24c2f000000b004ecb1bfa55bmr1642956lfq.24.1681738621717;
        Mon, 17 Apr 2023 06:37:01 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
        by smtp.gmail.com with ESMTPSA id u6-20020ac243c6000000b004e7fa99f2b5sm2061422lfl.186.2023.04.17.06.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 06:37:01 -0700 (PDT)
Message-ID: <8a6834d6-8e5a-3c48-8a04-8d9c4d160408@linaro.org>
Date: Mon, 17 Apr 2023 15:36:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4] dt-bindings: net: Convert ATH10K to YAML
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20230406-topic-ath10k_bindings-v4-1-9f67a6bb0d56@linaro.org>
 <87pm82x1ew.fsf@kernel.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <87pm82x1ew.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_063711_433262_88135A1D 
X-CRM114-Status: GOOD (  18.38  )
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



On 17.04.2023 12:12, Kalle Valo wrote:
> Konrad Dybcio <konrad.dybcio@linaro.org> writes:
> 
>> Convert the ATH10K bindings to YAML.
>>
>> Dropped properties that are absent at the current state of mainline:
>> - qcom,msi_addr
>> - qcom,msi_base
> 
> Very good, thanks. Clearly I had missed that those were unused during
> the review.
> 
>> qcom,coexist-support and qcom,coexist-gpio-pin do very little and should
>> be reconsidered on the driver side, especially the latter one.
> 
> I'm curious, what do you mean very little? We set ath10k firmware
> parameters based on these coex properties. How would you propose to
> handle these?
Right, I first thought they did nothing and then realized they're
sent to the fw.. I never amended the commit message though..


> 
>> Somewhat based on the ath11k bindings.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> [...]
> 
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
>> @@ -0,0 +1,358 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies ATH10K wireless devices
> 
> [...]
> 
>> +  wifi-firmware:
>> +    type: object
>> +    additionalProperties: false
>> +    description: |
>> +      The ATH10K Wi-Fi node can contain one optional firmware subnode.
>> +      Firmware subnode is needed when the platform does not have Trustzone.
> 
> Is there a reason why you write ath10k in upper case? There are two case
> of that in the yaml file. We usually write it in lower case, can I
> change to that?
No particular reason, my brain just implicitly decided that it
should be this way.. Please unify it (or LMK if you want me to
perform another resend)!

Konrad
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
