Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6BEC25B78
	for <ath10k@archiver.kernel.org>; Tue, 28 May 2024 12:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKjV4fgQjqu5wh6AYtxjbKfildzmBjMlCCtP3nDdjQo=; b=oYg9JwvH8gJIEbx43DS+cqajLd
	IavGDMCcGFqTp02bRNv53x6u03+iLv4bkNP9Jjn3WUXgPRotQ4LxfUXcy3Lc+ejvL/Trj29bC1vUq
	ex5NYUUHOFBcdh5glo7yhuKcpSB4vO5Q4B6linfDsZxwNUTD6+NTlD+5naJgqg4DBtrJkJwXbVer1
	MwZ7tAwnRIb6UI+gA97k0E+tLo4BjNNRGoyvq+fqaPGFTvamOw26wT7LAndnq/XKs69lgkZ3YIHtf
	sULogP6RHmdFVZCGLSChbxvw4uFlrqUaPTpRfduEAPE82nC273m/oMPylVf0A53ut4kRnzEn0DsQ/
	f74LPhSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBw3l-00000000bmR-3NyK;
	Tue, 28 May 2024 12:36:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBw3i-00000000bla-3NAA
	for ath10k@lists.infradead.org;
	Tue, 28 May 2024 12:36:08 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-35b6467754cso297508f8f.3
        for <ath10k@lists.infradead.org>; Tue, 28 May 2024 05:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1716899763; x=1717504563; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cKjV4fgQjqu5wh6AYtxjbKfildzmBjMlCCtP3nDdjQo=;
        b=NSDPTcMwC0SKUq0RMFb1IkIA0rSyj+CSY54rshUkPUR3tExD1FM8AFuaDwxjF0Vh6u
         LFwCZBoH1R2RCGsDiCpzpRqx3gTJObECFfgWZnIt8oVfOrxaF3ZQtO2CYPGQcRR4JL9k
         266OquMXEdvM1UDIobl+SPiMYz8tYuwLNUCUEekJ2t0wKU0CjYcME4hYVyPgqf+jKW/N
         emI5tljLbolsjKAUI8VBM2otqkdpV/peAaPCZcHwfKUo6rsZjBA/fuVMpa3NhHnk02OK
         3PDRrdGvGYhd1noYfQBV7REir59m8ytEMRqIvugsyZbCw+d7hF0Mnw1NvzGRVc4XZYYt
         ztgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716899763; x=1717504563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cKjV4fgQjqu5wh6AYtxjbKfildzmBjMlCCtP3nDdjQo=;
        b=S8otl63Y/l1RXtgPT6YH7b+blBcndCVCsu+rl8uDDQEIYMjDSHWsPWxBhjWN65KBPP
         vRMeezDT1q/YFj7MTMMAxB9G+7JMVcYDVNtlgrGtE03DaVnL0z53AfKjtCTyp7ADIyun
         Gg15zOGInsZcDko/ROzF30aHRhJebFlnFJ57ZOl1OCM2L3PYETu4z1HP0CnJRSiT39bP
         mXDS5/qlg6FfnACfPuYH3rpBilaQcFqUPJ1vKbWPnVwstdCJ5/VnhS9iFYTJvs5kIQkx
         DICoihZpk+9aMmEQJJWyuN/3fp+Ep3NMZ85VjNbHHrAGMfF04f4BpeRLLzNz6yY0aywW
         IUCw==
X-Forwarded-Encrypted: i=1; AJvYcCWjbzS5+lFdZlh4Q2T/bxmkDLs7pez5RUDR1XMrCPDJzBW1Nl8WInpD6rktiEkEzPXClkq48nI+SMPkEKb4e+5X8bNYtO2KJbHZdg==
X-Gm-Message-State: AOJu0YyB813e9lMjzcSsEzggUTzXFn7UWg726VB1fK67ZJ6anRgfJPCA
	LugZbGFYTZ4pVF1spaemMig2PI3GMWbN3IlLAR8Iw5RlSpB2/D1vZR9qVggiaVc=
X-Google-Smtp-Source: AGHT+IH/nIHnbKuaQ02BEZC+tUBPKkKNzrItqWNXK99sKCPB3sE+lmgdRWRIDZRs8kvy1AAgHOeL9w==
X-Received: by 2002:a05:6000:248:b0:355:21f:be1f with SMTP id ffacd0b85a97d-35526c155b3mr7235867f8f.4.1716899763394;
        Tue, 28 May 2024 05:36:03 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7d88esm11676251f8f.19.2024.05.28.05.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 05:36:03 -0700 (PDT)
Message-ID: <74ab64e2-9bb4-4e98-9f2f-f6402ba42c08@freebox.fr>
Date: Tue, 28 May 2024 14:36:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
To: Kalle Valo <kvalo@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k
 <ath10k@lists.infradead.org>, wireless <linux-wireless@vger.kernel.org>,
 DT <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr>
 <171560975908.1690511.498631481702370762.kvalo@kernel.org>
 <3464a980-36a7-4ed2-b2dc-be8fd9091b06@freebox.fr> <87zfsa6ybl.fsf@kernel.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <87zfsa6ybl.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_053606_881854_A472DA9E 
X-CRM114-Status: GOOD (  17.01  )
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

On 28/05/2024 12:11, Kalle Valo wrote:

> Marc Gonzalez writes:
> 
>> On 13/05/2024 16:16, Kalle Valo wrote:
>>
>>> Marc Gonzalez wrote:
>>>
>>>> The ath10k driver waits for an "MSA_READY" indicator
>>>> to complete initialization. If the indicator is not
>>>> received, then the device remains unusable.
>>>>
>>>> cf. ath10k_qmi_driver_event_work()
>>>>
>>>> Several msm8998-based devices are affected by this issue.
>>>> Oddly, it seems safe to NOT wait for the indicator, and
>>>> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
>>>>
>>>> Jeff Johnson wrote:
>>>>
>>>>   The feedback I received was "it might be ok to change all ath10k qmi
>>>>   to skip waiting for msa_ready", and it was pointed out that ath11k
>>>>   (and ath12k) do not wait for it.
>>>>
>>>>   However with so many deployed devices, "might be ok" isn't a strong
>>>>   argument for changing the default behavior.
>>>>
>>>> Kalle Valo first suggested setting a bit in firmware-5.bin to trigger
>>>> work-around in the driver. However, firmware-5.bin is parsed too late.
>>>> So we are stuck with a DT property.
>>>>
>>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>>> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>>>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>>>
>>> 2 patches applied to ath-next branch of ath.git, thanks.
>>>
>>> 71b6e321e302 dt-bindings: net: wireless: ath10k: add
>>> qcom,no-msa-ready-indicator prop
>>> 6d67d18014a8 wifi: ath10k: do not always wait for MSA_READY indicator
>>
>> Hello Kalle,
>> What version of Linux will these be included in?
>> (I don't see them in v6.10-rc1. Are they considered
>> a new feature, rather than a fix, and thus 6.11?)
> 
> Yeah, these commits will go to v6.11. Because of the multiple trees
> involved (ath-next -> wireless-next -> net-next -> linus) we need to
> have ath.git pull request ready well before the merge window opens and
> these commits missed the last pull request.
> 
> Yes, we are slow :)

My understanding of the merging process was that

- new features are queued for the next cycle,
so vN+1-rc1, or vN+2-rc1 if the submission came too late (after ~rc6) in cycle N

- fixes are queued for the fixes batch in the same cycle

This patch series is handled like a feature rather than a fix?
(To me, it fixed broken behavior in the FW, but I understand
if the nature of the changes require a more prudent approach.
Though they are disabled for everyone by default.)

Regards


