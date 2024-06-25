Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14EDC2BBCA
	for <ath10k@archiver.kernel.org>; Tue, 25 Jun 2024 15:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BivAvNhVtbmfJ49iI0EWdiBNlfZYeTH7nl5+DWK1/3A=; b=LGszX99iM9ObCGLdXHDySmsURQ
	6RGELdd9Qs9s+wgT6T85tgKwFSelDJEEVonvwB/5N6HvxRGTB3N1DIFipvACnvWt9U9pbDGAr3GpC
	Z2iwLIMfwuRaP1ltHns0FU9olmbg9T27+91LNWrHbG23G96AJ+IX8oEQ65bcC9KqqBcVbuPbr79VV
	p8NJL7bBl4bX83NAIu1pWHkCSC0oUo118IFeFXTqUoEufvuqtijnS4akPBaoZ3ikB/lFyoyoGrpMS
	0XD+1NFUX7VvK0/NHKSQ4SI6mI0wt+Wb2Tzcf2YbCRlzMqk0Ie6XIQFDx8u7t0KIck+MCvMG9gHbS
	FIsRECtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7jg-00000003Mlf-0x9F;
	Tue, 25 Jun 2024 15:05:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7h5-00000003Kpm-0JUj
	for ath10k@lists.infradead.org;
	Tue, 25 Jun 2024 15:02:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D5FF614AD;
	Tue, 25 Jun 2024 15:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6396C32782;
	Tue, 25 Jun 2024 15:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327770;
	bh=gQp1PmCHyGQ77qf5D9jrz9q7coboBiVr0Zb41/eD03w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IEJ42l8gT3X8doXsnqHqTK8SMiUZG9cxuttYRdr72Jg+ZELp5cJ52er5K3gzhNkj8
	 8PojVEtgqXtNAaymeCQVTYJMpl1/L4viulb3dfpLubcTAGqBiHLF++E3y9cMUO5mpA
	 TSapdKD+XvhNE2fNPvIkTHEuUEAg1UXUvN+Lqurxo/YIXrZpo2WSgOIInAVHXIyjYR
	 hcM9lCgRLgPSnyyF6sGmHmv2nd+6rWBztxRu7umRKPFik+wzPC4L7Q3kwqGaF10EKe
	 aEJAAf14l6TlWwuPd+X7Xpb3GzIQmuQsn6ExkmdL5O//RogMJGQ0QeBlIoDLbgWp4V
	 6vdeshDRSSMBQ==
Date: Tue, 25 Jun 2024 08:02:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Koen Vandeputte
 <koen.vandeputte@citymesh.com>, <ath10k@lists.infradead.org>,
 linux-wireless <linux-wireless@vger.kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, <netdev@vger.kernel.org>, Johannes Berg
 <johannes@sipsolutions.net>, Kees Cook <keescook@chromium.org>
Subject: Re: ieee80211.h virtual_map splat
Message-ID: <20240625080248.32c3e03d@kernel.org>
In-Reply-To: <87o77pik7w.fsf@kernel.org>
References: <CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com>
	<c470e4ff-3f70-40f6-844a-f9614286509f@quicinc.com>
	<87o77pik7w.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_080251_607799_25F2DABD 
X-CRM114-Status: GOOD (  12.70  )
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

On Tue, 25 Jun 2024 09:56:35 +0300 Kalle Valo wrote:
> > Adding netdev to the initial message in the thread.
> > https://lore.kernel.org/all/CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com/
> >
> > There was some discussion in the thread, with the observation that the splat 
> > is fixed by:
> > 2ae5c9248e06 ("wifi: mac80211: Use flexible array in struct ieee80211_tim_ie")
> >
> > Followed by discussion if this should be backported.
> >
> > Kees said that "netdev [...] maintainers have asked that contributors not 
> > include "Cc: stable" tags, as they want to evaluate for themselves whether 
> > patches should go to stable or not"  
> 
> BTW this rule doesn't apply to wireless subsystem. For wireless patches
> it's ok to "Cc: stable" in patches or anyone can send a request to
> stable maintainers to pick a patch.

It's an old rule. Quoting documentation:

  Stable tree
  ~~~~~~~~~~~
  
  While it used to be the case that netdev submissions were not supposed
  to carry explicit ``CC: stable@vger.kernel.org`` tags that is no longer
  the case today. Please follow the standard stable rules in
  :ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`,
  and make sure you include appropriate Fixes tags!
  
See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#stable-tree

