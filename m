Return-Path: <SRS0=w3s1=FV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639E7C4361B
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 06:50:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C90423603
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 06:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C90423603
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yg9ItleE/+aYkUmSZgPMIWOmnacOfGValE42WW0i2zM=; b=izTgH+IOMJIprDr1UIYHJfpwB
	bFyA++WltyNFeX+GAtMbvLBs8vKsTSS9H2W87sxivGv89ZnnJ4fnIGnMZ8joiLj6Glul/dvy3KPoO
	MmNnXR02ag9SE2rG29PL/S0dB1bnAlEW0qHVQXUvRHqiy8chjmZikpbXZsIq+CNGj00AVhHUF3NbW
	y0OdsBSPtl/d+0gHjwJ+rZarpA0AbaOeZaiJgNyBrdyCY0k5RDUZxjQSzsudwImbZ5e6UFNe+bMFV
	9EbQ1bsxXC4vGw3Doc6K0of/3IFFP2Pq+Lisy+fZBcU90m+HC0zsmiFmGdlaTX8L0vymkgpUNwFpm
	dZ2bQA65g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpn6d-0001qC-2f; Thu, 17 Dec 2020 06:49:43 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpn6Y-0001pd-I4
 for ath10k@lists.infradead.org; Thu, 17 Dec 2020 06:49:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608187780; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=5DvfUupqVLoh/0vLxxTriTZKRuTh4+K/pLTz7gLYYGw=;
 b=SvPCTyhEDuKbgNOgrQ/AJXtNRxQBqSYqJE2SGlYthmYfK6uht1yZMPQnzzjjnTh5saW08gO3
 b0rcJH1g8Onb9n0ABTHpv5cz6zvCESvMhd1HI3IrbdMvQ1+0MPKADvP0JXckaGWBIfq9zV9F
 kOklhSO0bBc6PRwn8WtoKyMQnNY=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5fdaff7393a3d2b1cd89913f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 06:49:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 09157C433ED; Thu, 17 Dec 2020 06:49:23 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9BD89C433C6;
 Thu, 17 Dec 2020 06:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9BD89C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix error handling in case of CE pipe init failure
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1607713210-18320-1-git-send-email-pillair@codeaurora.org>
References: <1607713210-18320-1-git-send-email-pillair@codeaurora.org>
To: Rakesh Pillai <pillair@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20201217064923.09157C433ED@smtp.codeaurora.org>
Date: Thu, 17 Dec 2020 06:49:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_014940_481012_8EB4AC7E 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: kuabhs@chromium.org, youghand@codeaurora.org, briannorris@chromium.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, dianders@chromium.org,
 Rakesh Pillai <pillair@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> wrote:

> Currently if the copy engine pipe init fails for snoc based
> chipsets, the rri is not freed.
> 
> Fix this error handling for copy engine pipe init
> failure.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> 
> Fixes: 4945af5b264f ("ath10k: enable SRRI/DRRI support on ddr for WCN3990")
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

31561e8557cd ath10k: Fix error handling in case of CE pipe init failure

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1607713210-18320-1-git-send-email-pillair@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
