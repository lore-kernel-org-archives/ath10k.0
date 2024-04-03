Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1653C6FD1F
	for <ath10k@archiver.kernel.org>; Wed,  3 Apr 2024 06:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqzG+GVTYlLCvJp4qtTWcyIY70wgO0A+rDrRVUSez5Q=; b=njSMjdNj3Ouon7ImKqmaMRX9Zt
	8YnwAsbbxpYZmAcLG00H6RiV7LxeIJYeYTP7ATwalrYKSSoeyxSZc78t5IaXjuuDJGA24pzHPohB+
	uDHXf4p7tls8szN6xeRuf+oFFiT3QypgSC8jXpOhVPayJ92mMfD83y5vOepmqgYOrhBiOlUJEmnkj
	MOrdNtYMOizMcpyfkUTBFgUC9V04E8SYSxZ6eVtoEx/FoW2JiFkhbGdQmANrROneWfvcONwUY/wbZ
	IvLbDSR7XmRaQfKl1i8r0+/6lr7aMob1EKka0TZtDjYAUiiB6ErNZulpd4l2XZBVadiZc+TPnB0V6
	cafr4wEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruMk-0000000EIoa-1Zxb;
	Wed, 03 Apr 2024 06:44:58 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruMf-0000000EIn1-2u3g
	for ath10k@lists.infradead.org;
	Wed, 03 Apr 2024 06:44:55 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-56e06116eb4so362370a12.3
        for <ath10k@lists.infradead.org>; Tue, 02 Apr 2024 23:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712126691; x=1712731491; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mqzG+GVTYlLCvJp4qtTWcyIY70wgO0A+rDrRVUSez5Q=;
        b=AX83OxIP5+tyTg3zwXlYituD87qFx50Kal0Mlyr7jWCI+F+ZcLSD3DVpOwfWzkZo3I
         YWG7Rb3u4nKQYFHOgAGWeoITrRj9r5gANdrAOfhVgUcYx5hCfh+R+i0JKEs6wmX1u+kz
         UXH+W/zu+4kBUHjl8TYwEGKmgFcy2Uev/Y/VgGm1iS3eYMFVjer9YA/y/COJCifB/ZUV
         jB+7BSuaNPjAo386XEywPLXHmABHIKoPPYNZUYz+4MSNoZRgMMDmttzRePKPgOPPUPWL
         qN5NenWzM30kIL5KXo33tzRh+hcsRiHjJXeQ2dLPthIrMVhaNbwDtBY7/K92dCWh57Ay
         C97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712126691; x=1712731491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqzG+GVTYlLCvJp4qtTWcyIY70wgO0A+rDrRVUSez5Q=;
        b=GgBp9TxW7kT2RLyA0XfXasI/qRuECoBzUjtSqXH8Ug2u5xZZlsRpFYMinrcRCo5qel
         RgrsgPJjEawSovcpiDMA+I8J+9HM+g+VWd8FsK3TYw29BqfiC0RyIjDxxKq1QDxv2EJj
         Cu1+bkUeM2P1w5swWaEr3L33am18C1EhsSAbY5gIZ8ElgBHfThepftplxawGJMOuGiXO
         6Yu7WX/efDlu0T2prb7EGsAF0d9WwljwiuQwxbbkbUjmX85CMwDlW3CTynRO+h4xuaho
         8uW2CIGVcDCQ/ok+1WZ8GIvqFZ/d6YSHyxGSlidgSVKbtEAStmokkEJGhQe1B9XtF8+v
         Uo8A==
X-Forwarded-Encrypted: i=1; AJvYcCUkzT8x+Git+UJpZzSM3WZNPWzvkkG+VtO8RvfnO5CBlXy6PvTjTE97ONJgKPjs0thngrZFFKZn+f63P9eGBLJ9WtHrOqNYZYXINQ==
X-Gm-Message-State: AOJu0YzXzKzfqiUMbFkkTdlSo2MKZyap2/k5O0Ho1agCg8q2NO8EZ5Rv
	zPmH1Zfs1Id5aBZbKWLTb7816/0moG8U8VvQV4efnpRFO0cFsQuH3O3OidZH41c=
X-Google-Smtp-Source: AGHT+IF1uLL1pPHXISWPCfPmatN0dRkigzOt05swpo3k6uWmGxqKf1SISJl1Y7/Pj0xYoM/BIfIN0Q==
X-Received: by 2002:a17:906:f6d1:b0:a4e:1b02:81d6 with SMTP id jo17-20020a170906f6d100b00a4e1b0281d6mr1123667ejb.10.1712126690625;
        Tue, 02 Apr 2024 23:44:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id n12-20020a1709061d0c00b00a4da28f42f1sm7459338ejh.177.2024.04.02.23.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 23:44:49 -0700 (PDT)
Message-ID: <1a9de041-8d17-42eb-85c5-9e8f280a1985@linaro.org>
Date: Wed, 3 Apr 2024 08:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
To: Marc Gonzalez <mgonzalez@freebox.fr>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <84f20fb5-5d48-419c-8eff-d7044afb81c0@freebox.fr>
 <72c162cc-45e0-48b6-8d90-d59fac299375@linaro.org>
 <6bd3db0f-2e18-4ad1-abc2-f59c6acc8037@linaro.org>
 <ea18f91a-710a-4eac-903d-90928caa3090@freebox.fr>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ea18f91a-710a-4eac-903d-90928caa3090@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_234453_879884_9492F412 
X-CRM114-Status: GOOD (  15.54  )
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

On 30/03/2024 23:04, Marc Gonzalez wrote:
> On 30/03/2024 19:23, Krzysztof Kozlowski wrote:
> 
>> On 30/03/2024 19:20, Krzysztof Kozlowski wrote:
>>
>>> On 28/03/2024 18:36, Marc Gonzalez wrote:
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
>>>
>>> This is v2, so where is the changelog?
>>
>> Expecting reviewer to dig previous discussions will not help your case.
>> It helps reviewers if you provide necessary information, like resolution
>> of previous discussion in the changelog.
>>
>> I dig the previous discussion, since you did not mention it here, and it
>> seems you entirely ignored its outcome. That's not a DT property.
>>
>> NAK, sorry. Please go back to v1 and read the comments you got there.
> 
> My apologies for omitting the changelog.
> 
> And I don't blame you for missing the thread's resolution,
> since I made a bit of a mess of it with my various messages.
> 
> The firmware-5.bin approach was deemed DOA since these files
> are parsed too late with respect to the required work-around.
> Thus, we went back to either DT or a to-be-written system used
> in the vendor driver.

Then please mention it briefly in the commit msg. Explain there why such
implementation is the correct way to solve your problem.

Best regards,
Krzysztof


