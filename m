Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807F5C19F53
	for <ath10k@archiver.kernel.org>; Tue, 30 Apr 2024 11:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIvWhOtQaSbhbwjiVrfaYv89apMYv7P7i1/N8DdL+Ko=; b=vTWuFzhOiLkCRBe7ZwHDu3t3Ei
	vHPrp66V9+Ql/8sLd5eOPgFHwPfL228Bkmimb4Mgn6cgHhJTzMx24rVGtMbXytvhfKTbff3rvSfKF
	k3EyomlaKG32qzDKOBUN9/cDz1bBhfx919+Nv7fvRA5StHUenbz3YNjPQZUIMoKubDcA/I2Nosg3y
	VLlJG1rG5sxtOAdjCSD9vMbbZe46ypYqqvUwfQ87gtk2iMGnV2M2dI4FHyo4pBQ+i7HCu3tOCnn0n
	Q4hU7YD0af1rzshaORhVwk4Q/FlDluA8g1+D3g5iJzTOJ5zoSfYErrpdQ7Oqz1AEldhfkpqtrHfI8
	NiJmfZ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lNt-000000068KS-2XYe;
	Tue, 30 Apr 2024 11:10:53 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lNq-000000068J3-3AB9
	for ath10k@lists.infradead.org;
	Tue, 30 Apr 2024 11:10:52 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-34d99ec52e1so222815f8f.3
        for <ath10k@lists.infradead.org>; Tue, 30 Apr 2024 04:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714475447; x=1715080247; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bIvWhOtQaSbhbwjiVrfaYv89apMYv7P7i1/N8DdL+Ko=;
        b=hMSzJiXd5Ccl8ssw1uA1K3ppgeapmNVCXKn1P+Jt7PyU7kAYvKA/PQcovtnPw1Y33Q
         4rgrCoAnnJ+oMmLkNgK+1Oa3HElT8661GejPErZfjEHJKSChCQAh1v4JxTrk1QpRybz1
         z3n8HNVJboGnvwCA52HNHoGOklDu+4NjK/ajCZ5pD65wjprzZuyRt4Ob4rGz88eWCOm/
         d2lfpRgcg8Flys7VnKo1tKnwSeynBpuuAjN+BsM8EVIrndHpRBDDBkLAjGh+7lsnC/nJ
         4HAmf0EClIvr7obEqCPiSZnEab5kMdDwoTYyRFt/W0sjBeTY97NarPJXQrAoeyIapqoT
         GDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714475447; x=1715080247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bIvWhOtQaSbhbwjiVrfaYv89apMYv7P7i1/N8DdL+Ko=;
        b=UgR0zDQTrnrDPwV08JLZPVMZhAHQASqi27fmKndTQ7z3liYTBb2zal7ToPESGFxVjO
         orF4Y3l6yD/AUs6t3tujcVXIVxhREsijXddAGQGOJj/60ejr2QHJjyv7RGOTp4YhN6SB
         sl0OVEVdZbBvpZcSYpkObpChLHdUMHmZAhj6YSyc0jDywmFw5IaU4Tvh8pIXpgmrxyac
         mzJyejBCM0kqmbxBdN2XxNGJFGTn2y6ytQte62ky5a84v+7TC0hcM2eLFLCvYEKDldC5
         Iz/Iqi/iYM+nZ96UbUBoh38P6CBLSxz/RTUHLy4eGYJ3uizt+7DWWyA5lPZbv2RgG/Ft
         uH0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpfKwbiS63Kh0ihki8c52RpluMPQl6dh9jTnQu8Vyj1ypqWSJQCTo0PZSNgfIO5exiGxqDUq/9jsNlpBx5S2HMrZfB/ik3YYahGw==
X-Gm-Message-State: AOJu0Yxw8Gqkz2MCVLWoRbWt7ZFXFTUZesD8/d0h4eKNxnO0bPLEZG62
	bRWDpzsUUElLI47URyQBMLkFWKDXF01xzZ0dxivCwMk7GhJPdNqvsP2uh/Gc3+A=
X-Google-Smtp-Source: AGHT+IGQOo0rskPzhDLRD7me8gspVxoemoUYNb/vPah60Lt9ZvK0rsJKvU9gxcYOnL3jSoqIaHMdCw==
X-Received: by 2002:a05:6000:d49:b0:349:eb5a:3b4f with SMTP id du9-20020a0560000d4900b00349eb5a3b4fmr1980272wrb.45.1714475446694;
        Tue, 30 Apr 2024 04:10:46 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id x5-20020a5d6b45000000b003472489d26fsm31853409wrw.19.2024.04.30.04.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 04:10:45 -0700 (PDT)
Message-ID: <b6a1eadf-477d-48a8-bf39-ac3c3191e929@freebox.fr>
Date: Tue, 30 Apr 2024 13:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
To: Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
 <54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr>
 <ZjBV+th9DmnNLhnN@hu-bjorande-lv.qualcomm.com> <8734r3qysm.fsf@kernel.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <8734r3qysm.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_041050_963750_7DD596BA 
X-CRM114-Status: GOOD (  16.32  )
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

On 30/04/2024 06:06, Kalle Valo wrote:

> Bjorn Andersson wrote:
> 
>> On Mon, Apr 29, 2024 at 04:04:51PM +0200, Marc Gonzalez wrote:
>>
>>> The ath10k driver waits for an "MSA_READY" indicator
>>> to complete initialization. If the indicator is not
>>> received, then the device remains unusable.
>>>
>>> cf. ath10k_qmi_driver_event_work()
>>>
>>> Several msm8998-based devices are affected by this issue.
>>> Oddly, it seems safe to NOT wait for the indicator, and
>>> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
>>>
>>> Jeff Johnson wrote:
>>>
>>>   The feedback I received was "it might be ok to change all ath10k qmi
>>>   to skip waiting for msa_ready", and it was pointed out that ath11k
>>>   (and ath12k) do not wait for it.
>>>
>>>   However with so many deployed devices, "might be ok" isn't a strong
>>>   argument for changing the default behavior.
>>>
>>> Kalle Valo first suggested setting a bit in firmware-5.bin to trigger
>>> work-around in the driver. However, firmware-5.bin is parsed too late.
>>> So we are stuck with a DT property.
>>>
>>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>
>> This says "Pierre-Hugues certifies the origin of the patch" then "Marc
>> certifies the origin of the patch". This would have to imply that
>> Pierre-Hugues authored the patch, but you're listed as the author...
>>
>> Perhaps a suitable answer to this question would be to add
>> "Co-developed-by: Pierre-Hugues ..." above his s-o-b, which implies that
>> the two of you jointly came up with this and both certify the origin.
> 
> BTW I can add that in the pending branch, no need to resend because of
> this. Just need guidance from Marc.

I typed this patch all by myself with my grubby little paws.
You can drop PH's S-o-b.

>> Other than that, I think this looks good, so please upon addressing this
>> problem feel free to add my:
>>
>> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> Thanks, I'll then add this as well.

Cool. Almost there :)


