Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07E2C47DD9
	for <ath10k@archiver.kernel.org>; Wed, 28 Feb 2024 17:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=likxxYoOfEMuAKtEYTDM9v8GLGgkDJojgZCQVbAvfQM=; b=VI1NYyLxvkCWHApAMtlOVSpLWc
	pTU2KOMd3hTBAYSh8moEdkEAFWESVWMF9cB1T5SzDNT5z1060O9VYVDQ2VruI8U6ZySC5XgGIs4S/
	D5eJw1/GqaJFixs9Fm/MCW/57hER9rLEiiyaGAhHtP7sMrZMTGevNoL2XoaJyTisnWnR8sVqphgvw
	Um06k6WOYzRnWA18I5IvsX0ZjB8Se5n8JhXbFtpvnetpSPyK+mWqifieuJ7ZkrleU8miDNcLMUCJA
	gdF/Ale0woOrb6ik4Fr16xqAeWWOLxfziq49q1E1rrT2H7Mk6frL0MY+bZ/Ae3uht5QrUDS9Fr5bY
	TtIEkd0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfNaJ-0000000AGWS-1wB3;
	Wed, 28 Feb 2024 17:19:11 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfNaG-0000000AGUn-1rZR
	for ath10k@lists.infradead.org;
	Wed, 28 Feb 2024 17:19:10 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-512be9194b7so6009354e87.1
        for <ath10k@lists.infradead.org>; Wed, 28 Feb 2024 09:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1709140746; x=1709745546; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=likxxYoOfEMuAKtEYTDM9v8GLGgkDJojgZCQVbAvfQM=;
        b=bA7grzx7yWxInU9xF3Lj+FNUm4zXehWx9f6izTLGsqMRry6VmQQS2VRElHFi+h1DtR
         fDq2yUB6XC7I1blpAnK9Uw3r3aU4p0OSeSishDTTJiJR3KioeLM7o7P75xlfxlfU7XIb
         bggW1X9+npi5+U1z261fZLpd6fuubinmltmjp+Fd0uqPqCH2nRPzpPshSEgkDdIfMBeo
         lTme85RhsHbOTTcScqT6waOmVAKTO3yukO89AS5z1gM1K9IsGrhZqMAZlHe1hL/0e/au
         3NnMNvdjpVhkxdxJs/BBygXkdc3q3qrlQWetBPNE6wA62PzcUALsmJzq2w1A5ARRAwRi
         v7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709140746; x=1709745546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=likxxYoOfEMuAKtEYTDM9v8GLGgkDJojgZCQVbAvfQM=;
        b=DLrHs0J6yW/vrhNy8yHXuV/J/+ug5S51hySEVKliEVZ2zJUMwwFl4lysb56sVpEqVw
         51OPCJROUqa84jt37L0GwUbzGaKn9TP5XLoEF0XN+17ExG9WEtHp1QyM8tpfEvYDWHLB
         bNQAcT/DAbe5uXIR3ZjeEXkbu03hGHZhmCNeWP2fMposdU2TFnAp5yrkUElD/dRFiMXP
         +u0iqc8QGcrTEOQhtv5QrVlh9pB5CbP+xAemSqlXjk9LqiasWqWxN7U2CPFknRfqedEl
         62DlAcD2Uu4Gxsl7MikR8GxgeF1YftwZ9LsklLZsHeP4mnlwhsuQRnArRWkRILRMDqR0
         vZVg==
X-Forwarded-Encrypted: i=1; AJvYcCUWABXmSe4rI2iXRFmOeVR7fjlqDkQ+MFPM1HyTFFHwWP0SsfiCLIwkH1UxNm56gtliYdprQ8XY8JyvxDajjSnFrBTqMMQd20fkIg==
X-Gm-Message-State: AOJu0YyaJ8TjNmC6Fif4PYp+dzquPKF6VkOHPqEk15oaTtBfEr9Fq0wM
	Isx4LGhQoWtVNTXN3tPmr4fepU+/MwGutyIsJDQFAlczy5agmjCA0y1RhMvfv10=
