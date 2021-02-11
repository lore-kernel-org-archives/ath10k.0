Return-Path: <SRS0=C/UJ=HN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A74C433DB
	for <ath10k@archiver.kernel.org>; Thu, 11 Feb 2021 20:54:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1C1164E33
	for <ath10k@archiver.kernel.org>; Thu, 11 Feb 2021 20:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1C1164E33
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MuFUQGF8cz5/Z9kV6CvNOQ3GuHlumOOVE9FwhxNG8Co=; b=VCVnFGu2oRp6legwSFNR1AaRH
	i50XbqRp/VCBDXOKSieklwxWdxSIfbFbZUECa6cTvjQvHOc5OgsLgh+ywe9J1r43PP6mXOsGmBcV4
	D+E5BhYtgRF/NG/OhsysSGvSHSBzpxpTZ0uqDjVmSrmDvFPKizsFCZhL0bTT2i5OUCnKa5yvLZ4CX
	uiZciIfmOUb71l/sEqjM2MRs+Yx5dmF2L3n7zw0S7K9MKQdkdXhUXXt01Lki63mhU7CYw7h500uhH
	WRan5mq9fPQkT8nUiy9CzLNW+3orRmKpqtc0oX3Vb+4rtpIGq/gyn4COJd5nQJ2l27eb0X+DIWYBs
	OtoiAch/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAIyO-0002q7-0v; Thu, 11 Feb 2021 20:54:00 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAIyK-0002pS-FR
 for ath10k@lists.infradead.org; Thu, 11 Feb 2021 20:53:57 +0000
Received: by mail-io1-xd2b.google.com with SMTP id s24so7158250iob.6
 for <ath10k@lists.infradead.org>; Thu, 11 Feb 2021 12:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z6ZG5Dmpcr3dphEuMXhR4ohnjOhh91pyYZOXK8YBBQ8=;
 b=SwQEk23nQu49/7zGvXpYbPxTTfQhd6o7wAYudESH1lMiZQYROCK9GrzJrOl2Bh84Zl
 o/RJiF9S+Nv6YIJsJs9mHanLZCn57L0+7WYavg7+z7foM6R7Jd//qEu+5oJIcCnPjXOf
 xktxquW2pcwEdLVdDtL00ytKmXKh1pNsWBuGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z6ZG5Dmpcr3dphEuMXhR4ohnjOhh91pyYZOXK8YBBQ8=;
 b=fnvuYOXlB1Z6pecuQ2qH9b2NzdQcPwHKoYbgXfQ/WLvePwqmWrSI51WMKBUP0Oiz5F
 A3KhUUtfo1Tz08irfFWYhC60bzBl3Lvpy2mWmo1r7r/zPcvE0lIm1ZYJqxTNPpaqWQyK
 oRML2e45wBRDuwExKuR6Ke/NQ1ctUqLqjtmu8OWZC1URW1ki1JOmgFgGnGwP+c2CFvPM
 FoToVqbG4SeV7Ts/dzwF7WjfIHZ426DIAFNs6qJp2pXJCDMZaH2ISlkhR/1tCWSklmr0
 rcG2B7FkQf5tWoULqhQSU4YjZEp1FLRXUAUSghda9Mt0acXVLNMtejMwH/WjNgP6q7Sd
 jrFw==
X-Gm-Message-State: AOAM533ILE2vqRLEJIMFNhb3j132J3678PiglGf+uUW5331qPOnt7KSy
 BqlaG11yf2Oia2Wt0xmDM1K0pw==
X-Google-Smtp-Source: ABdhPJxS+FbWEJCWFiOb19bw5JWTzO423ZZjhYNmsV3ct5XHCjciv+zdMEIgaDhb4egTqrnav0Krmw==
X-Received: by 2002:a5d:9586:: with SMTP id a6mr7220881ioo.83.1613076832081;
 Thu, 11 Feb 2021 12:53:52 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id h13sm3006905ioe.40.2021.02.11.12.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 12:53:51 -0800 (PST)
