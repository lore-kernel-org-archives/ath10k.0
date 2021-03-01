Return-Path: <SRS0=3j0W=H7=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99457C433E6
	for <ath10k@archiver.kernel.org>; Mon,  1 Mar 2021 16:05:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E6D64DBD
	for <ath10k@archiver.kernel.org>; Mon,  1 Mar 2021 16:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39E6D64DBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qlBGDYpNXi78Xnb7pBrS2ruJshOZQFeV5dBRxHhjUKA=; b=iYDU3w3G2k13RQV38jIcZ8p8A
	eCC3F4rJmTL5Kjg69V3LzFwW3nUM/UYtBVmJFtr7gFM54n1/no+j4mR67I1rkyix3QdpN3nzcIGZc
	HfB6fkuj+JLn1fBG3wOw2wmIskLfaqmUb/uGHg+F8BwQfifR/jSvSuABuk2a203cv7qW4sIGHH+Lh
	fO5QCyBbNeQ97AWChnvqDXXZ9duk+b8XeVAtD/IN13bQG3pObFmKHeih7A7yF1yfHZ5eE2ENS4gTG
	sc0dyMOnQvD0r8iuDO8y/5oyC445rQzwTJiUeWnmibvqvI40NgDnwEDitbsHwCJznCW1BPqSRKSZb
	SaUBKmiYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGl2b-00084G-NZ; Mon, 01 Mar 2021 16:05:01 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGl2Z-000831-0q
 for ath10k@lists.infradead.org; Mon, 01 Mar 2021 16:04:59 +0000
Received: by mail-io1-xd34.google.com with SMTP id k2so12842516ioh.5
 for <ath10k@lists.infradead.org>; Mon, 01 Mar 2021 08:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EKrTHUD8nTlc92mQngo8dvkuTImbzwvaVzeVetCu0jw=;
 b=OzKMNXek+I8inLFREphZnBTEPyMtKFd05n2jkhYEACrXQV50yWIreQxlvXh+bFeZdj
 m3mnr4ReYJxUEjpJoUUPkkWeMqnfuBbkfXQTCvtwielou8eZA/Yjk2ftF0lc2+EZb7gz
 AhJs+aZXzWmdcKcQYYgS9wuGbmOU0SNPmtXgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EKrTHUD8nTlc92mQngo8dvkuTImbzwvaVzeVetCu0jw=;
 b=aaEIcwi+rypmtJa4SzQYQhFrbXuaZs7bIBrlOTO1cge93VwS778LdHGOvB1ZNhcKVj
 l5hIvNz7wRbfUi6Dcs/xhfziPA5knfD56h4h045ZIbzFQP6B9s0oOuLJznOJxiKdmQqv
 8ind1ZzPmp4XWSpbt8Gf7K6T6i2q39E3LgnuvSVOA8NQ94ZqA7y/cw6WthDUpyNru8lB
 S4mJoysU/cFnMwZIsZNlyjYKqUAR6oCjkKPEOXo0MFXdcjZRsZ4vfCO5Gd5usEuZUdFN
 jDMnK2mYnVC+jtjnAPMzCmQ6dPgm28UsIfx9kKz+0pmuY3nbkJ7nH1ojNwV4iTW9SrmK
 Qzlw==
X-Gm-Message-State: AOAM531J4H72MIn/J095XqtkoKRRzr1A+OvP6pZ6snYaZe8+Wt44mibx
 S3fJ8ZSrdPTZL7ZKKt2mWUl73A==
X-Google-Smtp-Source: ABdhPJyHDG0iYVZlSzcNqnmMybFrQ2QGhS+B6rbmCLoGXy1bRb60o28gANXZXohEvaUxVInLWPvkRg==
X-Received: by 2002:a6b:b2cd:: with SMTP id b196mr1301123iof.67.1614614694219; 
 Mon, 01 Mar 2021 08:04:54 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id y3sm570760iot.15.2021.03.01.08.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 08:04:53 -0800 (PST)
Subject: Re: [PATCH v3 0/3] Add lockdep_assert_not_held()
To: Kalle Valo <kvalo@codeaurora.org>, Peter Zijlstra <peterz@infradead.org>
References: <cover.1614383025.git.skhan@linuxfoundation.org>
 <YDyn+6N6EfgWJ5GV@hirez.programming.kicks-ass.net>
 <878s779s9f.fsf@codeaurora.org>
 <YDy1j+hMLGUWKKV6@hirez.programming.kicks-ass.net>
 <87sg5f87df.fsf@codeaurora.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <5a34de30-6de2-8985-ef6f-5873228a3231@linuxfoundation.org>
Date: Mon, 1 Mar 2021 09:04:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87sg5f87df.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_110459_100962_96C025A5 
X-CRM114-Status: GOOD (  13.42  )
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
 davem@davemloft.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 3/1/21 4:02 AM, Kalle Valo wrote:
> Peter Zijlstra <peterz@infradead.org> writes:
> 
>> On Mon, Mar 01, 2021 at 10:45:32AM +0200, Kalle Valo wrote:
>>> Peter Zijlstra <peterz@infradead.org> writes:
>>>
>>>> On Fri, Feb 26, 2021 at 05:06:57PM -0700, Shuah Khan wrote:
>>>>> Shuah Khan (3):
>>>>>    lockdep: add lockdep_assert_not_held()
>>>>>    lockdep: add lockdep lock state defines
>>>>>    ath10k: detect conf_mutex held ath10k_drain_tx() calls
>>>>
>>>> Thanks!
>>>
>>> Via which tree should these go?
>>
>> I've just queued the lot for locking/core, which will show up in tip
>> when the robots don't hate on it.
>>
>> Does that work for you?
> 
> That's perfect, thanks! Just making sure that the patches don't get
> lost.
> 

Awesome. Thank you.

thanks,
-- Shuah

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
