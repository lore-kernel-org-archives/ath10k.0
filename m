Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5591FC433EF
	for <ath10k@archiver.kernel.org>; Fri, 29 Apr 2022 19:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oqfzzw8lHVk80PRHV89uypQ5Smjb9g40kwNeuUk+9f8=; b=bGEkXUqC6VnVrn
	tMS8TNCh+96OMDMUBSq0FpXb2C6vUGMEOu1Ht7In8OyISOhf2JLELQCVTQDJCgQ6tGFIpdJIp7YcS
	IGp4G680E06PfzXvzpUVapQo6Pw03kocTSGYohC2UVcGktfmgS4VKqVD3AZgjilVAgwGBQkC/BMzm
	AfM61kmVjuxO8f3O+F4gBXm0FNtBSbufMQ3vnT6WXq2q+/ewl1jJ9MbitIs7sI4u/13qjpPOsbJQX
	M9bU5CXaoMUOJ6LEQTX+/IlP/sPawHcecbaCsFVD/W2fnAqQq5rk/udY077kFjOcL/sIlMT1BtByv
	3ebZQJge88fVk8vnBg+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkVwm-00CIbl-BD; Fri, 29 Apr 2022 19:06:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkVwh-00CIal-7r
 for ath10k@lists.infradead.org; Fri, 29 Apr 2022 19:06:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF15FB837A1
 for <ath10k@lists.infradead.org>; Fri, 29 Apr 2022 19:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FA1C385A4;
 Fri, 29 Apr 2022 19:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651259184;
 bh=50dpnfYzr5JGdkLtQS3FV/qztqB75jWajOlvJ+cr3EY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=mXsV7YmuCopz4vFtpkgKT+1juj31UCt+BAwtrWHmMsmaBA78PRMoF/AJBCFdTB7M3
 4/WjeiANWfvso8ujLq7uHOKAA6wIogvvcwmp5yWdK7gaQvMVsZUKfy+NAAxcFTCB/w
 0enRpwr/tmzv64FKPhDSNYvZHsNmksD+B6/wgVNTTZ3d3Dy1TDPzmDDDICM3WD/pQK
 DLRsiyD7cjyFyzHs7prhEGzZI5FW6mCxUXgUCiwvEErSsgZUXY/VlTXs2rhKIBXnsK
 R2qJtNlLAHkiTlhqH68jP4Qm8kGrPUQoDfA3lXFTHXopIJ7/mB6omHuQ+bUAFOZa/B
 p2TkQiyxEYBfw==
From: Kalle Valo <kvalo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org
Subject: Re: [PATCH wireless-next 2/3] wifi: ath10k: remove a copy of the
 NAPI_POLL_WEIGHT define
References: <20220429174643.196994-1-kuba@kernel.org>
 <20220429174643.196994-3-kuba@kernel.org>
Date: Fri, 29 Apr 2022 22:06:20 +0300
In-Reply-To: <20220429174643.196994-3-kuba@kernel.org> (Jakub Kicinski's
 message of "Fri, 29 Apr 2022 10:46:42 -0700")
Message-ID: <87v8urd80j.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_120627_467249_44C8EAB2 
X-CRM114-Status: GOOD (  12.24  )
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

Jakub Kicinski <kuba@kernel.org> writes:

> Defining local versions of NAPI_POLL_WEIGHT with the same
> values in the drivers just makes refactoring harder.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: kvalo@kernel.org
> CC: ath10k@lists.infradead.org
> CC: linux-wireless@vger.kernel.org
> ---
>  drivers/net/wireless/ath/ath10k/core.h | 3 ---
>  drivers/net/wireless/ath/ath10k/pci.c  | 2 +-
>  drivers/net/wireless/ath/ath10k/sdio.c | 2 +-
>  drivers/net/wireless/ath/ath10k/snoc.c | 2 +-
>  4 files changed, 3 insertions(+), 6 deletions(-)

This failed to build as recently usb.c got napi poll as well, I fixed it
in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=89fc2e14d3e50cad605104572228d3740df7ca77

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