Subject: Re: [PATCH 4/5] ath10k: detect conf_mutex held ath10k_drain_tx() calls
To: Kalle Valo <kvalo@codeaurora.org>
References: <cover.1612915444.git.skhan@linuxfoundation.org>
 <a980abfb143f5240375f3f1046f0f26971c695e6.1612915444.git.skhan@linuxfoundation.org>
 <87lfbwtjls.fsf@codeaurora.org>
 <d6d8c7b8-f69d-01ef-6d66-8a33ea98920f@linuxfoundation.org>
 <871rdmu9z9.fsf@codeaurora.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f0905d6c-065f-a29c-2c83-77f55e77d36e@linuxfoundation.org>
Date: Thu, 11 Feb 2021 13:53:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <871rdmu9z9.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_155356_640086_2BEFEB1F 
X-CRM114-Status: GOOD (  24.02  )
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
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 Shuah Khan <skhan@linuxfoundation.org>, kuba@kernel.org, davem@davemloft.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2/11/21 4:20 AM, Kalle Valo wrote:
> Shuah Khan <skhan@linuxfoundation.org> writes:
> 
>> On 2/10/21 1:25 AM, Kalle Valo wrote:
>>> Shuah Khan <skhan@linuxfoundation.org> writes:
>>>
>>>> ath10k_drain_tx() must not be called with conf_mutex held as workers can
>>>> use that also. Add check to detect conf_mutex held calls.
>>>>
>>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>>
>>> The commit log does not answer to "Why?". How did you find this? What
>>> actual problem are you trying to solve?
>>>
>>
>> I came across the comment block above the ath10k_drain_tx() as I was
>> reviewing at conf_mutex holds while I was debugging the conf_mutex
>> lock assert in ath10k_debug_fw_stats_request().
>>
>> My reasoning is that having this will help detect incorrect usages
>> of ath10k_drain_tx() while holding conf_mutex which could lead to
>> locking problems when async worker routines try to call this routine.
> 
> Ok, makes sense. I prefer having this background info in the commit log,
> for example "found by code review" or something like that. Or just copy
> what you wrote above :)
> 

Thanks. I will do that.

>>>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>>>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>>>> @@ -4566,6 +4566,7 @@ static void
>>>> ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
>>>>    /* Must not be called with conf_mutex held as workers can use that also. */
>>>>    void ath10k_drain_tx(struct ath10k *ar)
>>>>    {
>>>> +	WARN_ON(lockdep_is_held(&ar->conf_mutex));
>>>
>>> Empty line after WARN_ON().
>>>
>>
>> Will do.
>>
>>> Shouldn't this check debug_locks similarly lockdep_assert_held() does?
>>>
>>> #define lockdep_assert_held(l)	do {				\
>>> 		WARN_ON(debug_locks && !lockdep_is_held(l));	\
>>> 	} while (0)
>>>
>>> And I suspect you need #ifdef CONFIG_LOCKDEP which should fix the kbuild
>>> bot error.
>>>
>>
>> Yes.
>>
>>> But honestly I would prefer to have lockdep_assert_not_held() in
>>> include/linux/lockdep.h, much cleaner that way. Also
>>> i915_gem_object_lookup_rcu() could then use the same macro.
>>>
>>
>> Right. This is the right way to go. That was first instinct and
>> decided to have the discussion evolve in that direction. Now that
>> it has, I will combine this change with
>> include/linux/lockdep.h and add lockdep_assert_not_held()
>>
>> I think we might have other places in the kernel that could use
>> lockdep_assert_not_held() in addition to i915_gem_object_lookup_rcu()
> 

I looked at i915_gem_object_lookup_rcu(). The following can be replaced
by lockdep_assert_held().

#ifdef CONFIG_LOCKDEP
         WARN_ON(debug_locks && !lock_is_held(&rcu_lock_map));
#endif

> Great, thank you. The only problem is that lockdep.h changes have to go
> via some other tree, I just don't know which :) I think it would be
> easiest if also the ath10k patch goes via that other tree, I can ack the
> ath10k changes.
> 
> Another option is that I'll apply the ath10k patch after the lockdep.h
> change has trickled down to my tree, but that usually happens only after
> the merge window and means weeks of waiting. Either is fine for me.
> 

I will send the include/linux/lockdep.h and ath10k patch together and
we will take it from there.

thanks,
-- Shuah

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
