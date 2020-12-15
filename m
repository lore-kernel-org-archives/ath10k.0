Return-Path: <SRS0=cltn=FT=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F383BC4361B
	for <ath10k@archiver.kernel.org>; Tue, 15 Dec 2020 08:06:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6A5E2228A
	for <ath10k@archiver.kernel.org>; Tue, 15 Dec 2020 08:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6A5E2228A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ly6kW5urwN6LOOCjHueHInN7xaSqEoUPbTciMMK9l9U=; b=ZA7vFFlsUziCJc3nNe5xA8i/0
	/iS5mjLCudEIEWjH4icy67RsgkoZTth1AvKzekCg1rC7rYLXsaMSs+Qg9aQf43skf+syaLLLPHphH
	uIx7Z8i0/I9UuG29O0ha194fbEaIFynEgnA537K7esP3+Dy3gTD4rVXKX5/3GHG61lfbO/oTmI0Me
	ZHz3SBB7LAFn7wVi+fic7asYXBQK/JlR3Su5CZp6ElwaK2aEuK+v4gTeKZjnDeoGB23APNd7aXb7t
	q9I1CkdyFuhyztiYb3ZHe7nqcGmw7GzIehv2tfNujVbjb6DdiHgPG5RHuoJ+ftY0m5bv6IsncqwTv
	BM3SGAQew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kp5L9-00078z-FJ; Tue, 15 Dec 2020 08:05:47 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kp5L3-00078b-MZ
 for ath10k@lists.infradead.org; Tue, 15 Dec 2020 08:05:45 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608019541; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=EiS56InFbNrrErINtWma1P8wVuX8T9P+uncV9L2GfGc=;
 b=FqsvbXBb6ZIthfxmwJH5lr4JN9j8+X2Wc10f4+LxDe0dHQvL5U3d3OgOhnggd0g/+qN2pXp7
 SVyUm3ZDyOOEv51YMeR/ug/iSDUBnWeDc7lCprXu6Z1m1SGkNLDwQohZksc9cnUtP6YPIC+H
 oyvg3bgjOqjr3mKBVP4ns/I9tvA=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5fd86e54f8abda8529b8eae3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Dec 2020 08:05:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5A7DFC43461; Tue, 15 Dec 2020 08:05:39 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A036EC433ED;
 Tue, 15 Dec 2020 08:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A036EC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v3] ath10k: add flag to protect napi operation to avoid
 dead loop hang
References: <1598617348-2325-1-git-send-email-wgong@codeaurora.org>
 <87d02x1rqb.fsf@codeaurora.org>
 <010101746bd17881-819242de-7cbb-4df3-93e2-59473d281155-000000@us-west-2.amazonses.com>
 <87r1nzbadn.fsf@codeaurora.org>
 <8a97f5ba-8eba-d61b-4c92-bdfd08d388ee@candelatech.com>
 <e4b4f4d1fadd4d691729ef422e8732d7@codeaurora.org>
Date: Tue, 15 Dec 2020 10:05:35 +0200
In-Reply-To: <e4b4f4d1fadd4d691729ef422e8732d7@codeaurora.org> (Wen Gong's
 message of "Thu, 10 Dec 2020 10:29:35 +0800")
Message-ID: <87tusn1okw.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_030541_790253_53B2C916 
X-CRM114-Status: GOOD (  17.44  )
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> On 2020-12-09 23:00, Ben Greear wrote:
>> On 12/9/20 1:24 AM, Kalle Valo wrote:
>>> Wen Gong <wgong@codeaurora.org> writes:
>>>
>>>> On 2020-09-08 00:22, Kalle Valo wrote:
>>>>
>>>>> Just like with the recent firmware restart patch, isn't
>>>>> ar->napi_enabled
>>>>> racy? Wouldn't test_and_set_bit() and test_and_clear_bit() be safer?
>>>>>
>>>>> Or are we holding a lock? But then that should be documented with
>>>>> lockdep_assert_held().
>>>>
>>>> yes, ath10k_hif_start is only called from ath10k_core_start, it has
>>>> "lockdep_assert_held(&ar->conf_mutex)", and ath10k_hif_stop is only
>>>> called from ath10k_core_stop, it also has
>>>> "lockdep_assert_held(&ar->conf_mutex)". then it will not 2 thread
>>>> both
>>>> enter ath10k_hif_start/ath10k_hif_stop meanwhile.
>>>
>>> Ok, but every function depending on a lock being held should still
>>> call
>>> lockdep_assert_held(), that way we can catch the bug if locking
>>> changes
>>> later. So it's not enough that ath10k_core_stop() has
>>> lockdep_assert_held(), also these napi functions should have it.
>>>
>>> I actually decided to switch using ATH10K_FLAG_NAPI_ENABLED with
>>> set_bit() & co, simpler locking that way and no lockdep_assert_held()
>>> needed anymore. Please check my changes in the pending branch, I have
>>> only compile tested them:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=e0a466d296bd862080f7796b41349f9f586272c9
>>>
>>
>> Why do you not need locking?  You can't just check a bit is set and
>> then do work and set
>> it later without locking, two concurrent CPU threads can pass the
>> first check and both get into
>> the logic below it?
>>
> maybe because which I said before:
>
> ath10k_hif_start is only called from ath10k_core_start, it has
> "lockdep_assert_held(&ar->conf_mutex)", and ath10k_hif_stop is only
> called from ath10k_core_stop, it also has
> "lockdep_assert_held(&ar->conf_mutex)". then it will not 2 thread both
> enter ath10k_hif_start/ath10k_hif_stop meanwhile.

Yeah, but that was not visible from the code. I now changed the patch in
pending branch that this is clearly documented with
lockdep_assert_held() and lockdep will warn if someone breaks the
locking later on.

If a function relies on a lock being held, lockdep_assert_held() needs
to be _always_ used to make the locking dependencies clearly visible.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
