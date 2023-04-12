Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB57CC7619A
	for <ath10k@archiver.kernel.org>; Wed, 12 Apr 2023 08:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crXVZETu2XgSkK4LryLffeT3pH223vapRW0iBh0dMJQ=; b=4ZCACy6r8/pBQl
	feq+limUbEjPmSzOPicTu7pVvFclIgkttsSnylLPPIoyCJWcB2U4f3E2LaTii3Ykt33+PNoQIXEIG
	21QQIwNF4Ile8vTRCjuO2ChMKtNwsqxsFZOCD9jNfhEs07y9C7KsXTrcXTRC+6z353GbZG1unRVIM
	0C1CfBDt2donKFTKOnl/uArrtA3+r3GVbJ+8EhaWfQNUHul7+znlfKuqOYIEir3v4bKCI51139137
	0UE58y5BJp6Q/qE+Es3zIcBaxOEfsFo+rPNxU8WCfhAqg20XNQtWKESVZSO50GJDqgzdRRX0hp+Oq
	APwb1BmbQWkGccHq/2GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVz2-002HSk-2O;
	Wed, 12 Apr 2023 08:37:40 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVz0-002HSC-2d
	for ath10k@lists.infradead.org;
	Wed, 12 Apr 2023 08:37:40 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-94a9bbfe3ecso171806566b.0
        for <ath10k@lists.infradead.org>; Wed, 12 Apr 2023 01:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681288656;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JF3WPk1WtXSLnyqiPhKTVud46FRRu6czewRsuPqGnnA=;
        b=ZSxAOBx1oV71IYBBZolreG5VEmcG3zApfwaekJpqpB/rFLbe14d/EZyc2f4gM4gjn5
         66hPH7RQanNvJo9bHbC/g9qQdo2fj6N8LMo+laioykVoGdf6nakDppwWWF5XN95B4gNu
         mz7gAQmfYPlgtCJuAmpA6itnaneNbtkzbEtZn+KurKTQeIBCJ5D2XK3ktlMkjPenisk4
         f6YWA1U9rhY+MhgRwi4n6iD8hh69sZ+1r0UiK2U4fDB4MGNiczsXMd5yzk/UXoxZGoSo
         feNNIQORsALodcix5fQ0VXH+6UpVXSw03ZUUGzaVX92BGy9zfcvViAqF6SoM6+Viqi+x
         ugIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681288656;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JF3WPk1WtXSLnyqiPhKTVud46FRRu6czewRsuPqGnnA=;
        b=xK6vi3A51u2rAg31mUNkZk9TvbOqMAHbKlhrYdRK122aP6g7klGGHSsSI0AqeT5ZYp
         lBe15eiIlTQ2ztWGjnaqf2Knfo2FjwX+N8Wc9ZJiFSFqenJnx1tSMQUda4h6qiY/4OI8
         SLBPbQnTZwHOAaXsYXjSF6IeqZ2y0R/G+4Alb7ev4NQll5pUfWw2Rb47V6g0is31NjgB
         OKRVt+IHHIaR0YAUePDXckhncKz9Ro8iL8MmM66voWas8QUu82O7cfcal3J06LGHsP+J
         ixj7pv/mQYllyKOfiB9253Vl8x1OHIKnoIuADhRlyhkWKhDEzpSNsGpi9WcNiA5nxkZA
         lpjg==
X-Gm-Message-State: AAQBX9dziPuFRfU/L9/vTG//h1PMHFurEReaV/+ZsvDGrb5G+mXZa0wl
	g17gFIa9EKGLDK04Lxcu0xgnng==
X-Google-Smtp-Source: AKy350aBwVs8SnHcaM/3pKKf00g7XCMEHYzXX/vNSI56mW4MmK0vC1Ick41N2B7PMC1esUn6k77bJQ==
X-Received: by 2002:aa7:ca59:0:b0:505:879:b54f with SMTP id j25-20020aa7ca59000000b005050879b54fmr279118edt.37.1681288656056;
        Wed, 12 Apr 2023 01:37:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8fa0:9989:3f72:b14f? ([2a02:810d:15c0:828:8fa0:9989:3f72:b14f])
        by smtp.gmail.com with ESMTPSA id co2-20020a0564020c0200b005049297c5d4sm3807023edb.56.2023.04.12.01.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 01:37:35 -0700 (PDT)
Message-ID: <4e5d0efb-581e-1b2a-6173-75e5f8ba6588@linaro.org>
Date: Wed, 12 Apr 2023 10:37:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4] dt-bindings: net: Convert ATH10K to YAML
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
References: <20230406-topic-ath10k_bindings-v4-1-9f67a6bb0d56@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406-topic-ath10k_bindings-v4-1-9f67a6bb0d56@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_013738_854399_B9BDFCC1 
X-CRM114-Status: UNSURE (   9.50  )
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

On 11/04/2023 20:19, Konrad Dybcio wrote:
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


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
