Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAAEC54E41
	for <ath10k@archiver.kernel.org>; Tue,  5 Mar 2024 08:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z321qTKWtk15yH3t9Ej/fGlBYVjhkASl76YshRID/ZE=; b=P0ad9kC55Hf7NkeOOE5pK7oSdr
	uD1LA96h2A0B3ixS5o4JoFi47U1Y/kk4tCpSNV32x7BxuB5al2hGlo57gnkPX2HlFMpeNjDaJQlGh
	UdlZzjpaUOdZK9coYHA2qL0UI7HsratKx6wFKnESIVo8yFDdvdLv/8edUGPf9V235aH/joW0yhSkm
	aTYWQPAiNBIsc0Eg6Gxlt/vBrMpSGFG1/7D6wd7eLg4vd01DBUhjiWvjHIVRVlQLCpuA0/2d2Fn/d
	vJ3w2Y9cKtYrp8Qs99EZpFSGrmeqErxxnwrMdEPXhbkhkeximM1vACQAHKhO4oCpix7NCTZC1+LvE
	KBkLRKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhPnL-0000000CW7i-038g;
	Tue, 05 Mar 2024 08:05:03 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhPnH-0000000CW6i-0rbh
	for ath10k@lists.infradead.org;
	Tue, 05 Mar 2024 08:05:01 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a44f2d894b7so320783866b.1
        for <ath10k@lists.infradead.org>; Tue, 05 Mar 2024 00:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709625895; x=1710230695; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z321qTKWtk15yH3t9Ej/fGlBYVjhkASl76YshRID/ZE=;
        b=xdGyXDV2YI39yv+Hs2BEFbq3MZI1RhrltpTJFv5oU60HcQhHd/V5t4LPHhdetGTq3N
         ijsSzxvhmaj9SdAjppRJz7u3hOC89GBOpWAvQ48x0JJkQJb3whg57dbFRHVgINiPulvA
         oh8dQs+NZxNkb9mDz0lDyyENh153Ax1E8PqsQeFdz/kr5xjq+X1kxmF1R6XUPztB+DZG
         Lgd0+v/fcWWxiEa4TkgnlvDOjOEwcAdlyIYSRvaUPvfKl6LYbTjxXQYGVBiVJWZRQKrH
         KXZMssNXX9doe9ZIUyLH+QYMH47TBlatGV3HEpwYc6cXcyb/D9SMXLl0+GwRcisfO12j
         wfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709625895; x=1710230695;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z321qTKWtk15yH3t9Ej/fGlBYVjhkASl76YshRID/ZE=;
        b=lo/ggwSAqUgvn7PWcb6oYxbuAkirWAanw+u9AmxejMgIStaY4jg+izaIC772HMpIxB
         joDmUp0MhkLJ9cUcLPrQGbMlgKPLYOtpi0wb5lB864hNTidYZv9YgjhpCh3/27MMtuYs
         qV/Tp4Y0O/bxSC+JN8j6tuMay73f1HePEoFVnyUEMzKzhnrc3t8PPsqhCD037T4S8iwy
         PrIIZy1V+Ro8rM5ShxTcZKp2L7gXRtKzWOcQgc7nLqreOs57cBhk69OVTkqC+fTjVxqP
         zdZsEXECwrazL3yKPasUh0DW1+AkScwvP8jAG0tFFOrIK8bCokotDPP55RXGf1kbgwoZ
         5UGw==
X-Forwarded-Encrypted: i=1; AJvYcCXi1lYK0kvEH2rrfPYBpF5BMCH+nTjbe+xOpHN0s3rg+KMfFrPGp7hERcPy7jDNUn/c7udsNtXuGyTnmg+RtsjgBRcByVyyIsxoTw==
X-Gm-Message-State: AOJu0YyLX/Y624wrOc/aufmXG732ZMRE5MwmiAo72albW+rt1qDfWNZA
	geeNhU2ilEHznU4MLMEhoVkGy7YsUwvejdQ8QqJEu2Br+yNHVc4TBVsYxLOtF2Q=
