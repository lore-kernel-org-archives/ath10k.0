Return-Path: <SRS0=Dn+H=N2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B13AC433F5
	for <ath10k@archiver.kernel.org>; Sat,  4 Sep 2021 21:11:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D23060E74
	for <ath10k@archiver.kernel.org>; Sat,  4 Sep 2021 21:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D23060E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7rfBHN+nh6vQRhg3DsfoBM7w/TerAdnsayPbaTnkGM=; b=QhjQ1ykE5LOeUE
	+TLwreUwcnqz+ofUwQlTIcOpkT03TPvHiJU8kNQkNA88CpOcxW5X2iGrNP4zYX+OdblQ2BsPUaMDX
	+jrwxkyM45ZB1mrz7PsGSU7NwbYCKaHiWIgVUlQV8TJwHQnJpIcGKFs3wQKlOFbwRSd6M+ewYSTpq
	5a38FXN0ktF9VMybPKCmcnx6WrRfEmeHeoZ03Slgfmb+oPGa1LS/2h1mQ0DQq6u8NLy/BRcAzpoGl
	X1HY2IWTBBNVzoDjt6tNs9CfNXyPH+3+wMDP6qtKDmmY2UZWN2OhpWErI3prHerrjTuTTxqH6Jmgb
	T586fpC+TEgPpXn4TOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMcwM-00Ej9Q-8q; Sat, 04 Sep 2021 21:11:06 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMcwI-00Ej7L-R4
 for ath10k@lists.infradead.org; Sat, 04 Sep 2021 21:11:04 +0000
Received: by mail-lj1-x22b.google.com with SMTP id s3so4369220ljp.11
 for <ath10k@lists.infradead.org>; Sat, 04 Sep 2021 14:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d8IOvNTUOq6JzLAydqjspWW5KTRCUhLqlTrLjSJZ2/M=;
 b=NXVRGKYStBYuta2B+4aG9yj8aPd8QlkIR6ZaCupIrIOw2OxkHhQadEyIc27BqUmr2z
 Bb5gM+2vHp2IjhgiUrSvN0ybqLjIvdzwuvqSGbZaghyuv7IWFSV/IFBlZbWO2rU4RW8K
 Jg6wdWqm31+oKpmfJ3M4ssn8nLMTN1xhZFpLySrz8qIJubmjC98bBpdamFrra93/d1qp
 Xx3Fxa0lsBaJt4FPSdDUBKnhAZhvd2pKeeSWucRtnuxA0NEB/cTYMEfn7CdyrCBYmk4y
 qwLrkbaLvmJYzY/PnwtvBvK+Fk/Ra7bh1XBQOeqwD/KzKHNUbaQZcZEDqbhv4ewdHPib
 6FBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d8IOvNTUOq6JzLAydqjspWW5KTRCUhLqlTrLjSJZ2/M=;
 b=STISHl8PKO9hrshtcBtoV1+jgd2p3RkiAPzAN60kZHn8JlsfAWwYNy0VQCzm1XtDmz
 5nJ4miv70hnZR3GBtrh/EqQvOibJWFKLtXikP/4pg9TjgCz8H31lWR8sB2nRnpIRmauJ
 s+FAF5SfUj+qhs0wzZScjsuFn1hUZ6ixTOAqCVK1L1gcRy4H5NeD+4xlJaslMbK75+/G
 OvWurbPBwTYQrsNPgP9bFVEljy19vZrXZo7CE/6Ro6icB7saY42Qo9TPWfJ3+urPa3It
 06DBAFwK10yggAko+qWYQe1q4ifkFJrPqdDt5FjMxmsPnlweqtuFxRi9em9WO6+5RygO
 wW/g==
X-Gm-Message-State: AOAM530W926YNAVVhjvFBomSzMnAcdes4zYcg/CN2Rq1zCvXGHweyF04
 OEb5xxl/wY3ruEHJTabyyuwVAWsh+6rPLPWlbOY=
