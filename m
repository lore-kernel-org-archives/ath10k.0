Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4277C5478C
	for <ath10k@archiver.kernel.org>; Wed, 28 Feb 2024 16:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3BBUgnVwR3soaWOrmj3I3bXyg9YVedXAOrnYNtyhrU=; b=mrk+8jsLCwNxW9fIJJGeblBqzp
	M9LYZsW2WKjrE+/uS42jyZ6gafDpWvrvUS0fateYGuwLe8f/xs4lhZ5jxfXWV2lxfEOjktRBeVVfw
	cpxPyBG3kzT1Nyin7ajdzs0sX5NA8/YlJ3ryXK1uQT2VYYP712Z/pos5f41RDrBYvzV4BeRdELcry
	QQbEt7x5d7Qm0Nrp4P3p/GTz0MuKyQFxZ6cON/Q3KyDeP3KnGmc45H7+eRRn3xPMa1zStiHk/OdkG
	E5Xd8KKowvIGzm9KSrIIdb7/fs5cjCxlknxjZAj+14uZrd1CCzJciL322dDLZcOSzmVm5SqWHPTF2
	60RmdVZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfMXc-0000000A3xW-3BLx;
	Wed, 28 Feb 2024 16:12:20 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfMXZ-0000000A3vS-13eD
	for ath10k@lists.infradead.org;
	Wed, 28 Feb 2024 16:12:18 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d180d6bd32so78651361fa.1
        for <ath10k@lists.infradead.org>; Wed, 28 Feb 2024 08:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1709136733; x=1709741533; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M3BBUgnVwR3soaWOrmj3I3bXyg9YVedXAOrnYNtyhrU=;
        b=Iyb4GQcDKrVtL1XSqQDJa0+I2cjLWblqAzGdFz9asmZrlMcu/EY+hgXkayaYJ9uKAK
         08RKWTi+I7+TyxU2nZQoCufIgXnoNGmz1WadESWddkYnFKPTfZHlUyZNh5d/h8Hn1YvR
         tbbCnXiJHbbWLCkU31kkxuu3VCaYqfB5dyRB7A7brX6l5GrNCXFpURGvOao3Sz4d92FT
         Ckdn4xaS08mXhki4qURG8RBOfANaUheSAxGNxWCU74HN6OTPEsPxiIx1lLSgWxR1e6Nl
         cUdsX79GlAdgxc2hiNnuMX0zVJlS/mBueHBf3P5JtMBSgP67j3r77X1ofXfT64pI9vhH
         w3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709136733; x=1709741533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M3BBUgnVwR3soaWOrmj3I3bXyg9YVedXAOrnYNtyhrU=;
        b=aifB2Lh8/kOFK2tj/Kcmg3Stkt2rCYBDUFN4nSc6enebx4wXKlHCaNPT9bmws4yMg5
         mEolyJEZkRPlFt0LgGHYtrAtIa0ZB0epQdeWbOj/XQSZq/L7q4Ps/Wab+e2CDOZw2HUG
         lgt01EAA9cgiAso9xkmF3tXecbLwETRyeqjZqcSXYHFKJikG6xqFjyJlYlMdI+uIAQpa
         POzmAmUVWEOxyec4Jyj6DNRQYyJ0anyFhLhh08HmDsr6K4qbTJadhTYsPYoz4/OasBMO
         tvql8haRwdr9VZiVW1DQB1tQR3YcWJBurT3gQB175QSC4KwN1Oe/bouUHH1+kZIqn9Y7
         uL5w==
X-Forwarded-Encrypted: i=1; AJvYcCVzUALDf8A0VIZGXKt12XefI5DODqcMfgv/1sjIkZAQVek1+GPv/WfNi89VFTIZQr1W2PG6CzavU8pxGwlMGdoE/Vvsu6fE2ux6iA==
X-Gm-Message-State: AOJu0YyoEWmeptNFgYvmfz8wkzaZaW4yP7jj5NRKdCqPFIr9wDTuqoc7
	Ko5vOXU5oebTMi12DncesB+btNYbyrQBOk1kL1LB/5p/cz8VQwPGSGSYwikTo2E=
X-Google-Smtp-Source: AGHT+IGG6AdUTyo4FoBdAMSmEv7Y/fYF0GPaQX0fJK9UX1HC4EI51NFSONZdNCzGaVHNBmdKJDQbGg==
X-Received: by 2002:a05:651c:23b:b0:2d2:99a3:e508 with SMTP id z27-20020a05651c023b00b002d299a3e508mr3410724ljn.38.1709136732828;
        Wed, 28 Feb 2024 08:12:12 -0800 (PST)
Received: from ?IPV6:2a02:8428:2a4:1a01:6dfa:263f:dd7e:9456? ([2a02:8428:2a4:1a01:6dfa:263f:dd7e:9456])
        by smtp.gmail.com with ESMTPSA id x1-20020a05600c2a4100b00410dd253008sm2487000wme.42.2024.02.28.08.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 08:12:12 -0800 (PST)
Message-ID: <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr>
Date: Wed, 28 Feb 2024 17:12:11 +0100
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
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <871q8wk7o3.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_081217_364549_7C3C7822 
X-CRM114-Status: GOOD (  15.49  )
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

On 28/02/2024 15:03, Kalle Valo wrote:

> Marc Gonzalez writes:
> 
>> The driver waits for this indicator before proceeding,
>> yet some WCNSS firmwares apparently do not send it.
>> On those devices, it seems safe to ignore the indicator,
>> and continue loading the firmware.
>>
>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
>> index 7758a55dd3286..145fa1a3c1c6a 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
>> @@ -121,6 +121,14 @@ properties:
>>        Whether to skip executing an SCM call that reassigns the memory
>>        region ownership.
>>  
>> +  qcom,no-msa-ready-indicator:
>> +    type: boolean
>> +    description:
>> +      The driver waits for this indicator before proceeding,
>> +      yet some WCNSS firmwares apparently do not send it.
>> +      On those devices, it seems safe to ignore the indicator,
>> +      and continue loading the firmware.
> 
> This sounds more like a firmware feature, not a hardware feature. What
> about having a flag in enum ath10k_fw_features in firmware-2.bin?

Are you using the word "feature" as in "it was done purposefully" ?
This looks very much like a FW bug to my untrained eye.

Is enum ath10k_fw_features also supposed to include work-arounds?

Sorry, I've grepped over the entire Linux source code,
and I cannot find where ath10k_fw_features is used,
other than in ath10k_core_get_fw_feature_str().

As mentioned in my other reply, there are several msm8998-based
devices affected by this issue. Is it not appropriate to consider
a kernel-based work-around?

Regards


