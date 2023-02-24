Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6EFC677F1
	for <ath10k@archiver.kernel.org>; Fri, 24 Feb 2023 06:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MUXpavAvyTeX7n784igxiigpQ618fGu60KrZVYmk0e0=; b=ITsCQcMTqp/gTq
	XqMLhdsEF076H/RbCEAwf6EDlT5L4x6hSEvqXTa4+CQnQ1GScRw/GefvOZedkHXGDkG/LQMNxK7hb
	D+piXw69J+5TxTzh8EwS1oNXE3E2ifG7jz51BREY0rQuDAiO5sNaP3CCXqYbGZO2Ycs3pule5ZM4L
	Srwzci6MA/XPkKIUD/OitSXK07u9xnFnEa3vnHIsCFF7u/XOczDJZ7dC8QWWOJryX+rZjVBilO0mj
	nWzkMspjWLXe2dTijliTf3cZLvUiRm4/+MbGVFQNJrQmaT6VSZ2xkjYGB1PHhwBi4rFdllCEMWAKK
	CpUuYnvUgCnYqjFbCiIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVRfm-001LIu-KH; Fri, 24 Feb 2023 06:35:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVRfj-001LIM-94
	for ath10k@lists.infradead.org; Fri, 24 Feb 2023 06:35:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBC67617F0;
	Fri, 24 Feb 2023 06:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8F2C433D2;
	Fri, 24 Feb 2023 06:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677220509;
	bh=lbti7xvMNeqJyA2mgZcAIBeAKeZvzByOiNbzQb5rZl4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=K+n5Uzqfm30znJRMjGfr9aBLvNOkKnCODlfjxkkYdvPy5eUVweQo4Kb9HUgSMHChI
	 oWMf4abF1smnKcKxYaxXrmMPkAX2tqGqEfAixfwmRBZrABSP7IMSdOQ10rsnfVyqn9
	 Wl1QbjQHCJfSFk7x7XiDm9XdAJNuQd6IGdZy97s30qMU5H27XwShyCLWLzgBL4eE1I
	 4LJu7iJ42Dt9X8F9Bj9p1jGVP4Wsb5ymA59O0bnvA13o7NM44B0DZQ91rv8dSaXUgv
	 F4TUZfrCjGEehKwh5138UULMkzI79GUKZoxQmBOGq40rfEf2sroXHS0n+i7kyamr8f
	 mz25iKvN8h/TQ==
From: Kalle Valo <kvalo@kernel.org>
To: Vincent Tremblay <vincent@vtremblay.dev>
Cc: ath10k@lists.infradead.org
Subject: Re: [PATCH] ath10k: read qcom,coexist-support as a u32
In-Reply-To: <Y/bD4Rfv2gE30RM8@vtremblay> (Vincent Tremblay's message of "Wed,
	22 Feb 2023 20:39:45 -0500")
References: <20221231184856.329282-1-vincent@vtremblay.dev>
	<Y/bD4Rfv2gE30RM8@vtremblay>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Fri, 24 Feb 2023 08:35:05 +0200
Message-ID: <87ttzbsh9i.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_223511_401523_CE305F79 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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

Vincent Tremblay <vincent@vtremblay.dev> writes:

> This is just a small bump to be sure that this patch does not go
> unnoticed as it was submitted during the holidays.

I couldn't find your patch from patchwork:

https://patchwork.kernel.org/project/linux-wireless/list/?series=&submitter=&state=*&q=ath10k&archive=&delegate=

Basically if the patch is not on patchwork the maintainers won't see it.
Please resubmit as v2 and cc linux-wireless, more info here:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches

Also please add "wifi:" to the title.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
