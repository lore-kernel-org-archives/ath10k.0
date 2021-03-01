Return-Path: <SRS0=3j0W=H7=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC31C433E0
	for <ath10k@archiver.kernel.org>; Mon,  1 Mar 2021 09:36:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E742C64E42
	for <ath10k@archiver.kernel.org>; Mon,  1 Mar 2021 09:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E742C64E42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KkurVTqMT8/Bm/5aSwXK2Jy8geWYaEXOXWX0HmGz8ds=; b=VOAQuBUYtGfNn5n5OPJVshOh+
	vSheFdZ3kCnYcVSfSJ7M5yXgPHgpc+qsMITOd/NkqTT5MBx4KfB9v7lYemChTKu2XIxpBLIys+Ib6
	qqCprnj9Bck10qXjcUu3SF1KdgXu9/lJiSqfvqAl084lyMMXPjbIYKuMfnjv6rW/BmZTz6KGCknHu
	u54hn7iLBRDP4nslCCSEaXf/DkDYO3Dy3rnsllEu7WRqNbG/68b5tpvVevLcB0Clq5qb/gjFInB5T
	g+p6lKn69Zf9tRdLOWkF7nCDFZGgAnjS1/ZBnRGcWb5NI/r7rLZMZxFOvBGHQYbil+S7mgVXj7wQV
	a1s6yd7Kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGeyV-0005iN-3H; Mon, 01 Mar 2021 09:36:23 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGeyR-0005i8-GM; Mon, 01 Mar 2021 09:36:19 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2A72F301959;
 Mon,  1 Mar 2021 10:36:15 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 19776206A2928; Mon,  1 Mar 2021 10:36:15 +0100 (CET)
Date: Mon, 1 Mar 2021 10:36:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3 0/3] Add lockdep_assert_not_held()
Message-ID: <YDy1j+hMLGUWKKV6@hirez.programming.kicks-ass.net>
References: <cover.1614383025.git.skhan@linuxfoundation.org>
 <YDyn+6N6EfgWJ5GV@hirez.programming.kicks-ass.net>
 <878s779s9f.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878s779s9f.fsf@codeaurora.org>
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

On Mon, Mar 01, 2021 at 10:45:32AM +0200, Kalle Valo wrote:
> Peter Zijlstra <peterz@infradead.org> writes:
> 
> > On Fri, Feb 26, 2021 at 05:06:57PM -0700, Shuah Khan wrote:
> >> Shuah Khan (3):
> >>   lockdep: add lockdep_assert_not_held()
> >>   lockdep: add lockdep lock state defines
> >>   ath10k: detect conf_mutex held ath10k_drain_tx() calls
> >
> > Thanks!
> 
> Via which tree should these go?

I've just queued the lot for locking/core, which will show up in tip
when the robots don't hate on it.

Does that work for you?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
