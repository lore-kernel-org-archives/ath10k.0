Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67249C6FD1F
	for <ath10k@archiver.kernel.org>; Sat, 30 Mar 2024 18:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWw0ZP7kBFk0KoFs8ftkXTic4hSGa1QLT0sqvHHSYPs=; b=B0E2Kv9GX1cqvaxLP6nPGmqz0q
	VEBQkprrfokCQyOc4IpQQ8JxeKjfzrQ/MsT3RoHz+s3hz5zrp5o9x3k/N8HfXwc5W3IY/twzTtuwq
	3cWqa28bWpp8V991g/jIMEPz3y/wy5npFQYVKUeenXlIzL487mJBzv70w0ExqThEpclX7Tb0N+fA9
	p8ImdrXizhk0CQvM27pZ6HP7sijmQd167IczWdoabR+yrTAJUx+m9H2HmBMjN69Z8sPXOgGtW5/kD
	HM4/uvFMSQWGWncN3JJYxD7PDgWhEC5b+FFOYQJNu8iNakU2j3WcEB5cfgnW+9Scn4L0A/2mxFUrH
	z9gl2dHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqdML-00000003wst-1lg9;
	Sat, 30 Mar 2024 18:23:17 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqdMH-00000003wrU-2WJF
	for ath10k@lists.infradead.org;
	Sat, 30 Mar 2024 18:23:15 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3417a3151c5so1898867f8f.1
        for <ath10k@lists.infradead.org>; Sat, 30 Mar 2024 11:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711822991; x=1712427791; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XWw0ZP7kBFk0KoFs8ftkXTic4hSGa1QLT0sqvHHSYPs=;
        b=Tw/bRODOZZ8zn7WR3SpUu0RdPvtZEcHIeeY2xVLbnIa6JkP2rvjRwpDgKrhh/LvM6w
         Y1ubhv/NXva3/pBT426ysrWHy2XO7WGBXG4BsNasJxvobVHILGzZr66MF+dlHe9ASpeo
         9TM0jqPpSWX0L4CJ/GePCrCsfmCzTDZqjP5xh81qTI2PoF6sNmRtSRKm+Mf/91LTyE72
         Aq+fyoOuHrQWExfgxQgFjPAP/ZHduFGz7QvetBHac7/j0TwkV53E0iPtGKlPSKiczqla
         oBAmEfbYObNG4rzvXCaFTJlLNLCUaNcpPtCi7VEHdqNo+wKMlKFhzjIrcv+xW1DtbUsw
         CTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711822991; x=1712427791;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWw0ZP7kBFk0KoFs8ftkXTic4hSGa1QLT0sqvHHSYPs=;
        b=ZKjMNaPxON3/8sTtBoquj4t8Hog6qfqfAmivt2/UJdsCcpohQxMssYevSjyRNvqovV
         +QRXVgc9zApBOdgVjqwNQIRCmZVi4WOApIrZ/0fX7EY/5Di3l+KXrbkkv97AgUDD9U6F
         fg9cPfku02d/AXpvHZPuVrkMvbM5nGhjCeb1FkojOMoVZuiV92zzaEii14DcMDoiab/k
         UUcOksg6PwMuMlu2EWO80GQZxpOESERkD0kQWnwqPrC6SPNTGzlxPXQ3ulQPsJ2NVsaK
         QtJqSqgvnfwA375aFDPi3qHL10vF7nFdHrv9qN1+CBBrQS1imQpEr6W9wvcTslmvlUf8
         9LwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVROM2Bi2RrkRCU4uPUfBTIb7+hq8Lvxq+QbSjyDHDE3amencD6XuLjBcKatK/SMxCP7Os70ZtnwF31FVoQ5cyhpBUVEs0oSr9a4A==
X-Gm-Message-State: AOJu0YxjR79fEwWVMdbXlQOz8v36bEybPDesyE7af9ep9sMLugSwK6wp
	e2R8TVXGWxdLHZ+krf+oQCc5ZjQdnJ0Tr4YVE+G2iQOrYs2BZGCveSC2/P6H8GA=
X-Google-Smtp-Source: AGHT+IGdAY5ScaZx1aVnvKHNMZiMDx+Uiiu9YBiOw0GIR9m2Q0k+cx1tZrLYMWlRMTQiMUCky+BQhQ==
X-Received: by 2002:a5d:484c:0:b0:33e:75d9:75cf with SMTP id n12-20020a5d484c000000b0033e75d975cfmr3405876wrs.52.1711822991293;
        Sat, 30 Mar 2024 11:23:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id x14-20020adfdd8e000000b00341b451a31asm6968812wrl.36.2024.03.30.11.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Mar 2024 11:23:10 -0700 (PDT)
Message-ID: <6bd3db0f-2e18-4ad1-abc2-f59c6acc8037@linaro.org>
Date: Sat, 30 Mar 2024 19:23:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <72c162cc-45e0-48b6-8d90-d59fac299375@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_112313_698652_B7BA6544 
X-CRM114-Status: GOOD (  10.27  )
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

On 30/03/2024 19:20, Krzysztof Kozlowski wrote:
> On 28/03/2024 18:36, Marc Gonzalez wrote:
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
> 
> This is v2, so where is the changelog?

Expecting reviewer to dig previous discussions will not help your case.
It helps reviewers if you provide necessary information, like resolution
of previous discussion in the changelog.

I dig the previous discussion, since you did not mention it here, and it
seems you entirely ignored its outcome. That's not a DT property.

NAK, sorry. Please go back to v1 and read the comments you got there.

Best regards,
Krzysztof


