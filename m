Return-Path: <SRS0=mktU=NX=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D478C432BE
	for <ath10k@archiver.kernel.org>; Wed,  1 Sep 2021 22:38:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0185760FDA
	for <ath10k@archiver.kernel.org>; Wed,  1 Sep 2021 22:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0185760FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bda.space
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LU//GZ7YDWX9fOpjWhXZI1txioM8p5bpQSNl8aVOXe4=; b=KVCZF8eooOBqNJ
	2Dp29/MftdEGJEAhPUY2QsaIaFUxT0exn2F98x6HQnrnx5cx7/j3oAUSghsvWnmEabuAtC+PeXchs
	P2Z2dIydbgOBRaREZiGvbWlU2M/uwgG+Dv8zC4wKsl5Oc0t+nu+1+OTtpN9ee1f0YuSnrFATodnt1
	NbOwRRAlnMNm+j7pBl1NLMlSndza08IJx1qOHb5naX2QKO2M626Yk/qr6d6oLfZPEQXzqkcZG3ckS
	zDLSD2u+M7VShd0VhQ+H+oshAfwNH6fM+BwPxiqVfNR2BTSoseFudPJOu7taj9yiaGCt0xVJUD0M5
	xsLrue/il2Fxr2SH9VYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLYrD-007iuV-8I; Wed, 01 Sep 2021 22:37:23 +0000
Received: from bda.space ([207.192.72.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLYrA-007iu3-9F
 for ath10k@lists.infradead.org; Wed, 01 Sep 2021 22:37:21 +0000
Message-ID: <f1102f00-95d3-3fe0-c9e4-cb53d51827d2@bda.space>
Date: Wed, 1 Sep 2021 18:37:04 -0400
MIME-Version: 1.0
To: ath10k@lists.infradead.org
Content-Language: en-US
From: Bryce Allen <bryce+list-ath10k@bda.space>
Subject: Re: Revert: ath: add support for special 0x0 regulatory domain
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_153720_447520_470EBE77 
X-CRM114-Status: UNSURE (   6.77  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

To handle my two pcengines routers with Compex cards hit by the 0x0 reg 
domain issue, I created some DKMS packages, one for Debian 11 bullseye 
(5.10) and one for the Ubuntu 20.04 HWE kernel (5.11):

https://github.com/bd4/athregd-dkms

Thanks to sparks71 for an example dkms.conf on how to do this. I just 
copied the drivers/net/wireless/ath directory out of the unpacked 
tarball from distro's linux-source package, removed everything except 
for ath9k/10k which are the cards I have and seem to be affected, and 
updated dkms.conf with desired version and modules.

I am using the module param patch from here:
https://gist.github.com/BigNerd95/0be0a5b52a16524a78fc768f0d208a74

It seems to work, but I still get tainted kernel warnings followed by an 
unpleasant stack dump in dmesg.

Cheers,
Bryce

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
