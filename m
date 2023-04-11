Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5562DC77B6F
	for <ath10k@archiver.kernel.org>; Tue, 11 Apr 2023 18:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VnVvKKA6haP5RnAxK+dX1kmAMYd3JlR/rAMxmgSLliw=; b=XyT4GnPgWiEjnS
	fIWW82+RiOVZqsrxPwGs8anZnwATxr6Ss2lt3tWKFRiSabPgFrCFlcUG66/tIONOHM2p4kETooQSy
	YtVFNx/ybnVUk4gTfP8ox6GEqdTAtuIRxpAlGly4DpyqKlKLh8vMdhNvF0tvIPV/X57SzWrmhaO0B
	IHNeeaDCWQlVUcp9VJ+PJD8V3ODPprU8LkvhKn++BPpEYy1pkjhBJROCIKx8IVDVO+pzXcDe8Obs/
	d0wkFu27Wuh/54lVXWPJF+3umxYiksbjJOaWz/yio1jOx62sU24eER4K5eRWno0ClPw7r+rtwIzM0
	vlCD+A0rqu06FrxMiQgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmIIB-000lvI-2E;
	Tue, 11 Apr 2023 18:00:31 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmII7-000ltc-0D
	for ath10k@lists.infradead.org;
	Tue, 11 Apr 2023 18:00:31 +0000
Received: by mail-lf1-x136.google.com with SMTP id m10so1973457lfq.1
        for <ath10k@lists.infradead.org>; Tue, 11 Apr 2023 11:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681236023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lwRBXjW3LKaf6FMdA/wwWmZg0VHbU8BDgWyAU/QAHUs=;
        b=lMLY/86gUy7qpoTj7Jju8dwSLtjfBksYqes73dWc11t6HM0axbTH0G6y4uu77e6DwA
         TCaphi37UOFahFw1XyvLd4GUXYsgkgjAZdEc1lhDD5jxEtIi3WrLHoNhlapLv6MgsW8p
         JH4a2GNcrynotw8G9Vc9dsZFY6AespUakqHHeVvKLEXGeArUiJ6QXQ6imqKVmbCsTdP+
         M2QfSKSmYzXOfsLq8+szyxE1wsDRpg61SyVVbYwf2zOSCJA2IdUhNddfyj5ebUhi1lOI
         1X/sTMNDl/SS0Iyl78UIVTDJB28yNRiZpaHcQBGXzPZyqrXtdrvlPVQ4OqaxeZHrX3Br
         ZjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681236023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lwRBXjW3LKaf6FMdA/wwWmZg0VHbU8BDgWyAU/QAHUs=;
        b=kzqUutTx7xX/4BpcqEY0jQ3FISksgyBc0KWaTw9yKLLyMYhGdyl/+X3Z0FcZk/cnpK
         6q9SMEQL3NP/5e80slINcMfRGrvBIIG0UR1L0m8uOZ9tY4Vt9SAJ+oZ3SynQAT8aqCxf
         YkT/6KZ7fzwDGMA2D7upW+q3Ar1Wa/vInW/uPwN2Dl7VootPvk8guAeOaNxweJ2mN8Ql
         wxt6Sv2UoljnRzr5YDw9T/BgGGG7pOMD+sHLAR/ntMRmkvQajlVQdFzwit+Fv3144nak
         bxg+8FoxMuU6h9f8086KhluLKfA/p6G/opm+P+7yZUzBfdef/ahuMmeQTSBws2K7KYJT
         ummw==
X-Gm-Message-State: AAQBX9drmcLbANyK3P3Zz3c5FRPLixKQgZXNFvZWrO2IKiGYZHjI4S5n
	DGh2Z/yIX9hnz7MNqmLMoJTEng==
X-Google-Smtp-Source: AKy350aqc5tqwAqaVQBe8GDzYh3HXxWbAtPfO+P8owp08Yi0tPimjDPGezSAC+QgPFJyPYdSUVT+/g==
X-Received: by 2002:ac2:43c3:0:b0:4dc:4b92:dbc4 with SMTP id u3-20020ac243c3000000b004dc4b92dbc4mr3212317lfl.14.1681236023345;
        Tue, 11 Apr 2023 11:00:23 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id w6-20020ac254a6000000b004e9c8290512sm2632303lfk.82.2023.04.11.11.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 11:00:22 -0700 (PDT)
Message-ID: <2aa69cb5-a545-13d4-4db2-7050d944f74e@linaro.org>
Date: Tue, 11 Apr 2023 20:00:20 +0200
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
 <e75a5a75-ea42-6c7c-f6ee-b32ef735cd81@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e75a5a75-ea42-6c7c-f6ee-b32ef735cd81@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_110027_109490_1C4FADB5 
X-CRM114-Status: GOOD (  13.75  )
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



On 11.04.2023 17:59, Krzysztof Kozlowski wrote:
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
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../bindings/net/wireless/qcom,ath10k.txt          | 215 -------------
>>  .../bindings/net/wireless/qcom,ath10k.yaml         | 357 +++++++++++++++++++++
>>  2 files changed, 357 insertions(+), 215 deletions(-)
> 
> You should have received kernel test robot warning. If not, just
> confirming here - you need to fix paths (docs, maintainers).
Will do

Konrad
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
