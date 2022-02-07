Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DFDC433EF
	for <ath10k@archiver.kernel.org>; Mon,  7 Feb 2022 08:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OKjN926qHW4QPfQJUCQDGkJddMNk21K/x9BDx0r5qXY=; b=ZmJvBa5OSVYO7A
	um2ecVzD1SFQinQHO8dP0eR/5rbms000bDE1o6m59DRg1fAov09A6LeTKNyAlAzLYOKw/YKkEj0Vx
	E8Yy3ent/ammVNwcQtMESvZEmkEmRZyTjtvGLKdqrXVKoF2ulxcgMaM1ckgLGCprD6B46YQsw+8Vs
	ON8IBXfaOANHta3DosEz/nlX2kQp18dC5yn9GtfAonjzEEMzUaSIFzzhSfTdiSLi6aAs+FteCAHLa
	tzpkr8Lj9HfgHn63keFtVpy4oedzp0oJwjQmzHOgb7S6Ah+XbtwyCkkbdh4Ci2NrupMdBSdu2uNfL
	TXUGsZ5MHI72Q5hGD+4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGzGX-009KVY-Gf; Mon, 07 Feb 2022 08:20:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGzGU-009KUM-Fx
 for ath10k@lists.infradead.org; Mon, 07 Feb 2022 08:20:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7907EB81059;
 Mon,  7 Feb 2022 08:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0A5C004E1;
 Mon,  7 Feb 2022 08:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644222047;
 bh=idFh5WnRn2KDNk72YHmA1PvP/vzPuJr17nOw0OCbrA8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=NktuEfiunUmV7Ejf52A4tJm7b+2hFFRaRSJpU2u48b/fLsT0FLts3nrgirtjYIk3v
 MhZe/+CvpH2X5g0kheYVWDD5bL94zNWNrXf4GTPAuQ95HNyQq5wq3rWJpGNdE2q5Xa
 sn2/ixt8agQ2+QuaBV2RtSHXiQXX9klLcqF9Qp5vladAnEyIyDSLdhU6FNmjygecYC
 TmOVFc3KcTyT1NcaL0eYo1WOQAgwnTcnF0dDuIqkjVovEuLfTZ0TVS0bQSO321+Ot5
 WMjBfTY4H57VKr5POGdPCciwcRjUD4hobLJv8NnwRqtEOSjfRWThoaSk2iixy13g00
 CLeB08+tKL0dg==
From: Kalle Valo <kvalo@kernel.org>
To: Francesco Magliocca <franciman12@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,  ath10k@lists.infradead.org
Subject: Re: [bug report] ath10k: abstract htt_rx_desc structure
References: <20220201130900.GD22458@kili>
 <CAH4F6usWj5_a9m4g+v1xxNDGwhiCmkCqphBY9VNsmfwX+NvUyg@mail.gmail.com>
Date: Mon, 07 Feb 2022 10:20:44 +0200
In-Reply-To: <CAH4F6usWj5_a9m4g+v1xxNDGwhiCmkCqphBY9VNsmfwX+NvUyg@mail.gmail.com>
 (Francesco Magliocca's message of "Sun, 6 Feb 2022 11:25:56 +0100")
Message-ID: <87iltray03.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_002050_708297_83DCC601 
X-CRM114-Status: GOOD (  10.79  )
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

Francesco Magliocca <franciman12@gmail.com> writes:

> Hello Dan Carpenter,
> auch, nice catch, thank you very much.
> Yes, your solution is correct,
> even if I think that we  could avoid skipping the first part of the
> rx_desc altogether,
> because it is just a trace.
>
> Kalle, will you amend my commit or do I need to file a new patch?

I don't rebase my trees, so please submit a new patch fixing this issue.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
