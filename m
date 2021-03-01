Return-Path: <SRS0=3j0W=H7=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704C8C433E0
	for <ath10k@archiver.kernel.org>; Mon,  1 Mar 2021 08:45:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C45864DF1
	for <ath10k@archiver.kernel.org>; Mon,  1 Mar 2021 08:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C45864DF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LUwM1zZAoBIJmd6xgmjTni4aa7kfdmsmy5M/+lxW8BQ=; b=AMrTrtx9Qqy0LYWld4740IbD/
	4XdUPtUY3hBWDWQHK5kt8i3lFQpwHluJDOd/RtJ+GT4aVqb9TFZzxH9Pkik52jl2J8t3dZixDsFKt
	MSy8QQthfY+PgK94+IKQXEKqrbuRbmR4VGxPeHN94dT9EM+6jVZ0rhBj5Xnck6WHOa1bZwQLGcVBp
	uVzm9VwKGKx/uG9RW3DrW8BPgYfyinYmDM7NPw0MlIrLtPmxHiX/Pxn+XEn0agwZBWa0BJd21zrVO
	Eifz6DXTm2Yxd1vsSCjm/cYaJxbUb9Q973ya+Epbw+F3knMx1gcsTP6raSsX4T5H+FGz1vmT+o38f
	V/DKEXirA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGeBa-0008Vl-9J; Mon, 01 Mar 2021 08:45:50 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGeBU-0008Sz-M2
 for ath10k@lists.infradead.org; Mon, 01 Mar 2021 08:45:47 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614588346; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=O3yhFBjQe0kRff0bAX1BbX9HwQn6+fCi8LLDaatQMAw=;
 b=oYj9VWy4h687Cm6xFbCxKOQL4tYg4vXYeArzPImBMEEw2AxaHbEdK9XHlVOQjocxnQP49RmU
 9QiMDxFYrkqNUHuGQ9a+BJKQ/smGA5XZ+xZ4RHkfnrUEKeyDCmUZx57hfZKVKOpzceJ3H1p7
 G99tmL6Mahl8M5abU0G+XXVMemA=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 603ca9b175e4458f08b79c3a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 08:45:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 97D8FC43466; Mon,  1 Mar 2021 08:45:37 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8CD2AC433C6;
 Mon,  1 Mar 2021 08:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8CD2AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 0/3] Add lockdep_assert_not_held()
References: <cover.1614383025.git.skhan@linuxfoundation.org>
 <YDyn+6N6EfgWJ5GV@hirez.programming.kicks-ass.net>
Date: Mon, 01 Mar 2021 10:45:32 +0200
In-Reply-To: <YDyn+6N6EfgWJ5GV@hirez.programming.kicks-ass.net> (Peter
 Zijlstra's message of "Mon, 1 Mar 2021 09:38:19 +0100")
Message-ID: <878s779s9f.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_034546_325589_B885E5BF 
X-CRM114-Status: GOOD (  10.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Peter Zijlstra <peterz@infradead.org> writes:

> On Fri, Feb 26, 2021 at 05:06:57PM -0700, Shuah Khan wrote:
>> Shuah Khan (3):
>>   lockdep: add lockdep_assert_not_held()
>>   lockdep: add lockdep lock state defines
>>   ath10k: detect conf_mutex held ath10k_drain_tx() calls
>
> Thanks!

Via which tree should these go?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
