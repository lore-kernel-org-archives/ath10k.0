Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F40C4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 17:56:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D426610FE
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 17:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D426610FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FzEmqdjKinWQR1VDC19QK5RH4IuwOyj9NEjRiCHhhtQ=; b=E7hUI/3qxzNush
	GtJ7Jb0z3aWvr5zz8Scb6+jwpdfz+WMxVp2BpNFtZx/rTnEKXrPO4UgqzWgu+g4QR754sp8bNpYjR
	0qd+VZrX/KlkkpyYBxEt/Rupk+CNeHMt/E/wGNyK2HHk19DGQCR0VC2If6fWowWqjHgc1qK1jM1gj
	eD0noXhb/Q1HN8SpcZhKZWsphqRrBKLTLrnUJZ4g3Y8EqhGZcHXrZfrk21Pc8S7cQ5Rvt81KLpF9c
	m4uKSvCOEBjrQCVarVIHmSDTTCKByhvRa0uL+yx0g3T8VaivKAhKg8Fkcpz1o2OCPXiJoPo5M8sp0
	JZmc98jAqynPsA94AqHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGPnP-006L5M-BQ; Wed, 18 Aug 2021 17:56:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGPnJ-006L4m-5x
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 17:56:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB7E860BD3;
 Wed, 18 Aug 2021 17:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629309364;
 bh=ns87ZPMySq8WJH44cZI5SX1ALtCXNHOELDCw7jSyjZ4=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=PCg1bptqI2Ma+CkzoivGb5Z2S97z2uMV1ZU8bm+5DOHVoAMsi2TraehFbG05hAe0K
 kOuSh+NH49M+0T+J4J4kKSG2e9IR2qyqXagUpy6asQotA8dZ5AfcMGeekhxkGnXVED
 Eghnx692f0QVe12V1jThlDNB9VOwj8mUTphqVY7p+sqyi4BONNJEdVGz2/auf3055v
 yDp75/zHKw4Jt4vbTwRSgJ48rx1mOXU9+nMjEQoDgU9q9AMgu3SqpykUziO8i5w7Ok
 ZUp/R/Y5qUsFwBnPLWKOA/9sWwCqwV5BZWYc6iJj4SWaaEKDJhQF5rvBY4RfZFTMio
 u+YiT+/rbo4Cg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 9A8DE5C04B1; Wed, 18 Aug 2021 10:56:04 -0700 (PDT)
Date: Wed, 18 Aug 2021 10:56:04 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Marek Vasut <marex@denx.de>,
 qais.yousef@arm.com, frederic@kernel.org, tglx@linutronix.de
Subject: Re: NOHZ tick-stop error with ath10k SDIO
Message-ID: <20210818175604.GX4126399@paulmck-ThinkPad-P17-Gen-1>
References: <CAOMZO5AAvZic-NFbYYSVfOxY-27QukXMX68f9eDmhbqAkBRKRw@mail.gmail.com>
 <20210818154358.GS4126399@paulmck-ThinkPad-P17-Gen-1>
 <CAOMZO5A7drx9yXWXKTh4VfV4QHNGCPbH_vxeb=NGDghAm98CXA@mail.gmail.com>
 <CAOMZO5BY7JeFQJkU--KGRfNLTUnUVjnfar+37SvReXyBt9QJfA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5BY7JeFQJkU--KGRfNLTUnUVjnfar+37SvReXyBt9QJfA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_105605_286232_7AA0FCE7 
X-CRM114-Status: GOOD (  17.57  )
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

On Wed, Aug 18, 2021 at 02:02:17PM -0300, Fabio Estevam wrote:
> Hi Paul,
> 
> On Wed, Aug 18, 2021 at 1:29 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi Paul,
> >
> > On Wed, Aug 18, 2021 at 12:43 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > > I believe that you need this commit (and possibly some prerequsites):
> > >
> > > 47c218dcae65 ("tick/sched: Prevent false positive softirq pending warnings on RT")
> > >
> > > Adding Qais on CC for his thoughts.
> >
> > Thanks for the suggestion, but I am running 5.13.11, which already
> > contains this commit.
> >
> > Any extra logs I should capture to help us understand the problem?
> 
> In case it helps, I followed your suggestion from:
> https://lkml.org/lkml/2020/12/10/676
> 
> With the debug patch and suggested command line, I get the following log:
> https://pastebin.com/raw/X96zKw7i

And it turns out that I am also seeing it in v5.14-rc2, just a lot less
frequently than earlier.  I have seen three instances of handler #02
(NET_TX_SOFTIRQ?) over the past month or so while you are seeing handler
#08 (BLOCK_SOFTIRQ?), in case that makes a difference.

Adding Frederic and Thomas on CC, though I believe Frederic is off
the grid at the moment.

							Thanx, Paul

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
