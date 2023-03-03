Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA22CC64EC4
	for <ath10k@archiver.kernel.org>; Fri,  3 Mar 2023 07:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iFed/Esrs3nlkxELWj4UH/kdTakHD7Pj9oZdBCAbdSc=; b=OiuUPdFWmGxeGk
	xiD8wqwY/MvhuS2AQ8TxxLITzlEkkL5A2CJKHjIuU97JhttWJVCSxVatRuGDfbNHd0V9ltB22GTZU
	4nfwmPckxwmViIQEUs4vpIE9J7i4xwFdXor0RoHFbQ3QD0pTILw+ijXD2ltZkBlpp/G4t1qVTM7g8
	Sevp1txC+hLUtZ/qaxHbC7UYJupgzVx7ysdBE/vksCtv+Kcka33eBV8pyGp4PmJO/auvHPfB7XmRb
	dLymN9bX01BvnBrnPtbebguPV/IHYw8Vkx8p32qqU7WXIY7/rUcAwv3MfkcDq8mg1kzW8nub55Hp8
	QqaRiimgZNlNR3jlQLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXzaU-005CTm-4g; Fri, 03 Mar 2023 07:12:18 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXzaR-005CTD-JP
	for ath10k@lists.infradead.org; Fri, 03 Mar 2023 07:12:16 +0000
Received: by mail-ed1-x533.google.com with SMTP id d30so6639902eda.4
        for <ath10k@lists.infradead.org>; Thu, 02 Mar 2023 23:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677827534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xi3e3zf8Klpq1iRcEdmcSTKwBOu4pz/Ei0EPeIx1fZY=;
        b=EZLxu7Y+iizjsoeGeUbmzPxbTlnTsVxbNP5WplEQkHBNoOsLzB62obZ9C7HjJdud77
         56/49ai23BGpoS36DG6EcSbmf63qfNq5oJWGrjeCcUiiqcP5s7T2Mro0aZ/J/j8ksgeI
         +bg2Y9ZjHQdv3oumc/D705agQ/kTIHtIJYSd3isGNZ021cdwZsiNraxSgOkprbG1/VSs
         Jy/A3i7jQicgkpkM9EZeoKOzBEgUtXQp/lpjyn7AuUuLTBZDpT2aSxgAtP6jsOAfs7BX
         anizbYYk4ixsFk47zhnqdrNzqaha1yJxtgSvDN8tkCbRbvXSD9EdiLHjOJXucHQh16pa
         x2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677827534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xi3e3zf8Klpq1iRcEdmcSTKwBOu4pz/Ei0EPeIx1fZY=;
        b=RI34zSoUGePtmTfShnIbTZ2jczAj2umSRWYDQRWIrFrOaljvI1M4icqnxriWldDEyU
         rRCixLVDVPXMoP0u5kJUmGh8gnMvuSzdcQhvmtYeC+IlgO8FMN1iIKS25zmJHJ51E5pV
         zBl4P/FMFx9kLyPAZkpdSYke8vtxiJ5a4t417OLG4Ar+YuVSrpju3xOb8pVN+BCaD+5X
         pSUxPaEOGuAa1i2L8PuY77TW0t7JtqcPDnKkMSpOkWipOMIp6J2afGw+5BrkSu3rKUGI
         VL/hxTmUc5KX5LplWSCLP1FcGbTguDJtweSkDnvoa84QRd3FDWHnJak1JKQnx1FftXDr
         Lmzw==
X-Gm-Message-State: AO0yUKUYWgRi41iEQMKDdYl44aGUE0uY/v9e9CeVBwf2ZPG9Anad24ad
	aqoBy9PCQooAsV0KCZaw2pEzvg==
X-Google-Smtp-Source: AK7set+r+vvJNdv0SgAgspPvo26Cw4Qq2bYappwi6VBNmRDuHd2TtvD3UYnxUh2P0DnOzbQxgvzdAA==
X-Received: by 2002:a17:907:7289:b0:8e3:74ad:94ce with SMTP id dt9-20020a170907728900b008e374ad94cemr866444ejc.8.1677827533823;
        Thu, 02 Mar 2023 23:12:13 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t26-20020a1709060c5a00b008ec793ac3f4sm614812ejf.192.2023.03.02.23.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 23:12:13 -0800 (PST)
Message-ID: <8e695c64-6abd-3c1e-8d80-de636d950442@linaro.org>
Date: Fri, 3 Mar 2023 08:12:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: ath10k: Add vdd-smps supply
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
Cc: marijn.suijten@somainline.org, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230303024246.2175382-1-konrad.dybcio@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230303024246.2175382-1-konrad.dybcio@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_231215_696361_AFE7C9BC 
X-CRM114-Status: UNSURE (   6.26  )
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

On 03/03/2023 03:42, Konrad Dybcio wrote:
> Mention the newly added vdd-smps supply.

There is no explanation here, but looking at your driver change it
suggests name is not correct. You named it based on regulator (so the
provider), not the consumer.

Best regards,
Krzysztof


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