X-Google-Smtp-Source: ABdhPJwnLXHVYXDKaxeoM5eWOigZm8O3zI+oNOKkU4Zx+cLmL2hc1PUGONsvs68VxuawQi4Pun+N2xfXq1WsaewcFeY=
X-Received: by 2002:a2e:b8c9:: with SMTP id s9mr4184883ljp.203.1630789856137; 
 Sat, 04 Sep 2021 14:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5AAvZic-NFbYYSVfOxY-27QukXMX68f9eDmhbqAkBRKRw@mail.gmail.com>
 <20210818154358.GS4126399@paulmck-ThinkPad-P17-Gen-1>
 <CAOMZO5A7drx9yXWXKTh4VfV4QHNGCPbH_vxeb=NGDghAm98CXA@mail.gmail.com>
 <CAOMZO5BY7JeFQJkU--KGRfNLTUnUVjnfar+37SvReXyBt9QJfA@mail.gmail.com>
 <20210818175604.GX4126399@paulmck-ThinkPad-P17-Gen-1> <87czpqbq98.ffs@tglx>
 <877dfyaxpx.ffs@tglx>
In-Reply-To: <877dfyaxpx.ffs@tglx>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 4 Sep 2021 18:10:45 -0300
Message-ID: <CAOMZO5BnPEnF-HNM7vCzeUrRW7BsQ-hhm4fcVmO_QieKf6oJsw@mail.gmail.com>
Subject: Re: NOHZ tick-stop error with ath10k SDIO
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 ath10k@lists.infradead.org, 
 linux-mmc <linux-mmc@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Vasut <marex@denx.de>, qais.yousef@arm.com, 
 Frederic Weisbecker <frederic@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210904_141102_927511_49EDA843 
X-CRM114-Status: GOOD (  18.45  )
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

Hi Thomas,

Thanks for your response.

On Fri, Sep 3, 2021 at 5:07 AM Thomas Gleixner <tglx@linutronix.de> wrote:

> Looked once more at the trace output. It seems to be incomplete. The
> last recording of softirq raise was at 379568us ~= 0.38s post boot, but
> the splat comes about 20 seconds post boot. Did your kernel trigger a
> WARN_ON before that splat? If so, that might have disabled tracing.

You are right. The WARN_ON only happens after hostapd runs, which is at a
much later stage.

> As you are triggering this manually by invoking hostapd and the machine
> should be still functional afterwards, can you please replace Paul's
> debug patch with the one below? Please remove the command line option
> and do the following:
>
> # echo 1 >/sys/kernel/debug/tracing/events/irq/softirq_raise/enable
> # echo 1 >/sys/kernel/debug/tracing/events/irq/softirq_entry/enable
> # echo 1 > /proc/sys/kernel/stack_tracer_enabled
> # hostapd ...
>
> Once the warning triggered do:
>
> # cat /sys/kernel/debug/tracing/trace >trace.txt
>
> That should give us the full trace data and hopefully a better
> understanding of the problem.

I did as suggested and here is trace.txt:
https://pastebin.com/VUfLRJ8a

Also, while investigating this problem I saw a commit that fixed a
similar issue:
e63052a5dd3c ("mlx5e: add add missing BH locking around napi_schdule()").

I then tried the same approach on the ath10k sdio driver:

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c
b/drivers/net/wireless/ath/ath10k/sdio.c
index b746052737e0..eb705214f3f0 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1363,8 +1363,11 @@ static void
ath10k_rx_indication_async_work(struct work_struct *work)
         ep->ep_ops.ep_rx_complete(ar, skb);
     }

-    if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags))
+    if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags)) {
+        local_bh_disable();
         napi_schedule(&ar->napi);
+        local_bh_enable();
+    }
 }

and no longer get the "NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!" error messages after launching hostapd.

Is this a proper fix?

Thanks,

Fabio Estevam

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
