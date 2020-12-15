Return-Path: <SRS0=cltn=FT=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E06C4361B
	for <ath10k@archiver.kernel.org>; Tue, 15 Dec 2020 07:57:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECFD222273
	for <ath10k@archiver.kernel.org>; Tue, 15 Dec 2020 07:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECFD222273
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fH7kRd1mWfgg8oxglzzIeRpqX/PIitySBiMFl8INSIE=; b=ofF+Ll3Q9hDCxWyE7KuhxAO6k
	015/493ujgZqXdiqHfhY51ccZ9P19Kix3RnVT2QkSZ6NDF2SU1X6/U7w7uLyheYfAeHOq1rj3dmvw
	yb00ryJ/aku6vacH3mxMwh32s5jY4EWJILAH8s+uXovPzPeKJiwctRcHJCbfIY1LH+t1aZEGLBRA7
	2kGnicvUHR7f553F4id0dgTLHH1zVmFE3prBaS9J8M3CxT5omwLe49Bu/us8gJP/SHpxbcNgnHDHL
	Elr25tpw5ou6roBIVMEQBZ+bFhJv/BHByROPDlsaNas0aY/ibANwAX7+iWFZW2Y+9TipKH8bSg6G0
	Ox4TWHslQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kp5CJ-0006mL-HE; Tue, 15 Dec 2020 07:56:39 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kp5CE-0006lX-QQ
 for ath10k@lists.infradead.org; Tue, 15 Dec 2020 07:56:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608018996; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=w/DmYDE2LJLOcCmATu8luhG4VxtIYbdFGkom5uX02wM=;
 b=emyg0x2/aKtSLue1Lhi9KdBK0McigAQFH9g9yqBCmtIH5HYgwq5gvmEr98drS1rS4ov62JcZ
 LbLeM/cgR3zJPiAdbdqNTPsZOudjVVZa0zPmIvfi9wO+O+P6WhwQ8OCYMg9X9tkYqqdacewL
 qiVNZdXp4u0qTqSlCXd9YnP7mUw=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fd86c299021521a4137593f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Dec 2020 07:56:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3E2ECC433C6; Tue, 15 Dec 2020 07:56:24 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 309ABC433CA;
 Tue, 15 Dec 2020 07:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 309ABC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Ben Greear <greearb@candelatech.com>
Subject: Re: [PATCH v3] ath10k: add flag to protect napi operation to avoid
 dead loop hang
References: <1598617348-2325-1-git-send-email-wgong@codeaurora.org>
 <87d02x1rqb.fsf@codeaurora.org>
 <010101746bd17881-819242de-7cbb-4df3-93e2-59473d281155-000000@us-west-2.amazonses.com>
 <87r1nzbadn.fsf@codeaurora.org>
 <8a97f5ba-8eba-d61b-4c92-bdfd08d388ee@candelatech.com>
Date: Tue, 15 Dec 2020 09:56:20 +0200
In-Reply-To: <8a97f5ba-8eba-d61b-4c92-bdfd08d388ee@candelatech.com> (Ben
 Greear's message of "Wed, 9 Dec 2020 07:00:52 -0800")
Message-ID: <87y2hz1p0b.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_025636_321553_D2AAF997 
X-CRM114-Status: GOOD (  17.82  )
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 Wen Gong <wgong@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> On 12/9/20 1:24 AM, Kalle Valo wrote:
>> Wen Gong <wgong@codeaurora.org> writes:
>>
>>> On 2020-09-08 00:22, Kalle Valo wrote:
>>>
>>>> Just like with the recent firmware restart patch, isn't
>>>> ar->napi_enabled
>>>> racy? Wouldn't test_and_set_bit() and test_and_clear_bit() be safer?
>>>>
>>>> Or are we holding a lock? But then that should be documented with
>>>> lockdep_assert_held().
>>>
>>> yes, ath10k_hif_start is only called from ath10k_core_start, it has
>>> "lockdep_assert_held(&ar->conf_mutex)", and ath10k_hif_stop is only
>>> called from ath10k_core_stop, it also has
>>> "lockdep_assert_held(&ar->conf_mutex)". then it will not 2 thread both
>>> enter ath10k_hif_start/ath10k_hif_stop meanwhile.
>>
>> Ok, but every function depending on a lock being held should still call
>> lockdep_assert_held(), that way we can catch the bug if locking changes
>> later. So it's not enough that ath10k_core_stop() has
>> lockdep_assert_held(), also these napi functions should have it.
>>
>> I actually decided to switch using ATH10K_FLAG_NAPI_ENABLED with
>> set_bit() & co, simpler locking that way and no lockdep_assert_held()
>> needed anymore. Please check my changes in the pending branch, I have
>> only compile tested them:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=e0a466d296bd862080f7796b41349f9f586272c9
>>
>
> Why do you not need locking? You can't just check a bit is set and
> then do work and set it later without locking, two concurrent CPU
> threads can pass the first check and both get into the logic below it?

Good point, there is a race. I now fixed the patch in the pending and
documented that core_mutex needs to be held when changing the NAPI
state:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=2fe769592ef6d4ae14260989dcbdbde4bff01cb6

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
