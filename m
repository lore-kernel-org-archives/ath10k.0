Return-Path: <SRS0=c117=IG=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57095C433E0
	for <ath10k@archiver.kernel.org>; Mon,  8 Mar 2021 07:25:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABE2564FE2
	for <ath10k@archiver.kernel.org>; Mon,  8 Mar 2021 07:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABE2564FE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dxkhBLqXt1qPq/W5qz3qhx+cXGplwihg9pP/ZcH1vJ4=; b=WS9A+FDfoIohzkcXeKxQiDHui
	gMYzBBKGVo3bDc8NFR94rZ8I/XRe67z9CPOSUefovMW5wkTqkBh3pv70wdkJEIiRGBxhe//8DlaKY
	LT2zJ6vlMfC/U3vbcvSnUOw7tWSzetXa9+MDAv+eH3IXsK14DKxJzsYbFk1YXKmare8vd+a9lq59C
	wyXBXvKFAYvDZaInrfo24JTOW6tlO3wjA0rOtwRglDTUoBnEhn7SLdSUNK4NcBzRER/zI+YAjCqat
	NZBOAdfag8CufbI9VK/aHWRfe1gu+0svhxZSH+1pTVElPhEL8/JzESc7oaBJMOq9Rvk2F2JLdv58X
	cY7sUbTXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJAFC-00FiIR-RG; Mon, 08 Mar 2021 07:24:00 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJADw-00Fi0L-0P
 for ath10k@lists.infradead.org; Mon, 08 Mar 2021 07:22:45 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615188158; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2zzNrDlFyq67/9T0xdtnfJBgqMfTjf8EjAqAeAeSK2s=;
 b=IF7ZdNewkKhMi9uQEXyQfqjl6RPbqZ0OJP2qPa8MniuCO5BXgr/8BcH1vCIonsiLVYBRWFol
 xRBUoyqzwnq7sljJgGFoqOTt1sLb0eeOumw0+0Is4/n/04iJ+dA8K3g887oeNTkEllrjXsYH
 PSJB4QGkoNEBmt+iRAMIqzcVIMU=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6045d0b12a5e6d1bfa06736e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Mar 2021 07:22:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 97D9EC433C6; Mon,  8 Mar 2021 07:22:25 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B8447C433CA;
 Mon,  8 Mar 2021 07:22:23 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 08 Mar 2021 15:22:23 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Brian Norris <briannorris@chromium.org>, ath10k
 <ath10k@lists.infradead.org>, linux-wireless
 <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath10k: change len of trace_ath10k_log_dbg_dump for large
 buffer size
In-Reply-To: <20210210115322.0b65a856@gandalf.local.home>
References: <1612839593-2308-1-git-send-email-wgong@codeaurora.org>
 <CA+ASDXN1V2HYA7C6s-q5bQNSxE7L5GCJiqfiJ_67R_hpUn4b_g@mail.gmail.com>
 <20210209145531.5977b16d@gandalf.local.home>
 <20210209163431.11133472@gandalf.local.home>
 <9b479a88331dbf969f07708eabe53d14@codeaurora.org>
 <20210210113026.5f5ebe8a@gandalf.local.home>
 <20210210114823.1408dd64@gandalf.local.home>
 <20210210115322.0b65a856@gandalf.local.home>
Message-ID: <137aaa6a6aa0ad0c0cf6e358705369c5@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_072241_699522_3E305161 
X-CRM114-Status: GOOD (  13.62  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2021-02-11 00:53, Steven Rostedt wrote:
> On Wed, 10 Feb 2021 11:48:23 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
>> On Wed, 10 Feb 2021 11:30:26 -0500
>> Steven Rostedt <rostedt@goodmis.org> wrote:
>> 
>> > Can you test this patch?
>> 
>> v2:
> 
> Bah!
> 
> v3:
> 
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index b79bcacdd6f9..90d7ade03499 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -2739,7 +2739,7 @@ trace_event_buffer_lock_reserve(struct
> trace_buffer **current_rb,
>  	    (entry = this_cpu_read(trace_buffered_event))) {
>  		/* Try to use the per cpu buffer first */
>  		val = this_cpu_inc_return(trace_buffered_event_cnt);
> -		if (val == 1) {
> +		if ((len < (PAGE_SIZE - sizeof(*entry))) && val == 1) {
>  			trace_event_setup(entry, type, trace_ctx);
>  			entry->array[0] = len;
>  			return entry;
After apply this 
patch(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/kernel/trace/trace.c?id=b220c049d5196dd94d992dd2dc8cba1a5e6123bf).
It not crash again on my v4.19 kernel.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
