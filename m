Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9ECBC433EF
	for <ath10k@archiver.kernel.org>; Wed, 22 Dec 2021 06:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiOpnhXu/hWwJM7mBCB2ThbYDNdYQXvEJ12WCX61c4s=; b=viI/pCNt+1xsuh
	HNmnf2MWP4TpaJN2YltsP022W0d5NAyuR+7VFuIPSOsQp3jMPS74XPacB8EazmdN83er6ExlMJAkh
	dTR0TyLz4++dHrnVFep/cberyIAK52SOwqspfrOsxPrPnzNf58A4TN2MhybNmOKoc+EkkxKfBIDDH
	gQgLskLrT17wwJlhlErCrRdzECx0RqEWPx0Mrgyut9hLsNRTkV8R3zU9Odt0IQN3I7U4vAZy1hpOJ
	1Hkj5KdTEv3o8msdXNWgbQwtlGRS1NxmcawR8pz+Khn9vN6LAinmZkqNm694CnjA4c3uf8mB8Z5Rz
	6ETDcVqTVGCz4kzDMysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzuhl-009IRV-3q; Wed, 22 Dec 2021 06:02:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzuhh-009IQE-Cu
 for ath10k@lists.infradead.org; Wed, 22 Dec 2021 06:02:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1C541B81A7A;
 Wed, 22 Dec 2021 06:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087CDC36AE8;
 Wed, 22 Dec 2021 06:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640152937;
 bh=qXyUNNLvS7M9znduJ26fMO1HSy/mFrpEP7RsPdj07tI=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=HCrqFJkbMjlDDzOhgktAVb6qXWZoFcpU/AZnj0Z3/IPuh9ZYhbbfETJ4LaQIx9+Nr
 3QXrrF/no6Vumzu+uZqEoqHfd+nSzElzxJDLx/pWQeIXqDitpNhtMdjOotl4Dxzsx7
 okrSWBIE0zFgfHxAqIJWFnZvwSqRXGKRxgdoSJk6VQryy4AyzJSBSHm9p09xOR167H
 5XCCDKh7W0P4GmtggDJwlHey4t2swarmDnxfK5MWDdpQ2A/i6ieWn9OqOBCCe4kT3M
 ltOSNERqRWeMrk/Pz+Mwm9K4RjFpv/yMPTtWpU8Tsz5XsZV16RXoSqrD3+ubBnH6Lw
 xR2AvySpy1c6Q==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: replace strlcpy with strscpy
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211221070931.725720-1-wangborong@cdjrlc.com>
References: <20211221070931.725720-1-wangborong@cdjrlc.com>
To: Jason Wang <wangborong@cdjrlc.com>
Cc: kuba@kernel.org, davem@davemloft.net, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jason Wang <wangborong@cdjrlc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164015293355.20356.17369576129448229832.kvalo@kernel.org>
Date: Wed, 22 Dec 2021 06:02:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_220221_613521_E21938D3 
X-CRM114-Status: GOOD (  10.02  )
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

Jason Wang <wangborong@cdjrlc.com> wrote:

> The strlcpy should not be used because it doesn't limit the source
> length. So that it will lead some potential bugs.
> 
> But the strscpy doesn't require reading memory from the src string
> beyond the specified "count" bytes, and since the return value is
> easier to error-check than strlcpy()'s. In addition, the implementation
> is robust to the string changing out from underneath it, unlike the
> current strlcpy() implementation.
> 
> Thus, replace strlcpy with strscpy.
> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9d364b828ae5 ath10k: replace strlcpy with strscpy

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211221070931.725720-1-wangborong@cdjrlc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
