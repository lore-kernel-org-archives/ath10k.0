Return-Path: <SRS0=3j0W=H7=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432AFC433DB
	for <ath10k@archiver.kernel.org>; Mon,  1 Mar 2021 08:38:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 069EF64DEF
	for <ath10k@archiver.kernel.org>; Mon,  1 Mar 2021 08:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 069EF64DEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y65nJMleL5RChDkcSHNTYpecdYtOxGzxRpJJ4Vqy9cc=; b=tgIeTzKyWmOBD3p4kWnWWX5/3
	zeZtw0MzfAbKTMBlglQdgsNF2CeSWVyooU+/Rq0i7TpA4dwbw7qKpzMrViBEIK7KhGPEMe++E18Dw
	hYSOzRzRic2eojruHITCL7ICehGqGwV1Sng0pl5XVA2LYJwOLCzjvcerHD+Jr5J2NSdX7j/nQPH/F
	i5NtM+FbDvNNT+4N8BZy2Nbum4FgkqnL+Guj3aRHSLMnoBZ1ZN+a9nS94cX57IWyQrBdby8K123LK
	XSs9WAuQ08Wb2mN1bkvbR9vpMI2d+43sIXW9yk8e+oqia40f0qVSsZtcz9nW3brp8Lgq4gHDl7M7N
	CK9XQ57Rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGe4c-0006ye-MZ; Mon, 01 Mar 2021 08:38:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGe4a-0006yW-Ph
 for ath10k@merlin.infradead.org; Mon, 01 Mar 2021 08:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sX04iQ+W/jdAFUfzECen1rbHlQQujm/m2fcunYtptNQ=; b=ZYYzApmDSrC3A3mJrNEFnMMTYl
 Owuvu468Iuob1Pq9iJPfzUjQBKXokwT+Z+rAcEYcI0NNzi05Bg8UDaBAea38MJMFbmvyOOpLc0CgJ
 2jswcasOIJ64Siu4srdOZA/FyydukB0bkxkBxKF76ZvwoXfog/DVhV+omLsVVa4a6POR6luiRAqps
 y6i+bhXOKa2495dMEX+J/vobKhmrGSmeUwp68RhYCFT0ehH7e9VPF3J51C5BOwM7eI5cXLK2BvdSO
 sJNHqNjDk0B6BgfVye0j5QK22pqMrOfd/xN9yAioufjtRf++r3/NwW4dc0khHx3yLeVq5uxUkKWH2
 +J3y1jCQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGe4K-00FUD5-V9; Mon, 01 Mar 2021 08:38:27 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 18F4D3049DC;
 Mon,  1 Mar 2021 09:38:20 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id ED854201A7CFC; Mon,  1 Mar 2021 09:38:19 +0100 (CET)
Date: Mon, 1 Mar 2021 09:38:19 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 0/3] Add lockdep_assert_not_held()
Message-ID: <YDyn+6N6EfgWJ5GV@hirez.programming.kicks-ass.net>
References: <cover.1614383025.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1614383025.git.skhan@linuxfoundation.org>
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

On Fri, Feb 26, 2021 at 05:06:57PM -0700, Shuah Khan wrote:
> Shuah Khan (3):
>   lockdep: add lockdep_assert_not_held()
>   lockdep: add lockdep lock state defines
>   ath10k: detect conf_mutex held ath10k_drain_tx() calls

Thanks!

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
