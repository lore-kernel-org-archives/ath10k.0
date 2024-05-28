Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C45C25B78
	for <ath10k@archiver.kernel.org>; Tue, 28 May 2024 09:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWYisXjJ7RIo5lhbJSv21znch1qUWj7f8daCXXniaDs=; b=l6eORaBpbn01cVY71JDG5ziKuA
	PIV/ZDFyz46F0ydcTYUjyVRqiY+xeXiCuZK3uYQCz66PgezJlQTrevcgCjDSIlhz2rB3Ggi5mldwi
	Sp0y4dE5esMhOd45wCqW/IgVDV0OeOXE+iAfe7lWm25IIeYZfLAxY1AO6nk+z2SScwbmv/PGOhGf/
	oDC8Rvy9ov0wFUCd/pBDvHSC7AKvDvHvJEcf0Xk8f0XjTsJWazgU+8N+OGuhHJOi1Nqxr0Ea06hBr
	/k21QDKcthJB7awbZpzfkslPtyhrSEgOvNV2UWLZtWXlaIYtcEvvluHp7kAoIaoZpXYXJIEaObPy+
	vEaydyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBtXa-000000006aA-1hBz;
	Tue, 28 May 2024 09:54:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBtXX-000000006ZM-1iQE
	for ath10k@lists.infradead.org;
	Tue, 28 May 2024 09:54:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-420180b58c5so4473805e9.3
        for <ath10k@lists.infradead.org>; Tue, 28 May 2024 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1716890079; x=1717494879; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oWYisXjJ7RIo5lhbJSv21znch1qUWj7f8daCXXniaDs=;
        b=ZbM6b/0V3hHVVH9Gu+meUIz5nkbUySTCGRuyjNhp0nA6/WGGMISajZHB45n+vzoGgV
         pi2Vy2NIoUW0AFlbN90cTOvQf4V3VpTKKPkHCA0y2LTmiV7Fj+hAMoCD7JVv/tgUCdPS
         1iKdv7tJHYtCAu00YDnkFyezsRKwkl+GwvvQLRyQaNjryz+1V6fMvyfEjuBYOndDPJHI
         UwKYVJVKft5Xm6ZluIXj6fmi/tXALlys+TIAEtPXwt5R3c2ZNUuk1coCwQg1Xx4c2Xl9
         cUpMl6RXyFo2vH848G3Bu2HPmZl2LhH/4ZivW0P4f+sk2+cBOJs6Fvm1uzusg3XCU+8a
         BHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716890079; x=1717494879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oWYisXjJ7RIo5lhbJSv21znch1qUWj7f8daCXXniaDs=;
        b=DmZu9eaaHBar27zJjV78HnlHet40xihFIBNFt47gTg+OlQ8q5mwIizktYElvTK/o7m
         J0y5mBGHtaAuKo7krhJFEOtbv+LCtZXSYuXvIheKep2brN8fVzN47aT5NCuGA6JcfaVC
         ljM1U5t99QdwDFRkCOxEW5ErdP5fuduZpgIpnv3IBCQtQT0cQ25807j5cgFJzXbX9IIY
         arAxoOvoIKj3rMRrqgRHgNOqrTEeW4tmXM6MjaOy4SvloTFcOh6NKRSW368QXmFJ7id8
         Arl7OuioK0Uh8aLOwviGWS/oBBIN0NlC2CRFC3Fr3hCkHKZmJeOoz32H81z+lBuGCVeD
         cJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAJi/BWBs358XyluG+FDOKeagOjmkrpf2/Up4bdBpU/161uyy50M6D8gzGihNOUO7I3M6uQZS2WWCSTiCYx81nys6creJEyFVXLw==
X-Gm-Message-State: AOJu0YwSvvvNwFbDDFdDj48UIpRgo1WR+sqwZzy6K+LANr+wcIuflVeI
	kChRuEEEf1VPP+Cn6s2RyIr+NU75LE1elRG3kSvtTwy/eLx7uWWOg3N4Sk0Ug/4=
X-Google-Smtp-Source: AGHT+IGtbEJvc0pZFif8+rjy+/1MtcLrU3cLsbt9CAfpx8NrU6rjdJ01tQfYMRj5877jciysw2vZww==
X-Received: by 2002:a05:600c:54cc:b0:419:f630:57c2 with SMTP id 5b1f17b1804b1-421089f98d1mr89925095e9.37.1716890078820;
        Tue, 28 May 2024 02:54:38 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42108989fdesm136479995e9.25.2024.05.28.02.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 02:54:37 -0700 (PDT)
Message-ID: <3464a980-36a7-4ed2-b2dc-be8fd9091b06@freebox.fr>
Date: Tue, 28 May 2024 11:54:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
To: Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <171560975908.1690511.498631481702370762.kvalo@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_025443_597271_407CA5BF 
X-CRM114-Status: GOOD (  13.40  )
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

On 13/05/2024 16:16, Kalle Valo wrote:

> Marc Gonzalez wrote:
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
>>   The feedback I received was "it might be ok to change all ath10k qmi
>>   to skip waiting for msa_ready", and it was pointed out that ath11k
>>   (and ath12k) do not wait for it.
>>
>>   However with so many deployed devices, "might be ok" isn't a strong
>>   argument for changing the default behavior.
>>
>> Kalle Valo first suggested setting a bit in firmware-5.bin to trigger
>> work-around in the driver. However, firmware-5.bin is parsed too late.
>> So we are stuck with a DT property.
>>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> 2 patches applied to ath-next branch of ath.git, thanks.
> 
> 71b6e321e302 dt-bindings: net: wireless: ath10k: add qcom,no-msa-ready-indicator prop
> 6d67d18014a8 wifi: ath10k: do not always wait for MSA_READY indicator

Hello Kalle,
What version of Linux will these be included in?
(I don't see them in v6.10-rc1. Are they considered
a new feature, rather than a fix, and thus 6.11?)

Hello Bjorn,
Will you pick up patch 3 ?

Regards


