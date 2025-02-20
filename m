Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C87C021B1
	for <ath10k@archiver.kernel.org>; Thu, 20 Feb 2025 14:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RW0UCqWX/l+n3jYLyBzuECOY8BYnHFlum299EUoN1U8=; b=GmbyipcomobPkw3mQAF7eZCoGS
	6QHfJac/TpSWHgScRXebJT+IySpc3SEZg+fTAg76tRagZqU77YD6Y89EkRdokXMc4umdKjM+YrJrB
	JkFNppAOL+HL4gzaHHnJ7s7LDGIWHZ5eI9ye5uWB2L1g9+mYNCxG+hPRp4IjE1o7ibV7QqJ/Ls7Ab
	uik9bpXejxMHXQKU59dLmBRVF817B+fNzdUNnoEvr1gV6WabmUOkE43mI9fLkbnfs4XHgBTwMEZ4o
	B5CEo8bisReElXbVc5chpb6x4kmooHNAVaJPIezcrZOuA4ZMf8tK7T+YCvJ6rIfoJtLibB/mPeO/e
	+WHaVA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl77a-00000001C0i-3yhL;
	Thu, 20 Feb 2025 14:01:46 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl72v-00000001Anj-3K4C
	for ath10k@lists.infradead.org;
	Thu, 20 Feb 2025 13:56:59 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c0b24cc566so76666485a.1
        for <ath10k@lists.infradead.org>; Thu, 20 Feb 2025 05:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740059816; x=1740664616; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RW0UCqWX/l+n3jYLyBzuECOY8BYnHFlum299EUoN1U8=;
        b=EKdrnysaR3Ro3gG+kJ8wN/EyqgKteDQi6kvK3XL67F86x/8GF28sJz2UNlf+O3u0gx
         jjcX20LaGl8aUZb8Jox14xlWVY+h0bJdd/J11doS54g00d0As2iHQAiaJY8e4pIotkNR
         fwGiPpX/8BVfQbir2Z9OI5bCMpkOHOmd9EOVkZgV0A3oiVs4wSy8cwo0OEsLCwEADXMY
         U6A67Li1A0DrzX+puKMGXdw2pBOdbQEO0mBpU9RnUrSOW2CgZnmJK+dmkkNAhv4LqHi3
         wwaPhNriqj7jXbgN+oatTLauUOntzg5edJMgnUTfizYx0G42MaxjYyj0DKlOBgYj5dzB
         VBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740059816; x=1740664616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RW0UCqWX/l+n3jYLyBzuECOY8BYnHFlum299EUoN1U8=;
        b=smgjV5kgknJ/oweMGMYTIs1SXm8GRJT3K+/j8Yn6OC8oUtOOMhI7/ZfQaXgWUWuaLq
         gXZZT/i0+quOGmwAGEDhUfJ2+0bHIj9KKEFsPhtQhsJ3tQ+wUm7RgMAbtNiJ4+dh04o5
         gIiLMPp/2BnZU7mtJ9QreR1WEqhM11+VgZ3Y+7VIhVr+IXx+R9Af1hxSivKT8lTpVCK6
         xrc9lPv2SbysejFwbw3qp+qm7c8hfygb4OP+i0Evlx7Jy9MD2cONmnISELIaqwFPJCfM
         IryiiV3sy8aIByRJ9fMTIYWKUvs9SHe5CSvBlmKghtTl87Zfpc8usNYq44hcMO4+XqPU
         w02Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDyE8shZMtubyK5clB/wESNJ8jAK9k6PbBP70G/4LAWHDhNz0/4i7UB7rr4KmWCUeNGRW+QsQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcAwCDpYqmkpNTnDaBbGT413zLkdrDOLpwS1g9A0aWrDVLuSFx
	XBr9KovlDCbuZfmMyNCs4JlIMBQj7s9y7LfZ2hWwZi+EZVCoC0jGXq2Vbw==
X-Gm-Gg: ASbGncuCvY1ERqBn35xvm/DNr/ic4/IdtE5vIP1BV+7Vag1g27FM4w58m2FioUiyRZu
	1eAWXPpXBERjCiOqf4dPSf/dPRVdGOf8L+OLkBZS23anH2/4UaP7/UbyCMOacLDZGohTrbnx83B
	YWeadhLEJGyPu3QkEdeDezFm3/63Mc7Vnxtn6+FYX9m1h6wOCxGIppoL23WJkViGdaySMuv3fZL
	besX7n/Be279Tj03NaQM5nFOjlpSdmkzMz1s6aXoLJV3jNxSUGMdkOmcwctn3CXGZIBA4zcpBoa
	jWjML0JB9Mp8EoARd9c=
X-Google-Smtp-Source: AGHT+IFyMpMdZjPWG7BXix80U9jYLJDhistuhM5RgZth54SZJl3KVv1PWz94DWh7WI6Z2Kk7SNjB7Q==
X-Received: by 2002:a05:620a:2a13:b0:7c0:79c3:fd2a with SMTP id af79cd13be357-7c0b53080dcmr1101097285a.43.1740059816622;
        Thu, 20 Feb 2025 05:56:56 -0800 (PST)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c0a526cc38sm409417985a.91.2025.02.20.05.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 05:56:56 -0800 (PST)
Message-ID: <ebeb4471-9c89-4b33-9889-b87f2d218508@gmail.com>
Date: Thu, 20 Feb 2025 05:56:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] Convert mac80211 to TXQs only
To: Alexander Wetzel <alexander@wetzel-home.de>,
 linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, ath10k@lists.infradead.org,
 Remi Pommarel <repk@triplefau.lt>
References: <20250217081721.45110-1-Alexander@wetzel-home.de>
 <548270b0-8267-4a94-85ab-597ade0f5082@gmail.com>
 <6586339a-d9c5-4787-95e4-202368341541@wetzel-home.de>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <6586339a-d9c5-4787-95e4-202368341541@wetzel-home.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_055657_842075_63C4831B 
X-CRM114-Status: GOOD (  13.21  )
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

Hi,

On 2/19/25 1:27 PM, Alexander Wetzel wrote:
> On 19.02.25 20:19, James Prestwood wrote:
> ...
>>>
>> Trying to get some clarity if this might fix a regression [1] with 
>> ath10k where upon roaming the TX queue hangs on flush for ~4-10 
>> seconds. I was hopeful for another set [2] but it looks like this 
>> only effected AP mode and with that applied I still notice the behavior.
>>
>> In the worse case we see two failures, which add up to about 10 
>> seconds of delays, more often its just the single "failed to flush 
>> transmit queue"
>>
>> Feb 19 14:15:59 kernel: ath10k_pci 0000:02:00.0: failed to flush sta 
>> txq (sta 6a:3a:0e:22:45:08 skip 0 ar-state 1): 0
>> Feb 19 14:16:04 kernel: ath10k_pci 0000:02:00.0: failed to flush 
>> transmit queue (skip 0 ar-state 1): 0
>>
>> Crossing my fingers this set will have some positive effect here
>>
>
> I had a quick look at ath10k driver and the error message you have. 
> The patch series here will probably not help with that. From driver 
> perspective nothing relevant should be different...
Well thank you for looking at least, I appreciate that.
>
>
>> [1] https://lore.kernel.org/all/ 
>> CA+Xfe4FjUmzM5mvPxGbpJsF3SvSdE5_wgxvgFJ0bsdrKODVXCQ@mail.gmail.com/
>> [2] https://lore.kernel.org/linux-wireless/ 
>> cover.1732293922.git.repk@triplefau.lt/
>>
>> Thanks,
>>
>> James
>>
>

