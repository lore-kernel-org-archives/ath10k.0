Return-Path: <SRS0=C/UJ=HN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86FBC433E0
	for <ath10k@archiver.kernel.org>; Thu, 11 Feb 2021 11:20:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91B7964DD5
	for <ath10k@archiver.kernel.org>; Thu, 11 Feb 2021 11:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91B7964DD5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8y7CgIOwOH5pNsT1OXjTSWMmrQsEhZ82b0q13K76RYA=; b=Bw3jCkYwutdzmkMeOFte/KwM/
	xBINj+xppV/3k1LWiwEEcvUzboTPQBazUYsP3X3Nw3vEXD+wuXAZl0k1QqrDSYsPutKOpR5N+ppTn
	Qae2r9THpvCFRVUkEMya+MsmlVgo7/7hxRCNnItdcg4BpsVCF4tJthZTn0ESRNiq5SIKnD1HCPmfb
	VUQObdNMglNbt5sJdmPvTubDXmfzQ006/R32Hxw2LZof6YhIADr9ACMm9XBlOt56nQJZpd+J1IOIQ
	8LTqLWJO4rELS1XMdvXLB62Pnd/YevjZ39mlyTalm3DsXP3HUsHbr3Og5wsOfLxiDVheMqCiuUkIa
	OJ/Ivvo8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAA1a-0005W7-AL; Thu, 11 Feb 2021 11:20:42 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAA1V-0005Ux-Sq
 for ath10k@lists.infradead.org; Thu, 11 Feb 2021 11:20:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613042439; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=ZMVEw+T1+2jFNHRLIczmtfsy/CV7EDResuKLWZr1Ipo=;
 b=PJHxF7zhz/Eb2qA9kJjueqKgmCMlqCgxBI3lzI3dEMNw9rYsk3sY5i5K4hqQmNPVDbDXlyEi
 4kfsDdZVaMAkF6Yx1n/IpQjlsusRRw4r/pUEYvrTatex6qng3K0QZNz43cVa/Jjlr5eWSqkQ
 GI/B5X3DwIaGHswnk0T6UIUvfnU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60251300e3df861f4b929758 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Feb 2021 11:20:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 83FF0C43462; Thu, 11 Feb 2021 11:20:31 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B87A5C433ED;
 Thu, 11 Feb 2021 11:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B87A5C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 4/5] ath10k: detect conf_mutex held ath10k_drain_tx() calls
References: <cover.1612915444.git.skhan@linuxfoundation.org>
 <a980abfb143f5240375f3f1046f0f26971c695e6.1612915444.git.skhan@linuxfoundation.org>
 <87lfbwtjls.fsf@codeaurora.org>
 <d6d8c7b8-f69d-01ef-6d66-8a33ea98920f@linuxfoundation.org>
Date: Thu, 11 Feb 2021 13:20:26 +0200
In-Reply-To: <d6d8c7b8-f69d-01ef-6d66-8a33ea98920f@linuxfoundation.org> (Shuah
 Khan's message of "Wed, 10 Feb 2021 08:57:04 -0700")
Message-ID: <871rdmu9z9.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_062039_615867_DB7E590C 
X-CRM114-Status: GOOD (  24.31  )
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
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, kuba@kernel.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Shuah Khan <skhan@linuxfoundation.org> writes:

> On 2/10/21 1:25 AM, Kalle Valo wrote:
>> Shuah Khan <skhan@linuxfoundation.org> writes:
>>
>>> ath10k_drain_tx() must not be called with conf_mutex held as workers can
>>> use that also. Add check to detect conf_mutex held calls.
>>>
>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>
>> The commit log does not answer to "Why?". How did you find this? What
>> actual problem are you trying to solve?
>>
>
> I came across the comment block above the ath10k_drain_tx() as I was
> reviewing at conf_mutex holds while I was debugging the conf_mutex
> lock assert in ath10k_debug_fw_stats_request().
>
> My reasoning is that having this will help detect incorrect usages
> of ath10k_drain_tx() while holding conf_mutex which could lead to
> locking problems when async worker routines try to call this routine.

Ok, makes sense. I prefer having this background info in the commit log,
for example "found by code review" or something like that. Or just copy
what you wrote above :)

>>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>>> @@ -4566,6 +4566,7 @@ static void
>>> ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
>>>   /* Must not be called with conf_mutex held as workers can use that also. */
>>>   void ath10k_drain_tx(struct ath10k *ar)
>>>   {
>>> +	WARN_ON(lockdep_is_held(&ar->conf_mutex));
>>
>> Empty line after WARN_ON().
>>
>
> Will do.
>
>> Shouldn't this check debug_locks similarly lockdep_assert_held() does?
>>
>> #define lockdep_assert_held(l)	do {				\
>> 		WARN_ON(debug_locks && !lockdep_is_held(l));	\
>> 	} while (0)
>>
>> And I suspect you need #ifdef CONFIG_LOCKDEP which should fix the kbuild
>> bot error.
>>
>
> Yes.
>
>> But honestly I would prefer to have lockdep_assert_not_held() in
>> include/linux/lockdep.h, much cleaner that way. Also
>> i915_gem_object_lookup_rcu() could then use the same macro.
>>
>
> Right. This is the right way to go. That was first instinct and
> decided to have the discussion evolve in that direction. Now that
> it has, I will combine this change with
> include/linux/lockdep.h and add lockdep_assert_not_held()
>
> I think we might have other places in the kernel that could use
> lockdep_assert_not_held() in addition to i915_gem_object_lookup_rcu()

Great, thank you. The only problem is that lockdep.h changes have to go
via some other tree, I just don't know which :) I think it would be
easiest if also the ath10k patch goes via that other tree, I can ack the
ath10k changes.

Another option is that I'll apply the ath10k patch after the lockdep.h
change has trickled down to my tree, but that usually happens only after
the merge window and means weeks of waiting. Either is fine for me.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
