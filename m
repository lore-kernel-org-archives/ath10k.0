Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A93C433E0
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 02:02:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2CC364DD5
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 02:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2CC364DD5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0+0k78XoB3SH6gUGwB8oEr7Wf2AHtSe2dU/1VvHTIW8=; b=LWcTiot+bIXCq/T5E84ldeoTa
	iF3hUN8ddZG0754pLUhjN33qLdZIr1RUBIOhl0IYCiFduB2mg8DqOehEm5vY6FRXFNWJUE1kkLAPN
	nrVk5XqhEBvqj20UhOrzdOpZ362/KPOznM/9wMkg81sl5STptImW+0PRvJeDZFjQNHxEXVNlTtZvY
	gyd1V0tNRnlDjCa1YqbjPYvW9hVyo2nVAh3mB1TbNS7Hquu+QfAf4RPp0x1wPoic9W+fDu0rhyPul
	sYAvPWE/nCI9oLJNaHDmrmKpphQSOr1F6iQ4PTXl+ArrY+MqQq9t0GFYXHvj6yTB2qbmL3T6QWZSK
	6tLytNQmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9epc-0000NT-Mo; Wed, 10 Feb 2021 02:02:16 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9epZ-0000Mh-FR
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 02:02:15 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612922533; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0dBmtYl/6yYwIgz/exWY39dmedgS/t1WhlIOfdVWVKk=;
 b=V5RzikjL5CMEfhqKjGT2gH4ygI7HoOJ7hr55YIM/rWcPAdKBHqh5DOlxLT+VbZ3lI/BxmKab
 4nlzbhx5Kyg6jxej4s4NEv2Wfy2vWspfo7fWoP2dYbWtWVHtzHmIn3wwjJ92AkIiuszOFgQT
 tOaFtG0scl8zHClAvPqRMG6yXYM=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60233e97e3df861f4b562a25 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 02:01:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 75872C43464; Wed, 10 Feb 2021 02:01:58 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B9A67C433ED;
 Wed, 10 Feb 2021 02:01:57 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 10 Feb 2021 10:01:57 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] ath10k: change len of trace_ath10k_log_dbg_dump for large
 buffer size
In-Reply-To: <20210209163431.11133472@gandalf.local.home>
References: <1612839593-2308-1-git-send-email-wgong@codeaurora.org>
 <CA+ASDXN1V2HYA7C6s-q5bQNSxE7L5GCJiqfiJ_67R_hpUn4b_g@mail.gmail.com>
 <20210209145531.5977b16d@gandalf.local.home>
 <20210209163431.11133472@gandalf.local.home>
Message-ID: <9b479a88331dbf969f07708eabe53d14@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_210213_907174_1A8265BB 
X-CRM114-Status: GOOD (  20.15  )
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
Cc: Brian Norris <briannorris@chromium.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2021-02-10 05:34, Steven Rostedt wrote:
> On Tue, 9 Feb 2021 14:55:31 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
>> > [for-next][PATCH 2/2] tracing: Use temp buffer when filtering events
>> > https://lore.kernel.org/lkml/f16b14066317f6a926b6636df6974966@codeaurora.org/
>> 
>> Note, that is only used when filtering happens, which doesn't appear 
>> to be
>> the case here.
> 
> I was basing this off of the original commands, but the stack dump says
> otherwise. But it should still work.
> 
>> 
>> >
>> > It seems like we should still try to get that fixed somehow, even if
>> > the below change is fine on its own (it probably doesn't make sense to
>> > such a large amount of data via tracepoints). It would be unfortunate
>> > for next poor soul to hit the same issues, just because they wanted to
>> > dump a few KB.
>> 
>> Yeah, it was a design decision to cap the max size of events to just 
>> under
>> PAGE_SIZE. The ring buffer is broken up into pages (for zero copy
>> transfers to file systems and the network). Thus, no event is allowed 
>> to be
>> bigger than a page (and actually a bit smaller)
>> 
>> That said, it shouldn't have crashed, it should have just failed to 
>> record.
>> 
>> I'll test it out and see why it crashed.
> 
> Looking at the original report, I see:
> 
>  CPU: 1 PID: 141 Comm: kworker/u16:1 Not tainted 4.19.139 #162
> 
> Does this still crash on the latest kernel?
> 
> -- Steve
Not tested with latest kernel.
The reason is below which I said in 
https://lore.kernel.org/lkml/b504b3d7e989cae108669a0cd3072454@codeaurora.org/

the per cpu buffer seems it is initilized in 
trace_buffered_event_enable,
it is only 1 page size as below:
void trace_buffered_event_enable(void)
{
...
	for_each_tracing_cpu(cpu) {
		page = alloc_pages_node(cpu_to_node(cpu),
					GFP_KERNEL | __GFP_NORETRY, 0);
If the size of buffer to trace is more than 1 page, such as 46680, then
it trigger kernel crash/panic in my case while run trace-cmd.
After debugging, the trace_file->flags in
trace_event_buffer_lock_reserve is 0x40b while run trace-cmd, and it is
0x403 while collecting ftrace log.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
