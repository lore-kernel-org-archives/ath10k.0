Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661A2C433EF
	for <ath10k@archiver.kernel.org>; Thu, 24 Feb 2022 16:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/yI0y0FrnPOzriM2mSr6O4xXExxA3m8TrDiw2mx2GQU=; b=T5KetbC7t/+xuD
	uDixoqSfppAeqZcaVIx18jXEM4vwMvGnH9UJuhJyr0PGp2gdm8Fziw21BoF1P31UJwY1TkU+AlCUQ
	FPUKRgrr8/qX12CuKil0wUQu7dLWXGx/qffCYCzgQGrkiuzRnPn3p7kXk5/n1heMvIi2qxQW2jpT6
	lpyzmHFbSBEWznRSVvmiZ9IqrGlGUlE4ohh2nNUahhxKV15ydnS5H8aP55qRtL1z8zU0gAw7VO3cw
	QDiIAVnu2zohg5/5NXz+wGL2vhXomQNAVVmbrtI8d4W+fI+1iY8sWEAopeLRQoQfpYY4VJSfZmVbg
	r7Fq0ezuCK+SZngDNdzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNGtB-001YeA-Tz; Thu, 24 Feb 2022 16:22:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNGt9-001Yck-Ep
 for ath10k@lists.infradead.org; Thu, 24 Feb 2022 16:22:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B1C64CE1FCC;
 Thu, 24 Feb 2022 16:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E3DC340EC;
 Thu, 24 Feb 2022 16:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645719758;
 bh=6AQaEZoBxwC8P5SMcS4qxA+oPXeSFFhe6lK0QQyH+5s=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=jww66/64Qu0L+xMCF6MZCXI8XrWI/fo59hOLHVDpgYQKIBhm2uBNf/bjxkHe3xLAz
 nA8Cg9z6DylS8z24BojPywd2j88zQeje6hxpBQjFVYSFcUz0ooR4d2aM5vPcvUX/1g
 K093QGZVPUuJLovwTEZe/e6qdB9bw1F6SC+xlBEGS/1dV2mSQSQea78SL/VewebDz3
 uz2dyyxvuM0fuiW+dlspweQfCOMr6K59kCRYc073s5x1bRdPB3bMfZYkR9w1CUMg7M
 YUFIw4ugWuXaVpFHqB+sOptLOsAXvKINvQQksN5jtyUCOquDBKu355w43HRM4Mmp37
 JXtG27frgSBlw==
From: Kalle Valo <kvalo@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Nuno Oliveira <nuno@eq.uc.pt>, Sebastian Bachmann <hello@reox.at>,
 wgong@codeaurora.org, ath10k@lists.infradead.org,
 "regressions\@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Compex WLE200NX: regdomain sanitized regression
References: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
 <YaIix40KaVlxT+XG@eq.uc.pt>
 <96b3682d-71b3-ada0-6fc7-686e51609968@leemhuis.info>
 <87v8zja7em.fsf@codeaurora.org> <YcDMGdpvINCX9VlX@eq.uc.pt>
 <625a51ed-8185-6fdb-bd7d-cfb0a913c7a4@leemhuis.info>
Date: Thu, 24 Feb 2022 18:22:29 +0200
In-Reply-To: <625a51ed-8185-6fdb-bd7d-cfb0a913c7a4@leemhuis.info> (Thorsten
 Leemhuis's message of "Fri, 18 Feb 2022 12:47:27 +0100")
Message-ID: <87v8x4tet6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_082243_710776_1CBFB45E 
X-CRM114-Status: GOOD (  13.98  )
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

Thorsten Leemhuis <regressions@leemhuis.info> writes:

> Hi, this is your Linux kernel regression tracker speaking. Top-posting
> for once, to make this easy accessible to everyone.
>
> Kalle, thx for looking into this, I'm well aware this is kinda tricky.
> This is a gently reminder about the issue to ensure it doesn't fall
> through the cracks. At the same time I know that it's not urgent, that
> why I'm not putting it on backburner in regzbot now:
>
> #regzbot backburner: tricky situation and around for a while, hence not
> that urgent
> #regzbot poke
>
> I'll likely sent another gentle reminder after the next merge-window.

I now queued the revert to my pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=dfc438d224e4ad756b276d79e5771c45b523156d

Thorsten, can you please check that the Link tag is correct so that
regzbot can automatically detect the fix?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
