Return-Path: <SRS0=eXlr=NK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B143FC432BE
	for <ath10k@archiver.kernel.org>; Thu, 19 Aug 2021 13:25:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 805306103A
	for <ath10k@archiver.kernel.org>; Thu, 19 Aug 2021 13:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 805306103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlwgz+6jZiozny4isALfVPFe4K3lbMtbvXV7kkbZ3fs=; b=ukKQqw9MS0RhZt
	lQU8W52mEx3axZy9Phi2/q+UHwJxEdQSy2gEi1WAJyR3v6lOGQpgeQ+8QHBBKP0Wji35PozM3i2jv
	nZaClWgTjqjEErwVz5LDNl/cBWRiDBhvOdV9xjyrAOXafIYyPgeFero4emUmsgpZOYGE/3G6A1fZ5
	wXMqFKsEDjMD2rNj7fVMogt9VGwxEH94KtKeVQ9klrJ0ZIC5TsoqORuduYi6X9aExCoIIEMgWhVAF
	/ArufL03VynBQpxpPJDPOV7Z7djA45YNnvzuVud1N3WyGkNBakrkRcXwdLlHPZaBxCRJFAhZF/edF
	/FoESNAXebZ4oR4MyCyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGi2d-008SF4-1q; Thu, 19 Aug 2021 13:25:07 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGi2a-008SEc-Kp
 for ath10k@lists.infradead.org; Thu, 19 Aug 2021 13:25:05 +0000
Received: by mail-lj1-x232.google.com with SMTP id y7so11594671ljp.3
 for <ath10k@lists.infradead.org>; Thu, 19 Aug 2021 06:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qsef7nu2zlQE6kcZLASBKkTaAvwF0nwU8Y3JF2FJlO0=;
 b=U8Pt++pHtYK3qAuvgqBGVLnR2Zw8VnHFHMY1m4/+XLGUqaU5LcaxMghxDUL8bCdyQ1
 VZggZEjBIkBAdwiGiPwvRHC79hY65inKfFyWu+6EBJiDCF/rQa5Q0HlKyyCqpV6AoSNz
 HW7eP5qMl7J9tJfecNm6tV4aCvP2RX4Hp8/4vd92zi+e+0TuRag2nXNjjssefG/aZHZh
 yIj2MW+nkA+Ue8Spk1vFR4ESem3BYadkym2vFV0tPH8Jorolf7XAVa+dTpTOWOJFYRea
 vAW7GLNQj8gg/F2ZY3bYt5QfLw/p466oX/oPL7Y1ZqqEZ1O0kbQ/g7mlvCvDRMTS5sox
 RHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qsef7nu2zlQE6kcZLASBKkTaAvwF0nwU8Y3JF2FJlO0=;
 b=kkJPlROJGw+YCD8GYgm9meqwo+RMLdTWyi4VShDQvMRS/QBCKapgLffCSbO9bGnMa/
 sdMhPpLpZlH/KbkXletzIUPzRirdtqrUOYpMWzYLxntcYHhx4jEDJP7TZL6KBv74yi/M
 5Fn7nVxo8eNKx0Xhsm1w9kBWQfQfIIYiLxo639qTHBKJgQxWAmSJ7c3whA/pUSSIwim6
 uf5PSLvn+dnzlz0tbawBQvtwjgRzAkokQtr/R0eQ1gBhXPhUnMbmxhepuhCI6z3WE7dq
 zDUFUiOMIR14rpPPUsdnI+gfnQSqFW7/mJ5yni/1iWwvg3A6NdP16k2WeijZAxqPevoJ
 WCxg==
X-Gm-Message-State: AOAM533Uus4Sog3nwusljOrW00yPMiD4+wMAGAALei51p0KLIo4etGnD
 ZEtRE2/ysuXePGHsfLtrAo8X011120jmQk3VG1c=
X-Google-Smtp-Source: ABdhPJz4OUPaOk2mOpJpgQ4f4/QnXdIXILZ/S9GUpHg0wY4tFfbM65VolOt0U/tztCWx0kOpjRZfJzAW+ZWPzL9y6dk=
X-Received: by 2002:a2e:8e8f:: with SMTP id z15mr5884085ljk.121.1629379502237; 
 Thu, 19 Aug 2021 06:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5AAvZic-NFbYYSVfOxY-27QukXMX68f9eDmhbqAkBRKRw@mail.gmail.com>
 <20210818154358.GS4126399@paulmck-ThinkPad-P17-Gen-1>
 <CAOMZO5A7drx9yXWXKTh4VfV4QHNGCPbH_vxeb=NGDghAm98CXA@mail.gmail.com>
 <CAOMZO5BY7JeFQJkU--KGRfNLTUnUVjnfar+37SvReXyBt9QJfA@mail.gmail.com>
 <20210818175604.GX4126399@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210818175604.GX4126399@paulmck-ThinkPad-P17-Gen-1>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 19 Aug 2021 10:24:51 -0300
Message-ID: <CAOMZO5Ag1uUx4BqS=+ZQwULSrkE=sNMyWgsWvPQ4xY16ac=zsQ@mail.gmail.com>
Subject: Re: NOHZ tick-stop error with ath10k SDIO
To: "Paul E . McKenney" <paulmck@kernel.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, 
 linux-mmc <linux-mmc@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Vasut <marex@denx.de>, qais.yousef@arm.com, 
 Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_062504_732031_CF5A64A0 
X-CRM114-Status: GOOD (  11.44  )
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

Hi Paul,

On Wed, Aug 18, 2021 at 2:56 PM Paul E. McKenney <paulmck@kernel.org> wrote:

> And it turns out that I am also seeing it in v5.14-rc2, just a lot less
> frequently than earlier.  I have seen three instances of handler #02
> (NET_TX_SOFTIRQ?) over the past month or so while you are seeing handler
> #08 (BLOCK_SOFTIRQ?), in case that makes a difference.
>
> Adding Frederic and Thomas on CC, though I believe Frederic is off
> the grid at the moment.

In my case, these errors are very easy to reproduce so if you need me
to collect any debug
info, just let me know.

Thanks!

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
