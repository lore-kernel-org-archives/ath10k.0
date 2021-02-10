Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07904C433E0
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 16:53:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AD2164E77
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 16:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AD2164E77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KxHhIo88ke0kcd2URuNzj/Q8eEZX9JzE97sOtRg2wcM=; b=2GyOKAiwfRJPDSt0P+yXKBjdK
	xn7ZdL+f1UQH/SfhCQbEopEm7sogJWOPoq7abVBR9YCiqgamOl8nYp7L6dc25uOt2gU1jPy5/yHYx
	zHc5aajtcuLgE4Ckw2mByAwtNUZXN3Wqz+m2UlhYlt2V6rl32pm+MOSoCqbUeCJdu1Y8IF3XTBMET
	d7KDW8HumMPxF6JkGc+BtrBxaa/IpflTyQt1aw3rbRLCMbwZ3VvKNzDQ3GkNh+2+VQJURkFSQlz+B
	liOrOMAl3JK1fOlHL50ljxjMOdAAERUAYggDOOjpDe697ZDPQBXYPNHXnaEHoWL0Ii0WL1/O6NSvW
	cGK3bvluw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9sk2-0004AC-Ma; Wed, 10 Feb 2021 16:53:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9sk1-00049l-6v
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 16:53:26 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B86BD64DDF;
 Wed, 10 Feb 2021 16:53:23 +0000 (UTC)
Date: Wed, 10 Feb 2021 11:53:22 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH] ath10k: change len of trace_ath10k_log_dbg_dump for
 large buffer size
Message-ID: <20210210115322.0b65a856@gandalf.local.home>
In-Reply-To: <20210210114823.1408dd64@gandalf.local.home>
References: <1612839593-2308-1-git-send-email-wgong@codeaurora.org>
 <CA+ASDXN1V2HYA7C6s-q5bQNSxE7L5GCJiqfiJ_67R_hpUn4b_g@mail.gmail.com>
 <20210209145531.5977b16d@gandalf.local.home>
 <20210209163431.11133472@gandalf.local.home>
 <9b479a88331dbf969f07708eabe53d14@codeaurora.org>
 <20210210113026.5f5ebe8a@gandalf.local.home>
 <20210210114823.1408dd64@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_115325_349066_A959A491 
X-CRM114-Status: GOOD (  12.25  )
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
Cc: Brian Norris <briannorris@chromium.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Wed, 10 Feb 2021 11:48:23 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 10 Feb 2021 11:30:26 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > Can you test this patch?  
> 
> v2:

Bah!

v3:

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index b79bcacdd6f9..90d7ade03499 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -2739,7 +2739,7 @@ trace_event_buffer_lock_reserve(struct trace_buffer **current_rb,
 	    (entry = this_cpu_read(trace_buffered_event))) {
 		/* Try to use the per cpu buffer first */
 		val = this_cpu_inc_return(trace_buffered_event_cnt);
-		if (val == 1) {
+		if ((len < (PAGE_SIZE - sizeof(*entry))) && val == 1) {
 			trace_event_setup(entry, type, trace_ctx);
 			entry->array[0] = len;
 			return entry;

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
