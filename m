Return-Path: <SRS0=xh5s=H4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD31C433DB
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 21:08:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDBE464EAF
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 21:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDBE464EAF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dXTBHv9UqXn4f6j6LF5Xve616nfmn0ZfKZG6mFRELhU=; b=UWVsLqoHQCE02jYz94q1EK6Do
	j4vwWz2pEJDlJ+ws7ZB1bFjv/zzX117mZR0Zp9QgDX/nhDiMzfSmq1/VZ/AY8c3n15i7SJehEuRdM
	T9Ufnyi4AN3rOYNLPdKWqlfqro6jEb5inaCVU4am+pfpMjTucaT8YcxZMUAEaJ9kuTOO9UXVfaA4q
	nAA58WOopQUvBvQcRxSbvGJ4N1m6yJQei7vBhmPCi6Zeho2Ocv0DrnR2KQkSV/6n/I3icwLztQ7M6
	RitOYEFjErJjftXbdbFLnlndEwek6usEnnVAd9GHb/T8wJYQn6tYKBuVACLVrCfV777cNEbwuOGHs
	2dfbOBmtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFkKS-0007UE-J3; Fri, 26 Feb 2021 21:07:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFkKR-0007Tt-6e
 for ath10k@merlin.infradead.org; Fri, 26 Feb 2021 21:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7pgftJoNP5KTdbInm9s0p3yXUSHbaaNN6wUdMbqk36Q=; b=iiQ3KmXmdmtEz3zoxoZjCfxwfG
 jdd70ti+Bkd01AvEbuYEA93mZ5RxbcslWYlslLagJqUxLmTq+FY3f5Dx749FY5vIS0nlDP1hmce1V
 etaW4F0Qal/ZfdjqmAUKMzfF8mP3WKiH8C+gUzC0iGL2xb5PQT6vwGcnobN5nsC6VYTEf8jDCw3dj
 cCu9tOQwgTyuQf1oUE0XGJYPpyiU2taOff/CHWOi1cIuMkEOsfIVl38BoqmLKlw65QR+mYD9LrKDY
 wuBaYI2/HVpH3vgLMnUiWS31zzPWnFQBqMLDzOwbQKSYP3MclasDj9rSUtJvyQYrg2oNaOfZ7/rxe
 /S1kQXEQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lFkKI-00CVhR-Ph; Fri, 26 Feb 2021 21:07:08 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2D6843006D0;
 Fri, 26 Feb 2021 22:07:04 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1BDE720616380; Fri, 26 Feb 2021 22:07:04 +0100 (CET)
Date: Fri, 26 Feb 2021 22:07:04 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 1/3] lockdep: add lockdep_assert_not_held()
Message-ID: <YDli+H48Ft3F6k9/@hirez.programming.kicks-ass.net>
References: <cover.1614355914.git.skhan@linuxfoundation.org>
 <a40d18bba5a52662ac8fc556e1fce3752ea08472.1614355914.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a40d18bba5a52662ac8fc556e1fce3752ea08472.1614355914.git.skhan@linuxfoundation.org>
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

On Fri, Feb 26, 2021 at 10:52:13AM -0700, Shuah Khan wrote:
> +		/* avoid false negative lockdep_assert_not_held()
> +		 * and lockdep_assert_held()
> +		 */

That's a coding style fail.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
