Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F50C2BBCA
	for <ath10k@archiver.kernel.org>; Tue, 25 Jun 2024 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z08Q+ITwk6z0OJeCtAIG4Lm+BOA7wQKDVnRRdeS2K+U=; b=YoqB87+q2bh8PZD1Ty67xNGihq
	J98XC9gAQnPPJaG3H8KqGWl4vM8IFqFEQM64kUaB+afXRlZ/0WWpR70DGIXpq983DWZsPic1RqB9S
	/jTS906+dxGYlRaHuBO8ZLKrSbU0CALHNIMOOErTGo8XIbtPW+xzg0OvOnIvbL+r50SnYbxNC11fv
	8T94VIljLxZgmVyKKI53UH/sh9iTBE/ZB/VQf+/QPxHm/azPFebWqSs+DyKaRq7FPmnx1zf6/NzJm
	Rhw9FYz7WdNv2dB1TJL9ha7xcoIRuFVN9Ce7ardXp4mxI5QlCneaKYi+01n8QBMerAiij2lxUAAZa
	TfckDFlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM82s-00000003W7w-0Mnc;
	Tue, 25 Jun 2024 15:25:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM82o-00000003W5I-3EV3
	for ath10k@lists.infradead.org;
	Tue, 25 Jun 2024 15:25:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 468EE611EE;
	Tue, 25 Jun 2024 15:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42CBC32781;
	Tue, 25 Jun 2024 15:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719329117;
	bh=8pXLi0+NE2elKsEGz3Exeg1kDvY+fHABVyxjsl7HrNI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Y0UWZ99e81f92pCKDy/ylcK54a2iCMmLSB3RltsaGQs72cjZYgVQ9wGF7SKhM1LRE
	 6+jSqJQsQQASg4sy82IGvB8FlpAKrBeHjVaS/mnnHY6wu0AegRToWx4WD07pqBbKS3
	 tXIT9L/oMTdRWeoJyGjg68VZ4vQ6NA4BL9ZDihNaXQUMliXQCVNpCVHgIkfFNCI60B
	 26eja9WqGWkiQH67YTIAQwFvYfiKKfoiW4Xe6wafdM7zH1RBpayRmZ7jMI4TU6UT5y
	 P9yVqxDa8mBURa5b8OVPxiuyYw5uuGQtjWx23p4czraCfdxdiPSKfMHsH5arFGaywM
	 blOFXGQpi2lzw==
From: Kalle Valo <kvalo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  Koen Vandeputte
 <koen.vandeputte@citymesh.com>,  <ath10k@lists.infradead.org>,
  linux-wireless <linux-wireless@vger.kernel.org>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Paolo Abeni
 <pabeni@redhat.com>,  <netdev@vger.kernel.org>,  Johannes Berg
 <johannes@sipsolutions.net>,  Kees Cook <keescook@chromium.org>
Subject: Re: ieee80211.h virtual_map splat
References: <CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com>
	<c470e4ff-3f70-40f6-844a-f9614286509f@quicinc.com>
	<87o77pik7w.fsf@kernel.org> <20240625080248.32c3e03d@kernel.org>
Date: Tue, 25 Jun 2024 18:25:12 +0300
In-Reply-To: <20240625080248.32c3e03d@kernel.org> (Jakub Kicinski's message of
	"Tue, 25 Jun 2024 08:02:48 -0700")
Message-ID: <87jzidhwo7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_082518_907545_9CCE36A9 
X-CRM114-Status: GOOD (  15.75  )
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

Jakub Kicinski <kuba@kernel.org> writes:

> On Tue, 25 Jun 2024 09:56:35 +0300 Kalle Valo wrote:
>> > Adding netdev to the initial message in the thread.
>> > https://lore.kernel.org/all/CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com/
>> >
>> > There was some discussion in the thread, with the observation that the splat 
>> > is fixed by:
>> > 2ae5c9248e06 ("wifi: mac80211: Use flexible array in struct ieee80211_tim_ie")
>> >
>> > Followed by discussion if this should be backported.
>> >
>> > Kees said that "netdev [...] maintainers have asked that contributors not 
>> > include "Cc: stable" tags, as they want to evaluate for themselves whether 
>> > patches should go to stable or not"  
>> 
>> BTW this rule doesn't apply to wireless subsystem. For wireless patches
>> it's ok to "Cc: stable" in patches or anyone can send a request to
>> stable maintainers to pick a patch.
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

Oh, I haven't noticed the change. Thanks for correcting.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

