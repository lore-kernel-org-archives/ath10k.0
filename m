Return-Path: <SRS0=fUhW=HG=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1034FC433DB
	for <ath10k@archiver.kernel.org>; Thu,  4 Feb 2021 07:40:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ED8764F48
	for <ath10k@archiver.kernel.org>; Thu,  4 Feb 2021 07:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ED8764F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rQxfTbvsOFeJ5aoqPcHQQ3bnaqhtikBen/3fqf/D0Po=; b=LuLCcvxCh3JQrXegBBgiSw3Mg
	7aiddslnHDr2WxNEq0NgYWCsjuhKMHQ/suMoW0X/UkCb4bMn0+e3JCrqFqPcBIoCWkPBR1RUvX1Pg
	Zh+GKHGbQ22cW8SDZAHqaCDUrr7vRGeiX66lHRGMfkc1veexqf+Y4BX2APms28sjpVGLNkuolNoBI
	3hX7cNmgsr52xcdKe9h/lnGfui5XyPoMv6SklwPHGxmqBoDnobv8WnzBCsF5gIjBsfDx0Pm/TAY8C
	UHVNRmpIxksIh76hCuwdg7BoTFVrDVt1iC41p5otwZ5RKNe3Y+t2r0GTPncL/RmomPQI+0D2VJyqe
	JetIMsUIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7ZEK-0007W0-2P; Thu, 04 Feb 2021 07:39:08 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7ZEH-0007VD-1V
 for ath10k@lists.infradead.org; Thu, 04 Feb 2021 07:39:06 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612424345; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=PNaFuQrq1FOPPvy1zsUBLo97crEnYUTCs9GUaPLmKcw=;
 b=RnKmk6FophfFgWv2GxmSGt4IUyuePsi0ONg0w+Mjkm5iCejvx9Taocefrug6gkeOmitt+J4O
 lK1gSagXXs1wuzZOyJsBPmbF3PTLygtM+/iao3kJX0auOb2SKmJ3dYq25C0C7tAMpGvgu4w9
 Ynak8vn7quMxA0K8ldYmHO+ns6k=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 601ba49059782fb516c9905e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Feb 2021 07:38:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BF9F1C43462; Thu,  4 Feb 2021 07:38:55 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 53D36C433C6;
 Thu,  4 Feb 2021 07:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 53D36C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: remove h from printk format specifier
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210127222344.2445641-1-trix@redhat.com>
References: <20210127222344.2445641-1-trix@redhat.com>
To: trix@redhat.com
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210204073855.BF9F1C43462@smtp.codeaurora.org>
Date: Thu,  4 Feb 2021 07:38:55 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_023905_465780_FCF9F936 
X-CRM114-Status: UNSURE (   9.50  )
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 Tom Rix <trix@redhat.com>, kuba@kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

trix@redhat.com wrote:

> This change fixes the checkpatch warning described in this commit
> commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use of
>   unnecessary %h[xudi] and %hh[xudi]")
> 
> Standard integer promotion is already done and %hx and %hhx is useless
> so do not encourage the use of %hh[xudi] or %h[xudi].
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

779750bb153d ath10k: remove h from printk format specifier

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210127222344.2445641-1-trix@redhat.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
