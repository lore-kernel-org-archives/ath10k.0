Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4322CC433E0
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 05:18:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7F7F64E4B
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 05:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7F7F64E4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RhTyPf1B1uFbYIvL1b6ZghKbY7Ya7lhiy65yDxnfcsQ=; b=SZqyYqSk/1Yz7JazbJOzBV+cd
	rmBkCWRdK2dPWAem2OoQVH8O2UwwOaxlT4l2bu9uybq9/7U0GCmp7Tx+A2drBK9wPowzc4u0DPjij
	aQWdCpola3Tf4PWaJ1PWjjgeO4XtnHAb4DTn/pE2FwILUw+iwWLeqn7B5/x8UqVlAgC+DUi1UXsUV
	5b9PRlu7Z7Rg6q88TnBFfCHjVuxGThD+4qTIFQrlRHs/2W5owiwRcqOs9vuCh9VLco6qhcsE1VPYg
	sGLj+pGhaMpN25ayFMuUQmRFAxCtpIqNQ6qjPtRakn1wl4jerZRaBYTNlIoJtjDSgCdRGFjrDRlG8
	6tGdlKpSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9htc-0005F1-49; Wed, 10 Feb 2021 05:18:36 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9htY-0005Bg-JL
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 05:18:34 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612934304; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=yA4uPCcjgumhOn0bEUKjVJ4BqtcWpZ83bZnHx4aWj0s=;
 b=HuD3teZFDwPoEVVByd5MOquCATMC6z+LJk1+1iNu3QsF8XHh0ujWu+VdloA5f9bIE3pcB7h6
 XrQJdao0eNafLrjhh9Fp1Kpt+rEIxvokM4D7N3E21/ptQpvSKw4ymFtuhOzc+n1dr1fpbF0Y
 SZxpgQ2yYy/IKMQtdpEUXbxk5pg=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60236c9c4bd23a05ae0f5f02 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 05:18:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8D096C43462; Wed, 10 Feb 2021 05:18:20 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C8A4AC433C6;
 Wed, 10 Feb 2021 05:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C8A4AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: WARNING: suspicious RCU usage (5.11.0-rc7+ #1812 Tainted: G)
References: <2578278.ATerS0GEoy@kreacher>
 <YCJyJgEeiQqBRgzL@hirez.programming.kicks-ass.net>
 <877dnhv4lg.fsf@codeaurora.org>
 <CAJZ5v0iX0Bn7qjTB6S8exox_NYujAupUy4XkJAyFVNDjvnnZXg@mail.gmail.com>
Date: Wed, 10 Feb 2021 07:18:13 +0200
In-Reply-To: <CAJZ5v0iX0Bn7qjTB6S8exox_NYujAupUy4XkJAyFVNDjvnnZXg@mail.gmail.com>
 (Rafael J. Wysocki's message of "Tue, 9 Feb 2021 18:44:21 +0100")
Message-ID: <87pn18tsa2.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_001832_681772_C06B53BB 
X-CRM114-Status: GOOD (  13.67  )
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
Cc: Paul McKenney <paulmck@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 ath10k@lists.infradead.org, Johannes Berg <johannes@sipsolutions.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

"Rafael J. Wysocki" <rafael@kernel.org> writes:

>> > AFAICT that's a simple 'use RCU without holding rcu_read_lock' warning.
>> > I've not dug through ath10k to see who should be doing rcu_read_lock,
>> > but the few places I did look at don't seem to have changed recently.
>>
>> Just this morning I applied a patch which should fix this:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=2615e3cdbd9c0e864f5906279c952a309871d225
>>
>> Please let me know if it fixes the issue.
>
> The traces are gone after applying this patch, so it does help:
>
> Tested-by: Rafael J. Wysocki <rafael@kernel.org>

Good, thanks for testing.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
