Return-Path: <SRS0=WP6D=PO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDD7C433F5
	for <ath10k@archiver.kernel.org>; Tue, 26 Oct 2021 14:43:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E2F5603E5
	for <ath10k@archiver.kernel.org>; Tue, 26 Oct 2021 14:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E2F5603E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVHa3x9tZhggXnaivpfBq1/QmVJYDj+pO5KPt46juLc=; b=M2YM5b/mHu06RUdQz7uS4g5FTC
	XQMyAEIOjMdvEXXp7oO3amd69DgprdDUUmjfsgASvNoGjvqmyxZEh5mi5sjXv4wqdUmHUdkr9wvUh
	PiOV3GREAGNgeWfRETx0XEwsCxplpU3m+LREahi7ShxrEYgbTNXExlkOECJ40ykgjiprBIE2FQ3xR
	bkQYuu2v6X2u6RVSvhTWD1f9ejjVxgtH6JkyibgdlTOKC0+RlNDFl1ptOcmz6zhqDpFDODNUt/uR6
	wTAx7NkPqdXPILkfn39ZKfQiiopZzMDfQKhntQ6yCLidQI72ghBvtyEa64dNXsN9/J/tiAN2PeXPl
	RhsE2VOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfNfJ-0022vP-Q0; Tue, 26 Oct 2021 14:43:01 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfNfH-0022uN-5p
 for ath10k@lists.infradead.org; Tue, 26 Oct 2021 14:43:00 +0000
Received: by mail-lf1-x12f.google.com with SMTP id u21so21861670lff.8
 for <ath10k@lists.infradead.org>; Tue, 26 Oct 2021 07:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IeDPLqe3LBKUpRJz9gheIRoaNjTzo/azi2xTKJ59u4Q=;
 b=rtTjZwJ3hBs0LVsm1btVhVOPMJ9I5MezaBoSmoqbce3/qjWaQC2+rhDsqRinNFpWQ9
 XEIv2SKGN2wjW6chPzCLFT9zXOXt09mKGJ/wp/DNysqfz/QAU71tshSVm8II8W/47Zro
 fFViFfYJTYFIggox35NWeXMsLXyiHz4KJZOhp09/tVEVgiKZNFcmb7ZD3JDtHb1fBhVQ
 yS2F4rXj6uNpRlrHm4EgqyOu1tCiRlDKS7dy0yVGyj64Vd+6Vc46iZY7ovCpsczbeLZF
 xEdJJP60JLVtl8SPNzMqy327fFe1kk/K19U6B1zRdDm/RDl/oaOFpQn9GHaOGF5wYdRV
 5zfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IeDPLqe3LBKUpRJz9gheIRoaNjTzo/azi2xTKJ59u4Q=;
 b=HhQVKLXLdzz9kKkWdqmxVbPY6/i2otmj+bJnRBtvcNXUBLHbWm276EQv9b0N3yVpgF
 G3kljWuoe9iHMG9lTpA/5PlB9608B/RKUbu9E0Ko/75TzsaO9ReOPIYjAsUY7hpRrFCS
 5wWnC/slx0pIQxm7hQ1DARYh62FW/GrGXLi2SK1jvaRF9MIYUPCDr4zO/+UVTHv8KD1Y
 aSF3zDzLkQlnT0WO8z3mT0w+9jPU0xVCjTltzmQCrzXTGEWmA3/O2TnhJjsRaAFqSLWo
 zQPcbT1MP1dNrxj9bB1wLDdbehzVmfXfLAjRENyNMcrds68bTZpxdlTFohQCS1KLrS16
 XM0w==
X-Gm-Message-State: AOAM533ajFfw0+h6tAx7d0dYZFYBCUaUdribFrqkdKJZamBJgHToJGQO
 66N45YR1DRtbTXt3pCtrnGSEyw==
X-Google-Smtp-Source: ABdhPJzbC4V4BOc77PUffVI7AxDyDMkYAgocDN0aDe9m5/bXIjvUGOQ5RhLNx5fCyuk5xWO+M9NHyA==
X-Received: by 2002:a05:6512:3407:: with SMTP id
 i7mr24013249lfr.563.1635259375652; 
 Tue, 26 Oct 2021 07:42:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id bi9sm2256901lfb.40.2021.10.26.07.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 07:42:55 -0700 (PDT)
Subject: Re: [PATCH v1 01/15] dt-bindings: add pwrseq device tree bindings
To: Rob Herring <robh@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
 <20211006035407.1147909-2-dmitry.baryshkov@linaro.org>
 <YXf6TbV2IpPbB/0Y@robh.at.kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <37b26090-945f-1e17-f6ab-52552a4b6d89@linaro.org>
Date: Tue, 26 Oct 2021 17:42:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXf6TbV2IpPbB/0Y@robh.at.kernel.org>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_074259_260172_CFCB70C5 
X-CRM114-Status: GOOD (  19.27  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 26/10/2021 15:53, Rob Herring wrote:
> On Wed, Oct 06, 2021 at 06:53:53AM +0300, Dmitry Baryshkov wrote:
>> Add device tree bindings for the new power sequencer subsystem.
>> Consumers would reference pwrseq nodes using "foo-pwrseq" properties.
>> Providers would use '#pwrseq-cells' property to declare the amount of
>> cells in the pwrseq specifier.
> 
> Please use get_maintainers.pl.
> 
> This is not a pattern I want to encourage, so NAK on a common binding.


Could you please spend a few more words, describing what is not 
encouraged? The whole foo-subsys/#subsys-cells structure?

Or just specifying the common binding?

> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/power/pwrseq/pwrseq.yaml         | 32 +++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/power/pwrseq/pwrseq.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/power/pwrseq/pwrseq.yaml b/Documentation/devicetree/bindings/power/pwrseq/pwrseq.yaml
>> new file mode 100644
>> index 000000000000..4a8f6c0218bf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/pwrseq/pwrseq.yaml
>> @@ -0,0 +1,32 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/pwrseq/pwrseq.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Power Sequencer devices
>> +
>> +maintainers:
>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> +
>> +properties:
>> +  "#powerseq-cells":
>> +    description:
>> +      Number of cells in a pwrseq specifier.
>> +
>> +patternProperties:
>> +  ".*-pwrseq$":
>> +    description: Power sequencer supply phandle(s) for this node
>> +
>> +additionalProperties: true
>> +
>> +examples:
>> +  - |
>> +    qca_pwrseq: qca-pwrseq {
>> +      #pwrseq-cells = <1>;
>> +    };
>> +
>> +    bluetooth {
>> +      bt-pwrseq = <&qca_pwrseq 1>;
>> +    };
>> +...
>> -- 
>> 2.33.0
>>
>>


-- 
With best wishes
Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
