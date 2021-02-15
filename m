Return-Path: <SRS0=1sN2=HR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CA2C4332B
	for <ath10k@archiver.kernel.org>; Mon, 15 Feb 2021 16:05:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC9B264DEB
	for <ath10k@archiver.kernel.org>; Mon, 15 Feb 2021 16:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC9B264DEB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uX0z2d8wjciTl6NOZDIPfNNsfBr2EokRqk+dyJfvcuA=; b=FgLfNZl8qDqty5OwjSZiQJ/aV
	iggcXtTfGxe29UvSArP+iLqV5qvBDgjxEKHS+Klw7TBhovgZM32kNPWIbQmkK5ZV676Xjfxc11p/A
	PQZtzhdGwCvdS0vaMVBVRr1WLOJKEvTuzfjBvNJ1o5G5wMXD4J0iJSwPop8JnipZo+FbaZHWvxp7E
	ql4u0vN+7MreauoN+nCbU1qzgXisOGo3QCuojG19JfGAh0+SVp9PBszSBfQNfKsUU4BAb7DF6BSKd
	ZjDWHJEDFpCOp2unjinDz6HggcTSwL9uthH/Wwf8uEQOviuZd2+mNiTOgf63B1AZ1XFa2P1ZPf1B1
	G09nZQHpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBgMM-0006qB-Mw; Mon, 15 Feb 2021 16:04:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBgML-0006q0-M7
 for ath10k@merlin.infradead.org; Mon, 15 Feb 2021 16:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ABknkne7Nrn83Z017RdB6TUScjJdC65GnVh/Mnzaro4=; b=OhNLW94ejUS39Nx7GhTuQ7ezdo
 q5Wb7HXw3WDjDr/XnEMyiKNF5Uxs9VTjZBW+3vEUNADCSPX5PvM77kgXHpbL7bgAujmpCQ5cflRMe
 tTgMXTJRBXrL7pptc1mjtI4Jb+Qby+L9ULklOfDMW0Dl/q7eIbus7Trt8VNc+I11PIct7CPbs7t8D
 0PeT8FwhMlogzUvkCLX9hiAhpOezlGe1hVcHmhsWIwL93pymNLCGpOaHgh+7EqwwQL8oYfRkyi1uW
 igN+zxx/JApi6jslEPnSmi77+yruJVv/f3P68A4EU9er5WeSclCa3/+wZCUuIxe0eSgGCmWJOYPTg
 L2U9YsRQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lBgM7-00Fky1-Ex; Mon, 15 Feb 2021 16:04:20 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 430053007CD;
 Mon, 15 Feb 2021 17:04:10 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2CD1D20431BC4; Mon, 15 Feb 2021 17:04:10 +0100 (CET)
Date: Mon, 15 Feb 2021 17:04:10 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH 1/2] lockdep: add lockdep_assert_not_held()
Message-ID: <YCqbehyyeUoL0pPT@hirez.programming.kicks-ass.net>
References: <cover.1613171185.git.skhan@linuxfoundation.org>
 <37a29c383bff2fb1605241ee6c7c9be3784fb3c6.1613171185.git.skhan@linuxfoundation.org>
 <YCljfeNr4m5mZa4N@hirez.programming.kicks-ass.net>
 <20210215104402.GC4507@worktop.programming.kicks-ass.net>
 <79aeb83a288051bd3a2a3f15e5ac42e06f154d48.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <79aeb83a288051bd3a2a3f15e5ac42e06f154d48.camel@sipsolutions.net>
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
 davem@davemloft.net, kvalo@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Mon, Feb 15, 2021 at 02:12:30PM +0100, Johannes Berg wrote:
> On Mon, 2021-02-15 at 11:44 +0100, Peter Zijlstra wrote:
> > 
> > I think something like so will work, but please double check.
> 
> Yeah, that looks better.
> 
> > +++ b/include/linux/lockdep.h
> > @@ -294,11 +294,15 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
> >  
> >  #define lockdep_depth(tsk)	(debug_locks ? (tsk)->lockdep_depth : 0)
> >  
> > -#define lockdep_assert_held(l)	do {				\
> > -		WARN_ON(debug_locks && !lockdep_is_held(l));	\
> > +#define lockdep_assert_held(l)	do {					\
> > +		WARN_ON(debug_locks && lockdep_is_held(l) == 0));	\
> >  	} while (0)
> 
> That doesn't really need to change? It's the same.

Correct, but I found it more symmetric vs the not implementation below.

> > -#define lockdep_assert_held_write(l)	do {			\
> > +#define lockdep_assert_not_held(l)	do {				\
> > +		WARN_ON(debug_locks && lockdep_is_held(l) == 1));	\
> > +	} while (0)
> > +
> > +#define lockdep_assert_held_write(l)	do {				\
> >  		WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));	\
> >  	} while (0)
> >  
> > diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> > index c1418b47f625..983ba206f7b2 100644
> > --- a/kernel/locking/lockdep.
> > +++ b/kernel/locking/lockdep.c
> > @@ -5467,7 +5467,7 @@ noinstr int lock_is_held_type(const struct lockdep_map *lock, int read)
> >  	int ret = 0;
> >  
> >  	if (unlikely(!lockdep_enabled()))
> > -		return 1; /* avoid false negative lockdep_assert_held() */
> > +		return -1; /* avoid false negative lockdep_assert_held() */
> 
> Maybe add lockdep_assert_not_held() to the comment, to explain the -1
> (vs non-zero)?

Yeah, or frob a '*' in there.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
