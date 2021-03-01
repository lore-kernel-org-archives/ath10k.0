Return-Path: <SRS0=3j0W=H7=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA86CC433E6
	for <ath10k@archiver.kernel.org>; Mon,  1 Mar 2021 11:03:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B729600EF
	for <ath10k@archiver.kernel.org>; Mon,  1 Mar 2021 11:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B729600EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z4kgakvFB5eZuyvxfZtqnr10rmssZqBtVE+dMSLV7I8=; b=JUaJTltlM6PPYFWewebJW9AmO
	Q5vu0Zz38YNnBha3XOgWujWinzNugta2ua6L+4ptvLDZoAbDBUzy1wWautOY1qlLvswbL9OwQLpgG
	VeYXHdjALs5c3iDUFqBGyH05j6kw3R7Kb974qqjGw7OhjPYkE/NdrPtZi1wKWPsST7NrYenAj8Kx6
	0BFmUNzbW393lZgSgZmAJN7B+Oxx/5EeRT/917Kl7DcQNYpPuBzK9mYcaC4Hq2+7V1MwJFrmEsfp3
	3PJQk9O2ruOhpEEgxrIBCZHYpU8/Hzmk/RH6LoPHIKDMsS0n4WH8K0t6GAtGkyRBJyvlpc3No7JMT
	RXAE1LsGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGgKb-0006Cc-Dx; Mon, 01 Mar 2021 11:03:17 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGgKU-00069X-Rj
 for ath10k@lists.infradead.org; Mon, 01 Mar 2021 11:03:15 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614596594; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=+7BFJqQDeYvelmgTlxYpxBYI4TI83ZPuqrPorQnkW3Y=;
 b=SZVMQTA1tbwfPI8e5gVgYZmz2nzN9A3l0Om3ryfWKANqQcB7o0/l4bA0/NP4w2KWxcQ0BHJF
 0iP9WkJuJX7GHrN+O33NoDoqO0vXf3Zo3wxklwAKKX5tGuFbgLeN2IGP7j6xcLqLqMfrfm5q
 daf227OobjWCTyLQvl2EYz7VmEw=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 603cc9b27aa94c52e7496f70 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 11:02:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1B7CEC43464; Mon,  1 Mar 2021 11:02:10 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E44A1C433C6;
 Mon,  1 Mar 2021 11:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E44A1C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 0/3] Add lockdep_assert_not_held()
References: <cover.1614383025.git.skhan@linuxfoundation.org>
 <YDyn+6N6EfgWJ5GV@hirez.programming.kicks-ass.net>
 <878s779s9f.fsf@codeaurora.org>
 <YDy1j+hMLGUWKKV6@hirez.programming.kicks-ass.net>
Date: Mon, 01 Mar 2021 13:02:04 +0200
In-Reply-To: <YDy1j+hMLGUWKKV6@hirez.programming.kicks-ass.net> (Peter
 Zijlstra's message of "Mon, 1 Mar 2021 10:36:15 +0100")
Message-ID: <87sg5f87df.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_060314_391175_16ED6D1D 
X-CRM114-Status: GOOD (  15.55  )
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

> On Mon, Mar 01, 2021 at 10:45:32AM +0200, Kalle Valo wrote:
>> Peter Zijlstra <peterz@infradead.org> writes:
>> 
>> > On Fri, Feb 26, 2021 at 05:06:57PM -0700, Shuah Khan wrote:
>> >> Shuah Khan (3):
>> >>   lockdep: add lockdep_assert_not_held()
>> >>   lockdep: add lockdep lock state defines
>> >>   ath10k: detect conf_mutex held ath10k_drain_tx() calls
>> >
>> > Thanks!
>> 
>> Via which tree should these go?
>
> I've just queued the lot for locking/core, which will show up in tip
> when the robots don't hate on it.
>
> Does that work for you?

That's perfect, thanks! Just making sure that the patches don't get
lost.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
