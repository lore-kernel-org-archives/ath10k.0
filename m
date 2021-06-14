Return-Path: <SRS0=VnLu=LI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0517DC2B9F4
	for <ath10k@archiver.kernel.org>; Mon, 14 Jun 2021 16:13:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C66B16023E
	for <ath10k@archiver.kernel.org>; Mon, 14 Jun 2021 16:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C66B16023E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTcAqd2YUVR4SZ6fvQOK929nuiwGNRaVg8MpxVe9nyg=; b=yU8lAmtyVtQMvC
	pJy+dYs+I349KjdHqBHrtlP0zvY/ccsbA0zNYV5vamnnSXXLzdi/qwIiSpWC9WvF1djQ2gH+lm9kg
	5D3M/4KvoNeEOWXadNPyJrLY+4KeUcfrBJ5ERK7fc69AVMtdykB4MotA9aRb8uEPCiemSrLMD1xMf
	dSUbmeNf5GuhQmYIuvfkYDw+Rvn7ifJRQg4BFvU0Fycg+1e3ExkLAM8Oy/VUo4WpYXNo2AR7wDNpS
	bBloqhn21YvSz+HYMjguQixvTev3lsth+O+JUsUpM/XkjfampYY6rq4EEaP+708FlZh0ivQ6l+msf
	xJNRtq7IrjvjDeVC0pQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lspBU-00F1NX-4m; Mon, 14 Jun 2021 16:11:32 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsoi4-00Eok0-BM
 for ath10k@lists.infradead.org; Mon, 14 Jun 2021 15:41:15 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623685273; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=1VUK17VDEqlhzzGGrjKr05lLrqM02n+e4Lw+khFBvkc=;
 b=POql3vvrYYPP4uefJrUA5q6SN1bBBVmtrtTjzLqrsSk07794X+HP3R0wiRmQwV4+QSRyZpsl
 F6IuRCPqlsv5rV11zytUW8BnCCBdGNLHrIvCFAOLpHENuKWoL/U3MzMtQArN+IdTTjnBd+n0
 WBtiXL1H/nGtCBPZIVKDM/0HJdQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60c7788151f29e6baedefa72 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Jun 2021 15:40:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 07A57C43217; Mon, 14 Jun 2021 15:40:49 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E5CBC4338A;
 Mon, 14 Jun 2021 15:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5E5CBC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix an error code in ath10k_add_interface()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1621939577-62218-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1621939577-62218-1-git-send-email-yang.lee@linux.alibaba.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: davem@davemloft.net, kuba@kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210614154049.07A57C43217@smtp.codeaurora.org>
Date: Mon, 14 Jun 2021 15:40:49 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_084113_705917_47E9471E 
X-CRM114-Status: GOOD (  10.62  )
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

Yang Li <yang.lee@linux.alibaba.com> wrote:

> When the code execute this if statement, the value of ret is 0.
> However, we can see from the ath10k_warn() log that the value of
> ret should be -EINVAL.
> 
> Clean up smatch warning:
> 
> drivers/net/wireless/ath/ath10k/mac.c:5596 ath10k_add_interface() warn:
> missing error code 'ret'
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Fixes: 'commit ccec9038c721 ("ath10k: enable raw encap mode and software
> crypto engine")'
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Fixes tag is wrong, it should be:

Fixes: ccec9038c721 ("ath10k: enable raw encap mode and software crypto engine")

I fixed this in the pending branch, no need to resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1621939577-62218-1-git-send-email-yang.lee@linux.alibaba.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
