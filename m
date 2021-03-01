Return-Path: <SRS0=3j0W=H7=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5095EC433DB
	for <ath10k@archiver.kernel.org>; Mon,  1 Mar 2021 08:28:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EFEA601FB
	for <ath10k@archiver.kernel.org>; Mon,  1 Mar 2021 08:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EFEA601FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WaiabCgXkVVfOYcyyTBruhEix28ndKLK7tzYPZlU6xY=; b=cOd1GZ7K+hyNfecwc0Kjzhld0
	TyHlO5UDgVWMmcr9vMTUSyhCChsd3QQ4czVVaUPevz4/4t/ukoL+bAsGtiO+OUTBeNLPdYcvMkysk
	cojKX11gZ70JTuMfB3FD6baDFnhbViQfl5VdhETIin76i2RnSPW0UMu8dTR1Fz5UHLgABKfIpqVXB
	GE9heKBKnk1NzPYUMq0yRNce4KIBAiA8/4CFqyJXUwzoZ8ubtBLH5ht4r1PRganZM3C1+ERV7UIoX
	a/QxPpCc8yVZMMDOwqMEsVhdVF2cSSnmY5QGtFAVONEgY4z/NGdcLLWtaGI/X9ifNWn0cm5mI+dYN
	6aBAiqGiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGduY-0006If-J3; Mon, 01 Mar 2021 08:28:14 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGduU-0006I4-HY; Mon, 01 Mar 2021 08:28:10 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A0F6F301959;
 Mon,  1 Mar 2021 09:28:06 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8785025F2CD01; Mon,  1 Mar 2021 09:28:06 +0100 (CET)
Date: Mon, 1 Mar 2021 09:28:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 1/3] lockdep: add lockdep_assert_not_held()
Message-ID: <YDyllv3zs+lWtgCV@hirez.programming.kicks-ass.net>
References: <cover.1614355914.git.skhan@linuxfoundation.org>
 <a40d18bba5a52662ac8fc556e1fce3752ea08472.1614355914.git.skhan@linuxfoundation.org>
 <YDli+H48Ft3F6k9/@hirez.programming.kicks-ass.net>
 <0ee409b7-b0d5-43c2-c247-b0482c392dea@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0ee409b7-b0d5-43c2-c247-b0482c392dea@linuxfoundation.org>
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
 kuba@kernel.org, will@kernel.org, davem@davemloft.net, kvalo@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Fri, Feb 26, 2021 at 02:16:12PM -0700, Shuah Khan wrote:
> On 2/26/21 2:07 PM, Peter Zijlstra wrote:
> > On Fri, Feb 26, 2021 at 10:52:13AM -0700, Shuah Khan wrote:
> > > +		/* avoid false negative lockdep_assert_not_held()
> > > +		 * and lockdep_assert_held()
> > > +		 */
> > 
> > That's a coding style fail.
> > 
> 
> Checkpatch didn't complain.

  Documentation/CodingStyle

(or whatever unreadable rst crap it is today :-( )

and:

  https://lkml.kernel.org/lkml/CA+55aFyQYJerovMsSoSKS7PessZBr4vNp-3QUUwhqk4A4_jcbg@mail.gmail.com/

> What's your preference? Does the following work for you?
> 
> /*
>  * avoid false negative lockdep_assert_not_held()
>  * and lockdep_assert_held()
>  */

Yep (ideally even with a Capital and full stop).

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
