Return-Path: <SRS0=F5wE=NY=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB32BC433EF
	for <ath10k@archiver.kernel.org>; Thu,  2 Sep 2021 22:09:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95E7260FA0
	for <ath10k@archiver.kernel.org>; Thu,  2 Sep 2021 22:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95E7260FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHS3AsGLJdh/g9m7pkdDpKgBhHj4zYW14v8gO8TVy7M=; b=VMPFN6inHSRBvU
	iw0tafPYwNB5a6FR7tTBmxJ8mhytcJRK1uDONVxgDTWktg5U5lvWGbrdToUqKT69fvqGX0HDM5ill
	eNn5kR8HOjX3yzhQ6IdQ6pS18x6Lfwj7KfHMYYf4k9D3ftsQ24zeJmJywgRwxQvPNO4VrFqRCAU4S
	8Bf+cDvLquwListE5ABFBlIj1R5/EO0cBLlMNW0vSNUFqMTPCNQoLz92jo/LuYUXtFJFTzmsGzCYY
	nXcXWvOpmLNUUJrml6mOWuz0tsLwK+Yfc0jpP5YxoHk45u6/ko142ccemDzdRQvnvHTIcAkZliXbj
	99aurfznugmqSJofHO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLutv-00Aait-R9; Thu, 02 Sep 2021 22:09:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLutt-00Aahx-Me
 for ath10k@lists.infradead.org; Thu, 02 Sep 2021 22:09:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE29461054;
 Thu,  2 Sep 2021 22:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630620576;
 bh=JozAychQdkZVheZRC5cWwi/+T0d8FJXICvfkY3V5oBo=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=V18ES6DFquE+5t+YhDz0yzC6zzNDXLTYF6EgHK2ATVlk+veX4/c6KdnZTZ7V2LnJQ
 3X9w24jn6s1G7nFufYQkAwX/2ptNxeFSYcydLe/4C+uAUlsSpy4rDJ45i0uHkznM91
 O0McyUB9SO2VWoGzlNH9fTdo5za96C4beesNag3wCRsdYpS1LOz9JTVMJX0QX3n5bu
 h5OYLFNT2n8N5tX4SHoGg+ObyL98YrRsGRNSQHciSWPfVZpC1evKe/LNiiMfYawTfR
 pru+bG93l9pdIqw9NVVwwweRAt+7Ea38M7Uvkg6cSLznZYzhOa9ONfGbYrKIBlDpF9
 AGgJVOkS67EdQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 7DD615C0E58; Thu,  2 Sep 2021 15:09:36 -0700 (PDT)
Date: Thu, 2 Sep 2021 15:09:36 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>, Kalle Valo <kvalo@codeaurora.org>,
 ath10k@lists.infradead.org, linux-mmc <linux-mmc@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Marek Vasut <marex@denx.de>,
 qais.yousef@arm.com, frederic@kernel.org
Subject: Re: NOHZ tick-stop error with ath10k SDIO
Message-ID: <20210902220936.GP4156@paulmck-ThinkPad-P17-Gen-1>
References: <CAOMZO5AAvZic-NFbYYSVfOxY-27QukXMX68f9eDmhbqAkBRKRw@mail.gmail.com>
 <20210818154358.GS4126399@paulmck-ThinkPad-P17-Gen-1>
 <CAOMZO5A7drx9yXWXKTh4VfV4QHNGCPbH_vxeb=NGDghAm98CXA@mail.gmail.com>
 <CAOMZO5BY7JeFQJkU--KGRfNLTUnUVjnfar+37SvReXyBt9QJfA@mail.gmail.com>
 <20210818175604.GX4126399@paulmck-ThinkPad-P17-Gen-1>
 <87czpqbq98.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87czpqbq98.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_150937_831801_EBBE350E 
X-CRM114-Status: GOOD (  21.83  )
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Thu, Sep 02, 2021 at 11:51:15PM +0200, Thomas Gleixner wrote:
> Paul,
> 
> On Wed, Aug 18 2021 at 10:56, Paul E. McKenney wrote:
> > On Wed, Aug 18, 2021 at 02:02:17PM -0300, Fabio Estevam wrote:
> >> On Wed, Aug 18, 2021 at 1:29 PM Fabio Estevam <festevam@gmail.com> wrote:
> >> > On Wed, Aug 18, 2021 at 12:43 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >> >
> >> > > I believe that you need this commit (and possibly some prerequsites):
> >> > >
> >> > > 47c218dcae65 ("tick/sched: Prevent false positive softirq pending warnings on RT")
> >> > >
> >> > > Adding Qais on CC for his thoughts.
> >> >
> >> > Thanks for the suggestion, but I am running 5.13.11, which already
> >> > contains this commit.
> >> >
> >> > Any extra logs I should capture to help us understand the problem?
> >> 
> >> In case it helps, I followed your suggestion from:
> >> https://lkml.org/lkml/2020/12/10/676
> >> 
> >> With the debug patch and suggested command line, I get the following log:
> >> https://pastebin.com/raw/X96zKw7i
> >
> > And it turns out that I am also seeing it in v5.14-rc2, just a lot less
> > frequently than earlier.  I have seen three instances of handler #02
> > (NET_TX_SOFTIRQ?) over the past month or so while you are seeing handler
> > #08 (BLOCK_SOFTIRQ?), in case that makes a difference.
> 
> Huch? #02 is TIMER_SOFTIRQ and #08 is NET_TX_SOFTIRQ.

Idiot here was forgetting that the #02 represents bit 1 (as you say,
TIMER_SOFTIRQ) rather than numeral 2.  Ditto for the #08.  :-/

							Thanx, Paul

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
