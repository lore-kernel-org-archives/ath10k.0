Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6926ACD128A
	for <ath10k@archiver.kernel.org>; Wed,  3 Apr 2024 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xffq3xDlhcth/zmXxLFozcKGPrlUpFFerV06UWS3/eA=; b=iCijDc3WF0RY7zPpPUviQCzh9c
	k2+yQxlbK+VdvvuXsOraf+J6kdyt7VDJEpvJqguo3vr5yNGiD0DW1rRJyRKlgOUz7e3CCzWiF7C7X
	JyfuuvfFHZ03b495VTSa4H9cd2viD7vNpRLqqlGHqI7yOCp4wFkncOmHGOFLq2fuJH9Q3+JjgbmVx
	Quoukr+Cdw9RNI5SM4ZDaLe/rpt/9kUJXsSfjYHBe9E8J7yfYu5P/4FfCubP1D1AuLUBww0JkoA5G
	Nk29LMODAr0R5tboskCpnrpv4xhM0mFAIorTC7w0wYtmlW3MAPYchrS2cA/CbKF8LjoD3+AptWyLK
	J//nhCQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1CN-0000000GLrE-0xJn;
	Wed, 03 Apr 2024 14:02:43 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1CI-0000000GLow-48XS
	for ath10k@lists.infradead.org;
	Wed, 03 Apr 2024 14:02:40 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2d485886545so106097041fa.2
        for <ath10k@lists.infradead.org>; Wed, 03 Apr 2024 07:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712152956; x=1712757756; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xffq3xDlhcth/zmXxLFozcKGPrlUpFFerV06UWS3/eA=;
        b=gFIpUIiApzHffORay5lpPGGVrVGGkQbDl9Kpdn9N0+pGvf4qeXdAqweutzhs/9Qtnq
         fm3exDqOMek+xsha7MGpMby7k8G7Jluy72hYbiG11QwB9eHklCpYJoP8KRKjl83IU3Gz
         O6FjRzrK8bfppSk26ZZw9xuI8NqB7u2uZ/XDq+y04TIYiN17yTSqmHPhdH6f48F14mTx
         /WCplv+tgyammBUhcdgKk+aar+ylE2juaYxBQ04mbSU4dUeWT6b91ZKidq+PF92mKBcr
         mHWUX/oTJWocBNpEChuYB37FY0wU+hNye2mrv/TKK9BpZRLiWnthVDb7xvMEne99GCgC
         /I2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712152956; x=1712757756;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xffq3xDlhcth/zmXxLFozcKGPrlUpFFerV06UWS3/eA=;
        b=uXPQhVCM0rBrJmGtoqVNvi3Dth+JdYVWTYHlnyEPoElHJpQFa97ZTEiTyLSxhYTIRQ
         v0FdcgERlYkCYs/bbzOVs2oKsHjlh+O9PhGOmtbcNHSLcovpENvzbonAVvfaWD7Qo31k
         HSWJQHWIhmJWVjSsXSrFMGX2CNoCPNiKoW9EGYo8Zzha46xVktu7cCUEjkKyu1yyEanx
         xFL2tfNkiQWSwNBSzimhETFQ2XRS75PV50ihUhSVV89NNIOXztcMgEbTqjoFFWQnPQYh
         7zfEZJ9vBXm8IFkHbGrwu3uZCC0JVu15ApSdho0MG0YGN1d5aBxYNwdUuHC2Z9kUN54R
         q4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcn5bRTW3DDO+nyNQfRlPDk6W8Z7MU+y5aUNls40BoDdIF6HdDSNbmiDr8nusU/ThHtH7Iz1ycw7LCDT64yJZVftywvNRG3RnGxQ==
X-Gm-Message-State: AOJu0YyE8cZHCfS81ndJ/GghUFqgyq1a4vyQQVSKz6UuQtCiZ34AUGRp
	E6b+bilf5rv5fv0A9Gxti7OZ3+Ie6mEv+EPgbsCYvx99Yx/hYpVi1XZArbDP7XZ+bxo1MIPNxVv
	i
X-Google-Smtp-Source: AGHT+IETrJrTqm00Dp9BwZahe/RD7sPBnfDU3orBH0Q5JhIG1nu10mWk/AhrLzD3NxyRT2xEBRwUmQ==
X-Received: by 2002:a2e:8550:0:b0:2d4:3e96:47ee with SMTP id u16-20020a2e8550000000b002d43e9647eemr3625858ljj.26.1712152956372;
        Wed, 03 Apr 2024 07:02:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o1-20020a1709064f8100b00a46baba1a0asm7788206eju.100.2024.04.03.07.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 07:02:33 -0700 (PDT)
Message-ID: <ec78df08-118b-4086-beec-9227b309595a@linaro.org>
Date: Wed, 3 Apr 2024 16:02:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] wifi: ath10k: sdio: simplify module initialization
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
 Brian Norris <briannorris@chromium.org>,
 Ajay Singh <ajay.kathat@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
 <f78fa061-3b34-47d2-a40c-bbec744f0f97@quicinc.com>
 <87jzle5zda.fsf@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <87jzle5zda.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_070239_075076_C49FDCA6 
X-CRM114-Status: GOOD (  12.54  )
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

On 03/04/2024 15:50, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> 
>> On 3/29/2024 10:10 AM, Krzysztof Kozlowski wrote:
>>> This driver's initialization functions do not perform any custom code,
>>> except printing messages.  Printing messages on modules
>>> loading/unloading is discouraged because it pollutes the dmesg
>>> regardless whether user actually has this device.  Core kernel code
>>> already gives tools to investigate whether module was loaded or not.
>>>
>>> Drop the printing messages which allows to replace open-coded
>>> module_sdio_driver().
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>
>>>
>>> ---
>>>
>>> FYI:
>>> I have ongoing patchset touching few lines above this patch chunk
>>> (sdio_driver) which might go via different tree. If that patchset is
>>> applied via different tree, it might result in a trivial conflict, but
>>> there is no dependency. They can go via separate trees (except that
>>> trivial conflict).
>>
>> I'll let Kalle respond if he'll take this through the ath tree vs letting you
>> take it through your tree
> 
> I prefer to avoid conflicts as much as possible. In this patchset I'm
> not anticipating any conflicts with wireless trees, so if we can avoid
> any conflicts, please take this patchset via the other tree:
> 
> Acked-by: Kalle Valo <kvalo@kernel.org>
> 
> I'll drop this patchset from my queue. But if I should take these to
> wireless trees instead just let me know.

Just to clarify - only the first patch has possible conflict. The rest
should be fine. Can you pick up 2-6 patches from this set?

Best regards,
Krzysztof


