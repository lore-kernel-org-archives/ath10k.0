Return-Path: <SRS0=t6ZP=HY=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E1CC433E0
	for <ath10k@archiver.kernel.org>; Mon, 22 Feb 2021 20:52:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C930464DF3
	for <ath10k@archiver.kernel.org>; Mon, 22 Feb 2021 20:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C930464DF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F9LpG+7eWp3vt5pNBjwKbhZFD+fjyUHO97TMTKkqkJY=; b=SsPOYtotI2PDxEBmHr+StOLto
	IZXbS6V/60GtAcepeG5pXxBasXRqBW0hdg40dQl/tRGsDANDokB3HeSciXlsFvrx4YrM73AHhB6+n
	dlmDkgdDO4wCh7S5mNh1ML0flbDY57TPOiOenx3Qui0MTy+JQWKZJfGX0RTAQD5tuXXUfcTi9W6NH
	kBJn5OaZB0Cv6vQVscMpV+PvbVcJlWbMUkOqf5SMV+tDLdfiNQ5eN8viem1CXxvtKP13CnMZn6h3b
	sbubVeh4aur4fh+vOwGvCEWMDhdtHWjCpf8xWfhIfSWKRwBbNKoiSJbowKQEvUHaEvZeBdPv6SD/X
	qdcsttUfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEIBZ-0000Rh-Hy; Mon, 22 Feb 2021 20:52:05 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEIBV-0000R8-Pc
 for ath10k@lists.infradead.org; Mon, 22 Feb 2021 20:52:03 +0000
Received: by mail-io1-xd30.google.com with SMTP id f6so14755260iop.11
 for <ath10k@lists.infradead.org>; Mon, 22 Feb 2021 12:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kuUm+XwaOMq3E6+R97zywmgPDYZMExhRWYsNZ2tzM1k=;
 b=fshLji8N5sLxudDYL0zctHxlngBXio5EBB4HIyt9yiFXqb1lvBv7Hbg+a7SdaXnU92
 t0Z88p6rhVp/LijwWirktql4JIJkb3Keslasl6Nr4g75JqqmbL+wXydCnu7Ugt6pdfTv
 qTcfLe0SVAhU+urDYqQa/2mcMfm2rDU+5gpBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kuUm+XwaOMq3E6+R97zywmgPDYZMExhRWYsNZ2tzM1k=;
 b=G0/BEvmUMzOc98qXRBkTBgwOv9/GZzmNRGZeXeDnyN1+nYXFAEDQ5dBHR8ZMeJ0wYF
 I3DUN7fXyQZdSLImsAD9voLvyaswEgtD1qACwCtcado/OukRT50TYJ3OiQkRtTdEzYaX
 bJcwv7soOggQcG0d4QmsKQnJpVFZ69e91/kXeiLnlzhmGB6HMaC/9ctyNnKgyPiSlFNn
 Yrq94J6Blu7tXG1eF4TFqignmnkeQTxJbASOubaGztOtjlWwqhd+71v8tvRhvRw4Jzoh
 m+Am9zSNA+z9fSG2P6uk88PimP8JAl1zd+31NtxKIUdGkVPNNOoOno3DXcuNotnzyziH
 6oxA==
X-Gm-Message-State: AOAM530ptnVmRLBp2g1TMdKpUKzp2Lr2il3D+vaMko7ncNMvskddGOtd
 niqEtrLBHeshVvZjhyfp0YiUOA==
X-Google-Smtp-Source: ABdhPJwzv6hjO87ytJYuheqlXuPEKrgLDRMEEqLMjH49Kte3lJoKPb495/7/SFdW8rMylcM2rbxG/A==
X-Received: by 2002:a5e:dd46:: with SMTP id u6mr14196077iop.73.1614027118926; 
 Mon, 22 Feb 2021 12:51:58 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id d12sm12524039ila.71.2021.02.22.12.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 12:51:58 -0800 (PST)
Subject: Re: [PATCH 1/2] lockdep: add lockdep_assert_not_held()
To: Johannes Berg <johannes@sipsolutions.net>,
 Peter Zijlstra <peterz@infradead.org>
References: <cover.1613171185.git.skhan@linuxfoundation.org>
 <37a29c383bff2fb1605241ee6c7c9be3784fb3c6.1613171185.git.skhan@linuxfoundation.org>
 <YCljfeNr4m5mZa4N@hirez.programming.kicks-ass.net>
 <20210215104402.GC4507@worktop.programming.kicks-ass.net>
 <79aeb83a288051bd3a2a3f15e5ac42e06f154d48.camel@sipsolutions.net>
 <YCqbehyyeUoL0pPT@hirez.programming.kicks-ass.net>
 <eb819e72fb2d897e603654d44aeda8c6f337453f.camel@sipsolutions.net>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <c9293180-3eba-a5f3-b34e-b44ebdd60077@linuxfoundation.org>
Date: Mon, 22 Feb 2021 13:51:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <eb819e72fb2d897e603654d44aeda8c6f337453f.camel@sipsolutions.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_155201_946890_7D1F2450 
X-CRM114-Status: GOOD (  15.28  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, mingo@redhat.com,
 Shuah Khan <skhan@linuxfoundation.org>, kuba@kernel.org, will@kernel.org,
 davem@davemloft.net, kvalo@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2/15/21 9:10 AM, Johannes Berg wrote:
> On Mon, 2021-02-15 at 17:04 +0100, Peter Zijlstra wrote:
>> On Mon, Feb 15, 2021 at 02:12:30PM +0100, Johannes Berg wrote:
>>> On Mon, 2021-02-15 at 11:44 +0100, Peter Zijlstra wrote:
>>>> I think something like so will work, but please double check.
>>>
>>> Yeah, that looks better.
>>>
>>>> +++ b/include/linux/lockdep.h
>>>> @@ -294,11 +294,15 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
>>>>   
>>>>   #define lockdep_depth(tsk)	(debug_locks ? (tsk)->lockdep_depth : 0)
>>>>   
>>>> -#define lockdep_assert_held(l)	do {				\
>>>> -		WARN_ON(debug_locks && !lockdep_is_held(l));	\
>>>> +#define lockdep_assert_held(l)	do {					\
>>>> +		WARN_ON(debug_locks && lockdep_is_held(l) == 0));	\
>>>>   	} while (0)
>>>
>>> That doesn't really need to change? It's the same.
>>
>> Correct, but I found it more symmetric vs the not implementation below.
> 
> Fair enough. One might argue that you should have an
> 
> enum lockdep_lock_state {
> 	LOCK_STATE_NOT_HELD, /* 0 now */
> 	LOCK_STATE_HELD, /* 1 now */
> 	LOCK_STATE_UNKNOWN, /* -1 with your patch but might as well be 2 */
> };
> 
> :)
> 


Thank you both. Picking this back up. Will send v2 incorporating
your comments and suggestions.

thanks,
-- Shuah






_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
