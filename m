Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423E7C4345F
	for <ath10k@archiver.kernel.org>; Tue, 30 Apr 2024 11:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmDNtKNAUj+EAe14afk12YEoJlqoF5/CO+cJg8bHSIE=; b=fcbJnlV2QgPxYA+lwJUZ30oyCn
	42OLDT+vzqJ/paD9dZk48wgcyakcgB5Vur5r+BOgAIeT5F7xsTiKy3QiMG7iTAR8MWPsM62OG4d3l
	GYf/BGBJgnCt06Z2B/U2PvwTGR0joDdfC6Zso7fVJmLtlQAcL0Nec3qg6FrgwZt6BWGTFc9ZAyo24
	f9rrjekrWZG+qWXW3I0QF9SLfyODaRA5/Bf0npEAgIjA7DZbL//lSAWQh/w/HJzhpMXsmbnDpsH+o
	gKAWnMmi38ZmF1+asnI3CIBBHk0AY/uxN6DKJKwdNA4wnTDT5K2p4apbYoGpqhT5U77cAPuAEihEQ
	pDKeLfrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lSf-000000069ha-1qkb;
	Tue, 30 Apr 2024 11:15:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lSc-000000069gn-2bYl
	for ath10k@lists.infradead.org;
	Tue, 30 Apr 2024 11:15:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41a1d2a7b81so37520775e9.0
        for <ath10k@lists.infradead.org>; Tue, 30 Apr 2024 04:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714475743; x=1715080543; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fmDNtKNAUj+EAe14afk12YEoJlqoF5/CO+cJg8bHSIE=;
        b=XN42yVjbx50rWoFuege65J2pPiBgJsdPchcwhoiSSQb2jc+qXRh/8d3YWRH/GtVVCi
         1/YrmsxKyFXRLnTFXUSkuzbbVh6zJ7kuVmev7FVXvsyfNaDvevlBiJxq3SDzPvtwLYud
         nX+0rs2NGy3t8ZbFhJyEoDI/Me+v7k/DZR8yvQ4q91xx+dQc5EiExgaIMXsmbnzNI1yh
         WnO11yQ2nwkVTjdL3bachFprWaHL9g4d+h95dSd5r5UJ0y5FXSuNBBj8NkQqpkTtTSZP
         XcWO6i4q5LM7ZG26ss/5LJAqaholCFOWtwVRW7D4abcjejVRcR7YeeXeZl3J/8r0D5wB
         Lu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714475743; x=1715080543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fmDNtKNAUj+EAe14afk12YEoJlqoF5/CO+cJg8bHSIE=;
        b=WninemdLq0yTsMcHd5/7vPZ2aZaDMrn36VaQloqtfbs/X4MwN5FKcBmn4jjC08xitr
         h5oH3gOIJimmK+UeTH13+0rbedG94QzjMf1Uj+TCWu9Aynxo3se/JZTA9vmK1AcTUydv
         M8vFz4X9nznkGPKQgnGsg2x36LtyYF0vu8X9LIOmFBLyhTecQGDbD0H6lHfxnRaVHHoE
         SNu7x9HVaK+c4Kn2vApCPWntSus2n6M72pi9Pbga3gNdbAx/SeyNsxWi769GQtPivHJw
         fxaV69y+E402dIYP6uAt57MQyngyPbdzcjxoTZkOT2VP8DpDFjWtiCUEpRRigwacDJot
         T49Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtBRl/Z58yZ1hw1jH1hHRvX9yBZJR4NpnViqo55rK4cMb10wHVLURfaG2JEfI5QV6DkSmAKLu/R86Ibkk7TVdWEYC043QnqocWsw==
X-Gm-Message-State: AOJu0Yy6xuc8VJg33HERxSZBv2T+58Hom1Dtn0WLbPhNskoiNabD8mp0
	C/NuM22/eDDsZg08ertTkylp/Uj8i5XUD1hbm9jtkr3Olit5TIaNhEf8s8lUC2g=
X-Google-Smtp-Source: AGHT+IHEFMtXAH/YKrNwQKlXxkPWH5Zf/6vTdgXFkM/G+vP1WzEEk5r/knMRdxIagzjU3f1WjQovVA==
X-Received: by 2002:adf:a792:0:b0:349:bb17:6e60 with SMTP id j18-20020adfa792000000b00349bb176e60mr1941881wrc.2.1714475743585;
        Tue, 30 Apr 2024 04:15:43 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id u4-20020a5d6ac4000000b0034c3d1e1391sm11786111wrw.42.2024.04.30.04.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 04:15:43 -0700 (PDT)
Message-ID: <0a242bc1-fe8a-439b-96cb-bebdf2ada7d7@freebox.fr>
Date: Tue, 30 Apr 2024 13:15:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] wifi: ath10k: do not always wait for MSA_READY
 indicator
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
 <23540303-5816-45d5-a1af-5f09d645a73b@freebox.fr>
 <ZjBWUvdEI6aq4s6M@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <ZjBWUvdEI6aq4s6M@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_041546_758521_A994D980 
X-CRM114-Status: GOOD (  13.29  )
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

On 30/04/2024 04:24, Bjorn Andersson wrote:

> On Mon, Apr 29, 2024 at 04:06:29PM +0200, Marc Gonzalez wrote:
>
>> The ath10k driver waits for an "MSA_READY" indicator
>> to complete initialization. If the indicator is not
>> received, then the device remains unusable.
>>
>> Several msm8998-based devices are affected by this issue.
>> Oddly, it seems safe to NOT wait for the indicator, and
>> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
>>
>> fw_version 0x100204b2
>> fw_build_timestamp 2019-09-04 03:01
>> fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.1.0-01202-QCAHLSWMTPLZ-1.221523.2
>>
>> Jeff Johnson wrote:
>>
>>   The feedback I received was "it might be ok to change all ath10k qmi
>>   to skip waiting for msa_ready", and it was pointed out that ath11k
>>   (and ath12k) do not wait for it.
>>
>>   However with so many deployed devices, "might be ok" isn't a strong
>>   argument for changing the default behavior.
>>
>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> 
> As with patch 1, please address the s-o-b and accept my:
> 
> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

As with patch 1,
I typed this patch all by myself with my grubby little paws.
You can drop PH's S-o-b.

Regards


