Return-Path: <SRS0=F5wE=NY=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2BDC433F5
	for <ath10k@archiver.kernel.org>; Thu,  2 Sep 2021 21:51:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34259610A2
	for <ath10k@archiver.kernel.org>; Thu,  2 Sep 2021 21:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34259610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkS0ED/JE+Ux3L04vPH319BQyRGscK3FJIuaPEmRK+4=; b=oZLPenQ7zvv9Q/
	PUYX1aXx1+mjOmvcVrirjcefDYWnNW7NVPCHAxT0CGz58bffPoZzguve/1Nt1J9Qd70ty5sShhJl5
	1yCNNvwja0Ob8Kz6L7+/UQ1GGbjp9xBSfkqVW75GgG3iAqZdozLALsYZpXsGH2CE4R3UobenBtKTV
	qFMYWApbp7LirdM6seg4EzgG3gvR9yGWCilOOns8ssVZOiJ+CDFUfROIZbiyuwWqJeKC25h2D6/Jt
	aqSs1qyfU2K1BrL3rJJJwBavxOo+UOJwV48cX0q1aXWF6/W4BuQz3esaV4q4IxVS9H2UP9+zCgERE
	DZt6WHIJkIQoSMo2gefg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLucF-00AY6U-3h; Thu, 02 Sep 2021 21:51:23 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLucC-00AY5Z-Az
 for ath10k@lists.infradead.org; Thu, 02 Sep 2021 21:51:21 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1630619476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dXynEmzNc/5dqTNv5HfEcE9bg8jjd3nUt9vOKJo805g=;
 b=gjfK/xwMuN9qpul1qSXhGslQ5t0nlyga/qktDHqC7NLiRuqSCV3dNDUrG31I3xhHvtTBYR
 eyOe46X1PIx8v8/FTSKnDLmxJGa2uTStHYYdpmKrUUqedP2C1g5aLPCGOsDyk/ijzp3W1b
 wQHju2K2Wk2WCixBAm6JMc9pNlBXn/34ZPnVzBzA5i00cYdiUfn2rBJrXA66NSxCodjPzy
 DX3c4hOtFKu2UJDZM3iiVwGZmeZmBvXvz0mcKVge96ATKWCAu7f9U87iRsep08m2Uioegk
 rYSwhawWZ7M2AwYrjAaBxQVdAoHOOjU4FsNyHtHGgw+NnlurxFvGVS5ePW94kg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1630619476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dXynEmzNc/5dqTNv5HfEcE9bg8jjd3nUt9vOKJo805g=;
 b=16abJ3hXdJEEYi5ibns/xE8FQnkkGA7BJ0g5VzZdgAy+bR4tNJbN2ke+YAEj2uGjAouUnW
 AQP7Rf0g6s7ZwGAQ==
To: paulmck@kernel.org, Fabio Estevam <festevam@gmail.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, linux-mmc
 <linux-mmc@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
 Vasut <marex@denx.de>, qais.yousef@arm.com, frederic@kernel.org
Subject: Re: NOHZ tick-stop error with ath10k SDIO
In-Reply-To: <20210818175604.GX4126399@paulmck-ThinkPad-P17-Gen-1>
References: <CAOMZO5AAvZic-NFbYYSVfOxY-27QukXMX68f9eDmhbqAkBRKRw@mail.gmail.com>
 <20210818154358.GS4126399@paulmck-ThinkPad-P17-Gen-1>
 <CAOMZO5A7drx9yXWXKTh4VfV4QHNGCPbH_vxeb=NGDghAm98CXA@mail.gmail.com>
 <CAOMZO5BY7JeFQJkU--KGRfNLTUnUVjnfar+37SvReXyBt9QJfA@mail.gmail.com>
 <20210818175604.GX4126399@paulmck-ThinkPad-P17-Gen-1>
Date: Thu, 02 Sep 2021 23:51:15 +0200
Message-ID: <87czpqbq98.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_145120_560536_2FD6A54F 
X-CRM114-Status: GOOD (  16.46  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Paul,

On Wed, Aug 18 2021 at 10:56, Paul E. McKenney wrote:
> On Wed, Aug 18, 2021 at 02:02:17PM -0300, Fabio Estevam wrote:
>> On Wed, Aug 18, 2021 at 1:29 PM Fabio Estevam <festevam@gmail.com> wrote:
>> > On Wed, Aug 18, 2021 at 12:43 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>> >
>> > > I believe that you need this commit (and possibly some prerequsites):
>> > >
>> > > 47c218dcae65 ("tick/sched: Prevent false positive softirq pending warnings on RT")
>> > >
>> > > Adding Qais on CC for his thoughts.
>> >
>> > Thanks for the suggestion, but I am running 5.13.11, which already
>> > contains this commit.
>> >
>> > Any extra logs I should capture to help us understand the problem?
>> 
>> In case it helps, I followed your suggestion from:
>> https://lkml.org/lkml/2020/12/10/676
>> 
>> With the debug patch and suggested command line, I get the following log:
>> https://pastebin.com/raw/X96zKw7i
>
> And it turns out that I am also seeing it in v5.14-rc2, just a lot less
> frequently than earlier.  I have seen three instances of handler #02
> (NET_TX_SOFTIRQ?) over the past month or so while you are seeing handler
> #08 (BLOCK_SOFTIRQ?), in case that makes a difference.

Huch? #02 is TIMER_SOFTIRQ and #08 is NET_TX_SOFTIRQ.

And looking at that ftrace output in the pastebin there is nothing which
raises NET_TX_SOFTIRQ but then the warning claims it is pending.

This does not make any sense at all.

Thanks,

        tglx



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
