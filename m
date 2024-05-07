Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AC5C10F1A
	for <ath10k@archiver.kernel.org>; Tue,  7 May 2024 11:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vu3E57enROBhkqZ25vaLZg3w8R1eCilIpWi4uX7bS5I=; b=lC+9Y0vymRFKiUqSUqrbUpIWvw
	MMuvokbTv+O6M+NMYQzZ0LJYERvnPvyrgLoDpNqdB30mTzrss6CB4PaX5Jud9wpnqGw4zvTGGTrA0
	c8S0vO5rC4/PtMERsleENfdLW2HxGHwxaVk91K8tSxcR+JZoMuCMGH8gPd9TEuxfDtF/Gd8zXCTbF
	LB9G27jRqI60ukx7lifFkVoOmHvXVLS19nrOwGkWzaDyaibvs3nteR8iQp+1olwcfeOgkSx1irsH8
	rc9yDeF6EgP3Slo0LXMJ/iQXqg2KSm3hA7sTgE3gufiiGjfpXYD7cPQgLjRv5glDgdHX+g1e7/R0m
	PobV5gUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4If7-0000000Af8c-2HV2;
	Tue, 07 May 2024 11:07:09 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4If5-0000000Af6N-0IcR
	for ath10k@lists.infradead.org;
	Tue, 07 May 2024 11:07:08 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2e2a4c20870so38653631fa.3
        for <ath10k@lists.infradead.org>; Tue, 07 May 2024 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715080018; x=1715684818; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vu3E57enROBhkqZ25vaLZg3w8R1eCilIpWi4uX7bS5I=;
        b=iN1g1JbNYp0mstyzemb/iI1NwKKT1or39Z2PeC3QcF/yC3R3AS1ZNwobSsh9kPlc2r
         vhKXc6mynzvoshnnO2weVE+KIeHTYeHqkBA0lO2B4/LZ5moEPPOQzLqGjmetK/ND3Xk4
         5jr9pQIC5uXmIcAExxRrgaiRGqOHzsRAn1Q5lBpiEoOSIZdcOO0gtEsFlKnYXmk7BzqP
         gvdkYs/Bwp5z1sLCZjAEnWH9NIrwruEBXtusi4iNaB4APzIOGXEplux6v7mUPZRxoy/R
         IrJB6pR9yaYoBEhisjDDUgko008XxtNT+ITYcesdIVZJ/5IODVQ+ewwC3qm4721y84ux
         iIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715080018; x=1715684818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vu3E57enROBhkqZ25vaLZg3w8R1eCilIpWi4uX7bS5I=;
        b=CqIwgHwWa8KuB1zMA3e8OCFI+077/Jzqm1rc2coG9tSF+NHKJZyuXEQAumh121qo7W
         fnbEn6eFOorgQLvuvxqSEpWH8mtptAU19uP0clKtGtNCLewQl+lMre7Y0mOMTHcEpq+O
         luqfoGSad4x/3+c7JUkwdPP3oo3ZiWEIZ6JdVhFtMqThxZwHKeq+3s8w8R8pmES2E1IR
         ud1GeV0/G25KyT3IThVj/DSKtBpymZD8vuMEBm4Pgp61mEydqnLqxCRlUMq+BJMF1JZj
         gNvc0q4/qq7rwaZPybRcU9TEGotXKWwP0kX9zMg8jz11+7/rXE2epmLa5VWchLqN8GLr
         2E3g==
X-Forwarded-Encrypted: i=1; AJvYcCWB6t5M2f9qCbzT8ADrbC3m6nAJ4yo3PJSzbV8tcpYKMctfDA3MM64RFGpSgN+Gm48j6gLp9vBX7Hyx/3EKjHFbhUGjpc60vNQ7UQ==
X-Gm-Message-State: AOJu0YwmFnsGv+7e/g3kDswvQNS6olS+FQlS0+h8494wzluOqXwCsFLg
	89oRbkCbzCvGKpB9gSs7c8tCG/9pJLGfbhfH2k/J80Hsh23ZctKq9iX5+BiZ3eDUXs7oe2d/Gxv
	iSeM=
X-Google-Smtp-Source: AGHT+IExp0qXNrJyw996e89disi8phPXmFYED+G9fNF42W0b5gF5pUVkJQl64hC5epdp7ic0/3TADw==
X-Received: by 2002:a2e:9153:0:b0:2da:15cf:1e23 with SMTP id q19-20020a2e9153000000b002da15cf1e23mr7938406ljg.17.1715080018522;
        Tue, 07 May 2024 04:06:58 -0700 (PDT)
Received: from [172.30.205.144] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id e3-20020a2e9e03000000b002d6daf3b41fsm1906226ljk.101.2024.05.07.04.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 04:06:57 -0700 (PDT)
Message-ID: <e1d66d4a-baf7-4f17-b214-be7e7432f53c@linaro.org>
Date: Tue, 7 May 2024 13:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
 <0914f96e-fcfd-4088-924a-fc1991bce75f@freebox.fr>
 <02592b09-8ab5-42ab-bd6b-6db79722d708@freebox.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <02592b09-8ab5-42ab-bd6b-6db79722d708@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_040707_231146_9C1E3F59 
X-CRM114-Status: GOOD (  15.24  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org



On 5/6/24 12:39, Marc Gonzalez wrote:
> On 29/04/2024 16:07, Marc Gonzalez wrote:
> 
>> The ath10k driver waits for an "MSA_READY" indicator
>> to complete initialization. If the indicator is not
>> received, then the device remains unusable.
>>
>> cf. ath10k_qmi_driver_event_work()
>>
>> Several msm8998-based devices are affected by this issue.
>> Oddly, it seems safe to NOT wait for the indicator, and
>> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
>>
>> Jeff Johnson wrote:
>>
>>    The feedback I received was "it might be ok to change all ath10k qmi
>>    to skip waiting for msa_ready", and it was pointed out that ath11k
>>    (and ath12k) do not wait for it.
>>
>>    However with so many deployed devices, "might be ok" isn't a strong
>>    argument for changing the default behavior.
>>
>> cf. also
>> https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_835_(MSM8998)#WLAN
>>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>   arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> index 67b8374ddf02f..4e6245095adfc 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> @@ -3234,6 +3234,7 @@ wifi: wifi@18800000 {
>>   			iommus = <&anoc2_smmu 0x1900>,
>>   				 <&anoc2_smmu 0x1901>;
>>   			qcom,snoc-host-cap-8bit-quirk;
>> +			qcom,no-msa-ready-indicator;
>>   		};
>>   	};
>>   };
> 
> 
> Bjorn,
> 
> This patch is supposed to go through your tree, right?

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

