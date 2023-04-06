Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C08DC76196
	for <ath10k@archiver.kernel.org>; Thu,  6 Apr 2023 18:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqVxdTef+zG7Yx9kWdBdjdOOt5Zr4ke5NbqYY8roWIA=; b=kjCJs32q19WPTs
	PeyF6TzCwtzTE03QkmGMOkO94Z2yWnKqj8aDfLnLO4CulOb/ERBCX0W0f1TRq6lBXj3TUysrSA7rn
	BeVUdOksHFCBJny/PeA7nld06v9s9wtLSKJgAgNH3sk3iHQDSejnNV4NH56brPmZXdjW6B2ex1gN/
	b2mn+n4hJC/eFQZBFv5xFSyEf9hfWAolf/1ygXSFw773SQaTltE6dRb6oMdouGH6122ZUuFVstiq3
	xQMPvCmsPi61lR+3JkOWR/jTcnyMcgIQxukd07gSGiwjV8X31Z2GEU18x3DndrY8xquE+nZ6ysmeY
	i0N6ucro+060apuiat5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUW3-008HUY-1t;
	Thu, 06 Apr 2023 18:39:23 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUW1-008HU5-1S
	for ath10k@lists.infradead.org;
	Thu, 06 Apr 2023 18:39:22 +0000
Received: by mail-lj1-x229.google.com with SMTP id e9so26332898ljq.4
        for <ath10k@lists.infradead.org>; Thu, 06 Apr 2023 11:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680806358;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DzdRb6pnkmsus+yIRwXbtWlbX60lc0X5WvMqlzQrDnw=;
        b=X2Gjkg08dhQfvA179XoZ/xMR768GPvfiMhSriliUPS2VW6IF+caRHk3oyvVi7zwceb
         rqYCEXyxbM47uvulQ890YxCwMio7oYiokZU2Q2jZhV26zZNSDHH9/llKN7QMvPHwijoB
         k9EhQm1tsSNbf9P+mHF3sTpNQfqODiLXNa2JNoUVN+pORj0bkoQB9VgOokmYekFC//8T
         ciHran2eaQcJEHjLnY3Gp0WpL++IGG6DSMQSXZ4UvxjGlhCI2gxMgvG+jL166wo+n6ir
         SeM2dr+e68hlv6tP2zTG1o3cIlQ4PJhsocx6ilN9qs9kyYpThk0Qvjf4a8FHQo1RzQiZ
         dm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680806358;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DzdRb6pnkmsus+yIRwXbtWlbX60lc0X5WvMqlzQrDnw=;
        b=HZvvV218e3E6FMoTfwrOsI+RdUc+mhwNSFMC9eMeecxRHtjZML5tLxaTdeBh93neKj
         IT4hURXzZWTGgpzZBgkMuGcLrOyDalqKNXC0eOheN6dtoVu7uIdd12ZbNOFw4LYznw5n
         t7dMz6NjQdDlq37AT1IKBd2VyfjZiejoaX5ql0anzemoZOL+sWmx8SmIqka6N8pBjG5q
         dWZUJxq67pWjpgiIoyivJHs2Mo8Nre4AInpOsFahMYB0VCo4wYrPlGJo/A65p3iUEtcO
         37YWq8sd+CtwCdHclFnryvQI4Qc4TWXQRkWkP5SVkNAlcHpSA6oM+3cYJbcvqoeMP/Sa
         lRUw==
X-Gm-Message-State: AAQBX9djVEjwwL5nFWDzFhs72mNJRy1j4sr1nh/zhEuB9pS32yHruN+E
	lIJc7vIX5HUENNgUoW7fGSrevQ==
X-Google-Smtp-Source: AKy350a3OD9HVmDgKylvrWyF5U95HSWfUl8N+EQpPalZT/JEENS+L64vmodPR1w4RzfkvCnGXQavIw==
X-Received: by 2002:a2e:3814:0:b0:295:a958:2bca with SMTP id f20-20020a2e3814000000b00295a9582bcamr3199301lja.6.1680806358396;
        Thu, 06 Apr 2023 11:39:18 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id w12-20020a05651c102c00b0029b32a40934sm385427ljm.113.2023.04.06.11.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 11:39:17 -0700 (PDT)
Message-ID: <5437085b-706b-2f9a-686e-b95a9a0e6993@linaro.org>
Date: Thu, 6 Apr 2023 20:39:11 +0200
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
 <8c818f95-b4a4-658f-701d-3151afdd5179@linaro.org>
 <6720f61e-550f-6e16-8860-54233a3ea069@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <6720f61e-550f-6e16-8860-54233a3ea069@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_113921_494942_EFF20868 
X-CRM114-Status: GOOD (  10.55  )
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



On 6.04.2023 20:30, Krzysztof Kozlowski wrote:
> On 06/04/2023 20:26, Konrad Dybcio wrote:
> 
>>>> +        interrupts:
>>>> +          items:
>>>> +            - description: CE0
>>>> +            - description: CE1
>>>> +            - description: CE2
>>>> +            - description: CE3
>>>> +            - description: CE4
>>>> +            - description: CE5
>>>> +            - description: CE6
>>>> +            - description: CE7
>>>> +            - description: CE8
>>>> +            - description: CE9
>>>> +            - description: CE10
>>>> +            - description: CE11
>>>
>>> What about interrupt-names here? If they are not expected, then just
>>> interrupt-names: false
>> They obviously wouldn't hurt, but they're unused on the driver side:
>>
>> for (i = 0; i < CE_COUNT; i++) {
>> 		ret = platform_get_irq(ar_snoc->dev, i);
>>
>> So I will forbid them.
> 
> Assuming DTS does not have them.
Tested locally, no warnings, so looks like nobody used them in dt.

Konrad
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
