Return-Path: <SRS0=1sN2=HR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65C6C433E0
	for <ath10k@archiver.kernel.org>; Mon, 15 Feb 2021 13:13:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A31464DEE
	for <ath10k@archiver.kernel.org>; Mon, 15 Feb 2021 13:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A31464DEE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y2ssAPRzz7MqbbQ1Icschy48sam9xjev1+5523uLadI=; b=vfoohp8vZBY+1B5KgEqc0HzxK
	ebs925KDOwD2KHFk/ppQuq+jb1XllZshCCX6brlc8Xa7gRwaqdu0VyTRd91y/DYbe+mYjb3UssAJs
	uxjc0bcZ3+PnHpzYX3Z1uhmKBBUVHFtpfpnbz/5aEfVV++O7rdRSfV/5UilkNnFjtHvUtvbL62ltL
	JU9Nbc3tlPDZGyJ4zYp4VExJNTesvubmeMbGlHrJLAbuY/wVZd5CF3Xh+ZGovZdztfOpnrGz9iBzN
	KK1AGCvjwKpfTAfdSfMp5+tHDl8p0FL1OLryOAYFbPw516iAg1GvTqfyuBwSrus4O994fbYaJelWl
	qTYruJIKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBdga-0007yK-L6; Mon, 15 Feb 2021 13:13:08 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBdgW-0007wo-BI
 for ath10k@lists.infradead.org; Mon, 15 Feb 2021 13:13:06 +0000
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94) (envelope-from <johannes@sipsolutions.net>)
 id 1lBdgE-003Frr-1U; Mon, 15 Feb 2021 14:12:46 +0100
Message-ID: <79aeb83a288051bd3a2a3f15e5ac42e06f154d48.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] lockdep: add lockdep_assert_not_held()
From: Johannes Berg <johannes@sipsolutions.net>
To: Peter Zijlstra <peterz@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Date: Mon, 15 Feb 2021 14:12:30 +0100
In-Reply-To: <20210215104402.GC4507@worktop.programming.kicks-ass.net>
 (sfid-20210215_114645_090502_64B4A89D)
References: <cover.1613171185.git.skhan@linuxfoundation.org>
 <37a29c383bff2fb1605241ee6c7c9be3784fb3c6.1613171185.git.skhan@linuxfoundation.org>
 <YCljfeNr4m5mZa4N@hirez.programming.kicks-ass.net>
 <20210215104402.GC4507@worktop.programming.kicks-ass.net>
 (sfid-20210215_114645_090502_64B4A89D)
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_081304_430874_EE3E5470 
X-CRM114-Status: GOOD (  14.24  )
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

On Mon, 2021-02-15 at 11:44 +0100, Peter Zijlstra wrote:
> 
> I think something like so will work, but please double check.

Yeah, that looks better.

> +++ b/include/linux/lockdep.h
> @@ -294,11 +294,15 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
>  
>  #define lockdep_depth(tsk)	(debug_locks ? (tsk)->lockdep_depth : 0)
>  
> -#define lockdep_assert_held(l)	do {				\
> -		WARN_ON(debug_locks && !lockdep_is_held(l));	\
> +#define lockdep_assert_held(l)	do {					\
> +		WARN_ON(debug_locks && lockdep_is_held(l) == 0));	\
>  	} while (0)

That doesn't really need to change? It's the same.

> -#define lockdep_assert_held_write(l)	do {			\
> +#define lockdep_assert_not_held(l)	do {				\
> +		WARN_ON(debug_locks && lockdep_is_held(l) == 1));	\
> +	} while (0)
> +
> +#define lockdep_assert_held_write(l)	do {				\
>  		WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));	\
>  	} while (0)
>  
> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index c1418b47f625..983ba206f7b2 100644
> --- a/kernel/locking/lockdep.
> +++ b/kernel/locking/lockdep.c
> @@ -5467,7 +5467,7 @@ noinstr int lock_is_held_type(const struct lockdep_map *lock, int read)
>  	int ret = 0;
>  
>  	if (unlikely(!lockdep_enabled()))
> -		return 1; /* avoid false negative lockdep_assert_held() */
> +		return -1; /* avoid false negative lockdep_assert_held() */

Maybe add lockdep_assert_not_held() to the comment, to explain the -1
(vs non-zero)?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
