Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44688C433EF
	for <ath10k@archiver.kernel.org>; Mon, 16 May 2022 16:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7fISg3NICEfgCizTjBUDjF/8NZgEcRyz8HArPfwPsQ=; b=hg8oN9aVQgaAVc
	FO2x3zLLbYPMtvTlUxd1a757eRkFB9iQ422FyRYFS7eXwgEwQzXpowOEsgKfetTQR8JUdy8QLvYyi
	D2ufQ+aqTBFJkPFlBVUyiWmcBWEeGlXxdTmAaRu22kCirP7LICvRODMY/gxo7ItzVlUvBmFO4UncN
	h+gkJ9LH76O5zQanqO+3Hj4Qxwjpi8DZrvv3KnseEAYnsCM7t1+8AWZfJ0haKXpMgckQosfY/fGt9
	xeHDH4531RUvfAd/iUNJv33hImqSOHq1QeaTv6kQ8lV1/uvLgMy52SbUyMtdw5SDCE5UAlwlzRycL
	Rfqo1Zb7wOtDQXTesadg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdm9-0095cF-1S; Mon, 16 May 2022 16:40:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdhS-00934E-Bb
 for ath10k@lists.infradead.org; Mon, 16 May 2022 16:36:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E6D15B81258;
 Mon, 16 May 2022 16:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23A0C385AA;
 Mon, 16 May 2022 16:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652718959;
 bh=4Gr2UMaY2vre3+l0Z/vZmHdEqnbxdBbORKHtVrhxuf4=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=pALU45M6RSdK7jSjZMMdMmT87g+XckxPnvwriAOxW2RocPj0T7rqueRaOH5CMTSX4
 0bVD4qTCPAO8oWZ5hN9HtxuBPE/fEVj4z+Ty9rYC2aDj6yOLkyrbYLRbdciFCvB5qs
 4p8xu7r+OJ2OCG21fOiKl6l8XWbB6LFkYg5hE5cMnHkwVH/EiAQnzg6RNZcP88leDC
 +Sxup/j7d/MO+CtBgjG5j/dAXnTSpCyKAojtm3b/N1Ch3Z9e4HUvTtPF87rUROTVDv
 BMEL2wraQbVhgeCJ5qzsI5v4/p9O46vML6zIaWPs3MkbfbPgh0xMmo5btb3JVPOCYt
 3zdhA6/A1MBNA==
From: Kalle Valo <kvalo@kernel.org>
To: Maxime Bizon <mbizon@freebox.fr>
Cc: ath10k@lists.infradead.org, linux-wireless <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath10k: fix misreported tx bandwidth for 160Mhz
References: <cd2735a40da7f4fcc5323e3fca3775e7b5402ece.camel@freebox.fr>
 <87o7zx4fue.fsf@kernel.org>
 <c4bf5262bc250afd9c9e52248f1b576a7882c8d4.camel@freebox.fr>
Date: Mon, 16 May 2022 19:35:54 +0300
In-Reply-To: <c4bf5262bc250afd9c9e52248f1b576a7882c8d4.camel@freebox.fr>
 (Maxime Bizon's message of "Mon, 16 May 2022 18:23:25 +0200")
Message-ID: <87fsl94eqd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_093602_579578_CC94B175 
X-CRM114-Status: GOOD (  10.98  )
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

> On Mon, 2022-05-16 at 19:11 +0300, Kalle Valo wrote:
>
>> On what ath10k hardware and afirmware version did you test this? I
>> can add that to the commit log.
>> 
>
> QCA9984 
> 10.4-3.10-00047

Thanks, I added that in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