X-Google-Smtp-Source: AGHT+IEJoL4rNXit1Wc4e/+msPDAwWm73giIGlMLyDcfuCOmEdIZnp7eAMTy35qiUMPZ+j61jG1zOw==
X-Received: by 2002:a17:907:7677:b0:a44:7bbe:d770 with SMTP id kk23-20020a170907767700b00a447bbed770mr9366046ejc.7.1709625895391;
        Tue, 05 Mar 2024 00:04:55 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id ld13-20020a170906f94d00b00a451ab833c5sm2635117ejb.21.2024.03.05.00.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 00:04:54 -0800 (PST)
Message-ID: <f2c02ebe-47a5-4035-9bd5-c4c1f13e27a5@linaro.org>
Date: Tue, 5 Mar 2024 09:04:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Conor Dooley <conor@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k
 <ath10k@lists.infradead.org>, wireless <linux-wireless@vger.kernel.org>,
 DT <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr>
 <871q8wk7o3.fsf@kernel.org> <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr>
 <87wmqoilzf.fsf@kernel.org> <20240229-ageless-primal-7a0544420949@spud>
 <68a49964-7c05-4575-a4f3-35848c08fefc@freebox.fr>
 <20240304-component-animator-e2ee0ab7574a@spud>
 <CAA8EJpq5HQaO2E2Pd7yqUTsWyQ_pLDdyoWng8QmWTzYn5fv3PQ@mail.gmail.com>
 <20240304-superior-vicinity-3dc6ca88141a@spud>
 <CAA8EJprMG=fY-G-X03bm7MMhcua9axjw5ULZz0efgHxwzgrdVg@mail.gmail.com>
 <20240304-privacy-registrar-93c48ab1b9c5@spud>
 <CAA8EJppoc9Mu7s8bzXjW_NJDQ5go2+MvoFG_JCnwP-6hC1SRow@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAA8EJppoc9Mu7s8bzXjW_NJDQ5go2+MvoFG_JCnwP-6hC1SRow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_000459_291572_85ADAC33 
X-CRM114-Status: GOOD (  18.45  )
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

On 04/03/2024 21:21, Dmitry Baryshkov wrote:
> On Mon, 4 Mar 2024 at 22:17, Conor Dooley <conor@kernel.org> wrote:
>>
>> On Mon, Mar 04, 2024 at 09:59:13PM +0200, Dmitry Baryshkov wrote:
>>> On Mon, 4 Mar 2024 at 21:46, Conor Dooley <conor@kernel.org> wrote:
>>>> On Mon, Mar 04, 2024 at 09:37:00PM +0200, Dmitry Baryshkov wrote:
>>>>> On Mon, 4 Mar 2024 at 21:34, Conor Dooley <conor@kernel.org> wrote:
>>>>>> On Mon, Mar 04, 2024 at 05:21:37PM +0100, Marc Gonzalez wrote:
>>
>>>>>>> Thus, anyone porting an msm8998 board to mainline would automatically
>>>>>>> get the work-around, without having to hunt down the feature bit,
>>>>>>> and tweak the FW files.
>>>>>>
>>>>>> How come the root node comes into this, don't you have a soc-specific
>>>>>> compatible for the integration on this SoC?
>>>>>
>>>>> No. Ath10k uses WiFi SoC as an SoC designator rather than the main SoC.
>>>>
>>>> Suitability of either fix aside, can you explain this to me? Is the "WiFi
>>>> SoC" accessible from the "main SoC" at a regular MMIO address? The
>>>> "ath10k" compatible says it is SDIO-based & the other two compatibles
>>>> seem to be MMIO.
>>>
>>> Yes, this is correct. MSM8996 uses PCI to access WiFi chip, MSM8998 uses MMIO.
>>
>> Thanks.
>>
>> A SoC-specific compatible sounds like it would be suitable in that case
>> then, to deal with integration quirks for that specific SoC? I usually
>> leave the ins and outs of these qcom SoCs to Krzysztof, but I can't help
>> but wanna know what the justification is here for not using one.
> 
> We can probably start with "historically established" here. From the
> hardware point of view msm8998, sdm845 and several other chipsets use
> a variant of the same wcn3990 WiFi+BT chip. The actual issue is in the
> DSP firmware, so it can be handled via the firmware-related means.
> 

The WiFi+BT chips are separate products, so they are not usually
considered part of the SoC, even though they can be integrated into the
SoC like here. I guess correct approach would be to add SoC-specific
compatible for them.

Best regards,
Krzysztof


