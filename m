Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E90C433EF
	for <ath10k@archiver.kernel.org>; Mon, 16 May 2022 16:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6gcOCcGY8PieaCUL1LENiUimw5eu2QAEJK5bb04S+Q=; b=wnc3n94037pAtz
	XxuYl5J/TIVg2hVZt2z0hRIVoPNlXTiQAG5QxL4TyB7rrNwP0Ra/8veomMFO0bMZEMc+6KHgZb0DC
	ulRj1YzjqScQFuy51k3tUe8Mc8fj5k7TiWV2ZiiC2sd3Ea2IkWKdsgwAhdS4m5gX0i77oEyiTMCU+
	fVSHgdR/zehEmvvO2uSvhwg5wAd5w5BTZjsIacrS3CwITSXbpQeNrv9p3ADKCyUWoQKC5+1Pkt/xL
	GSmQ/aI/Gxx4dPDOrdWB/JhwndzZxEOR/Wwh9oqcax8rdp6VDvNBofpwx+uCo2CGHqTYDFmlNRuQQ
	ibddH0lewNLMaGFIhtkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdKD-008twu-2m; Mon, 16 May 2022 16:12:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdKA-008tvq-9p
 for ath10k@lists.infradead.org; Mon, 16 May 2022 16:11:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE0386100D;
 Mon, 16 May 2022 16:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB17C385AA;
 Mon, 16 May 2022 16:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652717517;
 bh=k4Z629lD4jDxAZwSbnjVJOG6WtkNWbSIW3DDKaMroFE=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=mgNKFxad3brHr5iIOwNJ7Ab7Rmg7MLeTJdmIYIWl/gGwMxCt1uYuZ6vjxSMEP0DQY
 O+LlzLmgR6QufLIksNzVaPY1GeZmCaR213Frou6mvFXGwkzHTqbHZh3DpvnUkxrk7v
 BJ1mBmuiCjEy4LeQyDLl6wbywnr4gD59J3zV+3ELGefJoRFICYXr8sKuzQDr4jIdGl
 VfecWhlK8AStcAju4qLErJBK57V8l4p96U/XD4fxFRByzIIavp/0FLI6vGU/klqsb0
 /AplshdL/9H1MqA8TdqSgSAZUSurqWZMP7JVDsv3obwUHJQFnI4bA31S9I4sXsscye
 LBXpVXModne6g==
From: Kalle Valo <kvalo@kernel.org>
To: Maxime Bizon <mbizon@freebox.fr>
Cc: ath10k@lists.infradead.org, linux-wireless <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath10k: fix misreported tx bandwidth for 160Mhz
References: <cd2735a40da7f4fcc5323e3fca3775e7b5402ece.camel@freebox.fr>
Date: Mon, 16 May 2022 19:11:53 +0300
In-Reply-To: <cd2735a40da7f4fcc5323e3fca3775e7b5402ece.camel@freebox.fr>
 (Maxime Bizon's message of "Mon, 16 May 2022 17:23:43 +0200")
Message-ID: <87o7zx4fue.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_091158_419924_6813FF1A 
X-CRM114-Status: UNSURE (   9.19  )
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

Maxime Bizon <mbizon@freebox.fr> writes:

> Because of this missing switch case, 160Mhz transmit was reported as
> 20Mhz, leading to wrong airtime calculation and AQL limiting max
> throughput.
>
> Signed-off-by: Maxime Bizon <mbizon@freebox.fr>

On what ath10k hardware and afirmware version did you test this? I can
add that to the commit log.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
