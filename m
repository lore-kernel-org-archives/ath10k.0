Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE24C3DA7F
	for <ath10k@archiver.kernel.org>; Thu, 15 Aug 2024 17:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xulcGXZEULbJ4WCNcSPQTMNlh6M7re1bQifn38go1EI=; b=MWjzqbRA5q/VPTnoet3I63MFLj
	qaClreKB0ftekpwdA5AXSGszUu6ls8zJavCHXZ3K7QifZxxqXkDrNP5zTQyNKzdFa0/Ghn2lUOWpm
	0FVtLtxoI87ex4j/JXBvQ2neQxN57Z25thtS3y+iI3BIff4LkCCNRpbXwhB1V7CAd742dkucWF1EF
	0VopjwD0aI8vRJSZi+59D4uHALYHKV7KC6VT6c5MOZkZzrGnaYl5iSrtiy/LzL3FE3uDCZ3XVh93o
	UXGz+skOiT8zK7Gu4ktR3izh0Ku1mO8XKJMRMYMRBIFDX3eJxN2G99QqhwCO+3/KJ2R0WDSXgDOLP
	5HtAIpSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seeY0-0000000AgM6-36Gs;
	Thu, 15 Aug 2024 17:46:04 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sedV4-0000000AXUu-3rN9
	for ath10k@lists.infradead.org;
	Thu, 15 Aug 2024 16:39:04 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7c3d9a5e050so825467a12.2
        for <ath10k@lists.infradead.org>; Thu, 15 Aug 2024 09:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723739937; x=1724344737; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xulcGXZEULbJ4WCNcSPQTMNlh6M7re1bQifn38go1EI=;
        b=jEeRi2IhAtzjaHAp3bTqTSXTucKGXSScqScmjqzKVWCDHh6TXjZ0iu5xBcw3rxhNu5
         WjLCCUUumFL7M0+58w8nv/lPZ7TlcGGqO2/84Q2GlykI6aMvp9DkJZDXtavqo+/hS6tl
         PCeMBX4s91cqGQVQgYG95eFZUe/1ujjKtcewiYligOjf4DRx8af8wRdgIb6MpSVAowMG
         vOEloh6/f0k9AOg1Xz+g7YRbd+Cuq1wOZM+DDznNxv6ftNniSlFEPk6gN11b3hVzTphI
         j4ptzXKGkPt7cWsSGUBmZ8mCOJX3A9LUWRXmjw6wFpyo4kCDqN591nAS+JGt6x945/pW
         HvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723739937; x=1724344737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xulcGXZEULbJ4WCNcSPQTMNlh6M7re1bQifn38go1EI=;
        b=gYkGouO+3TZ0EF42zlnkiBU/H4EsaPkPkDqVyFhTZkHBQkleY1GbjsKgFMU4i54VQl
         vpqVBOOuFgjZcMxdoE6HMO0h4wHW1tA0TmTiUDu8oQTvp+JVPMw6oYIJkSpdewGwA7Ew
         sEKAwymXDmp/ZJEtUAHDGhbsONcBZLhQILds0XTIWIE084SPKlyqz+Quiu7nA4ZSUrKO
         48zQT+ru+SSQR5SswwFd3RQHYC1LP+zudhWNq4OvbzSmFj1PVzsD9OYNFGewaHhU4qfo
         F/msumMPNo0ucH/VfAjeaHG8HU+VYP4hZcVYg525mpRm3KQ5t1mO0u5D3H5dZPDWQ7c6
         +bkA==
X-Forwarded-Encrypted: i=1; AJvYcCWxEvgoAXBelqiHlA3wX6HR/ez62t6fQEnJI8erTrt/Fz7L9aIqv28a+fr8r7Ni2i1dojVq36uHgfkTfgKVeBTxonMKLhkX03v0Tg==
X-Gm-Message-State: AOJu0YwyNjjm63XN0RShtqplLCjAXDCJDBSWsAVU+4BEMxPnFVUIzCng
	Au8BdR07SriMFexirCAl75AxpPELbc6vLj5pTmJDUI4tRnDGyM3O
