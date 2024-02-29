Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2D5C48BF6
	for <ath10k@archiver.kernel.org>; Thu, 29 Feb 2024 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJWLEHwKCTq5M6yaIuOIWFF3XC8JrWtOfeFaJKHLycI=; b=hp/JynMrKWzq32OIvYw13k3eZm
	lmkRGlGMUBCh/xorRWUignqW4hTV6afw0e2c/B+P0TFsydJBPJYCjyzdtY3F/WMxyCQxIGJ23kxXE
	0A21j+JocW2auwq219i+L6l4uMxnKpBY77NLQJ8Z2OYQbnG+60HZ5oDYgCmZ1otURlzPYFEgahSm+
	PNsuULTseYD4YoD9ICOnj2m8cjacdbr+6c5denJZHbkAqs0OYvmwZGMTsa0xHGt23KeS5lTHCVgzH
	4hAlV5VBHvZWmF5LCX6B02HZNtFXUnCWGI8sbUal+kNPhDVVtkNSA0hhhjpGUhYxnKAXakkIlE4sk
	8FqLVC4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfifH-0000000E7PZ-3bVP;
	Thu, 29 Feb 2024 15:49:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfifE-0000000E7Mx-20Wa
	for ath10k@lists.infradead.org;
	Thu, 29 Feb 2024 15:49:42 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-33e1207bba1so484649f8f.1
        for <ath10k@lists.infradead.org>; Thu, 29 Feb 2024 07:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1709221778; x=1709826578; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJWLEHwKCTq5M6yaIuOIWFF3XC8JrWtOfeFaJKHLycI=;
        b=so2YNsYKsM2Bovv3HSR2GjOUHx0WjqdrB3gVv6EUO7xXe7k8dTQFyqW5WE3YSUp8R/
         Cg9KjoGlzkF33qu8t4pCFn1VMj6dJf72hT6uwSGweMzNF9SXqlCiLv8etdJDcSEFjtlK
         nrw3NgP8fjVghrCqUUQN1w97PZ4fTP9O9BzE3++sESrqOUorBrmXTAoE79YOveTRN9Uf
         7epk0VwGXFfIr7TO0rx80m1Q4TPsfh9cnehm8zcTiDSroo0uB428T6uQUbdIj95qnXNa
         0w0P65uIBRHos9niai03hnSrP6Asgt7g5qUOtDw+H2it5RYgwTQF1fpq6nLmglfPT3o5
         u8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709221778; x=1709826578;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJWLEHwKCTq5M6yaIuOIWFF3XC8JrWtOfeFaJKHLycI=;
        b=ied8zy/AnAKWOCb9Gv02MaaXlx4fqvgRmvO5Yr7pMkmosn+hSZWukI2wm4HoG8NnSp
         bnrjRXKRDTWW/hM3zEh4ClmNh9HitaTb4cobX8G9etNtlzdvFuWguz0+o5CfS75/+9O+
         tp0QG1KR0YDNYXB1LojrdPjT45LJXIqAS+Sn6iK6lWkimmDCtXDHzwQGRXC5AjbdwbeO
         ighojEsGYpDTOqdrxf5npkVDGq7JzuBXHAnIUCM2ruozswduZjIe+xXk0BGC20mMCPL2
         yi6yZii/aNgGpHCJMJuIrlPXvYf8zZYzd8XzKNJfybwI47ij8yEFguYkSX8AimPbbSVN
         Qr3A==
X-Forwarded-Encrypted: i=1; AJvYcCWcaE3fiu2+6IFTx4WYcrFp2LopFnQO/1G8K13OyP7FHYlyeyqDwL6Kqh+fjNa9Z76zTBaE0AUfoKRnNfZx0yK3vXBbQvqe+BuVAw==
X-Gm-Message-State: AOJu0YyzpvDsQjUQgZl/p9I23JK8w1xSZjMjo2lNkRAOfafInCJaQRqT
	5KtRpyF5DUDkZitT3wNxtvZ4YuUv6tcG8VBEUvBDGVpWsc/lhcXXbFSzw9FfTe0=
X-Google-Smtp-Source: AGHT+IE9abPTuZJImsBPPVwExiBHv3+UHoPZOEA+bzFtWuIKypEfuzgNNp3VESK6x/US7chA1lqTew==
X-Received: by 2002:a5d:58f2:0:b0:33d:29c1:c28c with SMTP id f18-20020a5d58f2000000b0033d29c1c28cmr1851510wrd.66.1709221778325;
        Thu, 29 Feb 2024 07:49:38 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id n13-20020a5d4c4d000000b0033cfa00e497sm2074044wrt.64.2024.02.29.07.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 07:49:38 -0800 (PST)
Message-ID: <49bcc88d-2562-40c9-81f6-64a48deb2066@freebox.fr>
Date: Thu, 29 Feb 2024 16:49:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
 ath10k <ath10k@lists.infradead.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr>
 <d8c90f33-d0ab-4d73-9580-2547446671a0@quicinc.com>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <d8c90f33-d0ab-4d73-9580-2547446671a0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_074940_851913_4E0931EC 
X-CRM114-Status: GOOD (  12.14  )
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

On 28/02/2024 15:59, Jeff Johnson wrote:

> On 2/28/2024 5:24 AM, Marc Gonzalez wrote:
>
>> The driver waits for this indicator before proceeding,
>> yet some WCNSS firmwares apparently do not send it.
>> On those devices, it seems safe to ignore the indicator,
>> and continue loading the firmware.
> 
> Can you list the product/hardware/firmware where this is observed?
> Would prefer to fix the firmware if the issue is there

Hello Jeff,

Do you think it is possible that the ath10k IP block in the msm8998/sdm835
has never actually sent the MSA_READY indication?

Perhaps the vendor driver does not wait for MSA_READY, and therefore this
issue has never caused a problem downstream?

In that case, we could enable the work-around for all msm8998 boards?

Regards


