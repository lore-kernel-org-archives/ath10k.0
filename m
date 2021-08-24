Return-Path: <SRS0=2rbV=NP=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBDBC4338F
	for <ath10k@archiver.kernel.org>; Tue, 24 Aug 2021 11:48:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEE8A610E9
	for <ath10k@archiver.kernel.org>; Tue, 24 Aug 2021 11:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEE8A610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bda.space
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mcvgk7mceMdQQVPW4Lq908nagOl2WjRnhGmQiPTq5vg=; b=2+ABexO8RAXhM4
	rh+tEApGFc6CRKv4MaS2O0ZEnPSkUyAASrmSjGvPp6G/4jkeL8PmfgK61/WTXoQoeNrEr8HdAGzG+
	BcMmSjoO66ZEZzwbP30BxFhoZqHsVpAQQYyz9PxdHALvTXvx4bmg2OTbEmkpkJwi4mWaaIkgka/Am
	BVvQEK5M4FSYlXDZSshaLlLrvpmato54Quv5kICjw7S76+NwU/rDWBNLFrLNeYRgEdEWqaalaLRrd
	Vqau77bHVCQ9w7OYnsuWApjzrPOEqtKl/JEo7TP5lTdE2ErSNsi0lBPrQQlHwt1Mn/bsj7LFz3dvX
	HYsu1gNr7TV67VBBopQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIUuq-002qQO-Ah; Tue, 24 Aug 2021 11:48:28 +0000
Received: from bda.space ([207.192.72.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIUuk-002qPX-TJ
 for ath10k@lists.infradead.org; Tue, 24 Aug 2021 11:48:26 +0000
Date: Tue, 24 Aug 2021 07:48:19 -0400
From: Bryce Allen <bryce+list-ath10k@bda.space>
To: ath10k@lists.infradead.org
Subject: Re: ath10k Digest, Vol 74, Issue 22
Message-ID: <20210824074819.604451a3@msi>
In-Reply-To: <mailman.17070.1629792071.1072.ath10k@lists.infradead.org>
References: <mailman.17070.1629792071.1072.ath10k@lists.infradead.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_044823_068014_E134D442 
X-CRM114-Status: GOOD (  27.25  )
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

I have also run into this bug, with two pcengine routers I have with
Compex wireless cards (two ath10k in one and 9k in the other). Note
that the 5.10 kernel ships with Debian 11, so this bug is now in a
default production vendor shipped kernel. One of my boxes runs Ubuntu
LTS, and I rolled back to the 5.4 kernel instead of the HWE kernel to
avoid this issue, and allow my AP to function again. My other box is
Debian and I recently upgraded it to 11 - so now I will need to build or
hunt down a package with an older kernel release, and manually apply
kernel security updates.

I don't know exactly how many users are affected, but it's non-trivial
- pcengines is a great independent Linux device provider, and they have
been selling these wireless cards. It is not their fault that the
wireless card hardware vendor is setting a country code that a kernel
developer decided to interpret in a way that completely disables
functionality for users. I thought the policy was "don't break user
space"; while this is not user space, the sentiment of that I think
should also apply to not break functioning hardware. And this is just
one vendor - I don't know how many other vendors have the 0x0 region.

At the end of the day, I don't care if the wireless card vendors did
the wrong thing putting 0x0 region in their firmware - I want my
hardware, purchased from a vendor that supports Linux and has been for
years, to function like it did before, on modern kernels. The fact that
this patch disallows me to change the region is crazy to me - it would
be one thing if the default failed to be set, but totally breaking the
functionality, I don't understand the justification. Shrugging and
saying it "won't affect that many people" does not seem to fit with the
principals of the Linux kernel.

Meanwhile, I would be interested to know if someone has a good workflow
for out of tree ath9k/10k builds, so I can patch around this without
doing a complete kernel build every time there is a new point release
with security fixes.

Thanks,
Bryce

> On 8/23/21 11:06 PM, Brian Norris wrote:
> Jouni gave a good explanation for why the offending patch is correct, 
> but it hinges on an interpretation of country code 0x0 which seems to
> be incorrect. I followed up on that almost a year ago here[1] but the 
> thread went cold after that.
> 
> Numerous people - myself included - have cited sources clearly 
> indicating that 0x0 = US, NOT unset. See the same post[1] for more
> info.
> 
> I still think this patch should be reverted unless somebody can
> provide a source to the contrary, re: the meaning of 0x0.
> 
> It's unfortunate that this is still affecting users, particularly
> when the original author of the patch even asked for it to be
> reverted.[2]
> 
> 	Alvin
> 
> [1]
> https://lists.infradead.org/pipermail/ath10k/2021-January/012374.html
> [2]
> https://lore.kernel.org/ath10k/9cc7efbb3c9b29e4553a427e6f58725f@codeaurora.org/
> 
> ------------------------------

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