X-Google-Smtp-Source: AGHT+IHf9LDzrQUk0mhNX0HZI9A7eurftX5m+Q9cLW4kXKvfJE7VxepV3F0mOJa0dPy47BylagdAYg==
X-Received: by 2002:a05:6a21:9184:b0:1c4:986a:de71 with SMTP id adf61e73a8af0-1c90502fc2emr307361637.35.1723739937328;
        Thu, 15 Aug 2024 09:38:57 -0700 (PDT)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127aef4504sm1188265b3a.132.2024.08.15.09.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 09:38:56 -0700 (PDT)
Message-ID: <3dfd6f81-62d0-4959-9ebe-69fceab3f32f@gmail.com>
Date: Thu, 15 Aug 2024 09:38:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k "failed to install key for vdev 0 peer <mac>: -110"
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <e780560a-86eb-4189-ab5d-3bed3ee5825e@gmail.com>
 <c407064a-1c2f-46ec-ac57-32bf9cf6f5c6@gmail.com>
 <9eafac85-2262-4f92-a70b-32109f65c05a@gmail.com> <87r0apyjc3.fsf@kernel.org>
 <6ba02350-3c8c-4664-9d68-67cb7e90eddb@gmail.com> <87ed6pydzw.fsf@kernel.org>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <87ed6pydzw.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_093858_982937_9B1AB5EE 
X-CRM114-Status: GOOD (  18.97  )
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

On 8/15/24 8:58 AM, Kalle Valo wrote:
> James Prestwood <prestwoj@gmail.com> writes:
>
>> On 8/15/24 7:03 AM, Kalle Valo wrote:
>>> James Prestwood <prestwoj@gmail.com> writes:
>>>
>>>> Hi,
>>>>
>>>> So I have no resolution to this (trying to get the AP vendor to chase
>>>> it down), but I'm toying with the idea of trying to work around
>>>> whatever issue the AP is having when this occurs. The only thing I can
>>>> think of is that there is a 3 second delay between the authentication
>>>> and reassociation, and perhaps this is causing some timeout in the AP
>>>> and in turn the deauth.
>>>>
>>>> I'm wondering how long it should take to add/remove a key from the
>>>> firmware? 3 seconds seems very long, and I question if this timeout is
>>>> really necessary or was just chosen arbitrarily? Is this something
>>>> that could be lowered down to e.g. 1 second without negative impacts?
>>>> The code in question is in ath10k_install_key:
>>>>
>>>> ret = ath10k_send_key(arvif, key, cmd, macaddr, flags);
>>>> if (ret)
>>>>       return ret;
>>>>
>>>> time_left = wait_for_completion_timeout(&ar->install_key_done, 3 * HZ);
>>>> if (time_left == 0)
>>>>       return -ETIMEDOUT;
>>> I can't remember anymore but I'm guessing the 3s delay was chosen
>>> arbitrarily just to be on the safe side and not get unnecessary
>>> timeouts.
>> Thanks, I have reduced this to 1 second and have had it running on a
>> client for ~19 hours. Still am seeing the timeouts, but no more than
>> prior. And even with the timeouts the roams are successful.
>>
>> After doing more looking in the spec I did see that there is
>> dot11ReassociationDeadline which may be coming into play here. Of
>> course these APs aren't advertising any TIE or even support FT
>> resource requests that so its impossible to know for sure, and hostapd
>> AFAICT doesn't enforce any deadlines even if you set it... But in any
>> case the timeout reduction is helping immensely and avoiding a
>> disconnect.
> Yeah, reducing the time out might a good option. 3s feels like overkill,
> especially if 1s timeout passes your tests.
>
> But I do wonder what's the root cause here. Are you saying that SET_KEY
> always works for you?

Yeah its only key removal that fails, we proceed on and adding the new 
key succeeds 100% of the time and in most cases this is fine, except 
these picky APs that don't like the 3 second delay.

Fwiw this seemed to start after going from 5.15 -> 6.2, which is a 
needle in a haystack, I know. Makes me think there is a race somewhere 
(like in the firmware) and the command timing changed just enough 
between 5.15 and 6.2 that it happens more frequently.

Thanks,

James


