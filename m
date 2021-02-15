Return-Path: <SRS0=1sN2=HR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2643C433E0
	for <ath10k@archiver.kernel.org>; Mon, 15 Feb 2021 10:44:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 808DC64E08
	for <ath10k@archiver.kernel.org>; Mon, 15 Feb 2021 10:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 808DC64E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y6uhFBb/huwO5Y5iW6uHDUFIkMJVyvwxp2zExSv/V00=; b=2W9p8wtssEP/8OzubCDntl5gO
	MmIxFbx9vEBJ49qnoZGNHqKTGoq5G0TkzbEkVtPWCCkQz3b8/I6Wo+tU8wxccsAio4I/BPBYbRlcg
	6xy+774cnEHoZGKod1EseSuAs+PFTwwazRVkNQ2/lUxCYMKguzeSP97JsnbojVIqgPGCpgl5ClaU3
	wBaJZoSe89I1x5D93+2Jff6clIkqFeMghVjy5Fcuy1nvHZJhVDSsx/Ak3QeUnXci6bKeDx4Na5SdU
	eAvzL6sli0cxKX9OxidT5IPbuL2dnbxE0paarYDP8tfuRFH1XNgK05L2FI2xfxtnzxx3yoBl1Xa27
	HOlRDn5sA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBbMR-0006jR-2b; Mon, 15 Feb 2021 10:44:11 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBbMN-0006hm-9U; Mon, 15 Feb 2021 10:44:07 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 7CE01981573; Mon, 15 Feb 2021 11:44:02 +0100 (CET)
Date: Mon, 15 Feb 2021 11:44:02 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 1/2] lockdep: add lockdep_assert_not_held()
Message-ID: <20210215104402.GC4507@worktop.programming.kicks-ass.net>
References: <cover.1613171185.git.skhan@linuxfoundation.org>
 <37a29c383bff2fb1605241ee6c7c9be3784fb3c6.1613171185.git.skhan@linuxfoundation.org>
 <YCljfeNr4m5mZa4N@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCljfeNr4m5mZa4N@hirez.programming.kicks-ass.net>
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

On Sun, Feb 14, 2021 at 06:53:01PM +0100, Peter Zijlstra wrote:
> On Fri, Feb 12, 2021 at 04:28:42PM -0700, Shuah Khan wrote:
> 
> > +#define lockdep_assert_not_held(l)	do {			\
> > +		WARN_ON(debug_locks && lockdep_is_held(l));	\
> > +	} while (0)
> > +
> 
> This thing isn't as straight forward as you might think, but it'll
> mostly work.
> 
> Notably this thing will misfire when lockdep_off() is employed. It
> certainyl needs a comment to explain the subtleties.

I think something like so will work, but please double check.

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index b9e9adec73e8..c8b0d292bf8e 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -294,11 +294,15 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 
 #define lockdep_depth(tsk)	(debug_locks ? (tsk)->lockdep_depth : 0)
 
-#define lockdep_assert_held(l)	do {				\
-		WARN_ON(debug_locks && !lockdep_is_held(l));	\
+#define lockdep_assert_held(l)	do {					\
+		WARN_ON(debug_locks && lockdep_is_held(l) == 0));	\
 	} while (0)
 
-#define lockdep_assert_held_write(l)	do {			\
+#define lockdep_assert_not_held(l)	do {				\
+		WARN_ON(debug_locks && lockdep_is_held(l) == 1));	\
+	} while (0)
+
+#define lockdep_assert_held_write(l)	do {				\
 		WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));	\
 	} while (0)
 
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c1418b47f625..983ba206f7b2 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -5467,7 +5467,7 @@ noinstr int lock_is_held_type(const struct lockdep_map *lock, int read)
 	int ret = 0;
 
 	if (unlikely(!lockdep_enabled()))
-		return 1; /* avoid false negative lockdep_assert_held() */
+		return -1; /* avoid false negative lockdep_assert_held() */
 
 	raw_local_irq_save(flags);
 	check_flags(flags);

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
