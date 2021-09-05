Return-Path: <SRS0=QvZk=N3=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12810C433F5
	for <ath10k@archiver.kernel.org>; Sun,  5 Sep 2021 13:00:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A8F5604AC
	for <ath10k@archiver.kernel.org>; Sun,  5 Sep 2021 13:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A8F5604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qj7046wozfN+xWWHJfj71TbO1eWJTcdFBW7UTSEibbA=; b=mDYzQ24MAAg/OH
	e97dHf3V4CsWdmySQqjsXMLw0rNjpdTCrwiiTltCxGnCa5kp+wzUXLfDbHvTOzE68IkV4q9qZViO3
	Ec7JPjO+TdTB9f5LY2Y8iTSlSxp6K9mW7DXhvHZbeQOnoxpa59KejSxyS0dWFWjt38MTKVv/LlWiO
	pjvOtqXEm0B8+VH8v/9PogWOgirAsS6wqm+cZtewfc5gyWihfu9bvUwfIiv3JegWaLe30gQmoad07
	EHj+QSVD+Jjbs5t0zzPGLK31cXtTfHmU/+x9afWCFRsDw7f2yEHbng8f+yXr44O3bl3q8ofW4Q/R4
	2rDI7er9pq/qM1zwKe+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMrlL-00Flm1-PB; Sun, 05 Sep 2021 13:00:43 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMrlG-00Fllb-Lr
 for ath10k@lists.infradead.org; Sun, 05 Sep 2021 13:00:40 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1630846833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5mrjGVFiOPqsdbJhlmm1IqiKCCQIVhCAj521c6QgqVM=;
 b=2Ssmz/nGTLxDypQ09h+gv3v+WyQtYzIIP94e/m9VP8G5jMRLmV99WbksWatpe7ei2611Tj
 ukf8q6vUbx1hIyG9i3AkQkn+8BYFkLhtJRlojjamC+rfBCUO7eYs/J0EBoRBNusSNLAVRM
 iryzslyn117MImHzeDQO6OZEsHLJYOUM2s8jF6GVCnfXOfASQie60mxgGPmglQ6R2ihHcC
 j0uOD4raeXKhmwPoMOY/yeSxlUTSWiAWhOjRe0sj9ogyVuqrI9gwCIVZd9PRNmwGqZw1dE
 O2rNrRaH4KLIam2o6W0LsTwr/HE6JmdPWnnN+5pYtsQbb9tKQuCuH1+Qk4s9jg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1630846833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5mrjGVFiOPqsdbJhlmm1IqiKCCQIVhCAj521c6QgqVM=;
 b=uib9f4Z1JO1xwyZA8nqZ763uwURP/23thAsyE9yMPj5VN/yfDK1Tq663JHaGVc43I5tE6X
 vLlqa8qKC/dRHQAA==
To: Fabio Estevam <festevam@gmail.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, Kalle Valo
 <kvalo@codeaurora.org>, ath10k@lists.infradead.org, linux-mmc
 <linux-mmc@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
 Vasut <marex@denx.de>, qais.yousef@arm.com, Frederic Weisbecker
 <frederic@kernel.org>
Subject: Re: NOHZ tick-stop error with ath10k SDIO
In-Reply-To: <CAOMZO5BnPEnF-HNM7vCzeUrRW7BsQ-hhm4fcVmO_QieKf6oJsw@mail.gmail.com>
References: <CAOMZO5AAvZic-NFbYYSVfOxY-27QukXMX68f9eDmhbqAkBRKRw@mail.gmail.com>
 <20210818154358.GS4126399@paulmck-ThinkPad-P17-Gen-1>
 <CAOMZO5A7drx9yXWXKTh4VfV4QHNGCPbH_vxeb=NGDghAm98CXA@mail.gmail.com>
 <CAOMZO5BY7JeFQJkU--KGRfNLTUnUVjnfar+37SvReXyBt9QJfA@mail.gmail.com>
 <20210818175604.GX4126399@paulmck-ThinkPad-P17-Gen-1>
 <87czpqbq98.ffs@tglx> <877dfyaxpx.ffs@tglx>
 <CAOMZO5BnPEnF-HNM7vCzeUrRW7BsQ-hhm4fcVmO_QieKf6oJsw@mail.gmail.com>
Date: Sun, 05 Sep 2021 15:00:32 +0200
Message-ID: <87y28b9nyn.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_060038_987928_2C14F9C4 
X-CRM114-Status: GOOD (  15.94  )
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

On Sat, Sep 04 2021 at 18:10, Fabio Estevam wrote:
> On Fri, Sep 3, 2021 at 5:07 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> I did as suggested and here is trace.txt:
> https://pastebin.com/VUfLRJ8a

Lacks a stack trace, but yes this one is the culprit:

kworker/u4:2-70      [000] d..1    87.940929: softirq_raise: vec=3 [action=NET_RX]

It has only interrupts and preemption disabled and it's in task
context. So if there is no interrupt raised and no local_bh_disable /
enable() pair invoked before the CPU goes idle nothing will handle the
softirq and the raised bit stays pending which makes the NOHZ idle code
complain.

> Also, while investigating this problem I saw a commit that fixed a
> similar issue:
> e63052a5dd3c ("mlx5e: add add missing BH locking around napi_schdule()").
>
> I then tried the same approach on the ath10k sdio driver:
>
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c
> b/drivers/net/wireless/ath/ath10k/sdio.c
> index b746052737e0..eb705214f3f0 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -1363,8 +1363,11 @@ static void
> ath10k_rx_indication_async_work(struct work_struct *work)
>          ep->ep_ops.ep_rx_complete(ar, skb);
>      }
>
> -    if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags))
> +    if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags)) {
> +        local_bh_disable();
>          napi_schedule(&ar->napi);
> +        local_bh_enable();
> +    }
>  }
>
> and no longer get the "NOHZ tick-stop error: Non-RCU local softirq work is
> pending, handler #08!!!" error messages after launching hostapd.
>
> Is this a proper fix?

Yes. This is correct. See above.

Thanks,

        tglx

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
