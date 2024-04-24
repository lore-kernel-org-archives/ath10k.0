Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09553C4345F
	for <ath10k@archiver.kernel.org>; Wed, 24 Apr 2024 15:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89bC8gUDeeHi+ICGj+q5ERAF7uAc0qGNQ/4L1l4ZGtw=; b=W6nTEL8mBj6EHdm1rCm0PNlkF8
	cxdGpqs2AXMfdIOGzRbok0G0jgr7DmDz3OK3i5yzgyhz0xuWfu6to61+SaukizzvIx05oZvtnpEKA
	cGw4eGpDy5l4a8uNW4vOHosRntF3WdAUWSzSE7csMDj89/U2xctnmzPw8h6815r6T2djnnCyPoLr2
	LPYZv1179A/9VrxDv70Sp5WxazB1JzgJ/alznmgA6vO7blK5g9NzaDDMR+myhXh+UD2aS/S6ftUAW
	COh3uEQMLDtVqzrpYTXXmijrcdGMi69fAOj4/ZujSh5Zh5j+HmNpNIvOw/2M0ZucIwtteXvKL/jP/
	sX280Xdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzejW-00000004m1j-1TTV;
	Wed, 24 Apr 2024 15:40:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzejT-00000004lzd-0uXF
	for ath10k@lists.infradead.org;
	Wed, 24 Apr 2024 15:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 732F0CE1759;
	Wed, 24 Apr 2024 15:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96481C113CD;
	Wed, 24 Apr 2024 15:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713973224;
	bh=AC95m6JL1F7JZG8sItYB3WOCvHcTlGuxSvUXzc4cQXo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=AXzZwUfSlS63aY5NOuVanxUFc/7T2ibF20bWJKX5r7af+OvugTESTc8663kvPxhQv
	 qyX2aUQXJUbWwyxmKga4BZ6Is04QHw9kUbxIThssBEtwu1ts2ZaNFJztqwnmh/zhiD
	 G+s0mBzyM1uFIwFqd6FrXMjFWZa6ELu8hIUPi9gpx2iHulSbOp/jd2HA4kPlrqxnVB
	 NXKEIn3g7LRh3oh89GFmbZ4LXf/HYT9A20nwKidgZ2JjiIs4ENj9uJGgTHdaah57le
	 mW12s6BkIw8IYPiUXUoVDGI+V9LnICatyTiFSG/+g1SnQQMVMSC8MZl+cmjYHtziej
	 5DmIXM0WF1dRg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH wireless v2] wifi: ath10k: Fix an error code problem in
 ath10k_dbg_sta_write_peer_debug_trigger()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240422034243.938962-1-suhui@nfschina.com>
References: <20240422034243.938962-1-suhui@nfschina.com>
To: Su Hui <suhui@nfschina.com>
Cc: quic_jjohnson@quicinc.com, jjohnson@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 Su Hui <suhui@nfschina.com>, c_mkenna@qti.qualcomm.com,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171397321994.2567832.9996590005061868676.kvalo@kernel.org>
Date: Wed, 24 Apr 2024 15:40:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_084027_519521_214B4F29 
X-CRM114-Status: UNSURE (   5.82  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Su Hui <suhui@nfschina.com> wrote:

> Clang Static Checker (scan-build) warns:
> 
> drivers/net/wireless/ath/ath10k/debugfs_sta.c:line 429, column 3
> Value stored to 'ret' is never read.
> 
> Return 'ret' rather than 'count' when 'ret' stores an error code.
> 
> Fixes: ee8b08a1be82 ("ath10k: add debugfs support to get per peer tids log via tracing")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

c511a9c12674 wifi: ath10k: Fix an error code problem in ath10k_dbg_sta_write_peer_debug_trigger()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240422034243.938962-1-suhui@nfschina.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


