Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2E9C4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 13:28:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BD7260F4C
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 13:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3BD7260F4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0S48mxs3tld3nFCJQPUbQJdLJnmIYHP4bEtz1BVexi8=; b=o5Sr5mRvTweGG9
	wQXKQfwErtyFSeGrVmTzhHF/SK+8GLQIkNfGRHXzpP4HK4ZUcPtDLTWY9he429DEMSsJ7LvWIpLRk
	wVWsxgr0CTPEW1U8PJllyohOmi4rukmPJZMSmdVuBXIj6SyWbgcwWG3qCfmrtIzxIUSb3FG4W0H10
	mkWhzo4htEQs8Az7W7d5KZWJ6kOa6xcAbaL1IhzYtxaf5ubfFaUElspYmHhY5yi0eS0iR697shqsc
	NSQ14AhIRe6ytAvN0v6ybVa70yUlt5tOwUE5TlCh/jtpjCJ5u+XXM1aVrvjkVSMZhSwcLf5bwxUKx
	dGSIvSGi5w6Z686bLGxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGLc5-005gwB-Kl; Wed, 18 Aug 2021 13:28:13 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGLc2-005gv6-68
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 13:28:11 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id A27EE68AFE; Wed, 18 Aug 2021 15:28:01 +0200 (CEST)
Date: Wed, 18 Aug 2021 15:28:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Kalle Valo <kvalo@codeaurora.org>,
 ath10k@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Bough Chen <haibo.chen@nxp.com>, linux-mmc <linux-mmc@vger.kernel.org>
Subject: Re: imx7: dev->coherent_dma_mask NULL warning
Message-ID: <20210818132800.GA6269@lst.de>
References: <CAOMZO5DEAMMKHwDkXxqWxg6uj_GQjBUQ5jV+4AzxAr2DCrgTVg@mail.gmail.com>
 <20210818051128.GA8550@lst.de>
 <CAOMZO5APotsBKPkN6tFDNnK0C7w7pzJ8zTWKUx6P=Rhd9_81mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5APotsBKPkN6tFDNnK0C7w7pzJ8zTWKUx6P=Rhd9_81mQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_062810_420375_73BFBEDC 
X-CRM114-Status: GOOD (  11.64  )
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

On Wed, Aug 18, 2021 at 06:31:19AM -0300, Fabio Estevam wrote:
> Correct, on i.MX7 the ath10k Wifi chip connects via SDIO.
> 
> Is there a way to avoid the WARN_ON_ONCE(!dev->coherent_dma_mask)
> to happen in this case?

The way to avoid it is by stoppind to use dma_alloc_attrs/coherent
on a device that is not DMA capable.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
