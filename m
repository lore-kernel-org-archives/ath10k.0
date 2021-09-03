Return-Path: <SRS0=dcMu=NZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49ADFC433F5
	for <ath10k@archiver.kernel.org>; Fri,  3 Sep 2021 08:08:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01E9C60F91
	for <ath10k@archiver.kernel.org>; Fri,  3 Sep 2021 08:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01E9C60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zwSRtSghm/ahglF+W2rhkDhFAxWj15fXl2lsF+d758=; b=F6OWtMpO8qjXbP
	1roDjBuRqUIMeyOdGRHyVL9dyof2uoPwZzk6BuMdDArT3h+tw4OAPfJ9TAqAOH3mUQXkoF1rSiqRJ
	+KC1JHG4V9gKe2IAbtdnAWyhkas3JOAgGSGT+39Hm2W7ZplOEy/NfYWF/w+3BjqV0LZ4Yotqh5FQr
	0qgK5H+u5QeULpbbIXcSx/jEeJ3BnwSlqQPc+thUhMuCNEb4m+KtOHX6CbSTEO39zvZSL3qAdRMY2
	UOXLEvqbgaYCcO4C10sJlwA5wGzh0MpCzjSdE0Na0god/37kPCdW0RDBEcAnWBGdKp1XODE+W/bks
	CzCowXpXbhycDz2WrtpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM4F8-00BE4r-2v; Fri, 03 Sep 2021 08:08:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM4F4-00BE4L-Tw
 for ath10k@lists.infradead.org; Fri, 03 Sep 2021 08:08:08 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1630656459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sz3NEorzSRhQ/KiRak0L67VRUrrFzRTUrbz18Kw9pyw=;
 b=s0CaIoH6qRe4B4DYl7Y5Ppw0fgkDPkL2B3W2KxJwau5wcw27PIHwZIzKc+iGwpuUE4FViw
 je4kuTaytAbf4nXp819MYipFgKFwq7BMHLbRpStetfEkjNnL9j6z3gAMDu+pkQuBflR0VV
 5YJ0ml/wBjwFycbvY5twLI3pvLwRM8V0B+zfaxHvapKQ8LXERP7hao4wbv1CobPVV65F7r
 DOhjQcoKyVsLZ80nreaJWwp/vovzNI5HjjTDD2Qf4ZSyPtQAwBm7Vf0Nad5rd6bjJWVsRb
 CIt+CaNGsmJ7oOnQc/qUeKU08r8WhjoXlY8M/CD0hjHNyyD/S7FHiu59l2jlYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1630656459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sz3NEorzSRhQ/KiRak0L67VRUrrFzRTUrbz18Kw9pyw=;
 b=CQJZyC1q8j4JW+dNvGC4I/kGtEltDL+IbN0NZ/4YzClkBD4RZ30qcUmLc8lwfTu3Hr4T6m
 sk3A/yM1esCzE7Dw==
To: paulmck@kernel.org, Fabio Estevam <festevam@gmail.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, linux-mmc
 <linux-mmc@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
 Vasut <marex@denx.de>, qais.yousef@arm.com, frederic@kernel.org
Subject: Re: NOHZ tick-stop error with ath10k SDIO
In-Reply-To: <87czpqbq98.ffs@tglx>
References: <CAOMZO5AAvZic-NFbYYSVfOxY-27QukXMX68f9eDmhbqAkBRKRw@mail.gmail.com>
 <20210818154358.GS4126399@paulmck-ThinkPad-P17-Gen-1>
 <CAOMZO5A7drx9yXWXKTh4VfV4QHNGCPbH_vxeb=NGDghAm98CXA@mail.gmail.com>
 <CAOMZO5BY7JeFQJkU--KGRfNLTUnUVjnfar+37SvReXyBt9QJfA@mail.gmail.com>
 <20210818175604.GX4126399@paulmck-ThinkPad-P17-Gen-1>
 <87czpqbq98.ffs@tglx>
Date: Fri, 03 Sep 2021 10:07:38 +0200
Message-ID: <877dfyaxpx.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_010807_298275_EA1A5FC7 
X-CRM114-Status: GOOD (  16.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Fabio,

On Thu, Sep 02 2021 at 23:51, Thomas Gleixner wrote:
> On Wed, Aug 18 2021 at 10:56, Paul E. McKenney wrote:
>> On Wed, Aug 18, 2021 at 02:02:17PM -0300, Fabio Estevam wrote:
>>> On Wed, Aug 18, 2021 at 1:29 PM Fabio Estevam <festevam@gmail.com> wrote:
>>>
>>> With the debug patch and suggested command line, I get the following log:
>>> https://pastebin.com/raw/X96zKw7i
>
> And looking at that ftrace output in the pastebin there is nothing which
> raises NET_TX_SOFTIRQ but then the warning claims it is pending.
>
> This does not make any sense at all.

Looked once more at the trace output. It seems to be incomplete. The
last recording of softirq raise was at 379568us ~= 0.38s post boot, but
the splat comes about 20 seconds post boot. Did your kernel trigger a
WARN_ON before that splat? If so, that might have disabled tracing.

As you are triggering this manually by invoking hostapd and the machine
should be still functional afterwards, can you please replace Paul's
debug patch with the one below? Please remove the command line option
and do the following:

# echo 1 >/sys/kernel/debug/tracing/events/irq/softirq_raise/enable
# echo 1 >/sys/kernel/debug/tracing/events/irq/softirq_entry/enable
# echo 1 > /proc/sys/kernel/stack_tracer_enabled
# hostapd ...

Once the warning triggered do:

# cat /sys/kernel/debug/tracing/trace >trace.txt

That should give us the full trace data and hopefully a better
understanding of the problem.

Thanks,

        tglx
---
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 6bffe5af8cb1..269f804090ef 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1015,6 +1015,7 @@ static bool can_stop_idle_tick(int cpu, struct tick_sched *ts)
 
 		if (ratelimit < 10 && !local_bh_blocked() &&
 		    (local_softirq_pending() & SOFTIRQ_STOP_IDLE_MASK)) {
+			tracing_off();
 			pr_warn("NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #%02x!!!\n",
 				(unsigned int) local_softirq_pending());
 			ratelimit++;

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
