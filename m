Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA74C77B6F
	for <ath10k@archiver.kernel.org>; Tue, 11 Apr 2023 15:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iU3nJkEyjNEaY13+C96aYPyyYZy6+M3cHLAURx6BH+8=; b=uF3rPLC/ZYSsyO
	xFQTpd4qp5piGHWLZgd3p/kNk81gXwJzfduzAzCDDCawQLyvUnoslcJxTFVUZr6/bb5AfVV/rxQFw
	P36hWBqWm9t0qvDl/Aiu40LYqySqX214/hXSXk/hsuLbC23lncyCm/pNQvW5irEuTzPzUk6njI6sb
	lrIG7YH7s+wt435nwrk08+8P6nje3WFwMEXedzQaaWy2PfRoCfBJ0pJZeP4an4R2X/FsG35+Ox8Qz
	30enOChjePm7UJnxT1y2lk6hc9VyFy2zjHHTRt/qvhkqvqNOwS/RbS8OVzL8pdxmSg9FkATAJWrjZ
	ULhViNo2TcctidC5IpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmGOm-000Uub-2K;
	Tue, 11 Apr 2023 15:59:12 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmGOk-000Utq-0E
	for ath10k@lists.infradead.org;
	Tue, 11 Apr 2023 15:59:11 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-504718a2265so3374451a12.2
        for <ath10k@lists.infradead.org>; Tue, 11 Apr 2023 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681228746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HuLKaVpqWP7mcBL6Va5Q6AmbfGLfH0Ywuo6SlIN5+HI=;
        b=lvxPfM8pF4k7O2Lg3VLCu9K5GPO9jyWxvj4IHAqR/RPyls6W2HA033ataUHE+gqDI9
         DBhU6dQmXT239qaiaKugflHr79gur8BX2toxtbaNIXDNrbhFAIZK+8PDjeT76BcStMYZ
         PrReP3uLUBz8/IOCC9f9XozZOo7bSwyq0qj5eL3oRFB14QtHwRfWvZmvW8gg7HLISRMz
         NO1K021Jbgll+t898NmGvGc1qW76ddjmiYc9tbkLPfjWvlrImk7jPLJX4rlfQWNg3CGK
         73Uxe60eY2kLkIk7nDs3DF/SEcmkLqVDzI1h8kgTRxjLfANGDYzQlBOxjOhZyFqqp4X9
         xdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681228746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HuLKaVpqWP7mcBL6Va5Q6AmbfGLfH0Ywuo6SlIN5+HI=;
        b=E3lT2qvGnHhymEJEEikgt4DxWsgsl6+MBndWe3RxDN6IdDKwZRJGxIO52IJOqWQUlt
         NO7gVwzZD2zhl9pKIvUcfYajAedQkjxj/NFVT2IaIigZsLlkTH/kOZuw4xqZWEiSUZzf
         uN2XFo3zXRQo8QK3q8jBTq+1Qbj6vY/KZwwLZsfRfHnmia/QvLzC//Ybe9HNK4YFTSfp
         GN0O6xZKe/lEHPH/R+hifbQPA0eMzx9NUBiXnYY6q3gM5yCGBW2sCTwAW9lB5qJ+hCuo
         uEx444ARvej24zYktV2ZdikHf52QNCOQzQatIfBwYur/6H5W24+WHi7Fdxw1QBtwr3ak
         gIbw==
X-Gm-Message-State: AAQBX9fVwqGMFkaryW2syTL/O1ymVQlnsV8baFahXkBBAZRYdpS8BIZp
	6s3Qh6t6WQJ/zqAegLD2YbjUzg==
X-Google-Smtp-Source: AKy350Y5CR7tYp8NsWFjkTYbI+F0Ye+qaeSHHHlVAklG30GRD47NiW1USk+vZaeKXZvsOfP0/XQq4g==
X-Received: by 2002:aa7:d60c:0:b0:502:9578:38ed with SMTP id c12-20020aa7d60c000000b00502957838edmr10337957edr.27.1681228746037;
        Tue, 11 Apr 2023 08:59:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f1da:c117:3657:c8a? ([2a02:810d:15c0:828:f1da:c117:3657:c8a])
        by smtp.gmail.com with ESMTPSA id ec20-20020a0564020d5400b00504a1313bafsm2332200edb.95.2023.04.11.08.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 08:59:05 -0700 (PDT)
Message-ID: <e75a5a75-ea42-6c7c-f6ee-b32ef735cd81@linaro.org>
Date: Tue, 11 Apr 2023 17:59:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/2] dt-bindings: net: Convert ATH10K to YAML
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
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406-topic-ath10k_bindings-v3-1-00895afc7764@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_085910_178672_296CC227 
X-CRM114-Status: GOOD (  12.12  )
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
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/net/wireless/qcom,ath10k.txt          | 215 -------------
>  .../bindings/net/wireless/qcom,ath10k.yaml         | 357 +++++++++++++++++++++
>  2 files changed, 357 insertions(+), 215 deletions(-)

You should have received kernel test robot warning. If not, just
confirming here - you need to fix paths (docs, maintainers).

Best regards,
Krzysztof


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
