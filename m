Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7530C433E6
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 15:57:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FB8F64D99
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 15:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FB8F64D99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q4Z4lYqCEIPrrtzWiyjdQ0K0bfTVDaOw/vmizwica1M=; b=e+zldPHXhG9bq1D7sdhmXfPAV
	Y5s5LIrB4L194XbJYtVv6iKAZvaHUc0Uzt3/jgqLBuU087e9jQt4/QcKs0NrGcGZ9p9aQlCyHQuaP
	r8QoGvQ0UOcNAYkYMcN0T9sWbiFkWWZhjQzQOKbNEaUfg9whJ0qcV2geCLSxwpEaHq/v87IK2E6SO
	W2dJtks/GVWRYb71L6pgeSQIKU6S0zkIe0M8WgpLSid34IgjivVlRtDHgGSYHEO3a3YaKBpSYovGW
	rJubnJbu2XVknaREuskhaSIlxaJM7fdPiPOwJqKy7JI6jgsvON9iX4KZ2fLAMQCEhWGfAQd9gmzPJ
	Hp0mRc1Ow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9rrb-0004EP-5g; Wed, 10 Feb 2021 15:57:11 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9rrY-0004E1-FQ
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 15:57:09 +0000
Received: by mail-oi1-x233.google.com with SMTP id l19so2513150oih.6
 for <ath10k@lists.infradead.org>; Wed, 10 Feb 2021 07:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yBNnyv08MV67kjLVdIyECXp/12nd8XUPVrYdyrWhw80=;
 b=aFtU6sU+k/QSlSdVczSVRwOa0OQYlIlkXqMs8fmabdtJ2KTico+vi2Tvo6qwHZLnym
 awEH55Dkft9hl2Cvo8lXT6HbyykMuW5CWx3rLl8p6rZF+ivhmxX+1PIWk5gsP9IszVJ3
 vGYsSGf8V0ZGchdfQfdsp//KlKjC7PQrLvwQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yBNnyv08MV67kjLVdIyECXp/12nd8XUPVrYdyrWhw80=;
 b=I2w2lgwNXSOduN1RLC+vzBOaPVse3/Hk99o5scsoRGUkNyU8bmaJqbfbeoPg0Q5HB6
 HtSCn1PjSTdhq12ZvYdV/scq82htZnauvonhXoum3do7VmAVCXQbL1zXyOOM1BLqCJfD
 KPIGJ+8Q1scm2h3xaKlO2MX8OVzLyqg8BaLvC1Jqx9jBKT0KZcQ+ojUkQGJJWWPGLbPN
 td+EAt6wbq3UKP8qlUwWiU1+7KKR7hliGqT6g9vasj9D/Sx/6phXnC4kDmlZwnXawDdU
 VL7z54uPcADsJFR3HMrR0IYXLxQoFOb45BuW7d2B3CVNrimGJGfdYUeCMXHtmZls7S7X
 wPiQ==
X-Gm-Message-State: AOAM531/BbrxZHcuxfs6c5TeIhz/KlfFN6kGHK5IGa6rSzzEiCj0lx65
 fIMKXqjqQ1DwkwxteFipL/4ncz+hJtpGMA==
X-Google-Smtp-Source: ABdhPJzXHwwIMWKtGJtYSb8Q3H0yElai/XdDilRjxI2noBBZcfvp6wpRhAliH3x0TRTylvoapvE4PA==
X-Received: by 2002:a05:6808:10f:: with SMTP id
 b15mr2584739oie.92.1612972626194; 
 Wed, 10 Feb 2021 07:57:06 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id r13sm435237oot.41.2021.02.10.07.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 07:57:05 -0800 (PST)
Subject: Re: [PATCH 4/5] ath10k: detect conf_mutex held ath10k_drain_tx() calls
To: Kalle Valo <kvalo@codeaurora.org>
References: <cover.1612915444.git.skhan@linuxfoundation.org>
 <a980abfb143f5240375f3f1046f0f26971c695e6.1612915444.git.skhan@linuxfoundation.org>
 <87lfbwtjls.fsf@codeaurora.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <d6d8c7b8-f69d-01ef-6d66-8a33ea98920f@linuxfoundation.org>
Date: Wed, 10 Feb 2021 08:57:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <87lfbwtjls.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_105708_683637_A559F4E8 
X-CRM114-Status: GOOD (  22.09  )
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

On 2/10/21 1:25 AM, Kalle Valo wrote:
> Shuah Khan <skhan@linuxfoundation.org> writes:
> 
>> ath10k_drain_tx() must not be called with conf_mutex held as workers can
>> use that also. Add check to detect conf_mutex held calls.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> The commit log does not answer to "Why?". How did you find this? What
> actual problem are you trying to solve?
> 

I came across the comment block above the ath10k_drain_tx() as I was
reviewing at conf_mutex holds while I was debugging the conf_mutex
lock assert in ath10k_debug_fw_stats_request().

My reasoning is that having this will help detect incorrect usages
of ath10k_drain_tx() while holding conf_mutex which could lead to
locking problems when async worker routines try to call this routine.

>> ---
>>   drivers/net/wireless/ath/ath10k/mac.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index 53f92945006f..3545ce7dce0a 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -4566,6 +4566,7 @@ static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
>>   /* Must not be called with conf_mutex held as workers can use that also. */
>>   void ath10k_drain_tx(struct ath10k *ar)
>>   {
>> +	WARN_ON(lockdep_is_held(&ar->conf_mutex));
> 
> Empty line after WARN_ON().
> 

Will do.

> Shouldn't this check debug_locks similarly lockdep_assert_held() does?
> 
> #define lockdep_assert_held(l)	do {				\
> 		WARN_ON(debug_locks && !lockdep_is_held(l));	\
> 	} while (0)
> 
> And I suspect you need #ifdef CONFIG_LOCKDEP which should fix the kbuild
> bot error.
> 

Yes.

> But honestly I would prefer to have lockdep_assert_not_held() in
> include/linux/lockdep.h, much cleaner that way. Also
> i915_gem_object_lookup_rcu() could then use the same macro.
> 

Right. This is the right way to go. That was first instinct and
decided to have the discussion evolve in that direction. Now that
it has, I will combine this change with
include/linux/lockdep.h and add lockdep_assert_not_held()

I think we might have other places in the kernel that could use
lockdep_assert_not_held() in addition to i915_gem_object_lookup_rcu()

thanks,
-- Shuah

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
