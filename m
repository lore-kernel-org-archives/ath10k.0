Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E592DC27C4F
	for <ath10k@archiver.kernel.org>; Wed, 26 Jun 2024 18:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1IcLAaFmzUsqpmOY/nqAogM0L95lh7reg0VX5Fru50=; b=hdU1OLVnJTecvIr1rwyXMdht7G
	iXR4nykPSBrfbkRsNLRn7P5rkNzvpwplDk6pAoa/NKuhmCjqqSMDy9blUC2fyNTpiWhQm7ycLH9H+
	AgkfmM0XjXghVvh7lUT75AA1Uu9/Een4q2zBdx/+rnLKfU7tA3TXfPOZ4hWdAQp7qKDWFhOUSVEfl
	OlD3dL+bArOWF+0WBfZTwOmHZOopRpYKpJL1eBErEIUzUZ5Nq4F+l8SVragY6yUaOUQqgq7e348C3
	uEw9ngVRm+LbqcyEGNzhyBH4BQVM0sa0k4GkeGf+6kosKezUtbfusHqhThxUknnU4Frj3d9YZenE8
	EsARqMRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMX7b-00000007sCb-23nk;
	Wed, 26 Jun 2024 18:11:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMX7T-00000007s8Y-0F73
	for ath10k@lists.infradead.org;
	Wed, 26 Jun 2024 18:11:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9809CCE2C29;
	Wed, 26 Jun 2024 18:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F81C116B1;
	Wed, 26 Jun 2024 18:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719425503;
	bh=V7B++SJTszDbRNn3G1xfashn5MADZfh7Xs25Pyj+9SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3hWBRzu57EVn5yNfPCrNA+FB/8psQr9gsgMuEAWq4Dp7czjE4E4kDcuRvBTjajDE
	 XC12iG3k0bdxF47I24Yn9AoBm5WqwyPWn5dTKCSqPWymCGZ+ASL6ltaHwNGHCPfpcC
	 URe7qvfCKRAInrvOPM7glooh4y1gMFkC6c47ICcrXHUyVjB3n4/byDMM1zos8WhhJm
	 MOKzVJYwABlQejZZFBNkJ4D6u/pVCh6Xa671IXIxQNe494ov3Aoc0cqmoNA8wjQat0
	 +vkcrpSVKpYbY84/IcLP54W9JUU1fIwSSguofMOsl3riOAQ5lKEIXxx8hbpWOJsV4c
	 AIzq7MOur2QfA==
Date: Wed, 26 Jun 2024 11:11:43 -0700
From: Kees Cook <kees@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
	Koen Vandeputte <koen.vandeputte@citymesh.com>,
	ath10k@lists.infradead.org,
	linux-wireless <linux-wireless@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Subject: Re: ieee80211.h virtual_map splat
Message-ID: <202406261111.2D3237A731@keescook>
References: <CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com>
 <c470e4ff-3f70-40f6-844a-f9614286509f@quicinc.com>
 <87o77pik7w.fsf@kernel.org>
 <20240625080248.32c3e03d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625080248.32c3e03d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_111147_383380_4E6FB962 
X-CRM114-Status: GOOD (  16.67  )
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

On Tue, Jun 25, 2024 at 08:02:48AM -0700, Jakub Kicinski wrote:
> On Tue, 25 Jun 2024 09:56:35 +0300 Kalle Valo wrote:
> > > Adding netdev to the initial message in the thread.
> > > https://lore.kernel.org/all/CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com/
> > >
> > > There was some discussion in the thread, with the observation that the splat 
> > > is fixed by:
> > > 2ae5c9248e06 ("wifi: mac80211: Use flexible array in struct ieee80211_tim_ie")
> > >
> > > Followed by discussion if this should be backported.
> > >
> > > Kees said that "netdev [...] maintainers have asked that contributors not 
> > > include "Cc: stable" tags, as they want to evaluate for themselves whether 
> > > patches should go to stable or not"  
> > 
> > BTW this rule doesn't apply to wireless subsystem. For wireless patches
> > it's ok to "Cc: stable" in patches or anyone can send a request to
> > stable maintainers to pick a patch.
> 
> It's an old rule. Quoting documentation:
> 
>   Stable tree
>   ~~~~~~~~~~~
>   
>   While it used to be the case that netdev submissions were not supposed
>   to carry explicit ``CC: stable@vger.kernel.org`` tags that is no longer
>   the case today. Please follow the standard stable rules in
>   :ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`,
>   and make sure you include appropriate Fixes tags!
>   
> See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#stable-tree

Ah-ha! Thanks. I will fix my brain. :)

-- 
Kees Cook

