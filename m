Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55973C76196
	for <ath10k@archiver.kernel.org>; Thu,  6 Apr 2023 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JoSAvMUJqYT74XXa+L79nFNZUMspzRUcj+77mLvuaEs=; b=2p/cynDL7A67ke
	OdS0Zn4eg4t+Tyt0x0gyRJ7DRD6PPa64Prosg1AmyPBDYPd9inD8VRLL6+DJ339HnxMj4/a3eQ5Rs
	j6j9S5BbLR/TK0hpglYHwTY73qlnDnXvy6LS3XnawBBQW10ryIAJtuioDSy8+afuAuEp3cIvfM2KR
	WERcECEYrrtmVtBDRn/IaN+8rVobAvbzs95I01HiP6RAK0NOCi+auJZg0/ewbz4oCajeA+LcGrAyT
	p9+a5eisz35Z1D9TUX7htmTBuBYsxXiFE8Dt0XRKxuRrBUsRfkRIhG7KzB0Tf/A/aR4AXNFS5/h6p
	7FQOI2Ek2rnxwdb/kuSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkTCv-0086FQ-0E;
	Thu, 06 Apr 2023 17:15:33 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkTCs-0086EG-27
	for ath10k@lists.infradead.org;
	Thu, 06 Apr 2023 17:15:32 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-942e6555947so127930266b.2
        for <ath10k@lists.infradead.org>; Thu, 06 Apr 2023 10:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680801326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/acLh4KOig99xCm/V9WrFZvIgzSBqVUp64UT391SRw=;
        b=JIwo5ZGRMeYyE/7IQxTnC3A+fotsrn9neIdNq6E4NRFpsndyz0JehvXFSIylJBK8ub
         LoTdXHdIv2pb2QHJk08i423+1ZXsWKfwfXardNdMMYqjl8XGrTBflzMzgYxYb8Dq8cZY
         wmFzjrSzL7x8l6aUC8Q4BP2jrAE/YIwbG/XNaUI+kc4U0I8JRag7J4iMb9aYymowQB4C
         IUMSUOHYgOMSvXKup2jBydbq1nnvIb4coRAOpHIxHHhYUfJPfZczqErwZQwFsbNvUrlg
         8WAFrQaSH9sYi2CpuOlwjZ0y97RysFZID/bdh+9H5ozb+Xki4QUP1xWCMvxjMZPB/Qv0
         SMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680801326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6/acLh4KOig99xCm/V9WrFZvIgzSBqVUp64UT391SRw=;
        b=n61lZWeHvpaDnBiLvyJT03c2dAkBLqmvhKwPU442i55Hil+/XCLihJ7uBEqsOm0IJ7
         HLgfftjd05LaC0B7kqFVJLb5EJwooNcdnMiPxBlbyTxD03h6F1zDmrLlT0hAS/YfEzD3
         OKy04/1kVjHSXjMXQ8v6ASskfN3FcZpnDDydsjo3Nt2YPdYquaSlqm++XjPYqFRZEfGl
         Vt5E0SvSupQTEJ7G4S8pUhJYmiZ78rweIn9gBoFMrqS0z16nZI82JWWMQXYvLV/7y9rt
         uk9P9xBMZNncsCLHX77hU8dnoCrlM9pA3VEGD1H7rIGRFB2PQwW7tf11MwCGxUXll3cX
         kHqg==
X-Gm-Message-State: AAQBX9fbIipsj+UmEDgCWW59DlroXUGpUrpbUAPxHutiXAgeBdU3WrS9
	i9R7Wod+2M+C9CrpDVDk3H46CA==
X-Google-Smtp-Source: AKy350bE/vnELTyryVtVPyEHqcyqo0/nGsw5Ao9XOGbN+UWCla4cqusv78f8aqXGcfYpdxMYmQ7eyw==
X-Received: by 2002:a05:6402:611:b0:502:4c82:9b4d with SMTP id n17-20020a056402061100b005024c829b4dmr347667edv.15.1680801326585;
        Thu, 06 Apr 2023 10:15:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id k30-20020a508ade000000b005024aff3bb5sm965527edk.80.2023.04.06.10.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 10:15:26 -0700 (PDT)
Message-ID: <223892d0-9b1b-9459-dec1-574875f7c1c6@linaro.org>
Date: Thu, 6 Apr 2023 19:15:25 +0200
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406-topic-ath10k_bindings-v3-1-00895afc7764@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_101530_825055_3277D574 
X-CRM114-Status: GOOD (  11.55  )
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

On 06/04/2023 14:55, Konrad Dybcio wrote:
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


> +  - reg
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq4019-wifi
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 17
> +          maxItems: 17
> +
> +        interrupt-names:
> +          minItems: 17

Drop minItems (the number of items is defined by listing them below, as
you did).

> +          items:
> +            - const: msi0
> +            - const: msi1
> +            - const: msi2
> +            - const: msi3
> +            - const: msi4
> +            - const: msi5
> +            - const: msi6
> +            - const: msi7
> +            - const: msi8
> +            - const: msi9
> +            - const: msi10
> +            - const: msi11
> +            - const: msi12
> +            - const: msi13
> +            - const: msi14
> +            - const: msi15
> +            - const: legacy
> +
> +        clocks:
> +          items:
> +            - description: Wi-Fi command clock
> +            - description: Wi-Fi reference clock
> +            - description: Wi-Fi RTC clock
> +
> +        clock-names:
> +          items:
> +            - const: wifi_wcss_cmd
> +            - const: wifi_wcss_ref
> +            - const: wifi_wcss_rtc
> +
> +      required:
> +        - clocks
> +        - clock-names
> +        - interrupts
> +        - interrupt-names
> +        - resets
> +        - reset-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,wcn3990-wifi
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          items:
> +            - description: XO reference clock
> +            - description: Qualcomm Debug Subsystem clock
> +
> +        clock-names:
> +          minItems: 1
> +          items:
> +            - const: cxo_ref_clk_pin
> +            - const: qdss
> +
> +        interrupts:
> +          items:
> +            - description: CE0
> +            - description: CE1
> +            - description: CE2
> +            - description: CE3
> +            - description: CE4
> +            - description: CE5
> +            - description: CE6
> +            - description: CE7
> +            - description: CE8
> +            - description: CE9
> +            - description: CE10
> +            - description: CE11

What about interrupt-names here? If they are not expected, then just
interrupt-names: false



Best regards,
Krzysztof


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