X-Google-Smtp-Source: AGHT+IEE4slZWG1595pj5QbfSYHDutE8sbK9mwf+NBrBMJOjYn3TB2ETiL96EkfflJv/cEyXxsBr/g==
X-Received: by 2002:a05:6512:398f:b0:512:b372:4eed with SMTP id j15-20020a056512398f00b00512b3724eedmr296674lfu.8.1709140745602;
        Wed, 28 Feb 2024 09:19:05 -0800 (PST)
Received: from ?IPV6:2a02:8428:2a4:1a01:6dfa:263f:dd7e:9456? ([2a02:8428:2a4:1a01:6dfa:263f:dd7e:9456])
        by smtp.gmail.com with ESMTPSA id a21-20020a05600c349500b00412b10ce488sm2803097wmq.23.2024.02.28.09.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 09:19:05 -0800 (PST)
Message-ID: <c58e67e6-6a7f-4963-86b9-580165bf05ba@freebox.fr>
Date: Wed, 28 Feb 2024 18:19:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <87wmqoilzf.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_091908_731281_3395B9A0 
X-CRM114-Status: GOOD (  25.44  )
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

On 28/02/2024 17:37, Kalle Valo wrote:

> Marc Gonzalez writes:
> 
>> On 28/02/2024 15:03, Kalle Valo wrote:
>>
>>> Marc Gonzalez writes:
>>>
>>>> +  qcom,no-msa-ready-indicator:
>>>> +    type: boolean
>>>> +    description:
>>>> +      The driver waits for this indicator before proceeding,
>>>> +      yet some WCNSS firmwares apparently do not send it.
>>>> +      On those devices, it seems safe to ignore the indicator,
>>>> +      and continue loading the firmware.
>>>
>>> This sounds more like a firmware feature, not a hardware feature. What
>>> about having a flag in enum ath10k_fw_features in firmware-2.bin?
>>
>> Are you using the word "feature" as in "it was done purposefully" ?
> 
> No, there's no bigger meaning like that. It's more like ath10k has to do
> something differently when a certain bit is enabled in the firmware. I
> just had to pick a word for the enum and from my limited vocabulary I
> chose "feature" :)

Understood!

>> Is enum ath10k_fw_features also supposed to include work-arounds?
> 
> Yes, and we already use.
> 
>> Sorry, I've grepped over the entire Linux source code,
>> and I cannot find where ath10k_fw_features is used,
>> other than in ath10k_core_get_fw_feature_str().
> 
> Here's one example where in ath10k we use a feature bit as a workaround:
> 
> 	/* Don't trust error code from otp.bin */
> 	ATH10K_FW_FEATURE_IGNORE_OTP_RESULT = 7,
> 
>         ....
> 
> 	if (!(skip_otp || test_bit(ATH10K_FW_FEATURE_IGNORE_OTP_RESULT,
> 				   ar->running_fw->fw_file.fw_features)) &&
> 	    result != 0) {
> 		ath10k_err(ar, "otp calibration failed: %d", result);
> 		return -EINVAL;
> 	}
> 
> BTW for modifying firmware-N.bin files we have a script here:
> 
> https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath10k/ath10k-fwencoder

If I understand correctly, you are saying that there is
(maybe... probably) a bug in the FW, so it makes sense to
tag that specific FW file with a special bit which the kernel
will interpret as "this FW is broken in a specific way;
and here's how to work around the issue."

So this bit would serve the same purpose as my proposed
"qcom,no-msa-ready-indicator" bit (that bit existed instead
in my board's device tree).

The problem I see is that the firmware files are signed.
Thus, changing a single bit breaks the verification...
UNLESS the FW format allows for a signed section ALONG-SIDE
an unsigned section?

>> As mentioned in my other reply, there are several msm8998-based
>> devices affected by this issue. Is it not appropriate to consider
>> a kernel-based work-around?
> 
> Sorry, not following you here. But I'll try to answer anyway:
> 
> I have understood that Device Tree is supposed to describe hardware, not
> software. This is why having this property in DT does not look right
> place for this. For example, if the ath10k firmware is fixed then DT
> would have to be changed even though nothing changed in hardware. But of
> course DT maintainers have the final say.

At some point, we start wandering into meta-physical considerations
such as "if FW cannot ever be changed, when does FIRM become HARD?"
(and other GPLv3 niceties). But this is a discussion for another list.

Regards


