Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5CACD128A
	for <ath10k@archiver.kernel.org>; Wed,  3 Apr 2024 13:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeDVjxJ3sAqTv13/aXHF66O8awP4FQ/ZTnlb/hTWU6s=; b=jq72wCWPzxGoGr6ysL68u0XI4I
	YDVuKhsPdeeEXRtoQggFw53W2gRaYgAjWbKlFvtNxOa4b80W/09PRVnFKL63dOX11bbHoFc7DmlOi
	eeCSXonMCvGX6tVJIX0n2kkTmHksJB2SHwfWmoBdYDyF1xh12agxjE48Ok3wH6HVj0zb3AKD3AHYS
	l2B+btRLJa2ZhHtfj3dcy3GRUhB4CGzZ6lvdTTt+V/cnxZ4yG2WidpNxU5bD9F3twFY0oJ+vJo4mt
	jM3LHyVpus1Si31enHVnIip7RmWq7QZzarsKAuvc9+XbzYdguAzJE1yr+so00aQL2NOuadyAi0LBZ
	7nk5exzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs15q-0000000GKX7-2PtF;
	Wed, 03 Apr 2024 13:55:58 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs15n-0000000GKWB-0sCU
	for ath10k@lists.infradead.org;
	Wed, 03 Apr 2024 13:55:56 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-56bdf81706aso8194514a12.2
        for <ath10k@lists.infradead.org>; Wed, 03 Apr 2024 06:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712152553; x=1712757353; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IeDVjxJ3sAqTv13/aXHF66O8awP4FQ/ZTnlb/hTWU6s=;
        b=rpHid8vRQYK/3B2fPsWdY0dpNABec6TKBAFo8m+aMpk1sImLdzYc6uxNf2WGU8MkCK
         XATgfkuDzJW46nzLzz80lMhvLA+3PUcDL6bT1pDNfl7GuwqrTN3QE7BA8liuQ072X8yH
         KPXnit7fezoHVe0wtFADXT904AYxNbp2zmT8ufIkZ2gR+E1XqLxo0VKzINDS9VDNjMMh
         3Yzi2JGuIpx8wDjeraqku4V9em4a9dWgtT9csdEibnE79sXg/GHbbxGUPTgC6GTc5HYY
         /yG0G/CUq0xfe667cpIobB/acM5AidjPGb32sGhOriMnscgX6c+2x0Zyu76KJoLJ+GS7
         THiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712152553; x=1712757353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeDVjxJ3sAqTv13/aXHF66O8awP4FQ/ZTnlb/hTWU6s=;
        b=Sl2ifiqt62JAZAK3lpZRZ6l9AXjUunEU598DR4xWzYNCq7xCauWaUI1UOo0MODHvO4
         YLgRH+V4trY4kG49WGn6OGULP+QDIUt70E6N5V4gxugWcG8xdmUnZVOT9xaKImUK9+dv
         D+v83vGlMv+Mzs+mi3hv5lT1J4fZ5O7A2tVEs9qzS+syocTW5FXjeM9BLDEciQJkJkKe
         dlU0M5wia/4srS032l6SvGc4VdJ3v8qgo4UR0syMsGZo2fLNuWGvFaBplDjzakJyp8YJ
         +QWF9ksWwKlkj8q2Xxw/W1XVKXvs5vdMOtxGU/kHu+C0EKeMie6vQOImqQHVf6ZLnupc
         gHDA==
X-Forwarded-Encrypted: i=1; AJvYcCWcsDAW949JqnC3Y8eTMTboSpIkR7iwnNEcjWdG7JeBHFPxiLZaq8eIQ2JTd8MQS1k9zYexVOH7cnTBVgyvDWCiMsOQf8BLlAP7dw==
X-Gm-Message-State: AOJu0YybGe5ecBHl0cmLsFkbkpY/aa7q8vlZpVfh+C1kR8VNkq5d6mLg
	tSFm0hqGHc9FEI4erTfwsnNjBTMWpbNxuz8BUS8eH9nLpYva967sgNyK/4dZpQo=
X-Google-Smtp-Source: AGHT+IH9+C9juSmV/GBuPYaqohGOY4cGhVgCt2H6EcxLrUYmesOKvHEB93iuGOIysgmB4m7ArBHZ6w==
X-Received: by 2002:a50:d596:0:b0:566:47ee:b8b4 with SMTP id v22-20020a50d596000000b0056647eeb8b4mr1682778edi.17.1712152553328;
        Wed, 03 Apr 2024 06:55:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id s2-20020aa7cb02000000b0056c0d96e099sm7963516edt.89.2024.04.03.06.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 06:55:52 -0700 (PDT)
Message-ID: <ec9c76dc-81c3-448c-86c3-8b4cb07c89c5@linaro.org>
Date: Wed, 3 Apr 2024 15:55:51 +0200
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
X-CRM114-CacheID: sfid-20240403_065555_318960_7819C402 
X-CRM114-Status: GOOD (  11.33  )
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

OK, let me squeeze both through sdio, with corrected subjects.

Best regards,
Krzysztof


