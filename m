Return-Path: <SRS0=gWg/=HL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FCCC433E0
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 21:35:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3928D64E92
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 21:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3928D64E92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=apOKNx+rjc/7TSNGKNAM0WNkbksVAbCXfmZZGALDlhs=; b=KaZZsJrBYtcyMeSZff6p9GRX3
	h5Gl8PH0C8YpJdjv0obM1DEWav9NsofvVxqLppqyCw4q69CoySGvOxlJmm9ttcsmVE7RpkhrofjMS
	TkCcNlFC5KsJCdmtNY0R4H1HPp+gUv3Vrxy8uUC81FIGiDgVl5BIkiI9alzqTV+sJTo6yRrKpNnJ5
	PjO9lPQdwa/Xvx0LF8NDZstejY+h0WTwpWjoNlb0tuDjYZlKyeAS2wyB4JrJJGlQ4k6O/6dCaGTCi
	0c8uMaL7Dw+MPciJWs0VKYLkLoIxTRJHbLcbf+9Fb4eo7ZRhg54sS6WViMUNQyUnHgLY6B0mrd1zL
	ylzWJ7c3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9aec-0003xm-G6; Tue, 09 Feb 2021 21:34:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9aeY-0003x5-Ey
 for ath10k@lists.infradead.org; Tue, 09 Feb 2021 21:34:36 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F2F7364DDF;
 Tue,  9 Feb 2021 21:34:32 +0000 (UTC)
Date: Tue, 9 Feb 2021 16:34:31 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] ath10k: change len of trace_ath10k_log_dbg_dump for
 large buffer size
Message-ID: <20210209163431.11133472@gandalf.local.home>
In-Reply-To: <20210209145531.5977b16d@gandalf.local.home>
References: <1612839593-2308-1-git-send-email-wgong@codeaurora.org>
 <CA+ASDXN1V2HYA7C6s-q5bQNSxE7L5GCJiqfiJ_67R_hpUn4b_g@mail.gmail.com>
 <20210209145531.5977b16d@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_163435_266919_4B83E4D3 
X-CRM114-Status: GOOD (  18.36  )
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Tue, 9 Feb 2021 14:55:31 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> > [for-next][PATCH 2/2] tracing: Use temp buffer when filtering events
> > https://lore.kernel.org/lkml/f16b14066317f6a926b6636df6974966@codeaurora.org/  
> 
> Note, that is only used when filtering happens, which doesn't appear to be
> the case here.

I was basing this off of the original commands, but the stack dump says
otherwise. But it should still work.

> 
> > 
> > It seems like we should still try to get that fixed somehow, even if
> > the below change is fine on its own (it probably doesn't make sense to
> > such a large amount of data via tracepoints). It would be unfortunate
> > for next poor soul to hit the same issues, just because they wanted to
> > dump a few KB.  
> 
> Yeah, it was a design decision to cap the max size of events to just under
> PAGE_SIZE. The ring buffer is broken up into pages (for zero copy
> transfers to file systems and the network). Thus, no event is allowed to be
> bigger than a page (and actually a bit smaller)
> 
> That said, it shouldn't have crashed, it should have just failed to record.
> 
> I'll test it out and see why it crashed.

Looking at the original report, I see:

 CPU: 1 PID: 141 Comm: kworker/u16:1 Not tainted 4.19.139 #162

Does this still crash on the latest kernel?

-- Steve

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
