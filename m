Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB94C27C4F
	for <ath10k@archiver.kernel.org>; Fri, 21 Jun 2024 19:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFTSNVDa4we8bJFrYHH/EK+wgipHGii9Y6Zfqg0V3C0=; b=j+ZcwpxBQE7TlJrZbr8/PFHOUi
	f79DwOSU8tJSuBLR3TB0TTdYSn3LetdocA6VIZWsaEGzcxdzXVEZEBrC1RUP3L1L9TT6hRrIzglh9
	VsPMhdZpXSBySbAHtpwMN/TGQk9y77qlTsx7jLSRVSd5oGMgLcjNiUMMvApdE7yWZqET+WvovH8Kf
	StFyJcV39RmAr3rvTFkzOK1U+Y3UrnoNUA9Oydrgu4CoA59bye/Q+wQIyqBN262oRyIwJqjJY5OP4
	tHUsZ7haCTwxGuWCGrd3KMU+4hy6loeD78NP9DJSVzyHr/aFUbdwdYYy6Slmv0FlxbVzeFl+5b5il
	i+Aw9HiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKkDJ-0000000AP01-48GL;
	Fri, 21 Jun 2024 19:46:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKkDH-0000000AOyZ-1Yhj
	for ath10k@lists.infradead.org;
	Fri, 21 Jun 2024 19:46:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C2A462F18;
	Fri, 21 Jun 2024 19:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB6AC2BBFC;
	Fri, 21 Jun 2024 19:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718999181;
	bh=C3SIMqwONzYK1bUW0NsLIvelgHUVmx8PUbQFb9azWgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hyAlmWdiwSlArMQwwj6AgWEljbMzqR1tszAeD7cfwBwAuc+fWbEXH7xU60Gzs1UyR
	 6K/Bd3JK5x9HnYWf+ohbbehb1lBkONGYBDDtIjSRLcmoUruD9lymRlYXDUckkYEFKo
	 2ymx4GKeiJT1TqyDfj26AmWmapnAlrP1mt/+OKvWIzELOELNaLpN5OL+HFooo0z7E0
	 XOo6PxK7lIv5oSmyYDzeL545k9+is43kXXbPuiSL6VZaOAThGnCCPuD9/9bxZs85sU
	 EuCd0CvNBxHbYerh9/y7DRJLzKjHrG1zrFbj/ixPmQ/PUIjbeMXFUnmGPn7cxSA7XR
	 CU3sdI+0yJyew==
Date: Fri, 21 Jun 2024 12:46:20 -0700
From: Kees Cook <kees@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Koen Vandeputte <koen.vandeputte@citymesh.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	ath10k@lists.infradead.org,
	linux-wireless <linux-wireless@vger.kernel.org>
Subject: Re: ieee80211.h virtual_map splat
Message-ID: <202406211241.3E23349@keescook>
References: <CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com>
 <efc8cdc0853a921ce4dad1a36b084608fe0b01a8.camel@sipsolutions.net>
 <CAPh3n834eg1_+gmh_LMTQnc95aLBWNVOANjZsMap=_szOY2nHQ@mail.gmail.com>
 <83fcb33e3fadb457466126255297899fbc4186f8.camel@sipsolutions.net>
 <CAPh3n80PF4NULjKJVVMEiGuuJZhLQszYSTCv+f6e9LfVJbKesw@mail.gmail.com>
 <d834ff59-f331-4eb4-91c6-e76eb48780d8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d834ff59-f331-4eb4-91c6-e76eb48780d8@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_124623_563868_B9281460 
X-CRM114-Status: GOOD (  15.51  )
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

On Fri, Jun 21, 2024 at 07:25:08AM -0700, Jeff Johnson wrote:
> On 6/21/2024 3:31 AM, Koen Vandeputte wrote:
> > On Fri, Jun 21, 2024 at 11:30 AM Johannes Berg
> > <johannes@sipsolutions.net> wrote:
> >>
> >>
> >>> will this one get backported also?
> >>
> >> Why? It's not even a bug.
> >>
> >> johannes
> > 
> > Because without this patch, it produces a splat on kernel 6.6 (which
> > is an LTS) at least ? :-)
> 
> @Kees, have you been backporting all your flexible array changes?

I haven't done anything explicit for them. This is especially true for
netdev where maintainers have asked that contributors not include "Cc:
stable" tags, as they want to evaluate for themselves whether patches
should go to stable or not.

> Or are you suggesting folks disable FORTIFY_SOURCE (is that the controlling
> config?)

I do not want people turning off FORTIFY_SOURCE. By design, this is
a warning only -- the memcpy() still works like it did before. The
goal was to catch any of these stragglers going forward, not to break
existing code. I expect that in a few more years it can be flipped to
warn-and-block for these kinds of detected memcpy()s, but for now there
should not be any behavioral changes seen besides the WARN appearing.

-Kees

-- 
Kees Cook

