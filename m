Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E204BC6FD1F
	for <ath10k@archiver.kernel.org>; Sat, 30 Mar 2024 22:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGCYWWp9GMIyWYRiLUIkswqhBEjJW45xVVdYqohDnyQ=; b=dy9HuZ7n59Pgy820N+x+qlYWm3
	sD2/exZGNYTSmV4ExPLOZ9xopa1pO3ySIuruDYpTrY/85dCkNAlG0KRFFjdp1TzfBN30i5sV870iI
	E2LuuN/0RnDwdY3cC9UMki5XGjilxhL6WDfVwt7gcUvmBNUTisMKsnX05xmQwSG6768heThkv4ph/
	ZaP58rw1L9bQu3hSqqZ7kzgLezMPjCtq0VvuGbJ4EjcdMH/GZKWQ5SY/Ib/2PBYCFIdD4QU3eHZn/
	KFoPA2q+33mkbptGM94nGaKwK7p5f0tJLlt+tM1F0/M+q3BNh/hVe09sjax3s8Ehg2Be2X5tF3zOL
	7N0UAhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqgon-00000004LMh-3Gzr;
	Sat, 30 Mar 2024 22:04:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqgok-00000004LLs-3PP2
	for ath10k@lists.infradead.org;
	Sat, 30 Mar 2024 22:04:53 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4148c6132b4so22538385e9.1
        for <ath10k@lists.infradead.org>; Sat, 30 Mar 2024 15:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1711836286; x=1712441086; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SGCYWWp9GMIyWYRiLUIkswqhBEjJW45xVVdYqohDnyQ=;
        b=LESDl3vpsIiAmSsq8gD/D3Bn6iHBKXoT4JeyjKcJ2GENUn8qW9ayS9nb+vJFMKrg2k
         uUcw3lgfCUl33UgrIifGPOuWcUhjnf5Q9XISWpIoYthJtiLYZSbUsYQ7sZ8ihf3vuuAA
         6hPY3yroRqB0TGxL+eJHRzoJf8FJ3OkPPB+ZRN80Ff9N01RTZqqbdmHLjs7qCbHVH2rK
         U0KAz5uGoaxdb1z1dINudgJ4FIltC0dLAfj/pP68AC+o2hvlsSvJMTnF7KPG73w6U8Iy
         x8bj3pt/k4iO3bWLbpwGNdQq9fMQxHCaai+sJyq7waP1+ryUAY+7vsPhUOR4Tw38v3Ew
         134w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711836286; x=1712441086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGCYWWp9GMIyWYRiLUIkswqhBEjJW45xVVdYqohDnyQ=;
        b=OYEL0m2vhFbQVLagL6gPj7LYqe5DblmcikabcN8+tKYxuUotK/D4k1EHl8lF4u6PPs
         7mfKleHhOU+/FUpwCYbjc/rWz99D33vsSd1gaeCV3x4Sh1B+o6E4ERFoeh8Wb0GACmuj
         sjN+D5zo6bsGAWvPdRbeXFpe3rfaLpK67WYL4Of9Z4KAmuckQ0HPXpTJgOZ0IVqii3wF
         j2XN4cW2nK0QcJYXqzI3fIqtN3mc6El1MofHY+ZQ5F1+WbzofBuARlL6iS3VrHcJBlXG
         nuvN9kpF4B9gF7Ko6Kj8wnb8HnkJNbUqwtNQngNAlkMF8F6RSew1j9IqOHaZepn/FUqL
         bPZg==
X-Forwarded-Encrypted: i=1; AJvYcCVoiQAnMH1lf4fTkwF8tC2ubirfv7SPEPhXHPcRg1volMvxaS31zkdxBqcCgGvjLG/Gh81PxbepVHnDbIG/U/1fV1AR/mguWreBEQ==
X-Gm-Message-State: AOJu0Yyx4m1ADEMbBw5XI92W1rioT13Lg9L5Nt1tTqk8O3aDVd/2Gyq0
	cCoFmC4ApdiKDwlb4iGiBj+r/de+QAodc62HjnhoMos2MzMZmkeoOc+Owr5YONVMvouGct9JYW+
	Pbv7PRw==
X-Google-Smtp-Source: AGHT+IHQblUi6EhvJVc2vxBWhRa0CSocPGwpe4Y/225yNjIZknidoGHYR6Qi/0vpH2PCTsPbf1WZ4Q==
X-Received: by 2002:a05:600c:3d99:b0:415:475c:2cb7 with SMTP id bi25-20020a05600c3d9900b00415475c2cb7mr6808179wmb.3.1711836285597;
        Sat, 30 Mar 2024 15:04:45 -0700 (PDT)
Received: from ?IPV6:2a02:8428:2a4:1a01:2b43:edfc:7d3f:4878? ([2a02:8428:2a4:1a01:2b43:edfc:7d3f:4878])
        by smtp.gmail.com with ESMTPSA id bp29-20020a5d5a9d000000b00341d28586afsm7512161wrb.2.2024.03.30.15.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Mar 2024 15:04:45 -0700 (PDT)
Message-ID: <ea18f91a-710a-4eac-903d-90928caa3090@freebox.fr>
Date: Sat, 30 Mar 2024 23:04:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>
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
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <6bd3db0f-2e18-4ad1-abc2-f59c6acc8037@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_150451_184606_1BB6306F 
X-CRM114-Status: GOOD (  14.60  )
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

On 30/03/2024 19:23, Krzysztof Kozlowski wrote:

> On 30/03/2024 19:20, Krzysztof Kozlowski wrote:
> 
>> On 28/03/2024 18:36, Marc Gonzalez wrote:
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
>>
>> This is v2, so where is the changelog?
> 
> Expecting reviewer to dig previous discussions will not help your case.
> It helps reviewers if you provide necessary information, like resolution
> of previous discussion in the changelog.
> 
> I dig the previous discussion, since you did not mention it here, and it
> seems you entirely ignored its outcome. That's not a DT property.
> 
> NAK, sorry. Please go back to v1 and read the comments you got there.

My apologies for omitting the changelog.

And I don't blame you for missing the thread's resolution,
since I made a bit of a mess of it with my various messages.

The firmware-5.bin approach was deemed DOA since these files
are parsed too late with respect to the required work-around.
Thus, we went back to either DT or a to-be-written system used
in the vendor driver.

Jeff Johnson (one of the maintainers) concluded with:
"But I'm OK with the DT option as well. Kalle?"

Thus, I spun v2 to get Kalle's Ack, and more crucially to give
a heads-up to the msm8998 users my patch would impact.

Regards


