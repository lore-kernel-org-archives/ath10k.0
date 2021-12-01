Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDDBC433F5
	for <ath10k@archiver.kernel.org>; Wed,  1 Dec 2021 09:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ITc8y7sNJAuHTWWPyCNRaf0Gs2XFKXyRDPiB+/L6O68=; b=d5yPoT3IrBudWW
	LrfuqFYe+5qWVThkG8f5DyiiFOZnbEq76V4AtfPZuXubyEIV7nSmR0Wg8ZkYj4ivn/JMx+4cersUB
	DaPB9vWSirXghNTwb7QQxQF1IxHBpaYbs5WLvHpPO6z7n/1V3D0NOpm/hFXA72gKodjK/vPlc4YfG
	l7ysVOHtIkd51vYPiwH65MDlADJ31GhPt1fR2NDPRQFHOGyrdC/MiB4GVk/cDzxndNgmnWIpg+wn0
	Y8gHXiBCSQk/YAAAImnW5u5YPL0lIUI+bg/au9b5TYaq2C7TVwXptEOqoRvx6lTqOw+ux0fGca6z5
	w8Utb6Y0RZs7yEtRjkKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msLZ6-007tn9-48; Wed, 01 Dec 2021 09:06:12 +0000
Received: from mail.onlinetradesystem.pl ([195.231.78.62])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msLYz-007tlT-QO
 for ath10k@lists.infradead.org; Wed, 01 Dec 2021 09:06:10 +0000
Received: by mail.onlinetradesystem.pl (Postfix, from userid 1001)
 id 05D5BA3FEF; Wed,  1 Dec 2021 09:05:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onlinetradesystem.pl;
 s=mail; t=1638349559;
 bh=KQ5TJWiFNBM9Qmbx1DsKwYRr7Gl2XvCqTDyWFFvQ/VU=;
 h=Date:From:To:Subject:From;
 b=Xg5kzFqvhAM9y44e3+U6nVuuo0CdAP9G1IO/12zrOd/jgGRyEsFEtQKqaLP8eVaXY
 DaVvKK90dlHr0uV0ePN6L6Vf9Dw3ieYa9Sp7lrhK0FZqpY6lqLLRr8pMKUXtXJ0uzN
 Jyyx9xoT6N+ilGq5EpQ7aoZ4V144fBPC93Gx8tEZD6SdV6UccUEjvQg/YpDl6nj4sy
 LId6Y6Yf3KGoSZqdCr05pGU+fx6oSLud2eS+C8R6DYmUfPM6AIb8Daq9cR8mLLecXI
 sA1fOndEwjVjyh1wFaX4ryk3SFeDvlLIrA6FFoTDA4ELdmv9RwBrZqo68Nc9cVgivA
 7m9ksrm7TqZ8Q==
Received: by mail.onlinetradesystem.pl for <ath10k@lists.infradead.org>;
 Wed,  1 Dec 2021 09:05:51 GMT
Message-ID: <20211201074500-0.1.55.kmei.0.h6fidhfefg@onlinetradesystem.pl>
Date: Wed,  1 Dec 2021 09:05:51 GMT
From: =?UTF-8?Q?"Dariusz_M=C4=85czka"?= <dariusz.maczka@onlinetradesystem.pl>
To: <ath10k@lists.infradead.org>
Subject: Przekierowanie ruchu na stronie
X-Mailer: mail.onlinetradesystem.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_010606_085806_AF1D4242 
X-CRM114-Status: UNSURE (   1.47  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKamFrbyBzcGVjamFsaXN0YSBvZCBwb3p5Y2pvbm93YW5pYSBzdHJvbiBp
bnRlcm5ldG93eWNoIHcgd3lzenVraXdhcmthY2gsIHBvbXnFm2xhxYJlbSBvIHJvendpxIV6YW5p
YWNoLCBrdMOzcmUgcG9tb2fEhSBQYcWEc3R3dSB6YWrEhcSHIGN6b8WCb3dlIG1pZWpzY2UgdyBH
b29nbGUuCgpQcm9zesSZIG8ga29udGFrdCwgamXFm2xpIHPEhSBQYcWEc3R3byB6YWludGVyZXNv
d2FuaSB1bW9jbmllbmllbSBwb3p5Y2ppIHN3b2plaiBmaXJteSB3IEludGVybmVjaWUuCgoKUG96
ZHJhd2lhbSwKRGFyaXVzeiBNxIVjemthCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==
