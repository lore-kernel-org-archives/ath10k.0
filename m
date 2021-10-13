Return-Path: <SRS0=ohlR=PB=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D34C433EF
	for <ath10k@archiver.kernel.org>; Wed, 13 Oct 2021 06:12:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4EC260C4D
	for <ath10k@archiver.kernel.org>; Wed, 13 Oct 2021 06:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4EC260C4D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8i1dJEHmlz92pawmjdUrFJNI0NQtkBNpIMT1ohkkms=; b=ONgfGiZC6tX8Bk
	/XREVe+iZCF3ZWEPn3fi9Rzael8ssr8mssPofvjKuQROovW64AA+dD3smBCmF+RDmZKS0gddoZEbD
	ymyGlcfm5UA/dQwoGClOdaKkLkPit1suQ726HaNEeLDq39l6IOXk1AYBNfKm13YxHTbfojbXpLx3U
	T4lctcwnal0+TnPYjrocTTx0dQnWiq4UrVIfEqbkRk60pqDaNmSwbcrRX3rQrTTXuMtl5N78Zg1Yi
	GTXaT5fnFT+mShfMboVevH1Rt/yePCV0DKaJPQL+bbKkTFZufbGD0Ej7IM7poUeKDqli6LxtE9WTJ
	UIPk7URkoBxGWZzIPegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maXVF-00F6Nc-6w; Wed, 13 Oct 2021 06:12:37 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maX8P-00F1VW-7n
 for ath10k@lists.infradead.org; Wed, 13 Oct 2021 05:49:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634104139; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=V8zlMIoGO8Qmr2pOGAUAk9gFpxGsFFrsRVmNv+nGpbE=;
 b=n7N7TtPmu0vZ4etNdvX9fMMEZ6pj/5NVYsskX5oX20zOsnX8TH8fy6Xt6m5UkN/qQmpC0cKC
 8t7ue0OP8XzT6+4btd0vMqqFPxtKyV9MwXlkWf8B0M4fJltl2kw/ALCMMTjl6DNCb7yW8SzS
 MLJRSJoyS+1qBuFb11deHjV/Egg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6166734a446c6db0cb908e99 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Oct 2021 05:48:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1448DC4360C; Wed, 13 Oct 2021 05:48:58 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 92856C4338F;
 Wed, 13 Oct 2021 05:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 92856C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: fix max antenna gain unit
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190611172131.6064-1-sven@narfation.org>
References: <20190611172131.6064-1-sven@narfation.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Sven Eckelmann <seckelmann@datto.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163410413435.12797.8692375433554922203.kvalo@codeaurora.org>
Date: Wed, 13 Oct 2021 05:48:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_224901_430563_D184184D 
X-CRM114-Status: GOOD (  10.85  )
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

Sven Eckelmann <sven@narfation.org> wrote:

> Most of the txpower for the ath10k firmware is stored as twicepower (0.5 dB
> steps). This isn't the case for max_antenna_gain - which is still expected
> by the firmware as dB.
> 
> The firmware is converting it from dB to the internal (twicepower)
> representation when it calculates the limits of a channel. This can be seen
> in tpc_stats when configuring "12" as max_antenna_gain. Instead of the
> expected 12 (6 dB), the tpc_stats shows 24 (12 dB).
> 
> Tested on QCA9888 and IPQ4019 with firmware 10.4-3.5.3-00057.
> 
> Fixes: 02256930d9b8 ("ath10k: use proper tx power unit")
> Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

0a491167fe0c ath10k: fix max antenna gain unit

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20190611172131.6064-1-sven@narfation.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
