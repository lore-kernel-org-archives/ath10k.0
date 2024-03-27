Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD731C54E67
	for <ath10k@archiver.kernel.org>; Wed, 27 Mar 2024 16:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4YJvO6MabuKaosr/db7Mxpxk1nahKdSpT7lsmsSoSE=; b=IAXKEHAhG2Zc9+8mGwuaP7HSXo
	+yUZF1CLfCZBcHFQoK3mPcC/LF20/bSvzd4UG0g3acbBziuY6PcJEBRwP27eKwmNtf3xyCyh0jt+M
	qJTBv4q4PTeD5Nyzd/B2ANbSoanUBw8Z6nxSmvKdNjAUekZxqljrJBij00xoZAQmaIxR5mN3/Gd56
	G81G5HFdOS2msqrL+/rgmUEruzn56owW1ORgodK1qmEcjKP8Nxl1sRkd39cDF6UJJoHWnZ3t9Kdxk
	RNYy4jRFlgHj2+ZjwOsuVQbba/Z+xFAaR1k1wu/CVsF3/8WYTgx6rryRT9h/phfKZkj52CcTuF5Li
	9HF+gUXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVxj-0000000A2kg-1D2Q;
	Wed, 27 Mar 2024 16:17:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVxg-0000000A2i3-06si
	for ath10k@lists.infradead.org;
	Wed, 27 Mar 2024 16:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 50994CE2565;
	Wed, 27 Mar 2024 16:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B22C433C7;
	Wed, 27 Mar 2024 16:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711556229;
	bh=f61So1Ws0SkXaOlt+8mMWwfTLUxvYSQ7nKISq+0qW/0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BwYmau2cQyr+8vTxiCxY9LvjzuGCkA/QJKuycvxKZt0fc1iTkZiFx/wTI86Ci8ZZ/
	 rU3wcvTLPgZklkueylDcFpGULYZ+6yg7PKMZSDTAKgMF/cOUe79kf0jVTZY5ljN0Ua
	 f8pJ/EfUFN2sRyre4dfbeGOr4RjhTLDPKqHK6xoDLGn6vMKcdQquFjkBmvyi5A8jtK
	 UlAW0nANLW6z/eMsESsMEhQy3X9MEcOJ0uxsexTe+6cDC227KsX0uk/KTeG31dLCR+
	 5Cqeke57J2SD4BQnLa+Lo3p0rARIpKgRpCzDC/rtQWDcf9QvXo6Sz56XeKcvLl798s
	 jCb/01fXIEwmw==
Date: Wed, 27 Mar 2024 09:17:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Breno Leitao <leitao@debian.org>, Kalle Valo <kvalo@kernel.org>, Jeff
 Johnson <jjohnson@kernel.org>, <keescook@chromium.org>, "open
 list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, "open
 list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ath10k: allocate dummy net_device dynamically
Message-ID: <20240327091708.553f2251@kernel.org>
In-Reply-To: <00b1703a-47d7-4dc1-a3cd-f07f1a24db92@quicinc.com>
References: <20240319104754.2535294-1-leitao@debian.org>
	<9fcdb857-da62-4832-ae11-043fe993e4ad@quicinc.com>
	<20240321072821.59f56757@kernel.org>
	<5039256c-03eb-4cda-8d11-49e4561cf1ef@quicinc.com>
	<20240321151744.246ce2d0@kernel.org>
	<Zf2ceu2O47lLbKU3@gmail.com>
	<20240322082336.49f110cc@kernel.org>
	<ZgQvTTnMoBn2oG1K@gmail.com>
	<20240327074516.624b7ecf@kernel.org>
	<00b1703a-47d7-4dc1-a3cd-f07f1a24db92@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_091712_310098_050A6215 
X-CRM114-Status: GOOD (  10.52  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Wed, 27 Mar 2024 08:42:55 -0700 Jeff Johnson wrote:
> On 3/27/2024 7:45 AM, Jakub Kicinski wrote:
> > On Wed, 27 Mar 2024 07:38:05 -0700 Breno Leitao wrote:  
> >>   -void init_dummy_netdev(struct net_device *dev)
> >>   +void init_dummy_netdev_core(struct net_device *dev)  
> > 
> > Can init_dummy_netdev_core() be a static function (and no export)?
> > alloc_netdev_dummy() is probably going to be the only user.
> > 
> > I'd also lean towards squashing the two commits into one.  
> 
> And once all of the conversions are complete, won't init_dummy_netdev() no
> longer be used and can be removed?

That's right, it should be removed. But it may take another release
cycle until we can do that, depending on how quickly the patches
propagate :(

